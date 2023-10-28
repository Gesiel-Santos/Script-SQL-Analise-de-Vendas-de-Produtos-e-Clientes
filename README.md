# Suco Vendas

Este repositório contém scripts SQL para criar e popular um banco de dados de vendas de sucos. Os scripts foram desenvolvidos usando o MySQL.

## Objetivo

O objetivo deste projeto é demonstrar como usar o SQL para criar tabelas, inserir dados, realizar consultas e análises em um banco de dados relacional. O banco de dados contém informações sobre clientes, produtos, vendedores, notas fiscais e itens de notas fiscais.

## Esquema do banco de dados

O banco de dados é composto por cinco tabelas:

- **TABELA_DE_CLIENTES**: contém os dados dos clientes, como CPF, nome, endereço, data de nascimento, sexo, limite de crédito, volume de compra e primeira compra.
- **TABELA_DE_PRODUTOS**: contém os dados dos produtos vendidos, como código, nome, embalagem, tamanho, sabor e preço de lista.
- **TABELA_DE_VENDEDORES**: contém os dados dos vendedores, como matrícula, nome, percentual de comissão, data de admissão, férias e bairro.
- **NOTAS_FISCAIS**: contém os dados das notas fiscais emitidas pelos vendedores para os clientes, como número, data, valor e imposto.
- **ITENS_NOTAS_FISCAIS**: contém os dados dos itens de cada nota fiscal, como número da nota fiscal, código do produto, quantidade e preço.

O esquema do banco de dados pode ser visualizado na imagem abaixo:

<div>
 <img align="" height="400" width="600" alt="coding-time" src="esquema.banco de dados.png">
</div>
<br>

## Scripts SQL

Os scripts SQL estão divididos em três arquivos:

- **CRIACAO_ESQUEMA.sql**: contém os comandos para criar o esquema do banco de dados e as tabelas.
- **INSERCAO_DADOS.sql**: contém os comandos para inserir os dados nas tabelas.
- **SCRIPT_CONSULTAS.sql**: contém os comandos para realizar consultas no banco de dados.

## Resultados

Os resultados das consultas e análises são apresentados em tabelas ou gráficos. Alguns exemplos são:

- **Quantidade e valor médio dos pedidos por mês**: mostra a quantidade e o valor médio dos pedidos realizados em cada mês do ano.

| Mês | Quantidade | Valor médio |
| --- | ---------- | ----------- |
| Jan | 10         | 150.00      |
| Fev | 12         | 180.00      |
| Mar | 15         | 200.00      |
| ... | ...        | ...         |



- **Produtos mais vendidos por sabor**: mostra os nomes e as quantidades dos produtos mais vendidos em cada sabor.

| Sabor    | Nome do produto    | Quantidade |
| -------- | ------------------ | ---------- |
| Abacaxi  | Suco Abacaxi 300ml | 120        |
| Laranja  | Suco Laranja 500ml | 150        |
| Morango  | Suco Morango 300ml | 100        |
| ...      | ...                | ...        |



- **Vendedores que mais venderam produtos da categoria Suco**: mostra os nomes e os valores totais dos vendedores que mais venderam produtos da categoria Suco.

| Nome      | Valor total |
| --------- | ----------- |
| Ana       | 5000.00     |
| Bruno     | 4500.00     |
| Carlos    | 4000.00     |
| ...       | ...         |

## Conclusão

Este projeto mostra como usar o SQL para criar e manipular um banco de dados relacional. Os scripts SQL podem ser adaptados para outros cenários e necessidades. Espero que este projeto seja útil para quem quer aprender ou praticar SQL.
