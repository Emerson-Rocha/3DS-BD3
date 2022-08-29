/*
 -- https://docs.microsoft.com/pt-br/sql/t-sql/statements/create-view-transact-sql?view=sql-server-ver16
 P:  O que � View ?

 R: Cria uma tabela virtual cujo conte�do (colunas e linhas)
 � definido por uma consulta.
 Use esta instru��o para criar uma exibi��o dos dados em uma ou 
 mais tabelas no banco de dados. 
 Por exemplo, uma exibi��o pode ser usada para as finalidades a seguir:

 -> Para focalizar, simplificar e personalizar a percep��o que cada 
    usu�rio tem do banco de dados.

 -> Como um mecanismo de seguran�a permitindo que os usu�rios acessem 
   dados por meio da exibi��o, sem conceder permiss�es aos usu�rios para 
   acessar diretamente as tabelas base subjacentes.

 -> Para fornecer uma interface compat�vel com vers�es anteriores 
 para emular uma tabela cujo esquema foi alterado.



*/
-- CRIAR UMA VIEW
CREATE VIEW vwLivro 
 AS
 SELECT tb_livro.cod_liv as 'CODIGO',
        tb_livro.titulo_liv as 'TITULO',
		format(tb_livro.preco_liv,'C','PT-BR') as 'VALOR UN'
 FROM tb_livro ;

 -- CHAMAR UM VIEW

 SELECT * FROM vwLivro;

 
 -- EXCLUIR 
 DROP VIEW vwLivro;


 -- ALTER 

ALTER VIEW vwLivro 
 AS
 SELECT tb_livro.cod_liv as 'CODIGO',
        tb_livro.titulo_liv as 'TITULO',
	   tb_livro.preco_liv as 'VALOR UN'
 FROM tb_livro ;