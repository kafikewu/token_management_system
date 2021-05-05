from wsgiref.util import FileWrapper

from django.shortcuts import render
from django.views import View
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.apps import apps
from .forms import CreateTokenForm
from django.contrib import auth, messages
from django.core.files.storage import FileSystemStorage
from django.conf import settings
from django.core.files import File
import os
import mimetypes
from django.utils.encoding import smart_str
# Create your views here.


class StudentHome(View):
    def get(self, request):
        tokenidentification = apps.get_model("systemadmins", "TokenIdentification")
        query = f"""select I.token_type_name, I.id, B.completed_time, B.body  from public.systemadmins_tokenidentification as I, public.systemadmins_tokenbody as B
                    where I.id = B.token_id and B.username = '{request.user}' order by B.completed_time desc"""
        tokenidentificationobjects = tokenidentification.objects.raw(query)
        for tokens in tokenidentificationobjects:
            print(tokens.body)

        context = {
            "user": request.user,
            "tokens": tokenidentificationobjects
        }
        return render(request, 'StudentHome.html', context)


class CreateToken(View):
    def get(self, request, **kwargs):
        tokendefinition = apps.get_model('systemadmins', 'TokenDefinition')
        token_types = [{"token_id": i.id, "token_type_name": i.token_type_name} for i in tokendefinition.objects.all()]
        if kwargs.values():
            token_type_id = kwargs['token_type_id']
            current_token = tokendefinition.objects.filter(id = token_type_id)[0]
            #print(current_token.structure["All_the_steps"][0]["Body"])
            new_form = CreateTokenForm(current_token.structure["All_the_steps"][0]["Body"])

            context = {
                "user": request.user,
                "token_type_id": token_type_id,
                "token_types": token_types,
                "form": new_form
            }

            return render(request, 'StudentCreateToken.html', context)


        else:
            context = {
                "user": request.user,
                "token_types": token_types

            }
            return render(request, 'StudentCreateToken.html', context)

    def post(self, request, token_type_id):
        tokendefinition = apps.get_model('systemadmins', 'TokenDefinition')
        print(token_type_id)
        current_token = tokendefinition.objects.filter(id=token_type_id)
        tokenidentification = apps.get_model('systemadmins', 'TokenIdentification')
        tokenprogress = apps.get_model('systemadmins', 'TokenProgress')
        tokenbody = apps.get_model('systemadmins', 'TokenBody')
        temp = token_type_id
        print(current_token[0].token_type_name)
        current = current_token[0].token_type_name



        #print(b)

        to_user = User.objects.filter(email=request.POST['to'])


        jsonfile = {}
        for i in request.POST.items():
            if i[0] != 'to' and i[0] != "csrfmiddlewaretoken":
                jsonfile.update({i[0]: i[1]})
        if len(to_user) == 1:

            b = tokenidentification.objects.create(token_type_id=temp,
                                                   token_type_name=current,
                                                   created_by=request.user)

            tokenid = b.id
            for index, myfile in enumerate(request.FILES.items()):
                fs = FileSystemStorage()
                uploaded_file_name = f"{temp}_{tokenid}_1_{index}.jpg"
                filename = fs.save(uploaded_file_name, myfile[1])
                uploaded_file_url = fs.url(filename)
                jsonfile.update({myfile[0]: uploaded_file_url})
            tokenprogressobject = tokenprogress.objects.create(token_id = tokenid,
                                                               step = 1,
                                                               to = to_user[0].username,
                                                               state_of_emergency = True,
                                                               completed = True)
            tokenbodyobject = tokenbody.objects.create(token_id = tokenid,
                                                       step = 1,
                                                       to = to_user[0].username,
                                                       state_of_emergency = True,
                                                       approval=True,
                                                       username = request.user, 
                                                       body = jsonfile)
            messages.error(request, 'Token Created Successfully', extra_tags='success')
            return redirect('/students/')
        else:
            messages.error(request, 'Invalid Email', extra_tags='email')
            return redirect(f'/students/CreateToken/{token_type_id}')

        """print('this is working')
        for i in request.POST.items():
             if i[0] != 'Attachments':
                print(i[1])
        myfile = request.FILES['Attachments']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        uploaded_file_url = fs.url(filename)"""
        #return HttpResponse(uploaded_file_url)

class StudentDownload(View):
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

class TokenProgress(View):
    def get(self, request, token_id):
        tokenbody = apps.get_model("systemadmins", "TokenBody")
        tokenbodyobjects = tokenbody.objects.filter(token_id = token_id)
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
        return render(request, 'StudentTokenProgress.html', context)


class LogOut(View):
    def get(self, request):
        auth.logout(request)
        return redirect('/')

class DeleteToken(View):
    def get(self, request, token_id):
        tokenidentification = apps.get_model('systemadmins', 'TokenIdentification')
        tokenprogress = apps.get_model('systemadmins', 'TokenProgress')
        tokenbody = apps.get_model('systemadmins', 'TokenBody')
        tokendelete1 = tokenbody.objects.filter(token_id = token_id).delete()
        tokendelete2 = tokenprogress.objects.filter(token_id = token_id).delete()
        tokendelete3 = tokenidentification.objects.filter(id = token_id).delete()
        messages.error(request, message=f"Token no:{token_id} is deleted", extra_tags="tokendeleted")
        return redirect(to='studenthome')