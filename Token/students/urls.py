from django.urls import include, path
from .views import StudentHome, CreateToken, LogOut, TokenProgress, DeleteToken, StudentDownload

urlpatterns = [
    path('', StudentHome.as_view(), name="studenthome"),
    path('CreateToken/', CreateToken.as_view(), name='createtoken'),
    path('CreateToken/<int:token_type_id>/', CreateToken.as_view(), name='createtoken'),
    path('TokenProgress/<int:token_id>/', TokenProgress.as_view(), name='tokenprogress'),
    path('TokenProgress/<int:token_id>/delete', DeleteToken.as_view(), name='deletetoken'),
    path('download/<str:file_name>', StudentDownload.as_view(), name='studentdownload'),
    path('logout', LogOut.as_view(), name="logout")
]