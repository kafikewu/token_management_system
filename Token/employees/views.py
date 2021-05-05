from django.core.files.storage import FileSystemStorage
from django.shortcuts import render, HttpResponse, redirect
from django import views
from django.apps import apps
from .forms import ProcessTokenForm
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib import auth
from django.core.exceptions import PermissionDenied, ObjectDoesNotExist
from wsgiref.util import FileWrapper
from django.conf import settings
from django.core.files import File
import os
import mimetypes
from django.utils.encoding import smart_str
from django import forms
# Create your views here.
def check_if_employees(request):
    if request.user.groups.filter(name="employees").exists():
        return True
    else:
        raise PermissionDenied


class EmployeesHome(views.View):
    def get(self, request):
        check_if_employees(request)
        tokenprogress = apps.get_model('systemadmins', 'TokenBody')
        tokendefinition = apps.get_model('systemadmins', 'TokenDefinition')
        query = f"""select * from systemadmins_tokenbody as B, systemadmins_tokenidentification as I where B.token_id = I.id and B.to = '{request.user}' and B.approval = true
                 and B.token_id not in (select token_id from systemadmins_tokenbody where username = '{request.user}');"""
        print(query)
        tokenprogressobjects = tokenprogress.objects.raw(query)

        #tokenprogressobjects = tokenprogress.objects.filter(to=request.user)
        #print(tokenprogressobjects)
        context = {
            "user": request.user,
            "tokens": tokenprogressobjects,
            "number_of_tokens": len(tokenprogressobjects)
        }
        return render(request, "EmployeeHome.html", context)


class EmployeesProcessToken(views.View):
    def get(self, request, token_id, step):
        tokenbody = apps.get_model('systemadmins', 'TokenBody')
        query = f"select * from systemadmins_tokenbody as B, systemadmins_tokenidentification as I where B.token_id = I.id and B.to = '{request.user}' and B.token_id = {token_id} and B.step = {step};"
        #query = f"select * from systemadmins_tokenbody as B where B.token_id = {token_id} and B.step = {step}"
        tokenbodyobject = tokenbody.objects.raw(query)
        jsonbody = tokenbodyobject[0].body

        tokendefinition = apps.get_model('systemadmins', 'TokenDefinition')
        query = f"select * from systemadmins_tokendefinition where id = {tokenbodyobject[0].token_type_id}"
        tokendefinitionobjects = tokendefinition.objects.raw(query)
        new_form = ProcessTokenForm(tokendefinitionobjects[0].structure["All_the_steps"][step]["Body"])
        query2 = f"""select * from public.systemadmins_tokenidentification as I, public.systemadmins_tokendefinition as D
                    where I.token_type_id = D.id and I.id = {token_id}"""
        tokenbodyobjects2 = tokenbody.objects.filter(token_id=token_id)
        tokendefinitionobject2 = tokendefinition.objects.raw(query)
        str = []
        for i in tokendefinitionobject2[0].structure['All_the_steps']:
            str.append(i["Name"])
        yaxis2 = []
        yaxis = []
        for i in tokenbodyobjects2:
            yaxis2.append(i.state_of_emergency)
            yaxis.append(i.approval)
        print(yaxis)
        context = {
            "user": request.user,
            "tokenprogress": tokenbodyobjects2,
            "body": jsonbody,
            "xaxis": str,
            "yaxis": yaxis,
            "yaxis2": yaxis2,
            "form": new_form
        }
        return render(request, "EmployeeProcessToken.html", context)

    def post(self, request, token_id, step):
        uservalidation = User.objects.filter(email = request.POST['to'])
        if len(uservalidation) == 1:
            tokenidentification = apps.get_model('systemadmins', 'TokenIdentification')
            tokenprogress = apps.get_model('systemadmins', 'TokenProgress')
            tokenbody = apps.get_model('systemadmins', 'TokenBody')

            query = f"""select * from public.systemadmins_tokenidentification as I, public.systemadmins_tokendefinition as D
                                where I.token_type_id = D.id and I.id = {token_id}"""
            tokendefinition = apps.get_model("systemadmins", "TokenDefinition")
            tokendefinitionobject = tokendefinition.objects.raw(query)
            Number_of_steps = tokendefinitionobject[0].structure['Steps']
            token_type_id = tokendefinitionobject[0].token_type_id


            to_user = User.objects.filter(email=request.POST.get('to'))
            print(to_user[0].username)
            jsonfile = {}
            approval = False
            if request.POST['approval'] == "1":
                approval = True
            state_of_emergency = False
            if request.POST['state_of_emergency'] == "1":
                state_of_emergency = True
            for i in request.POST.items():
                if i[0] != 'to' and i[0] != "csrfmiddlewaretoken" and i[0] != "approval" and i[0] != "state_of_emergency":
                    jsonfile.update({i[0]: i[1]})
            to_username = to_user[0].username
            if step+1 == Number_of_steps:
                to_username = "null"
            for index, myfile in enumerate(request.FILES.items()):
                fs = FileSystemStorage()
                uploaded_file_name = f"{token_type_id}_{token_id}_{step+1}_{index}.jpg"
                filename = fs.save(uploaded_file_name, myfile[1])
                uploaded_file_url = fs.url(filename)
                jsonfile.update({myfile[0]: uploaded_file_url})
            tokenprogressobject = tokenprogress.objects.create(token_id=token_id,
                                                               step=step+1,
                                                               to=to_username,
                                                               state_of_emergency=state_of_emergency,
                                                               completed=True)
            tokenbodyobject = tokenbody.objects.create(token_id=token_id,
                                                       step= step+1,
                                                       to=to_username,
                                                       state_of_emergency=state_of_emergency,
                                                       username=request.user,
                                                       approval = approval,
                                                       body=jsonfile)
            messages.error(request, "Response Recorded", extra_tags="valid_response")
            return redirect(f'/employees/{token_id}/{step}', messages,)
        else:
            messages.error(request, "Please Enter Valid Email Address", extra_tags="Invalid_User_info")
            return redirect(f'/employees/{token_id}/{step}', messages)

