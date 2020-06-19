CREATE OR REPLACE FUNCTION dados01.fct_pagtodiavenda()
 RETURNS void
 LANGUAGE plpgsql
AS $function$


declare -- fco fcçjhp
V_NODIA  numeric(6) := 0;
V_NODIA0A6 numeric(6) := 0;
CLIVENDA RECORD;

begin 
	/*
drop table if exists pg_pagtos;
drop table if exists pg_pagven;
drop table if exists pg_pagven_ini;
drop table if exists pg_naovenda;
drop sequence if exists x;

create temp table pg_pagtos as select c.sg_loja as "sg_pagto",c.cd_chave_con, c.tp_contrato, c.tp_fin,c.cd_chave_cli,c.qt_prest_atraso, c.tt_dias_atraso,
           c.tt_dias_uatraso,c.nr_dias_matraso, p.dt_vencimento, p.dt_caixa,p.nr_prestacao,p.qt_prestacao,p.nr_mesref_pag, p.nr_anoref_pag, 
            c.vl_venda, c.cd_divisao from 
 contrato c join prestacao p 
   on c.cd_chave_con = p.cd_chave_con 
    WHERE  p.dt_caixa BETWEEN '2017-01-01' and '2017-12-31'
      and p.nr_prestacao = p.qt_prestacao 
      and p.tp_contrato in (2,7);
     
create temp table pg_pagven_ini as select distinct on (cd_chave_cli) cd_chave_cli from pg_pagtos_tmp order by cd_chave_cli; 

create temp table pg_pagven2 as
   select nextval('x'::regclass) as "pk", c.sg_loja as "sg_venda",c.cd_chave_con as "ct_venda",c.cd_divisao as "cd_divvenda",c.tp_contrato as "tp_contven", 
       c.tp_fin as "tp_finven",  c.cd_chave_cli, c.dt_venda,c.dt_cancel,c.dt_exclui, 0 as "nr_dia", 0 as "nr_dia0a6"
       from  pg_pagven_ini p LEFT join contrato c
         on p.cd_chave_cli = c.cd_chave_cli
         WHERE  (c.sg_loja <> 'DAP' AND 
         c.dt_venda >= '2017-01-01' AND c.dt_exclui IS NULL);      
     */   
--ALTER TABLE pg_pagven2_tmp ADD nr_dia numeric(6);
--ALTER TABLE pg_pagven2_tmp ADD nr_dia0a6 numeric(6);

FOR clivenda in select cd_chave_cli,ct_venda ,dt_venda from pg_pagven2_tmp where tp_contven <> 7
   loop
      V_NODIA := 0;
      V_NODIA0A6 := 0;
      select 1 into v_nodia from pg_pagtos_tmp p where p.cd_chave_cli = clivenda.cd_chave_cli
              and p.dt_caixa = clivenda.dt_venda limit 1;
      if not found THEN
         V_NODIA := 0;
         select 1 into v_nodia0a6 from pg_pagtos_tmp p where p.cd_chave_cli = clivenda.cd_chave_cli
              and clivenda.dt_venda between p.dt_caixa and (p.dt_caixa+6) limit 1;
      end if;
     
      update PG_PAGVEN2_TMP set nr_dia = coalesce(V_NODIA,0), 
                                nr_dia0a6 = coalesce(V_NODIA0a6,0)
                                where ct_venda = clivenda.ct_venda;
   

    END LOOP;
