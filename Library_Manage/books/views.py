from django.http import HttpResponse
from django.shortcuts import render,redirect
from books.forms import Bookform
from books.models import Book
from .forms import SignUpForm
from django.contrib.auth import login, authenticate

# Create your views here.
def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            user.save()
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(email=user.email, password=raw_password)
            login(request, user)
            return redirect('/')
    else:
        form = SignUpForm()
    return render(request, 'signup.html', { 'form' : form })

def insert(request):
    if request.method=="POST":
        form = Bookform(request.POST)
        if form.is_valid:

            try:
                form.save()
                return redirect('/')
            except:
                pass

    form = Bookform()
    return render(request, 'add.html',{'form':form})

def show(request):
    books = Book.objects.all()
    return render(request, 'view.html',{'book':books})


def delete(request,id):
    book = Book.objects.get(id=id)
    book.delete()
    return redirect('/')

def edit(request,id):
    book = Book.objects.get(id=id)
    return render(request,"edit.html",{'book':book})

def update(request ,id):
    book = Book.objects.get(id=id)
    form=Bookform(request.POST, instance=book)
    if form.is_valid:
        form.save()
        return redirect('/')
    return render(request, "edit.html", {'book': book})