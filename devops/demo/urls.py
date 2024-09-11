from django.urls import path

from . import views

urlpatterns = [
    path('my-django-app/', views.index, name='index'),
]
