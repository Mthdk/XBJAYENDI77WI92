SELECT 
  CASE 
    WHEN REGEXP_REPLACE(imagem, '.*_([0-9]{9})\.tif$', '\1') IS NULL THEN 'SEM KICID' 
    WHEN REGEXP_LIKE(imagem, '.*_[0-9]+_[0-9]+\.tif$') THEN 'KICID INCORRETO'
    ELSE REGEXP_REPLACE(imagem, '.*_([0-9]{9})\.tif$', '\1') 
  END AS KICID_REGEX
FROM (
  SELECT '27032024_16_123456789.tif' AS imagem FROM dual UNION ALL
  SELECT '27032024_16_1234_56789.tif' FROM dual UNION ALL
  SELECT '27032024_16.tif' FROM dual UNION ALL
  SELECT '' FROM dual UNION ALL
  SELECT '27032024_16_%%123456789.tif' FROM dual
) proc;
