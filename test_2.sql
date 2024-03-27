,(length(proc.imagem) - length(replace(proc.imagem, '_'))) teste
,INSTR(replace(proc.imagem,'.tif',''),'_',-1) POS
, CASE
WHEN (length(proc.imagem) - length(replace(proc.imagem, '_'))) = 2 THEN replace(substr(proc.imagem,(INSTR(replace(proc.imagem,'.tif',''),'_',-1))+1,100),'.tif','')
ELSE '0'
END KICID_REPLACE
