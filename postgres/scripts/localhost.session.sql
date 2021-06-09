SELECT 'Soma de 2 + 2 é: ' || 2 + 2;
-- CREATE DATABASE IF NOT EXISTS mydb
--     WITH 
--     OWNER = marco
--     ENCODING = 'UTF8'
--     CONNECTION LIMIT = -1;
-- create table categoria(
--   id serial,
--   descricao varchar(100) not null,
--   status integer default 1
-- );
-- insert into categoria (descricao)
-- values ('Comidas') CREATE TABLE weather (
--     city varchar(80),
--     -- low temperature
--     temp_lo int,
--     -- high temperature
--     temp_hi int,
--     -- precipitation
--     prcp real,
--     date date
--   );
CREATE TABLE IF NOT EXISTS cities (name varchar(80), location point);
-- DROP TABLE cities
INSERT INTO weather
VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');
INSERT INTO weather (city, temp_lo, temp_hi, prcp, date)
VALUES ('San Francisco', 43, 57, 0.0, '1994-11-29');
INSERT INTO weather (date, city, temp_hi, temp_lo)
VALUES ('1994-11-29', 'Hayward', 54, 37);
INSERT INTO cities
VALUES ('San Francisco', '(-194.0, 53.0)');
INSERT INTO cities
VALUES ('Hayward', '(-124.0, 43.0)');
-- COPY weather FROM './weather.txt';
SELECT *
FROM weather;
SELECT *
FROM cities;
SELECT *
FROM weather
where city = 'San Francisco'
  AND temp_lo = 46;
SELECT *
FROM weather
ORDER BY city,
  temp_lo;
SELECT *
FROM weather,
  cities
WHERE city = name;
-- Participar consultas do tipo vistas até agora também pode ser escrita nesta forma alternati
SELECT *
FROM weather
  INNER JOIN cities ON (weather.city = cities.name);
-- Também podemos juntar uma mesa contra si mesma. Isso é chamado de auto-adesão. Como exemplo, suponhamos encontrar todos os registros meteorológicos que estão na faixa de temperatura de outros registros meteorológicos. Então precisamos comparar as colunas de cada linha com as colunas de todas as outras linhas. Podemos fazer isso com a seguinte consulta:temp_lotemp_hiweathertemp_lotemp_hiweather
SELECT W1.city,
  W1.temp_lo AS low,
  W1.temp_hi AS high,
  W2.city,
  W2.temp_lo AS low,
  W2.temp_hi AS high
FROM weather W1,
  weather W2
WHERE W1.city = W2.city
  AND W1.temp_lo < W2.temp_lo
  AND W1.temp_hi > W2.temp_hi;
-- Agora vamos descobrir como podemos obter os registros Hayward de volta dentro O que queremos que a consulta faça é digitalizar a tabela e para cada linha encontrar as linhas correspondentes. Se não for encontrada uma linha correspondente, queremos que alguns "valores vazios" sejam substituídos pelas colunas da tabela. Esse tipo de consulta é chamada de adesão externa. (As adesões que vimos até agora são adesões internas.) O comando é assim:
SELECT * -- FROM weather
  LEFT OUTER JOIN cities ON (weather.city = cities.name);
-- Funções agregadas
-- Como a maioria dos outros produtos de banco de dados relacionais, o PostgreSQL suporta funções agregadas. Uma função agregada calcula um único resultado de várias linhas de entrada. Por exemplo, há agregados para calcular o , (média), (máximo) e (mínimo) sobre um conjunto de linhas.
SELECT max(temp_lo)
FROM weather;
-- Se quiséssemos saber em que cidade (ou cidades) essa leitura ocorreu, poderíamos tentar:
SELECT city
FROM weather
WHERE temp_lo = (
    SELECT max(temp_lo)
    FROM weather
  );
-- Isso é OK porque o subquery é um cálculo independente que computa seu próprio agregado separadamente do que está acontecendo na consulta externa.
-- Agragação
-- Agregados também são muito úteis em combinação com cláusulas. Por exemplo, podemos obter a temperatura máxima baixa observada em cada cidade com:GROUP BY
SELECT city,
  max(temp_lo)
FROM weather
GROUP BY city;
-- Podemos filtrar essas linhas agrupadas usando:HAVING
SELECT city,
  max(temp_lo)
FROM weather
GROUP BY city
HAVING max(temp_lo) < 40;
-- Filtro Like
-- cidades cujos nomes começam com "S",podemos fazer:temp_lo
SELECT city,
  max(temp_lo)
FROM weather
WHERE city LIKE 'S%' -- (1)
GROUP BY city
HAVING max(temp_lo) < 48;
-- Atualizações
UPDATE weather
SET temp_hi = temp_hi - 2,
  temp_lo = temp_lo - 2
WHERE date > '1994-11-28';

-- Deletar / Apagar
DELETE FROM weather WHERE city = 'Hayward';

