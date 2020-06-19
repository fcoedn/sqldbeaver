select * from pg_pagven pp where sg_venda ='RDB' and to_char(dt_venda,'YYYYMM') = '201909' and tp_contven <> 7 and (nr_dia+nr_dia0a6)>0
  --and cd_chave_cli in (' 4 5824962',' 4 5817789',' 4  890467')

select * from pg_pagtos pp where sg_pagto  = 'RDB' and nr_anoref_pag ='2019' and nr_mesref_pag ='09'

select * from pg_pagven pp  where cd_chave_cli = ' 4  813393'

select * from pg_pagtos pp  where cd_chave_cli = ' 4  813393'