class EmployeesProcessedToken(views.View):
    def get(self, request):
        tokenprogress = apps.get_model('systemadmins', 'TokenBody')
        tokendefinition = apps.get_model('systemadmins', 'TokenDefinition')
        query = f"""select * from systemadmins_tokenbody as B, systemadmins_tokenidentification as I where B.token_id = I.id and B.username = '{request.user}';"""
        print(query)
        tokenprogressobjects = tokenprogress.objects.raw(query)

        # tokenprogressobjects = tokenprogress.objects.filter(to=request.user)
        # print(tokenprogressobjects)
        context = {
            "user": request.user,
            "tokens": tokenprogressobjects,
            "number_of_tokens": len(tokenprogressobjects)
        }
        return render(request, "EmployeeProcessedToken.html", context)


class EmployeeDownload(views.View):
    def get(self, request, file_name):

        #file_name = file_name.split('.')[0]
        #print(file_name)
        file_path = settings.MEDIA_ROOT + '\\' + file_name

        file_wrapper = FileWrapper(open(file_path, 'rb'))
        print(file_wrapper)
        file_mimetype = mimetypes.guess_type(file_path)
        print(file_mimetype)
        response = HttpResponse(file_wrapper, content_type=file_mimetype)
        response['X-Sendfile'] = file_path
        response['Content-Length'] = os.stat(file_path).st_size
        response['Content-Disposition'] = 'attachment; filename=%s' % smart_str(file_name)
        return response


class EmployeesProcessedTokenProgress(views.View):
    def get(self, request, token_id):
        check_if_employees(request)
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
        return render(request, 'EmployeesProcessedTokenProgress.html', context)


class LogOut(views.View):
    def get(self, request):
        auth.logout(request)
        return redirect('/')