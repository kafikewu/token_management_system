from django.shortcuts import render, redirect
from django.views import View
from django.http import HttpResponse
from .forms import CreateUserForms
from django.contrib.auth.models import User, Group
from django.contrib import messages
from django.urls import resolve
from django.contrib import auth
from django.apps import apps
from django.core.exceptions import PermissionDenied, ObjectDoesNotExist
from django import forms
# Create your views here.
def check_if_systemadmin(request):
    if request.user.groups.filter(name="systemadmins").exists():
        return True
    else:
        raise PermissionDenied
class AdminHome(View):
    def get(self, request):
        check_if_systemadmin(request)
        tokenidentification = apps.get_model("systemadmins", "TokenIdentification")
        query = f"""select I.token_type_name, I.id, B.completed_time, B.body, I.created_by  from public.systemadmins_tokenidentification as I, public.systemadmins_tokenbody as B
                            where I.id = B.token_id order by B.completed_time desc limit 12"""
        tokenidentificationobjects = tokenidentification.objects.raw(query)
        #for tokens in tokenidentificationobjects:
            #print(tokens.body)
        context = {
            "user": request.user,
            "tokens": tokenidentificationobjects
        }
        return render(request, 'SystemAdminHome.html', context)

class CreateUser(View):
    def get(self, request):
        check_if_systemadmin(request)
        new_form = CreateUserForms()
        context = {
            "user": request.user,
            "form": new_form
        }
        return render(request, 'SystemAdminCreateUser.html', context)

    def post(self, request):
        #current_url = resolve(request.path_info).url_name
        new_form = CreateUserForms(request.POST)
        if new_form.is_valid():
            clean_data = new_form.cleaned_data
            if request.POST['password1'] == request.POST['password2']:
                if User.objects.filter(username=request.POST['username']).exists():
                    messages.error(request, 'Username Taken', extra_tags='username')
                    return redirect('/systemadmins/createuser/')
                if User.objects.filter(email=request.POST['email']).exists():
                    messages.error(request, 'Email Taken', extra_tags='email')
                    return redirect('/systemadmins/createuser/')
            else:
                messages.error(request, "Password does not match", extra_tags='password')
                return redirect("/systemadmins/createuser/", messages)
            user = User.objects.create_user(
                username=request.POST['username'],
                email=request.POST['email'],
                password=request.POST['password1'],
                first_name=request.POST['first_name'],
                last_name=request.POST['last_name'],
                is_superuser=False,
                is_staff=False)
            user.save()
            print(f"user created {request.POST['password1']}")
            type_of_user = ""
            if request.POST['type_of_user'] == "1":
                type_of_user = "students"
            elif request.POST['type_of_user'] == "2":
                type_of_user = "employees"
            else:
                pass
            my_group = Group.objects.get(name=type_of_user)
            print(my_group)
            my_group.user_set.add(user)
            messages.info(request, "User created successfully", extra_tags="usercreated")
            return redirect('/systemadmins/createuser/', messages)
        else:
            messages.error(request, "Please Enter Valid Information", extra_tags="Invalid_User_info")
            return redirect('/systemadmins/createuser/', messages)


class CreateTokenType(View):
    def get(self, request):
        check_if_systemadmin(request)
        option = [i for i in range(2, 11)]
        context = {
            "user": request.user,
            "options": option
        }
        return render(request, 'SystemAdminsCreateTokenType.html', context)

class CreateTokenTypeBody(View):
    def get(self, request, number_of_steps):
        check_if_systemadmin(request)
        context = {
            "number_of_steps": number_of_steps,
            "user": request.user
        }
        return render(request, 'SystemAdminsCreateTokenType.html', context)
    def post(self, request, number_of_steps):
        jsonobject = {}
        jsonobject["Steps"] = number_of_steps
        All_the_steps = []
        #jsonobject["Steps"] = number_of_steps,
        postValues = {}
        for index, value in request.POST.items():
            postValues[index.strip()] = value
        #print(postValues)
        for i in range(1, number_of_steps+1):
            All_the_steps.append({})
            All_the_steps[i-1]['Name'] = request.POST['name-'+str(i)]
            body = {}

            for j in range(1, 100):
                try:
                    #postValues["body-" + str(i) + "-el-"+str(j)]:
                    body[request.POST["body-" + str(i) + "-el-"+str(j)]] = postValues["body-" + str(i) + "-type-"+str(j)]
                except:
                    break
            All_the_steps[i - 1]['Body'] = body
        jsonobject["All_the_steps"] = All_the_steps
        #print(jsonobject)
        tokendefinition = apps.get_model('systemadmins', 'TokenDefinition')
        b = tokendefinition.objects.create(token_type_name = postValues['Token-name'],
                                       structure = jsonobject,
                                       can_create = postValues["Token-can-create"]
                                       )
        messages.error(request, 'Token Type Created Successfully', extra_tags='success')
        return redirect('/systemadmins/createtokentype/')

            #for index, value in request.POST.items():
            #    if index.count("body-"+str(i)+"-el-") != 0
class SeeProgress(View):
    def get(self, request, token_id):
        tokenbody = apps.get_model("systemadmins", "TokenBody")
        tokenbodyobjects = tokenbody.objects.filter(token_id=token_id)
        query = f"""select * from public.systemadmins_tokenidentification as I, public.systemadmins_tokendefinition as D
                            where I.token_type_id = D.id and I.id = {token_id}"""
        tokendefinition = apps.get_model("systemadmins", "TokenDefinition")
        tokendefinitionobject = tokendefinition.objects.raw(query)
        str = []
        for i in tokendefinitionobject[0].structure['All_the_steps']:
            str.append(i["Name"])
        yaxis = []
        yaxis2 = []
        for i in tokenbodyobjects:
            yaxis.append(i.approval)
        for i in tokenbodyobjects:
            yaxis2.append(i.state_of_emergency)
        print(yaxis)
        context = {
            "user": request.user,
            "tokenprogress": tokenbodyobjects,
            "xaxis": str,
            "yaxis": yaxis,
            "yaxis2": yaxis2,
            "token_id": token_id
        }
        return render(request, 'SystemAdminTokenProgress.html', context)
class SystemAdminDeleteToken(View):
    def get(self, request, token_id):
        check_if_systemadmin(request)
        tokenidentification = apps.get_model('systemadmins', 'TokenIdentification')
        tokenprogress = apps.get_model('systemadmins', 'TokenProgress')
        tokenbody = apps.get_model('systemadmins', 'TokenBody')
        tokendelete1 = tokenbody.objects.filter(token_id = token_id).delete()
        tokendelete2 = tokenprogress.objects.filter(token_id = token_id).delete()
        tokendelete3 = tokenidentification.objects.filter(id = token_id).delete()
        messages.error(request, message=f"Token no:{token_id} is deleted", extra_tags="tokendeleted")
        return redirect(to='AdminHome')

class LogOut(View):
    def get(self, request):
        auth.logout(request)
        return redirect('/')