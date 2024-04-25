WITH Documentos AS (
  SELECT
    documento_id,
    COUNT(*) OVER (PARTITION BY documento_id) AS total_paginas
  FROM paginas_documento
  WHERE documento_id = 5 -- Aqui você especifica o ID do documento desejado
)
SELECT
  documento_id,
  imagem,
  total_paginas
FROM paginas_documento
JOIN Documentos ON paginas_documento.documento_id = Documentos.documento_id;
