/*
 -- https://docs.microsoft.com/pt-br/sql/t-sql/statements/create-view-transact-sql?view=sql-server-ver16
 P:  O que é View ?

 R: Cria uma tabela virtual cujo conteúdo (colunas e linhas)
 é definido por uma consulta.
 Use esta instrução para criar uma exibição dos dados em uma ou 
 mais tabelas no banco de dados. 
 Por exemplo, uma exibição pode ser usada para as finalidades a seguir:

 -> Para focalizar, simplificar e personalizar a percepção que cada 
    usuário tem do banco de dados.

 -> Como um mecanismo de segurança permitindo que os usuários acessem 
   dados por meio da exibição, sem conceder permissões aos usuários para 
   acessar diretamente as tabelas base subjacentes.

 -> Para fornecer uma interface compatível com versões anteriores 
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