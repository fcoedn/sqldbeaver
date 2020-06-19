from django.shortcuts import render,redirect
from .forms import PisoSalarioForm
from .models import PisoSalario, Loja, Cobrador, ComissaoGeral

# Create your views here.
def comissaomenu(request):
    return render(request,"menu/menu.html")

def pisosalario_list(request):
    print("B")
    context = {'pisosalario_list':PisoSalario.objects.all()}
    return render(request,"pisosalario/pisosalario_list.html",context)

def pisosalario_form(request,id=0):
    if request.method == "GET":
       if id == 0:
          form = PisoSalarioForm()
       else:
          pisosalario = PisoSalario.objects.get(pk_piso_salario=id)
          form = PisoSalarioForm(instance=pisosalario)
       return render(request,"pisosalario/pisosalario_form.html",{'form':form})
    else:
        if id == 0:
           form = PisoSalarioForm(request.POST)
        else:
           pisosalario = PisoSalario.objects.get(pk_piso_salario=id)
           form = PisoSalarioForm(request.POST,instance=pisosalario)
        if form.is_valid():
            form.save()
        return redirect('pisosalario_list/')


def pisosalario_exclui(request,id):
    print("C")
    pisosalario = PisoSalario.objects.get(pk_piso_salario=id)
    pisosalario.delete()
    print("A")
    id=0
    return redirect('pisosalario_list/')
  
