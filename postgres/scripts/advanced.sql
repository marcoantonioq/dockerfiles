-- https://www.postgresql.org/
SELECT 'Soma de 2 + 2 é: ' || 2 + 2;
-- Vistas / VIEW
CREATE VIEW myview AS
SELECT city,
  temp_lo,
  temp_hi,
  prcp,
  date,
  location
FROM weather,
  cities
WHERE city = name;
SELECT *
FROM myview;
-- Transações
-- O ponto essencial de uma transação é que ela empacota vários passos em uma única operação, tudo ou nada. 
BEGIN;
UPDATE accounts
SET balance = balance - 100.00
WHERE name = 'Alice';
-- etc etc
COMMIT;
-- Se, em parte através da transação, decidirmos que não queremos nos comprometer (talvez tenhamos notado que o saldo de Alice foi negativo), podemos emitir o comando em vez de , e todas as nossas atualizações até agora serão canceladas.ROLLBACKCOMMIT
-- 
-- Funções da janela
-- https://www.postgresql.org/docs/current/tutorial-window.html
-- Uma função de janela realiza um cálculo em um conjunto de linhas de tabela que estão de alguma forma relacionadas com a linha atual. Isso é comparável ao tipo de cálculo que pode ser feito com uma função agregada. 
SELECT depname,
  empno,
  salary,
  avg(salary) OVER (PARTITION BY depname)
FROM empsalary;