from django.db import models
from django.core.validators import RegexValidator
from django.contrib.auth.models import User

# Create your models here.
class Service(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    service_name = models.CharField(max_length=200)

    def __str__(self):
        return self.service_name
    

class Company(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    company_name = models.CharField(max_length=200)
    phone_number = models.CharField( max_length=13,
        validators=[
            RegexValidator(
                regex=r'^\+255\d{9}$',
                message="Phone number must start with '+255' followed by 9 digits."
            )
        ]
    )
    location = models.CharField(max_length=200)
    address = models.CharField(max_length=200)
    security_service = models.ManyToManyField(Service,max_length=200)

    def __str__(self):
        return self.company_name


COUNTRY=(
    ('tanzania','tanzania'),
    ('kenya','kenya'),
    ('uganda','uganda'),
)

STATUS=(
   ('pending','pending'),
   ('rejected','rejected'),
   ('accepted','accepted'),
)

class RequestService(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    business_name = models.CharField(max_length=200)
    address = models.CharField(max_length=200,blank=True)
    phone_number = models.CharField( max_length=13,
        validators=[
            RegexValidator(
                regex=r'^\+255\d{9}$',
                message="Phone number must start with '+255' followed by 9 digits."
            )
        ]
    )
    email = models.CharField(max_length=200,unique=True)
    company = models.ForeignKey(Company,on_delete=models.CASCADE)
    Service = models.ForeignKey(Service,on_delete=models.CASCADE)
    document = models.FileField(upload_to='document',default=None)
    date = models.DateTimeField()
    country = models.CharField(max_length=200,choices=COUNTRY)
    message = models.TextField()
    status  = models.CharField(max_length=200,choices=STATUS,default='pending')
    feedback = models.TextField(default=None,blank=True,null=True)

    def __str__(self):
        return self.business_name


