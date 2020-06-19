
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

 FOR clivenda in select cd_chave_cli from pg_pagven_ini  
   LOOP
      select count(1) into v_totven from contrato where c.cd_chave_cli = clivenda.cd_chave_cli
     
  
   END LOOP;