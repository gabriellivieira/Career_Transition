/* DELIMITADOR 
	
	No MySQL o delimitador padr�o era ;
	Em SQL Server os comandos n�o precisam de um delimitador
	porem � recomendado utilizar o 'Go'.
*/

create database aula_sql
go

use aula_sql
go 

create table teste(
	nome varchar(30)
)
go



/* ORGANIZAR FISICAMENTE E LOGICAMENTO UM BANCO DE DADOS

1- Criar um banco com arquivos para setores de marketing e vendas.
2- Criar um arquivo geral
3- Dexar o MDF apenas com o dicionario de dados
4- Criar 2 grupos de arquivos (grupo padr�o chamado Primaty - com arquivo MDF)
*/

USE EMPRESA
GO

CREATE TABLE TB_EMPRESA(
	ID INT, 
	NOME VARCHAR(50)
)
GO
