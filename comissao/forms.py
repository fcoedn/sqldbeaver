from django import forms
from .models import PisoSalario

class MenuForm(forms.ModelForm):
      pass

class PisoSalarioForm(forms.ModelForm):

      class Meta:
          model = PisoSalario
          fields = ('dt_inicio','dt_final','vl_piso','tx_obs','dt_criado','dt_exclui')
          labels = {
              'dt_inicio':'Data de Início',
              'dt_final':'Data Final',
              'vl_piso':'Valor do Piso',
              'tx_obs':'Observações',
              'dt_criado':'Criado Em',
              'dt_exclui':'Excluído em'
          }
