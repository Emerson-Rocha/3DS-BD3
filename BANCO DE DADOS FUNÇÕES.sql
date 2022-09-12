/*
 Funções de String
  https://docs.microsoft.com/en-us/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver16

  https://docs.microsoft.com/pt-br/sql/relational-databases/user-defined-functions/user-defined-functions?view=sql-server-ver16
 
 Funções escalares(UDF)
  As funções escalares definidas pelo usuário retornam um valor único de dados do tipo definido na cláusula RETURNS

 Funções com valor de tabela(TVFs)
  As TVFs (funções com valor de tabela) definidas pelo usuário retornam um tipo de dados de tabela

*/

-- Funções escalares(UDF)
  -- COMANDO PARA CRIAR FUNÇÃO
 
CREATE FUNCTION  somaProduto(@ID  INT , @QTD INT)
    RETURNS FLOAT
   AS       
   BEGIN
       DECLARE @VALOR FLOAT;
          SELECT  @VALOR = (PRECO_LIV) FROM tb_livro
		  WHERE COD_LIV = @ID;
		RETURN  @VALOR * @QTD

   END;

   GO
   -- CHAMAR UM FUNÇÃO

  DECLARE @I INTEGER,
          @QT INTEGER;
		  SET @I = 1;
          SET @QT= 10;
	  --SELECT @I;
  SELECT dbO.somaProduto(@I,@QT);
   
GO

-- DELETAR

DROP FUNCTION dbo.SOMA;


GO
-- ALTER 

ALTER  FUNCTION  somaProduto(@ID  INT , @QTD INT)
    RETURNS varchar(30)
   AS       
   BEGIN
       DECLARE @VALOR FLOAT;
          SELECT  @VALOR = (PRECO_LIV) FROM tb_livro
		  WHERE COD_LIV = @ID;
		RETURN  FORMAT (@VALOR * @QTD, 'C', 'pt-br')

   END;
GO
   -- Funções com valor de tabela

   CREATE FUNCTION tabelaProduto (@ID INT, @QTD INT)
      RETURNS TABLE
	  AS
	 RETURN
	  (     
          SELECT  COD_LIV,
		          TITULO_LIV,
				  PRECO_LIV,
				  @QTD  AS 'QUANTIDAE',
		          (PRECO_LIV * @QTD) AS 'VALOR TOTAL' FROM tb_livro
		   WHERE COD_LIV = @ID
	);
GO
-- EXECUTAR(a forma de executar)
  SELECT * from tabelaProduto(1,20);

  GO
-- ALTER

ALTER FUNCTION tabelaProduto (@ID INT, @QTD INT)
      RETURNS TABLE
	  AS
	 RETURN
	  (     
          SELECT  COD_LIV,
		          TITULO_LIV,
				  FORMAT(PRECO_LIV,'C','pt-br') AS 'VALOR UNI',
				  @QTD  AS 'QUANTIDAE',
		          FORMAT (PRECO_LIV * @QTD,'C','pt-br') AS 'VALOR TOTAL' FROM tb_livro
		   WHERE COD_LIV = @ID
	);


GO



