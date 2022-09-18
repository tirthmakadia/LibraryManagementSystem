from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class CustomUser(AbstractUser):
    full_name = models.CharField(max_length=100, blank=False)
    age = models.PositiveIntegerField(null=True, blank=True)
    email = models.EmailField(blank=True, max_length=254, verbose_name='email address', error_messages={'unique': 'A email is already exists.'}, help_text='', unique=True)
    is_superuser= models.BooleanField(default=True,
                                         help_text='Designates that this user has all permissions without explicitly assigning them.',
                                         verbose_name='superuser status')
    username = None
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []


class Book(models.Model):
    bname = models.CharField(max_length=100)
    bauthor = models.CharField(max_length=100)
    bsubject = models.CharField(max_length=100)
    bprice = models.CharField(max_length=10)

    class Meta:
        db_table = "book"




