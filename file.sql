CREATE DATABASE `File`;

CREATE TABLE `FileTest` (
	`fno`		INT AUTO_INCREMENT PRIMARY KEY,
	`oName`	VARCHARACTER(100),
	`sName`	VARCHARACTER(100),
	`rdate`	DATETIME
);


ALTER TABLE `Product` CHANGE `cate` `type` TINYINT;