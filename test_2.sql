WITH RecursiveIterator AS (
  SELECT 1 AS IteratorValue
  FROM dual
  UNION ALL
  SELECT IteratorValue + 1
  FROM RecursiveIterator
  WHERE IteratorValue < (SELECT MAX(SeuCampoNumerico) FROM SuaTabela)
), MaxValue AS (
  SELECT MAX(SeuCampoNumerico) AS MaxValue
  FROM SuaTabela
)
SELECT IteratorValue
FROM RecursiveIterator, MaxValue
WHERE IteratorValue <= MaxValue;
