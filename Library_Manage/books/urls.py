
from django.urls import path
from django.contrib.auth import views as auth_views
from books import views


urlpatterns = [
    path("", views.show, name="show"),
    path("add", views.insert, name="add"),
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('signup/', views.signup, name='signup'),
    path("show",views.show,name="show"),
    path("delete/<int:id>",views.delete,name="delete"),
    path("edit/<int:id>",views.edit,name="edit"),
    path("update/<int:id>",views.update,name="update"),

]