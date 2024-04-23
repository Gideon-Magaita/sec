from django.shortcuts import render,redirect
from .forms import *
from .models import *
from django.contrib import messages
from django.http import JsonResponse
#authentication imports
from django.contrib.auth.models import Group
from django.contrib.auth.forms  import UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .decorators import unauthenticated_user,allowed_users,admin_only

#authentication functions
@unauthenticated_user
def login_user(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username,password=password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.info(request,'username or password is incorrect') 

    return render(request,'pages/auth/login.html')


def logoutUser(request):
    logout(request)
    return redirect('login_user')



@unauthenticated_user
def register(request):
    form = CreateUserForm()
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
           user = form.save()
           username = form.cleaned_data.get('username')
           group = Group.objects.get(name='client')
           user.groups.add(group)
           messages.success(request, 'Account was created for '+ username)
           return redirect('login_user')
    else:
        form = CreateUserForm()    
    return render(request,'pages/auth/register.html',{'form':form})


#endauthentication functions

@login_required(login_url='login_user')
@admin_only
def home(request):
    count_service = RequestService.objects.filter(user_id=request.user.id).count()
    company = Company.objects.all().count()
    context={
        'count_service':count_service,
        'company':company,
    }
    return render(request,'pages/client/home.html',context)




def get_services(request):
    company_id = request.GET.get('company_id')
    try:
        company = Company.objects.get(pk=company_id)
        services = company.security_service.all().values('id', 'service_name')
        return JsonResponse(list(services), safe=False)
    except Company.DoesNotExist:
        return JsonResponse({'error': 'Company not found'}, status=404)
    



@login_required(login_url='login_user')
@admin_only
def request_service(request):
    service = RequestService.objects.filter(user_id=request.user.id)
    if request.method == 'POST':
        form = RequestServiceForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            data = form.save(commit=False)
            data.user=request.user
            data.save()
            form = RequestServiceForm()
            messages.success(request,'Request sent successfully')
        else:
            messages.error(request,'Request failed')
            return redirect('request_service')
    else:
        form = RequestServiceForm()
    context = {
        'form': form,
        'service':service,
    }
    return render(request,'pages/client/service.html',context)



@login_required(login_url='login_user')
@admin_only
def edit_details(request,id):
    ref = RequestService.objects.get(id=id)
    form  = RequestServiceForm(request.POST or None,request.FILES or None, instance=ref)
    if form.is_valid():
        form.save()
        messages.success(request,'Application updated')
        return redirect('request_service')
    context={
        'form':form,
    }
    return render(request,'pages/client/edit-application.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_service(request,id):
    service = RequestService.objects.get(id=id)
    service.delete()
    messages.success(request,'Request service deleted')
    return redirect('request_service')