from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.views.generic import View
from .forms import Login_form, SignUpForm
from django.contrib.auth.models import User, auth, Group
from django.contrib import messages

# Create your views here.


class loginView(View):
    def get(self, request):
        my_form = Login_form()
        context = {
            'form': my_form
        }
        return render(request, 'login.html', context)

    def post(self, request):
        user = auth.authenticate(username=request.POST.get('username'), password=request.POST.get('password'))
        if user is not None:
            auth.login(request, user)
            if user.groups.filter(name="students").exists():
                context = {
                    'user': user
                }
                return redirect('/students', request)
            elif user.groups.filter(name="employees").exists():
                context = {
                    'user': user
                }
                return redirect('/employees', request)
            elif user.groups.filter(name="systemadmins").exists():
                context = {
                    'user': user
                }
                return redirect('/systemadmins', request)
        else:
            messages.info(request, "Invalid Creadentials", extra_tags="invalid")
            return redirect('/', messages)


class SignUpView(View):
    def get(self, request):
        signup = SignUpForm()
        context = {
            'form': signup
        }
        return render(request, 'sign_up.html', context)

    def post(self, request):
        answers = SignUpForm(request.POST)
        if request.POST['password1'] == request.POST['password2']:
            if User.objects.filter(username=request.POST['username']).exists():
                messages.error(request, 'Username Taken', extra_tags='username')
                return redirect('/sign_up')
            if User.objects.filter(email=request.POST['email']).exists():
                messages.error(request, 'Email Taken', extra_tags='email')
                return redirect('/sign_up')
        else:
            messages.error(request, "Password does not match", extra_tags='password')
            return redirect('/sign_up')
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
        my_group = Group.objects.get(name='students')
        my_group.user_set.add(user)
        messages.info(request, "User created successfully", extra_tags="usercreated")
        return redirect('/', messages)
