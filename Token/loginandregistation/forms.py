from django import forms

from .models import Login_information
from django.contrib.auth.models import User


class Login_form(forms.Form):
    username = forms.CharField(label="Username", widget=forms.TextInput(attrs={
        "placeholder": "Username"
    }))
    password = forms.CharField(label="Password", widget=forms.TextInput(attrs={
        "type": "Password",
        "placeholder": "Password"
    }))


class SignUpForm(forms.Form):
    username = forms.CharField(label="Username", widget=forms.TextInput(attrs={
        "placeholder": "Username"
    }))
    password1 = forms.CharField(label="Password1", widget=forms.TextInput(attrs={
        "type": "Password",
        "placeholder": "Password"
    }))
    password2 = forms.CharField(label="Password2", widget=forms.TextInput(attrs={
        "type": "Password",
        "placeholder": "Retype Password"
    }))
    email = forms.EmailField(label='Email', widget=forms.EmailInput({
        "placeholder": "Email"
    }))
    first_name = forms.CharField(label="First Name", widget=forms.TextInput(attrs={
        "placeholder": "First Name"
    }))
    last_name = forms.CharField(label="Last Name", widget=forms.TextInput(attrs={
        "placeholder": "Last Name"
    }))