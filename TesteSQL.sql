CREATE DATABASE testeSQL; 

CREATE TABLE produtos (
  cod_prod INT UNIQUE NOT NULL,
  loj_prod INT UNIQUE NOT NULL,
  desc_prod VARCHAR(40),
  dt_inclui_prod date,
  preco_prod decimal(8,3),
  CONSTRAINT produtos_pk PRIMARY KEY (cod_prod,loj_prod)
);


--1
INSERT INTO produtos VALUES (174, 1, 'CARNE', '2008-10-08', 120.00);

--2
UPDATE produtos
SET preco_prod = 95.40
WHERE cod_prod = 170 AND loj_prod = 2;

--3
SELECT * FROM produtos
WHERE loj_prod BETWEEN 1 AND 2;

--4
SELECT MAX(dt_inclui_prod) AS MaiorData, MIN(dt_inclui_prod) AS MenorData FROM produtos;

--5
SELECT COUNT(cod_prod) FROM produtos;

--6
SELECT * FROM produtos
WHERE desc_prod LIKE 'L%';

--7
SELECT SUM(preco_prod) FROM produtos
GROUP BY loj_prod;

--8
SELECT lojas.loj_prod, lojas.desc_loj, estoque.Cód_prod, produtos.desc_prod, produtos.preco_prod, estoque.qtd_prod 
FROM lojas 
INNER JOIN  produtos ON lojas.loj_prod = produtos.loj_prod
INNER JOIN estoque ON  produtos.Cód_prod = estoque.Cód_prod
 
--9
SELECT produtos.Cód_prod, estoque.Cód_prod FROM produtos
LEFT JOIN estoque
ON produtos.Cód_prod <> estoque.Cód_prod
ORDER BY produtos.Cód_prod;

--last
SELECT  estoque.Cód_prod, produtos.Cód_prod FROM estoque
LEFT JOIN produtos
ON estoque.Cód_prod <> produtos.Cód_prod;


