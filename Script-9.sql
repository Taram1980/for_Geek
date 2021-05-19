-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

SELECT * FROM shop.users s;
SELECT * FROM sample.users u;

DROP TABLE IF EXISTS shop.users;
CREATE TABLE shop.users (id int, balance int);
INSERT INTO shop.users (id, balance) VALUES (1, 100), (2, 200), (3, 300);
DROP TABLE IF EXISTS sample.users;
CREATE TABLE sample.users (id int, balance int);

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

-- Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

CREATE VIEW ca_pr AS 
SELECT lesson_7.products.id, lesson_7.products.name AS name_product, lesson_7.catalogs.name AS name_catalog FROM lesson_7.products LEFT JOIN lesson_7.catalogs ON lesson_7.products.catalog_id = lesson_7.catalogs.id;
SELECT * FROM ca_pr;
-- по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
-- Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.

-- (по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
 
-- Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
-- второму пользователю shop — любые операции в пределах базы данных shop.
DROP USER IF EXISTS 'shop_read'@'localhost';
CREATE USER 'shop_read'@'localhost';
GRANT SELECT ON shop.* TO 'shop_read'@'localhost';
SHOW GRANTS FOR 'shop_read'@'localhost';

DROP USER IF EXISTS 'shop_all'@'localhost';
CREATE USER 'shop_all'@'localhost' IDENTIFIED BY '123';;
GRANT ALL ON shop.* TO 'shop_all'@'localhost';
SHOW GRANTS FOR 'shop_all'@'localhost';
SHOW GRANTS FOR 'shop_all'@'localhost';

-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 
-- функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — 
-- "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello() 
RETURNS text NO SQL
BEGIN
 DECLARE x INT;
 SET x = HOUR(now());
-- SET x = 20;
CASE 
 WHEN x > 5 AND x < 13 THEN  
 RETURN "Доброе утро";
 WHEN x > 12 AND x < 19 THEN
 RETURN  "Добрый день";
 WHEN x > 18 AND x <= 24 THEN
 RETURN  "Добрый вечер";
 else
 RETURN  "Доброй ночи";
 END CASE; 
END; 
SELECT hello();

-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.


DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  desсription TEXT COMMENT 'Описание'
);
DROP TRIGGER IF EXISTS not_null;
CREATE TRIGGER not_null BEFORE INSERT ON products
FOR EACH ROW
BEGIN
 IF NEW.name IS NULL AND NEW.desсription IS NULL THEN
 SIGNAL SQLSTATE '45000'
 SET message_text = 'Both are NULL';
 END IF;
END;

INSERT INTO products
  (name, desсription)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.'),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.'),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.'),
  (NULL, 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.'),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX'),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX'),
  (NULL, NULL);

SELECT * FROM products p ;
SHOW TRIGGERS;
--