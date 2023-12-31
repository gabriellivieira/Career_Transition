-- Função retirada na página oficial do Postgree

-- É uma função em duas partes usando programação

CREATE OR REPLACE FUNCTION _final_median(NUMERIC[])
   RETURNS NUMERIC AS
$$
   SELECT AVG(val)
   FROM (
     SELECT val
     FROM unnest($1) val
     ORDER BY 1
     LIMIT  2 - MOD(array_upper($1, 1), 2)
     OFFSET CEIL(array_upper($1, 1) / 2.0) - 1
   ) sub;
$$
LANGUAGE 'sql' IMMUTABLE;


										 
CREATE AGGREGATE median(NUMERIC) (
  SFUNC=array_append,
  STYPE=NUMERIC[],
  FINALFUNC=_final_median,
  INITCOND='{}'
);
					
										 
SELECT MEDIAN(QTD) AS MEDIANA
FROM MAQUINAS;

SELECT MEDIAN(QTD) AS MEDIANA
FROM MAQUINAS
WHERE MAQUINA = 'Maquina 01';
								
SELECT MEDIAN(QTD) AS MEDIANA
FROM MAQUINAS
WHERE MAQUINA = 'Maquina 02';
										 
SELECT MEDIAN(QTD) AS MEDIANA
FROM MAQUINAS
WHERE MAQUINA = 'Maquina 03';
										 
-- Inserindo dados 

INSERT INTO MAQUINAS VALUES('Maquina 01',11,15.9);
INSERT INTO MAQUINAS VALUES('Maquina 02',11,15.4);
INSERT INTO MAQUINAS VALUES('Maquina 03',11,15.7);
INSERT INTO MAQUINAS VALUES('Maquina 01',12,30);
INSERT INTO MAQUINAS VALUES('Maquina 02',12,24);
INSERT INTO MAQUINAS VALUES('Maquina 03',12,45);

-- Deletando para os resultados dos outros indicadores não fiquem diferentes da tabela. 

delete from maquinas where dia = 11 or dia = 12;
