from django.db import models

# Create your models here.
from django.urls import path

from .views import *

urlpatterns = [
    path('', loginView.as_view(), name='login'),
    path('sign_up', SignUpView.as_view(), name='signup')
]