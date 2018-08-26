DROP DATABASE mqtt;
CREATE DATABASE mqtt;
USE mqtt;

CREATE TABLE mqtt (
	`id` INTEGER PRIMARY KEY AUTO_INCREMENT,
	`createdAt` TIMESTAMP NOT NULL,
	`topic` VARCHAR(255) NOT NULL,
	`message` VARCHAR(255),
	`qos` INTEGER(1) NOT NULL
);

DELIMITER //
CREATE PROCEDURE InsertIntoMQTTTable(IN `topic` VARCHAR(255), IN `message` VARCHAR(255), IN `qos` INTEGER(1))
	BEGIN
		INSERT INTO `mqtt` (`createdAt`, `topic`, `message`, `qos`)
		VALUES (CURRENT_TIMESTAMP, topic, message, qos);
	END //
DELIMITER ;