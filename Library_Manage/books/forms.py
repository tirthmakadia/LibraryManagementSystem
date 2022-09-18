from django import forms
from books.models import Book
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from .models import CustomUser
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit

class Bookform(forms.ModelForm):
    class Meta:
        model = Book
        fields= "__all__"
        widgets ={
            "bname": forms.TextInput(attrs={'class': 'form-control'}),
            "bauthor": forms.TextInput(attrs={'class': 'form-control'}),
            "bsubject": forms.TextInput(attrs={'class': 'form-control'}),
            "bprice": forms.TextInput(attrs={'class': 'form-control'})
        }

class SignUpForm(UserCreationForm):
    full_name = forms.CharField(max_length=100, help_text='')

    class Meta:
        model = CustomUser
        #fields = UserCreationForm.Meta.fields + ('full_name', 'age', 'email')
        fields = 'full_name', 'email'