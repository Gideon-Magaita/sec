from django import forms
from django.forms import ModelForm
from .models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User, Group

class UserForm(forms.Form):
    username = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder': 'Enter Username'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class':'form-control','placeholder': 'enter Password'}))
    group = forms.ModelChoiceField(queryset=Group.objects.all(), widget=forms.Select(attrs={'class':'form-control'}))


    
class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username','email','password1','password2']



class RequestServiceForm(ModelForm):      
    class Meta:
        model = RequestService
        fields = ['business_name','address','phone_number','email','company','Service','document','date','country','message']

        widgets = {
            'business_name':forms.TextInput(attrs={'class':'form-control', 'placeholder':'Enter business name','required':'required'}),
            'address':forms.TextInput(attrs={'class':'form-control', 'placeholder':'Enter address','required':'required'}),
            'phone_number':forms.TextInput(attrs={'class':'form-control', 'placeholder':'Enter phone number(+255)','required':'required'}),
            'email':forms.EmailInput(attrs={'class':'form-control', 'placeholder':'Enter Email','required':'required'}),
            'company': forms.Select(attrs={'class': 'form-control', 'id':'company-select','name':'company'}),
            'document':forms.FileInput(attrs={'class':'form-control', 'required':'required'}),
            'date':forms.DateInput(attrs={'class':'form-control','type':'date','required':'required'}),
            'Service': forms.Select(attrs={'class': 'form-control', 'id':'service-select'}),             
            'country':forms.Select(attrs={'class':'form-control'}),
            'message':forms.Textarea(attrs={'class':'form-control'}),
        }


    



class ServiceForm(ModelForm):
    class Meta:
        model = Service
        fields=['service_name']
        widgets={
            'service_name':forms.TextInput(attrs={'class':'form-control', 'placeholder':'Enter service name','required':'required'}),
        }


class CompanyForm(ModelForm):
    #fetch security_service from manytomany table associated with the logged in user
    def __init__(self, user, *args, **kwargs):
        super(CompanyForm, self).__init__(*args, **kwargs)
        
        self.fields['security_service'].queryset = Service.objects.filter(user=user)
    

    class Meta:
        model = Company
        fields=['company_name','phone_number','location','address','security_service']

        widgets = {
            'company_name':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter company name','required':'required'}),
            'phone_number':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter phone number(+255)','required':'required'}),
            'location':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter company location','required':'required'}),
            'address':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter company address','required':'required'}),
            'security_service':forms.SelectMultiple(attrs={'class':'form-control'}),  
        }


class ApplicationForm(ModelForm):
    class Meta:
        model = RequestService
        fields=['status','feedback']
        widgets={
            'status':forms.Select(attrs={'class':'form-control'}),
            'feedback':forms.Textarea(attrs={'class':'form-control'}),
        }