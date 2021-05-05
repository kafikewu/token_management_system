import django.forms as forms

type_of_user_choices = (
    ("1", "Student"),
    ("2", "Employee")
)
number_of_steps_choices = (
    ("2", "2"),
    ("3", "3"),
    ("4", "4"),
    ("5", "5"),
    ("6", "6"),
    ("7", "7"),
    ("8", "8"),
    ("9", "9"),
)

class CreateUserForms(forms.Form):
    type_of_user = forms.ChoiceField( choices=type_of_user_choices, widget=forms.Select(attrs={
        "class": "form-control dropdown"
    }))
    username = forms.CharField(label="Username", widget=forms.TextInput(attrs={
        "placeholder": "Username",
        "class": "form-control"
    }))
    first_name = forms.CharField(label="First Name", widget=forms.TextInput(attrs={
        "placeholder": "First Name",
        "class": "form-control"
    }))
    last_name = forms.CharField(label="Last Name", widget=forms.TextInput(attrs={
        "placeholder": "Last Name",
        "class": "form-control"
    }))
    email = forms.EmailField(label='Email', widget=forms.EmailInput({
        "placeholder": "Email",
        "class": "form-control"
    }))
    password1 = forms.CharField(label="Password", widget=forms.TextInput(attrs={
        "type": "Password",
        "placeholder": "Password",
        "class": "form-control"
    }))
    password2 = forms.CharField(label="Retype Password", widget=forms.TextInput(attrs={
        "type": "Password",
        "placeholder": "Retype Password",
        "class": "form-control"
    }))

"""class CreateTokenType(forms.Form):
    number_of_steps = forms.ChoiceField( choices=number_of_steps_choices, widget=forms.Select(attrs={
        "class": "form-control dropdown",
    }))"""