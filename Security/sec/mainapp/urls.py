from django.urls import path
from .import views
from django.conf import settings
from django.conf.urls.static import static
from . import company_views
from . import admin_view

urlpatterns=[
    path('',views.home,name='home'),
    path('request_service',views.request_service,name='request_service'),
    path('get_services/',views.get_services, name='get_services'),
    path('delete_service/<int:id>',views.delete_service,name='delete_service'),
    path('edit_details/<int:id>',views.edit_details,name='edit_details'),

    #company urls
    path('company_home',company_views.company_home,name='company_home'),
    path('company_service',company_views.company_service,name='company_service'),
    path('add_company',company_views.add_company,name='add_company'),
    path('update_company/<int:id>',company_views.update_company,name='update_company'),
    path('delete_company/<int:id>',company_views.delete_company,name='delete_company'),
    path('application_details',company_views.application_details,name='application_details'),
    path('edit_application_details/<int:id>',company_views.edit_application_details,name='edit_application_details'),
    path('view_application_details/<int:id>',company_views.view_application_details,name='view_application_details'),
    path('manage_user',company_views.manage_user,name='manage_user'),
    path('delete_company_service/<int:id>',company_views.delete_company_service,name='delete_company_service'),
    path('update_company_service/<int:id>',company_views.update_company_service,name='update_company_service'),
    
    #authenticationurls
    path('login_user',views.login_user,name='login_user'),
    path('register',views.register,name='register'),
    path('logoutUser',views.logoutUser,name='logoutUser'),
    #admin urls
    path('admin_home',admin_view.admin_home,name='admin_home'),
    path('users',admin_view.users,name='users'),
    path('delete_user/<int:id>',admin_view.delete_user,name='delete_user'),
    path('company_details',admin_view.company_details,name='company_details'),
    path('delete_company_details/<int:id>',admin_view.delete_company_details,name='delete_company_details'),
    path('user_application_details',admin_view.user_application_details,name='user_application_details'),



    
]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)