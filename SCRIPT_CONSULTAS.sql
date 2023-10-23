-- Consultas Iniciais
-- Selecionando informações da tabela de produtos
SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

-- Selecionando informações distintas de EMBALAGEM e TAMANHO da tabela de produtos
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

-- Selecionando informações distintas de EMBALAGEM e TAMANHO da tabela de produtos
-- com filtro para SABOR igual a 'Laranja'
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos
WHERE SABOR = 'Laranja';

-- Selecionando informações distintas de EMBALAGEM, TAMANHO e SABOR da tabela de produtos
SELECT DISTINCT EMBALAGEM, TAMANHO, SABOR FROM tabela_de_produtos;

-- Consultas do Join
-- Selecionando todas as informações da tabela de vendedores
SELECT * FROM tabela_de_vendedores;

-- Selecionando todas as informações da tabela de notas fiscais
SELECT * FROM notas_fiscais;

-- Realizei um INNER JOIN entre tabela_de_vendedores e notas_fiscais usando a chave primária (MATRICULA)
-- Resultado incluirá todas as colunas de ambas as tabelas
SELECT A.MATRICULA, A.NOME, B.*
FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA;

-- Realizei uma contagem do número de notas fiscais para cada vendedor
SELECT A.MATRICULA, A.NOME, COUNT(*) AS NUM_NOTAS
FROM tabela_de_vendedores A
INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;

-- Selecionando todas as informações da tabela de vendedores
SELECT * FROM tabela_de_vendedores;

-- Realizei um JOIN entre tabela_de_vendedores e notas_fiscais usando a chave primária (MATRICULA)
-- e conte o número de notas fiscais por vendedor
SELECT A.MATRICULA, A.NOME, COUNT(*) AS NUM_NOTAS
FROM tabela_de_vendedores A, notas_fiscais B
WHERE A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, A.NOME;

-- Calculo do faturamento anual somando a quantidade multiplicada pelo preço das notas fiscais
SELECT YEAR(DATA_VENDA) AS ANO, SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF 
INNER JOIN itens_notas_fiscais INF
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);

-- Concatene várias colunas em um formato específico
SELECT CONCAT(NOME, ' (', CPF, ') ') AS RESULTADO FROM TABELA_DE_CLIENTES;

-- Concatene várias colunas com espaço entre elas
SELECT NOME, CONCAT(ENDERECO_1, ' ', BAIRRO, ' ', CIDADE, ' ', ESTADO) AS COMPLETO
FROM tabela_de_clientes;

-- Consultas de Junção
-- Selecione todas as informações da tabela de itens de notas fiscais
SELECT * FROM ITENS_NOTAS_FISCAIS;

-- Selecionei todas as informações da tabela de notas fiscais
SELECT * FROM NOTAS_FISCAIS;

-- Realizei um INNER JOIN entre notas_fiscais e itens_notas_fiscais usando a chave NUMERO
-- para obter informações relacionadas
SELECT NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO;

-- Realizei um INNER JOIN entre notas_fiscais e itens_notas_fiscais usando a chave NUMERO
-- para obter informações relacionadas, incluindo o CPF do cliente
SELECT NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO;

-- Realizei um INNER JOIN entre notas_fiscais e itens_notas_fiscais usando a chave NUMERO
-- e agrupe o resultado por CPF e mês/ano
SELECT NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF, MES_ANO;

-- Calculo da diferença entre o limite de compra e a quantidade de vendas por cliente
SELECT X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.LIMITE_COMPRA,
       (X.LIMITE_COMPRA - X.QUANTIDADE_VENDAS) AS DIFERENCA
FROM (
  SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, 
         SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS, MAX(TC.VOLUME_DE_COMPRA) AS LIMITE_COMPRA
  FROM NOTAS_FISCAIS NF
  INNER JOIN ITENS_NOTAS_FISCAIS INF
  ON NF.NUMERO = INF.NUMERO
  INNER JOIN TABELA_DE_CLIENTES TC
  ON TC.CPF = NF.CPF
  GROUP BY NF.CPF, TC.NOME, MES_ANO
) AS X;
