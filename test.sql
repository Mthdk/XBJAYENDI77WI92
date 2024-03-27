SELECT 
  LENGTH(REGEXP_REPLACE(proc.imagem, '[^_]', '')) AS teste,
  REGEXP_INSTR(REGEXP_REPLACE(proc.imagem, '\.tif$', ''), '_[^_]*$', 1, 1, 0, 'c') AS POS,
  CASE
    WHEN LENGTH(REGEXP_REPLACE(proc.imagem, '[^_]', '')) = 2 THEN REGEXP_REPLACE(REGEXP_SUBSTR(proc.imagem, '_([^_]*)(?:\.tif)?$', 1, 2, NULL, 1), '\.tif$', '')
    ELSE '0'
  END AS KICID_REPLACE
FROM (
  SELECT '27032024_16_123456789.tif' AS imagem FROM dual UNION ALL
  SELECT '27032024_16_1234_56789.tif' FROM dual UNION ALL
  SELECT '27032024_16.tif' FROM dual UNION ALL
  SELECT '' FROM dual UNION ALL
  SELECT '27032024_16_%%123456789.tif' FROM dual
) proc;
