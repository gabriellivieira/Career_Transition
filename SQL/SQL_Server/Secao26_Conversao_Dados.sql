/* CONVERS�O DE DADOS */

USE EMPRESA
GO

-- A convers�o de String para Numerico � feito de forma autom�tica.
-- A convers�o de Numerico para String precisa ser feito manual 

-- Convers�o implicito/autom�tico
SELECT 1 + '1' 
GO

SELECT '1' + '1'
GO

SELECT 'CURSO DE BANCO DE DADOS' + '1'
GO

SELECT 'CURSO DE BANCO DE DADOS' + 1
GO

/* FUN��O DE CONVERSAO DE DADOS*/

-- CAST para converter, devendo passar o tipo
-- Convers�o explicita 
SELECT CAST('1' AS INT) + CAST('1' AS INT)
GO

/* CONVERS�O POR CONCATENACAO */

-- Trazer a data no formato PT-BR
SELECT  NOME,
		CAST(DAY(NESCIMENTO) AS VARCHAR) + '/' +
		CAST(MONTH(NESCIMENTO) AS VARCHAR) + '/' +
		CAST(YEAR(NESCIMENTO) AS VARCHAR) AS "NASCIMENTO"
FROM ALUNO
GO


/* CHARINDEX - RETORNA INTEIRO
*/

-- Quando~n�o passado um parametro ele inicia a contagem em 1
-- No select estamos buscarndo a letra A e a posi��o da letra no nome
SELECT NOME, CHARINDEX('A', NOME) AS INDICE
FROM ALUNO
GO

-- No select ele come�a a procura come�ando a segunda posi��o, desconsiderando a segunda
SELECT NOME, CHARINDEX('A', NOME, 2) AS INDICE
FROM ALUNO
GO

/* BULK INSERTO - IMPORTA��O DE ARQUIVOS */

CREATE TABLE LANCAMENTO_CONTABIL(
	CONTA INT,
	VALOR INT,
	DEB_CRED CHAR(1)
)
GO

SELECT * FROM LANCAMENTO_CONTABIL
GO

-- \t = TAB
-- \n = ENTER
BULK INSERT LANCAMENTO_CONTABIL
FROM 'C:\Users\gabri\documents\SQL\CONTAS.txt'
WITH
(
	FIRSTROW = 2,
	DATAFILETYPE = 'CHAR',
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n'
)
GO

SELECT * FROM LANCAMENTO_CONTABIL
GO

/* DESAFIO DO SALDO
 Fazer Query que traga o numero da conta
 Saldo - Devedor ou Credor */

 -- 01 PASSO
 SELECT CONTA, VALOR,
 CHARINDEX('D', DEB_CRED) AS DEBITO,
 CHARINDEX('C', DEB_CRED) AS CREDITO
 FROM LANCAMENTO_CONTABIL
 GO

-- 02 PASSO: C-> 1 x 2 - 1 = 1
--			 D -> 0 x 2 -1 = -1
 SELECT CONTA, VALOR,
 CHARINDEX('D', DEB_CRED) AS DEBITO,
 CHARINDEX('C', DEB_CRED) AS CREDITO,
 CHARINDEX('C', DEB_CRED) * 2 - 1 AS MULTIPLICADOR
 FROM LANCAMENTO_CONTABIL
 GO

-- 03 PASSO: Realizando a soma agrupando por conta
 SELECT CONTA,
		SUM(VALOR * (CHARINDEX('C', DEB_CRED) * 2 - 1)) AS SALDO
 FROM LANCAMENTO_CONTABIL
 GROUP BY CONTA
 GO

