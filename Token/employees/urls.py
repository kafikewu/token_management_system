from django.urls import path, include
from .views import *

urlpatterns = [
    path('', EmployeesHome.as_view(), name="employeeshome"),
    path('<int:token_id>/<int:step>/', EmployeesProcessToken.as_view(), name="employeeprocesstoken"),
    path('processedtoken', EmployeesProcessedToken.as_view(), name="employeeprocessedtoken"),
    path('processedtoken/<int:token_id>/', EmployeesProcessedTokenProgress.as_view(), name="employeeprocessedtokenprogress"),
    path('download/<str:file_name>', EmployeeDownload.as_view(), name='employeedownload'),
    path('logout', LogOut.as_view(), name = "logout")
]