# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Cobrador(models.Model):
    pk_cobrador = models.BigAutoField(primary_key=True)
    nr_matricula = models.DecimalField(max_digits=8, decimal_places=0, blank=True, null=True)
    no_completo = models.CharField(max_length=60, blank=True, null=True)
    no_reduzido = models.CharField(max_length=25, blank=True, null=True)
    fl_ativo = models.CharField(max_length=1, blank=True, null=True)
    dt_criado = models.DateField(blank=True, null=True)
    dt_alterado = models.DateField(blank=True, null=True)
    fl_atividade = models.CharField(max_length=2, blank=True, null=True)
    dt_afastamento = models.DateField(blank=True, null=True)
    fk_pisosalario = models.BigIntegerField(blank=True, null=True)
    id_criado = models.DecimalField(max_digits=8, decimal_places=0, blank=True, null=True)
    tx_obs = models.CharField(max_length=60, blank=True, null=True)
    dt_exclui = models.DateField(blank=True, null=True)
    id_exclui = models.DecimalField(max_digits=8, decimal_places=0, blank=True, null=True)
    id_alterado = models.DecimalField(max_digits=8, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cobrador'


class CobradorLoja(models.Model):
    pk_cobrador_loja = models.BigAutoField(primary_key=True)
    nr_matricula = models.DecimalField(max_digits=8, decimal_places=0)
    fl_atividade = models.CharField(max_length=1)
    dt_criado = models.DateField(blank=True, null=True)
    dt_inicio = models.DateField(blank=True, null=True)
    dt_final = models.DateField(blank=True, null=True)
    dt_alterado = models.DateField(blank=True, null=True)
    sg_loja = models.CharField(max_length=3)
    id_criado = models.DecimalField(max_digits=8, decimal_places=0, blank=True, null=True)
    sg_pdv = models.CharField(max_length=3)
    dt_exclui = models.DateField(blank=True, null=True)
    id_exclui = models.DecimalField(max_digits=8, decimal_places=0, blank=True, null=True)
    tx_obs = models.CharField(max_length=60, blank=True, null=True)
    id_alterado = models.DecimalField(max_digits=8, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cobrador_loja'


class ComissaoGeral(models.Model):
    pk_comissao_geral = models.BigAutoField(primary_key=True)
    sg_loja = models.CharField(max_length=3, blank=True, null=True)
    nr_matricula = models.DecimalField(max_digits=8, decimal_places=0, blank=True, null=True)
    dt_criado = models.DateField(blank=True, null=True)
    nr_mes = models.CharField(max_length=2, blank=True, null=True)
    nr_ano = models.CharField(max_length=4, blank=True, null=True)
    vl_entrada = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)
    vl_prestacao = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)
    vl_juros = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)
    vl_entradancp = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)
    vl_rconfdiv07 = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)
    vl_relcrm01 = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)
    id_senha = models.DecimalField(max_digits=8, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'comissao_geral'


class Loja(models.Model):
    sg_loja = models.CharField(primary_key=True, max_length=3)
    nr_cgc = models.CharField(max_length=14, blank=True, null=True)
    nr_ins_estadual = models.CharField(max_length=14, blank=True, null=True)
    no_razao_social = models.CharField(max_length=45, blank=True, null=True)
    no_endereco = models.CharField(max_length=45, blank=True, null=True)
    no_cidade = models.CharField(max_length=40, blank=True, null=True)
    sg_uf = models.CharField(max_length=10, blank=True, null=True)
    nr_cep = models.CharField(max_length=10, blank=True, null=True)
    no_bairro = models.CharField(max_length=20, blank=True, null=True)
    nr_fone = models.CharField(max_length=10, blank=True, null=True)
    nr_telex = models.CharField(max_length=10, blank=True, null=True)
    nr_fax = models.CharField(max_length=10, blank=True, null=True)
    dt_loja = models.DateField(blank=True, null=True)
    nr_juncao_loja = models.CharField(max_length=3, blank=True, null=True)
    nr_dias_carencia = models.IntegerField(blank=True, null=True)
    sg_sai_de = models.CharField(max_length=3, blank=True, null=True)
    no_mensagem_dia = models.CharField(max_length=40, blank=True, null=True)
    cd_comunicacao = models.CharField(max_length=1, blank=True, null=True)
    cd_tabano = models.CharField(max_length=4, blank=True, null=True)
    nr_tabela = models.CharField(max_length=3, blank=True, null=True)
    nr_dias_atraso = models.IntegerField(blank=True, null=True)
    vl_perc_atraso = models.FloatField(blank=True, null=True)
    vl_perc_desconto = models.FloatField(blank=True, null=True)
    vl_arr_recibo = models.FloatField(blank=True, null=True)
    fl_arr_automatico = models.CharField(max_length=1, blank=True, null=True)
    nr_dias_cobranca = models.IntegerField(blank=True, null=True)
    dt_caixa = models.DateField(blank=True, null=True)
    fl_ld = models.CharField(max_length=1, blank=True, null=True)
    fl_rec_entrada = models.CharField(max_length=1, blank=True, null=True)
    sg_loja_cc = models.CharField(max_length=3, blank=True, null=True)
    vl_pag_min_car = models.FloatField(blank=True, null=True)
    vl_perc_pgm_car = models.FloatField(blank=True, null=True)
    sg_loja_central = models.CharField(max_length=3, blank=True, null=True)
    no_moeda_cartao = models.CharField(max_length=4, blank=True, null=True)
    vl_perc_07_cartao = models.FloatField(blank=True, null=True)
    vl_perc_08_cartao = models.FloatField(blank=True, null=True)
    vl_perc_entrada = models.FloatField(blank=True, null=True)
    vl_perc_avista = models.FloatField(blank=True, null=True)
    vl_perc_aprazo = models.FloatField(blank=True, null=True)
    vl_perc_cartao = models.FloatField(blank=True, null=True)
    fl_preco_manual = models.CharField(max_length=1, blank=True, null=True)
    vl_arr_nota = models.FloatField(blank=True, null=True)
    fl_caixa_con = models.CharField(max_length=1, blank=True, null=True)
    no_dolar = models.CharField(max_length=4, blank=True, null=True)
    nr_dias_conceito = models.IntegerField(blank=True, null=True)
    fl_emite_nota = models.CharField(max_length=1, blank=True, null=True)
    vl_arr_prestacao = models.FloatField(blank=True, null=True)
    fl_rat_cc_pe = models.CharField(max_length=2, blank=True, null=True)
    fl_arr_tipo = models.CharField(max_length=1, blank=True, null=True)
    tt_dias_aplica_df = models.CharField(max_length=3, blank=True, null=True)
    no_fantasia = models.CharField(max_length=15, blank=True, null=True)
    dt_reserva = models.DateField(blank=True, null=True)
    fl_desc_item = models.CharField(max_length=1, blank=True, null=True)
    vl_max_desconto = models.FloatField(blank=True, null=True)
    fl_local_desc = models.CharField(max_length=1, blank=True, null=True)
    fl_promo_av = models.CharField(max_length=1, blank=True, null=True)
    fl_promo_ap = models.CharField(max_length=1, blank=True, null=True)
    dt_control1 = models.DateField(blank=True, null=True)
    dt_control2 = models.DateField(blank=True, null=True)
    dt_control3 = models.DateField(blank=True, null=True)
    dt_control4 = models.DateField(blank=True, null=True)
    dt_control5 = models.DateField(blank=True, null=True)
    dt_control6 = models.DateField(blank=True, null=True)
    tt_limite_azul = models.IntegerField(blank=True, null=True)
    tt_limite_verde = models.IntegerField(blank=True, null=True)
    fl_impressao = models.CharField(max_length=1, blank=True, null=True)
    fl_almoxarifado = models.CharField(max_length=1, blank=True, null=True)
    fl_mensnota = models.CharField(max_length=1, blank=True, null=True)
    fl_tp_seried = models.CharField(max_length=1, blank=True, null=True)
    fl_cod_barra = models.CharField(max_length=1, blank=True, null=True)
    sg_loja_recibo = models.CharField(max_length=3, blank=True, null=True)
    fl_nr_transf = models.CharField(max_length=1, blank=True, null=True)
    sg_loja_estoque = models.CharField(max_length=3, blank=True, null=True)
    nr_dias_predt = models.CharField(max_length=3, blank=True, null=True)
    nr_meses_desc_canc = models.CharField(max_length=3, blank=True, null=True)
    nr_cmc = models.CharField(max_length=20, blank=True, null=True)
    nr_nire = models.CharField(max_length=20, blank=True, null=True)
    dt_nire = models.DateField(blank=True, null=True)
    cd_cidadeibge = models.CharField(max_length=7, blank=True, null=True)
    nr_numero = models.CharField(max_length=6, blank=True, null=True)
    cd_loja = models.CharField(max_length=4, blank=True, null=True)
    nr_cnae = models.CharField(max_length=7, blank=True, null=True)
    no_email = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'loja'


class PisoSalario(models.Model):
    pk_piso_salario = models.BigAutoField(primary_key=True)
    dt_inicio = models.DateField(blank=True, null=True)
    dt_final = models.DateField(blank=True, null=True)
    dt_criado = models.DateField(blank=True, null=True)
    vl_piso = models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)
    fl_ativo = models.CharField(max_length=1, blank=True, null=True)
    id_criado = models.DecimalField(max_digits=8, decimal_places=0, blank=True, null=True)
    tx_obs = models.CharField(max_length=60, blank=True, null=True)
    dt_exclui = models.DateField(blank=True, null=True)
    id_exclui = models.DecimalField(max_digits=8, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'piso_salario'
