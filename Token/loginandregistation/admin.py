from django.contrib import admin
from .models import Login_information
from django.contrib.auth.models import User, Group
from django.contrib.auth.admin import GroupAdmin
# Register your models here.

admin.site.register(Login_information)


class UserAdmin(admin.ModelAdmin):
    list_display = ('email', 'first_name', 'last_name')
    list_filter = ('is_staff', 'is_superuser')


admin.site.unregister(User)
admin.site.register(User, UserAdmin)


class UserSetInline(admin.TabularInline):
    model = User.groups.through
    raw_id_fields = ('user',)  # optional, if you have too many users


class MyGroupAdmin(GroupAdmin):
    inlines = [UserSetInline]

# unregister and register again


admin.site.unregister(Group)
admin.site.register(Group, MyGroupAdmin)