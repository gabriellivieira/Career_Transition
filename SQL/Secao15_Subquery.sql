
-- SUBQUARYS 

use projeto;

/* Vendedor que vendeu menos em marco e o seu nome */

SELECT NOME, MARCO 
FROM VENDEDORES;

SELECT MIN(MARCO) AS MIN_MARCO FROM VENDEDORES;

SELECT NOME, MARCO
FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) AS MIN_MARCO FROM VENDEDORES);

/* Vendedor que vendeu mais em marco e o seu nome */

SELECT MAX(MARCO) AS MAX_MARCO FROM VENDEDORES;

SELECT NOME, MARCO
FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) AS MAX_MARCO FROM VENDEDORES);

/* Quem vendeu mais que a média no mês de fevereiro */

SELECT AVG(FEVEREIRO) FROM VENDEDORES;

SELECT NOME, FEVEREIRO
FROM VENDEDORES
WHERE FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES);
-- Utilizando o operador de maior > para que traga aqueles com 
-- resultados maiores que a média. 

/* Quem vendeu mais que a média no mês de marco */

SELECT AVG(MARCO) AS 'MÉDIA' FROM VENDEDORES;

SELECT NOME, MARCO
FROM VENDEDORES
WHERE MARCO > (SELECT AVG(MARCO) FROM VENDEDORES);