from django.db import models


class Login_information(models.Model):
    username = models.CharField(max_length=70, primary_key=True, )
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    email = models.EmailField()
    type_of_user = models.IntegerField()
    is_anonymous = models.BooleanField(default=False)
    REQUIRED_FIELDS = ['username', 'password', 'email', 'type_of_user']
    USERNAME_FIELD = 'username'