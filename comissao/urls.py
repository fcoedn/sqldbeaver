from django.urls import path,include
from . import views

urlpatterns = [
    path('',views.comissaomenu),
    path('pisosalario',views.pisosalario_form,name='pisosalario_novo'),
    path('pisosalario<int:id>',views.pisosalario_form,name='pisosalario_altera'),
    path('pisosalario_exclui<int:id>',views.pisosalario_exclui,name='pisosalario_exclui'),
    path('pisosalario_list/',views.pisosalario_list,name='pisosalario_lista')
]
