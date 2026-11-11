-- Questao 01
--Resposta: 906

SELECT count(*) 
FROM fato_vendas
WHERE id_cliente IS NULL

-- Questao 02
--Resposta: 746

SELECT count(DISTINCT id_cliente) 
FROM fato_vendas

-- Questao 03
--Resposta: 388250.31

SELECT  SUM(valor_total) 
FROM fato_vendas
WHERE data_venda BETWEEN '2025-01-01' AND '2025-12-31'

-- Questao 04
--Resposta: 
"Colgate"
"Dove"
"Elseve"
"Huggies"
"Lux"
"Mili"
"Neve"
"Nivea"
"Oral-B"
"Pampers"
"Pantene"
"Personal"
"Protex"
"Rexona"
"Seda"
"Sorriso"

SELECT distinct marca
FROM dim_produto
where categoria = 'Higiene'
order by marca asc

-- Questao 05
--Resposta: 52.2665833630846126

SELECT avg(valor_total) as valor_medio
FROM fato_vendas
where canal = 'Aplicativo'

-- Questao 06
--Resposta: 20

SELECT COUNT(*)
FROM dim_produto
where categoria = 'Bebidas'
and preco_tabela > 10.00

-- Questao 07
--Resposta: "Racao para Caes 10kg"	"Premier"	140.29

SELECT nome_produto, marca, preco_tabela
FROM dim_produto
ORDER BY preco_tabela DESC, nome_produto ASC
LIMIT 1

-- Questao 08
--Resposta:
"Mercearia"	49
"Bebidas"	39
"Higiene"	34
"Laticínios"	32
"Limpeza"	27
"Congelados"	20
"Carnes"	13
"Padaria"	10
"Pet"	8
"Hortifruti"	8

SELECT categoria, COUNT(*) AS total_produtos
FROM dim_produto
GROUP BY categoria
ORDER BY total_produtos DESC

-- Questao 09
--Resposta: 
"Pet"	76.1500000000000000
"Carnes"	37.8230769230769231
"Congelados"	33.1800000000000000
"Higiene"	25.8452941176470588
"Bebidas"	19.2646153846153846
"Limpeza"	17.5674074074074074
"Laticínios"	14.5062500000000000
"Mercearia"	14.4977551020408163
"Padaria"	8.2220000000000000
"Hortifruti"	6.2400000000000000

SELECT categoria, avg(preco_tabela) as preco_medio
FROM dim_produto
GROUP BY categoria
order by preco_medio desc

-- Questao 10
--Resposta: 
"Brasília"	245
"Taguatinga"	92
"Ceilândia"	81
"Goiânia"	68
"Águas Claras"	64
"Samambaia"	63

SELECT cidade, count(*) as total_clientes
FROM dim_cliente
group by cidade 
having count(*) >= 60
order by total_clientes desc, cidade asc

-- Questao 11
--Resposta: 75

SELECT count (*)
FROM dim_cliente
where email is null

-- Questao 12
--Resposta: 74

SELECT count (*)
FROM dim_cliente
where sexo = 'F'
and data_nascimento between '1990-01-01' and '1999-12-31'

-- Questao 13
--Resposta: 11

SELECT COUNT(*)
FROM dim_cliente
WHERE nome ILIKE 'Ana'
   OR nome ILIKE 'Ana %'

-- Questao 14
--Resposta: 
"DF"	56
"GO"	41
"MG"	4

SELECT UF, COUNT(*) AS total_lojas
FROM dim_loja
GROUP BY UF
HAVING COUNT(*) > 3
ORDER BY total_lojas DESC;

-- Questao 15
--Resposta: 
"Bom Dia Cruzeiro"	"Brasília"	"2005-01-20"
"Bom Dia Jardim Tiradentes"	"Aparecida de Goiânia"	"2005-03-14"
"Bom Dia Sobradinho I"	"Sobradinho"	"2005-04-15"
"Bom Dia Aparecida Centro"	"Aparecida de Goiânia"	"2005-06-04"
"Bom Dia Colônia Agrícola Samambaia"	"Vicente Pires"	"2005-08-07"
"Bom Dia Octogonal"	"Brasília"	"2005-08-21"
"Bom Dia Sobradinho II"	"Sobradinho"	"2005-10-15"
"Bom Dia Samambaia Norte"	"Samambaia"	"2006-04-07"
"Bom Dia Centro Uberlândia"	"Uberlândia"	"2006-04-12"
"Bom Dia Pistão Sul"	"Taguatinga"	"2006-08-12"
"Bom Dia Jardim Goiás"	"Goiânia"	"2006-12-06"
"Bom Dia Luziânia Centro"	"Luziânia"	"2006-12-07"
"Bom Dia Taguatinga Centro"	"Taguatinga"	"2006-12-16"
"Bom Dia P Norte"	"Ceilândia"	"2006-12-20"

