from django import template
import os
from django.core.files.storage import FileSystemStorage
from django.core.files.storage import DefaultStorage
from django.conf import settings

register = template.Library()



def ifattachment(value):
    isFile = os.path.isfile(f'{settings.BASE_DIR}\\{value}')

    #isFile = fs.exists(value)
    #print(settings.BASE_DIR)
    return isFile
register.filter("ifattachment", ifattachment)

def getdir(value):
    newvalue = value.split("/")
    newdir = f'{settings.BASE_DIR}{newvalue}'
    #print(newvalue[2])
    return newvalue[2]


register.filter("getdir", getdir)