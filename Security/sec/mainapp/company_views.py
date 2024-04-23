from django.shortcuts import render,redirect
from .forms import *
from .models import *
from django.contrib import messages
from django.http import HttpResponse
#authentication imports
from django.contrib.auth.models import Group
from django.contrib.auth.forms  import UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .decorators import unauthenticated_user,allowed_users,admin_only


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['company'])
def company_home(request):
    application = RequestService.objects.filter(company_id=request.user.id).count()
    company = Company.objects.filter(user_id=request.user.id).count()
    service = Service.objects.filter(user_id=request.user.id).count()
    context={
        'application': application,
        'company':company,
        'service':service,
    }
    return render(request,'pages/company/home.html',context)



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['company'])
def company_service(request):
    service = Service.objects.filter(user_id=request.user.id)
    if request.method == 'POST':
        form = ServiceForm(request.POST or None)
        if form.is_valid():
            data = form.save(commit=False)
            data.user=request.user
            data.save()
            form = ServiceForm()
            messages.success(request,'Company services added')
        else:
            messages.error(request,'Company services not added')
            return redirect('company_service')
    else:
        form = ServiceForm()
    context = {'form': form,'service': service}
    return render(request, 'pages/company/service.html', context)



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['company'])
def update_company_service(request,id):
    company = Service.objects.get(id=id)
    form = ServiceForm(request.POST or None,instance=company)
    if form.is_valid():
        form.save()
        messages.success(request,'Company services updated')
        return redirect('company_service')
    return render(request,'pages/company/edit-service.html',{'form': form})



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['company'])
def delete_company_service(request,id):
    service = Service.objects.get(id=id)
    service.delete()
    return redirect('company_service')



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['company'])
def add_company(request):
    company = Company.objects.filter(user_id=request.user.id)
    if request.method == 'POST':
        form = CompanyForm(user=request.user,data=request.POST or None)
        if form.is_valid():
            add_app=form.save(commit=False)
            add_app.user=request.user
            add_app.save()

            # Associate selected security_service with the company
            sec_service = form.cleaned_data['security_service']
            add_app.security_service.set(sec_service)
            messages.success(request,'Company added successfully')
        else:
            messages.error(request,'Something went wrong')
            return redirect('add_company')
    else:
        form = CompanyForm(user=request.user)
    context={
        'form':form,
        'company':company
    }
    return render(request,'pages/company/add-company.html', context)


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['company'])
def update_company(request,id):
    company = Company.objects.get(id=id)
    if request.method == 'POST':
        form = CompanyForm(user=request.user,data=request.POST or None,instance=company)
        if form.is_valid():
            form.save()
            messages.success(request,'Company details updated!')
        else:
            messages.error(request,'Update failed,check for the issue!')
        return redirect('add_company')
    else:
        form = CompanyForm(user=request.user, instance=company)
    context={
        'form':form,
    }
    return render(request,'pages/company/edit-company.html',context)



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['company'])
def delete_company(request,id):
    company = Company.objects.get(id=id)
    if request.method == 'POST':
        company.delete()
        messages.success(request,'Company deleted!')
        return redirect('add_company')
    return render(request,'pages/company/confirm-delete.html')



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['company'])
def application_details(request):
       # Retrieve the company associated with the logged-in user
        company = Company.objects.get(user=request.user)

        # Retrieve services owned by the company
        company_services = company.security_service.all()

        # Filter applications associated with the company's services
        application = RequestService.objects.filter(Service__in=company_services, company=company)

        context = {
            'application': application,
        }
        return render(request, 'pages/company/application.html', context)



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['company'])
def view_application_details(request,id):
    details = RequestService.objects.get(id=id)
    return render(request,'pages/company/view-details.html',{'details':details})



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['company'])
def edit_application_details(request,id):
    application = RequestService.objects.get(id=id)
    form = ApplicationForm(request.POST or None,instance=application)
    if form.is_valid():
        form.save()
        messages.success(request,'Application Details updated successfully')
        return redirect('application_details')
    return render(request,'pages/company/edit-application.html',{'form':form})



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['company'])
def manage_user(request):
    return render(request,'pages/company/manage-user.html')