END;
/*
create temp table pgtovendas_tmp42 as 
 SELECT sg_pagto, nr_mesref_pag, nr_anoref_pag,'A0' as "fl_registro", SUM(1) as "qt_quitados",
          SUM(CASE WHEN cd_divisao IN (1,51)  THEN 1 ELSE 0 END) as "qt_quitele",
          SUM(CASE WHEN cd_divisao IN (1,51) AND tp_contrato = 2 THEN 1 ELSE 0 END) as "qt_quiteleap",
          SUM(CASE WHEN cd_divisao IN (1,51) AND tp_fin > 70 THEN 1 ELSE 0 END) as "qt_quitelencp",
          SUM(CASE WHEN cd_divisao IN (2,52) THEN 1 ELSE 0 END) as "qt_quittec",
          SUM(CASE WHEN cd_divisao IN (2,52) AND tp_contrato = 2 THEN 1 ELSE 0 END) as "qt_quittecap",
          SUM(CASE WHEN cd_divisao IN (2,52) AND tp_fin > 70 THEN 1 ELSE 0 END) as "qt_quitecncp",
          SUM(CASE WHEN cd_divisao NOT IN (1,2,51,52) THEN 1 ELSE 0 END) as "qt_quitout",
          SUM(CASE WHEN cd_divisao NOT IN (1,2,51,52) AND tp_contrato = 2 THEN 1 ELSE 0 END) as "qt_quitoutap",
          SUM(CASE WHEN cd_divisao NOT IN (1,2,51,52) AND tp_fin > 70 THEN 1 ELSE 0 END) as "qt_quitoutncp",
          SUM(CASE WHEN cd_divisao = 4 THEN 1 ELSE 0 END) as "qt_cdv",
          SUM(CASE WHEN nr_dias_matraso > 0 THEN 1 ELSE 0 END)  as "qt_atraso", 
	      SUM(CASE WHEN tt_dias_uatraso > 0 THEN 1 ELSE 0 END)  as "qt_atrultima", 
          0 as "qt_vendas",
          0 as "qt_vendasdia",
	      0 as "pc_vendas", 
	      0 as "qt_eletro", 
	      0 as "qt_eleav", 
	      0 as "qt_eleap", 
	      0 as "qt_elencp", 
	      0 as "qt_tecon", 
	      0 as "qt_tecav", 
	      0 as "qt_tecap", 
	      0 as "qt_tecncp", 
	      0 as "qt_outros", 
	      0 as "qt_outav", 
	      0 as "qt_outap", 
	      0 as "qt_outncp" 
    FROM pg_pagtos_tmp GROUP BY sg_pagto, nr_mesref_pag, nr_anoref_pag
   UNION
 SELECT sg_venda, to_char(dt_venda,'MM'), to_char(dt_venda,'YYYY'),'A1' as "fl_registro",
          0 as "qt_quitados",
	      0 as "qt_quitele",
	      0 as "qt_quiteleap",
	      0 as "qt_quitelencp", 
	      0 as "qt_quittec", 
	      0 as "qt_quittecap", 
	      0 as "qt_quitecncp", 
	      0 as "qt_quitout", 
	      0 as "qt_quitoutap", 
	      0 as "qt_quitoutncp", 
          0 as "qt_cdv", 
          0 as "qt_atraso", 
	      0 as "qt_atrultima", 
          SUM(CASE WHEN nr_dia = 1 AND tp_contven IN (1,2) THEN 1 ELSE 0 END) as "qt_vendas",
          SUM(CASE WHEN nr_dia0a6 = 1 AND tp_contven IN (1,2) THEN 1 ELSE 0 END) as "qt_vendasdia",
          0 as "pc_vendas",
          SUM(CASE WHEN nr_dia between 1 and 6 and cd_divvenda IN (1,51) THEN 1 ELSE 0 END) as "qt_eletro",
          SUM(CASE WHEN nr_dia between 1 and 6 and cd_divvenda IN (1,51) AND tp_contven = 1 AND tp_finven < 70  THEN 1 ELSE 0 END) as "qt_eleav",
          SUM(CASE WHEN nr_dia between 1 and 6 and cd_divvenda IN (1,51) AND tp_contven = 2 THEN 1 ELSE 0 END) as "qt_eleap",
          SUM(CASE WHEN nr_dia between 1 and 6 and cd_divvenda IN (1,51) AND tp_contven = 1 AND tp_finven > 70 THEN 1 ELSE 0 END) as "qt_elencp",
          SUM(CASE WHEN nr_dia between 1 and 6 and cd_divvenda IN (2,52) THEN 1 ELSE 0 END) as "qt_tecon",
          SUM(CASE WHEN nr_dia between 1 and 6 and cd_divvenda IN (2,52) AND tp_contven = 1 AND tp_finven < 70 THEN 1 ELSE 0 END) as "qt_tecav",
          SUM(CASE WHEN nr_dia between 1 and 6 and cd_divvenda IN (2,52) AND tp_contven = 2 THEN 1 ELSE 0 END) as "qt_tecap",
          SUM(CASE WHEN nr_dia between 1 and 6 and cd_divvenda IN (2,52) AND tp_contven = 1 AND tp_finven > 70 THEN 1 ELSE 0 END) as "qt_tecncp",
          SUM(CASE WHEN nr_dia between 1 and 6 and cd_divvenda NOT IN (1,2,51,52) THEN 1 ELSE 0 END) as "qt_outros",
          SUM(CASE WHEN nr_dia between 1 and 6 and cd_divvenda NOT IN (1,2,51,52) AND tp_contven = 1 AND tp_finven < 70 THEN 1 ELSE 0 END) as "qt_outav",
          SUM(CASE WHEN nr_dia between 1 and 6 and cd_divvenda NOT IN (1,2,51,52) AND tp_contven = 2 THEN 1 ELSE 0 END) as "qt_outap",
          SUM(CASE WHEN nr_dia between 1 and 6 and cd_divvenda NOT IN (1,2,51,52) AND tp_contven = 1 AND tp_finven > 70 THEN 1 ELSE 0 END) as "qt_outncp"
    FROM pg_pagven2_tmp GROUP BY sg_venda ,to_char(dt_venda,'MM'), to_char(dt_venda,'YYYY');
    
   SELECT sg_pagto, nr_mesref_pag, nr_anoref_pag, 
       SUM(qt_quitados) as "qt_quitados",
	   SUM(qt_quitele) as "qt_quitele",
	   SUM(qt_quiteleap) as "qt_quiteleap",
	   SUM(qt_quitelencp) as "qt_quitelencp",
	   SUM(qt_quittec) as "qt_quittec",
	   SUM(qt_quittecap) as "qt_quittecap",
	   SUM(qt_quitecncp) as "qt_quitecncp",
	   SUM(qt_quitout) as "qt_quitout",
	   SUM(qt_quitoutap) as "qt_quitoutap",
	   SUM(qt_quitoutncp) as "qt_quitoutncp",
       SUM(qt_cdv) as "qt_cdv",
       SUM(qt_atraso) as "qt_atraso",
	   SUM(qt_atrultima) as "qt_atrultima",
	   SUM(qt_vendas) as "qt_vendas",
	   SUM(qt_vendasdia) as "qt_vendasdia",
	   SUM(pc_vendas) as "pc_vendas",
	   SUM(qt_eletro) as "qt_eletro",
	   SUM(qt_eleav) as "qt_eleav",
	   SUM(qt_eleap) as "qt_eleap",
	   SUM(qt_elencp) as "qt_elencp",
	   SUM(qt_tecon) as "qt_tecon",
	   SUM(qt_tecav) as "qt_tecav",
	   SUM(qt_tecap) as "qt_tecap",
	   SUM(qt_tecncp) as "qt_tecncp",
       SUM(qt_outros) as "qt_outros",
	   SUM(qt_outav) as "qt_outav",
	   SUM(qt_outap) as "qt_outap",
	   SUM(qt_outncp) as "qt_outncp"
      FROM pgtovendas_tmp42 GROUP BY sg_pagto, nr_mesref_pag, nr_anoref_pag;
  */
$function$
;