USE booking_final;

-- Поиск отелей по городу и ближайшему к нему городам, датам заселения, без номеров ноходящихся на стадии бронирования и остортированные по цене
SELECT choice.id, city, name, street, price, latitude, longitude FROM (SELECT * FROM hotel_room WHERE hotel_room.check_in = '2021-05-26' AND hotel_room.check_out = '2021-05-27') 
	AS choice JOIN hotel ON hotel.id = choice.hotel_id JOIN location ON location.hotel_id = hotel.id 
	WHERE 
	latitude > (SELECT latitude FROM location JOIN hotel ON hotel.id = location.hotel_id WHERE city = 'South Arthur')  - 10
	AND latitude < (SELECT latitude FROM location JOIN hotel ON hotel.id = location.hotel_id WHERE city = 'South Arthur') + 10
	AND longitude > (SELECT longitude FROM location JOIN hotel ON hotel.id = location.hotel_id WHERE city = 'South Arthur') - 10
	AND longitude < (SELECT longitude FROM location JOIN hotel ON hotel.id = location.hotel_id WHERE city = 'South Arthur') + 10
	AND choice.id NOT IN (SELECT hotel_room_id FROM cart_item)
	ORDER BY price LIMIT 10;

-- Формирование сиписка клиентов с указанием количество оставленных сообщений, лайков, сделанных заказов через booking. С последующим вычислением интегрированного показателя 
-- для присвоения нового значения типа лояльности и скидки от booking 
SELECT
gest.id, concat(gest.name, ' ', gest.sername) AS guest,
COUNT(DISTINCT message.id) AS count_messages,
COUNT(DISTINCT like.id) AS count_likes,
COUNT(DISTINCT total)  AS count_books,
10*COUNT(DISTINCT message.id) + 5*COUNT(DISTINCT like.id) + 20*COUNT(DISTINCT total) AS RESULT,
round(avg(disc_persent), 2) AS disc_persent,
discount_booking.name AS type_loyalty
FROM gest 
LEFT JOIN `like` ON gest.id = like.gest_id 
LEFT JOIN message ON gest.id = message.gest_id 
LEFT JOIN order_detail ON gest.id = order_detail.guest_id
LEFT JOIN discount_booking ON gest.discount_booking_id = discount_booking.id 
GROUP BY gest.id
ORDER BY RESULT DESC;

--  Формирование списка по типу оплаты бронирования с учетом средних, минимальных и максимальных значений и начала использования
SELECT DISTINCT 
provider,
COUNT(total) OVER windows AS COUNT,
MIN(total) OVER windows AS MIN,
MAX(total) OVER windows AS MAX,
AVG(total) OVER windows AS MEAN
FROM order_detail JOIN gest_payment ON gest_payment.gest_id = order_detail.guest_id 
WINDOW windows AS (PARTITION BY provider);


-- Процедура для определения максимального статуса для пользователя booking

DROP PROCEDURE IF EXISTS SELECT_ALL;
CREATE PROCEDURE SELECT_ALL(name varchar(500), sername varchar(500), OUT total_ int)
BEGIN
-- 	DECLARE a INT DEFAULT 0;
	SELECT total INTO total_ FROM gest LEFT JOIN discount_booking 
	ON discount_booking.id = gest.discount_booking_id LEFT JOIN order_detail ON order_detail.guest_id = gest.id 
	WHERE gest.name = name AND gest.sername = sername GROUP BY gest.id ORDER BY gest.id;
-- 	SELECT total_;
	IF total_ > 5000 then
		SELECT 'patner' AS offer;
	ELSEIF total_ > 2500 then
		SELECT 'loyalty' AS offer;
	ELSEIF total_ <= 2500 then
		SELECT 'friend' AS offer;
	END IF;
END;

call select_all('Araceli', 'Wehner', @total);
SELECT @total;



-- Триггер на проверку наличия message, hotel  с указанным id
DROP FUNCTION IF EXISTS is_row_exists;
CREATE FUNCTION is_row_exists (target_id int, target_type varchar(50))
RETURNS boolean READS SQL DATA

BEGIN
	CASE target_type
		WHEN 'message' THEN
			RETURN EXISTS (SELECT id FROM message WHERE id = target_id);
		WHEN 'hotel' THEN
			RETURN EXISTS (SELECT id FROM hotel WHERE id = target_id);
		ELSE 
			RETURN FALSE;
	END CASE;
END;

DROP TRIGGER IF EXISTS like_BEFORE_UPDATE;
CREATE TRIGGER `like_BEFORE_UPDATE` BEFORE UPDATE ON `like` FOR EACH ROW
BEGIN
	IF NOT is_row_exists(1100, 'message') THEN
		SIGNAL SQLSTATE '45000'
		SET message_text = 'Error adding like!';
	END IF;
END;