SELECT nome_loja, cidade, data_inauguracao
FROM dim_loja
where data_inauguracao <= '2007-01-01'
order by data_inauguracao asc

-- Questao 16
--Resposta: 
"Loja física"	276534.24
"Aplicativo"	76340.05
"Site"	35376.02

SELECT canal, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE data_venda >= '2025-01-01'
GROUP BY canal
ORDER BY faturamento DESC

-- Questao 17
--Resposta: 
"Cartão de crédito"	3237	166687.46
"Cartão de débito"	3222	163300.11
"Pix"	2684	141486.51
"Dinheiro"	1627	80073.40

SELECT forma_pagamento, COUNT(*) AS quantidade_vendas, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE canal = 'Loja física'
GROUP BY forma_pagamento
ORDER BY faturamento DESC

-- Questao 18
--Resposta: 
28	1333
89	827
224	804
136	587
163	555
113	532
132	504
223	470
6	436
127	374

SELECT id_produto, SUM(quantidade) AS total_unidades_vendidas
FROM fato_vendas
GROUP BY id_produto
ORDER BY total_unidades_vendidas DESC, id_produto ASC
LIMIT 10

-- Questao 19
--Resposta: 
3	23884.53
17	13507.46
6	12672.20
56	11476.51
4	10963.94

SELECT id_loja, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE data_venda BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY id_loja
ORDER BY faturamento DESC
LIMIT 5

-- Questao 20
--Resposta: 
3	886
49	476
11	459
6	444
9	440
4	434
56	429
2	420
17	410
23	316

SELECT id_loja, COUNT(*) AS total_linhas_venda
FROM fato_vendas
GROUP BY id_loja
HAVING COUNT(*) > 300
ORDER BY total_linhas_venda DESC

-- Questao 21
--Resposta: 
416	169
684	135
9	126
186	122
563	113
323	97
395	95
290	81
501	78
90	75
129	75
198	71
242	70

SELECT  id_cliente, COUNT(*) AS total_linhas_venda
FROM fato_vendas
WHERE id_cliente IS NOT NULL
GROUP BY id_cliente
HAVING COUNT(*) >= 70
ORDER BY total_linhas_venda DESC, id_cliente ASC

-- Questao 22
--Resposta: 
2653	5.25

SELECT COUNT(*) AS total_linhas_com_desconto, ROUND(AVG(desconto), 2) AS valor_medio_desconto
FROM fato_vendas
WHERE desconto > 0

-- Questao 23
--Resposta: 
2.67	654.20

SELECT MIN(valor_total) AS menor_valor_total, MAX(valor_total) AS maior_valor_total
FROM fato_vendas
WHERE data_venda BETWEEN '2025-12-01' AND '2025-12-31'

-- Questao 24
--Resposta: 
24	1281.83

SELECT COUNT(*) AS total_linhas_venda, SUM(valor_total) AS faturamento_total
FROM fato_vendas
WHERE data_venda = '2025-12-24'

-- Questao 25
--Resposta: 
8328	3.45	0.52	2.93	15.07
8282	6.71	1.01	5.70	15.05
13421	7.32	1.10	6.22	15.03
8261	18.04	2.71	15.33	15.02
9109	25.97	3.90	22.07	15.02
13288	19.84	2.98	16.86	15.02
8422	58.58	8.79	49.79	15.01
10473	35.72	5.36	30.36	15.01
10654	11.06	1.66	9.40	15.01
10706	23.39	3.51	19.88	15.01

SELECT  id_venda, (quantidade * preco_unitario) AS valor_bruto, desconto, valor_total, ROUND(((desconto / (quantidade * preco_unitario)) * 100), 2) AS percentual_desconto
FROM fato_vendas
WHERE canal = 'Site'
AND data_venda BETWEEN '2025-01-01' AND '2025-12-31'
AND desconto > 0
ORDER BY percentual_desconto DESC, id_venda ASC
LIMIT 10;


