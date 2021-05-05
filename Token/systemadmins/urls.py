from .views import *
from django.urls import path
urlpatterns = [
    path('', AdminHome.as_view(), name="AdminHome"),
    path('createuser/', CreateUser.as_view(), name="CreateUser"),
    path('createtokentype/', CreateTokenType.as_view(), name="CreateTokenType"),
    path('createtokentype/<int:number_of_steps>/', CreateTokenTypeBody.as_view(), name="CreateTokenTypeBody"),
    path('seeprogress/<int:token_id>', SeeProgress.as_view(), name='SeeProgress'),
    path('seeprogress/<int:token_id>/delete', SystemAdminDeleteToken.as_view(), name='SystemAdminDeleteToken'),
    path('logout', LogOut.as_view(), name="logout")
]

