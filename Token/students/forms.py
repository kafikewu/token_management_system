from django import forms


class CreateTokenForm(forms.Form):
    to = forms.EmailField(widget=forms.EmailInput(attrs={
        "class": "form-control",
        "placeholder": "To (Email)"
    }))
    def __init__(self, body):
        super().__init__()
        for field_name in body:
            field_type = body[field_name]
            if field_type == "text":
                self.fields[field_name] = forms.CharField(label=field_name.replace('_', ' ').title(),
                                      widget=forms.Textarea(attrs={
                                                                "value": "",
                                                                "cols": 40,
                                                                "rows": 5,
                                                                "class": "form-control",
                                                                "placeholder": field_name.replace('_', ' ').title()
                                                            }))
            elif field_type == "int":
                self.fields[field_name] = forms.IntegerField(label=field_name.replace('_', ' ').title(),
                                                             widget=forms.NumberInput(attrs={
                                                                 "class": "form-control",
                                                                 "placeholder": field_name.replace('_', ' ').title()
                                                             }))
            elif field_type == "char":
                self.fields[field_name] = forms.CharField(label=field_name.replace('_', ' ').title(),
                                                          widget=forms.TextInput(attrs={
                                                              "class": "form-control",
                                                              "placeholder": field_name.replace('_', ' ').title()
                                                          }))
            elif field_type == "file":
                self.fields[field_name] = forms.FileField(required=False, label=field_name.replace('_', ' ').title(),
                                                          widget=forms.FileInput(attrs={
                                                              "class": "form-control",
                                                              "placeholder": field_name.replace('_', ' ').title()
                                                          }))

