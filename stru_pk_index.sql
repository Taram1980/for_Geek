DROP DATABASE IF EXISTS booking_final;
CREATE DATABASE booking_final;
USE booking_final;

DROP TABLE IF EXISTS gest_payment;
DROP TABLE IF EXISTS cart_item;
DROP TABLE IF EXISTS booking_session;
DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS order_detail;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS `like`;
DROP TABLE IF EXISTS gest;
DROP TABLE IF EXISTS discount_booking;
DROP TABLE IF EXISTS hotel_room;
DROP TABLE IF EXISTS room_type;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS hotel;
DROP TABLE IF EXISTS hotel_chain;
DROP TABLE IF EXISTS hotel_room;

CREATE TABLE IF NOT EXISTS room_type (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(225) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `square` INT NOT NULL,
  `max_capacity` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `hotel_chain` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `resident` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `discount_booking` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `disc_persent` FLOAT NOT NULL DEFAULT 0,
  `active` TINYINT NOT NULL,
  `created` DATE NOT NULL,
  `modified` DATE NOT NULL,
  `deleted` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS hotel;
CREATE TABLE IF NOT EXISTS `hotel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `house` INT NOT NULL,
  `phone` INT NOT NULL,
  `hotel_chain_id` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `hotel_chain_id_idx` (`hotel_chain_id` ASC) VISIBLE,
  CONSTRAINT `hotel_chain_id`
    FOREIGN KEY (`hotel_chain_id`)
    REFERENCES `hotel_chain` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS location;
CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `latitude` INT NOT NULL,
  `longitude` INT UNSIGNED NOT NULL,
  `hotel_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `location_hotel_id_fk_idx` (`hotel_id` ASC) VISIBLE,
  CONSTRAINT `location_hotel_id_fk`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `hotel_room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_key` INT NOT NULL,
  `hotel_id` INT NOT NULL,
  `room_type_id` INT NOT NULL,
  `price` FLOAT NOT NULL,
  `floor` INT NOT NULL,
  `number` INT NOT NULL,
  `check_In` DATE NOT NULL,
  `check_out` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `hotel_id_idx` (`hotel_id` ASC) VISIBLE,
  INDEX `room_type_id_fk_idx` (`room_type_id` ASC) VISIBLE,
  CONSTRAINT `hotel_id_fk`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `room_type_id_fk`
    FOREIGN KEY (`room_type_id`)
    REFERENCES `room_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `gest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `sername` VARCHAR(45) NOT NULL,
  `phone` INT UNSIGNED NOT NULL,
  `password` INT NOT NULL,
  `created_at` DATE NOT NULL,
  `updated_at` DATE NOT NULL,
  `discount_booking_id` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `gest_booling_fk_idx` (`discount_booking_id` ASC) VISIBLE,
  CONSTRAINT `gest_booling_fk`
    FOREIGN KEY (`discount_booking_id`)
    REFERENCES `discount_booking` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `gest_payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gest_id` INT NOT NULL,
  `provider` VARCHAR(45) NOT NULL,
  `account_number` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `gest_id_idx` (`gest_id` ASC) VISIBLE,
  CONSTRAINT `gest_id`
    FOREIGN KEY (`gest_id`)
    REFERENCES `gest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `booking_session` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `guest_id` INT NOT NULL,
  `date_in` DATE NOT NULL,
  `date_out` DATE NOT NULL,
  `total` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `gest_id_fk_idx` (`guest_id` ASC) VISIBLE,
  CONSTRAINT `gest_id_fk`
    FOREIGN KEY (`guest_id`)
    REFERENCES `gest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `cart_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `booking_session_id` INT NOT NULL,
  `hotel_room_id` INT NOT NULL,
  `created` DATETIME NOT NULL,
  `modified` DATETIME NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `booking_session_fk_idx` (`booking_session_id` ASC) VISIBLE,
  INDEX `hotel_room_fk_idx` (`hotel_room_id` ASC) VISIBLE,
  CONSTRAINT `booking_session_fk`
    FOREIGN KEY (`booking_session_id`)
    REFERENCES `booking_session` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `hotel_room_fk`
    FOREIGN KEY (`hotel_room_id`)
    REFERENCES `hotel_room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `guest_id` INT NOT NULL,
  `date_in` DATE NOT NULL,
  `date_out` DATE NOT NULL,
  `total` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `gest_id_fk_order_idx` (`guest_id` ASC) VISIBLE,
  CONSTRAINT `gest_id_fk_order`
    FOREIGN KEY (`guest_id`)
    REFERENCES `gest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `order_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_detail_id` INT NOT NULL,
  `hotel_room_id` INT NOT NULL,
  `created` DATETIME NOT NULL,
  `modified` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `order_detail_id_fk_idx` (`order_detail_id` ASC) VISIBLE,
  INDEX `hotel_room_id_fk_order_idx` (`hotel_room_id` ASC) VISIBLE,
  CONSTRAINT `order_detail_id_fk_order`
    FOREIGN KEY (`order_detail_id`)
    REFERENCES `order_detail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `hotel_room_id_fk_order`
    FOREIGN KEY (`hotel_room_id`)
    REFERENCES `hotel_room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `head` VARCHAR(45) NOT NULL,
  `body` VARCHAR(225) NOT NULL,
  `gest_id` INT NOT NULL,
  `hotel_id` INT NOT NULL,
  `raiting` TINYINT(5) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `message_gest_id_fk_idx` (`gest_id` ASC) VISIBLE,
  INDEX `message_hotel_id_fk_idx` (`hotel_id` ASC) VISIBLE,
  CONSTRAINT `message_gest_id_fk`
    FOREIGN KEY (`gest_id`)
    REFERENCES `gest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `message_hotel_id_fk`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `like` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `target_type` VARCHAR(45) NOT NULL,
  `target_id` INT NOT NULL,
  `created` DATETIME NOT NULL,
  `gest_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `like_gest_id_fk_idx` (`gest_id` ASC) VISIBLE,
  CONSTRAINT `like_gest_id_fk`
    FOREIGN KEY (`gest_id`)
    REFERENCES `gest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Создание индексов
CREATE INDEX gest_name_sername_idx ON gest(name, sername);
CREATE INDEX location_latitude_longitude_idx ON location(latitude, longitude);

--  Создание представления с выводом лучших 5 отелей на основе оценок пользователей, если число оценко больше 15.
DROP VIEW IF EXISTS best_hotel;
CREATE VIEW best_hotel AS
SELECT name, count(*) AS count, avg(raiting) AS score FROM hotel LEFT JOIN message ON hotel.id = message.hotel_id GROUP BY name HAVING count > 15 ORDER BY score DESC LIMIT 5;

-- Три лучших путешественника с точки зрения полученных лайков за отзывы
DROP VIEW IF EXISTS best_treveler;
CREATE VIEW best_treveler AS
SELECT message.gest_id, concat(name, ' ', sername) AS name, count(name) AS count FROM `like` JOIN gest ON gest.id = like.gest_id JOIN message ON message.id = like.target_id WHERE target_type = 'message'GROUP BY message.gest_id ORDER BY count DESC LIMIT 3;

SELECT * FROM best_treveler;
SELECT * FROM best_hotel;

