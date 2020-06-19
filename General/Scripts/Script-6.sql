--select distinct on (ct_venda ) cd_chave_cli, ct_venda, ct_pagto ,dt_caixa ,dt_venda,nr_dias from pg_pagven_tmp ppt where 
--sg_pagto ='TMO' and nr_mesref_pag ='08' and nr_dias between 0 and 999
 -- and cd_chave_cli='10 1241017' order by ct_venda 

select distinct on (ct_venda ) cd_chave_cli, ct_venda, tp_contven , ct_pagto ,dt_caixa ,dt_venda,nr_dias from pg_pagven_tmp ppt where 
sg_pagto <>'TFF' --and nr_mesref_pag ='05' --and nr_dias between 0 and 1999 
  and cd_chave_cli='10   97296' order by ct_venda 
  
  select * from pg_pagven_tmp ppt  where cd_chave_cli='10   97296' and nr_dias  = 0 and tp_contven <> 7