#날짜 : 2023/06/16
#이름 : 박성용
#내용 : 2. 테이블 제약조건과 수정

#실습 2-1
 CREATE TABLE `User2` (
	`uid`	 	VARCHAR(10) PRIMARY KEY,
	`name` 	VARCHAR(10),
	`hp` 		CHAR(13),
	`age`	   INT
); 

#실습 2-2
INSERT INTO `User2` VALUES('A101', '김유신', '010-1234-1001', 25);
INSERT INTO `User2` VALUES('A102', '김춘추', '010-1234-1002', 23);
INSERT INTO `User2` VALUES('A103', '장보고', '010-1234-1003', 31);
INSERT INTO `User2` (`uid`, `name`, `hp`) VALUES('A104', '강감찬', '010-1234-1004');

INSERT INTO `user2` SET
	`uid` = 'a105',
	`name` = '고구마',
	`hp` = '010-1234-1111';

#실습 2-3
CREATE TABLE `User3` (
	`uid`		VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10),	
	`hp`		CHAR(13) UNIQUE,
	`age`		INT
	);
	
#실습 2-4

실습 2-5
CREATE TABLE `Parent` (
	`pid` 	VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10),
	`hp`		CHAR(13) unique
	);

CREATE TABLE `Child` (
	`cid` 	VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10),
	`hp`		CHAR(13) UNIQUE,
	`pid`		VARCHAR(10),
	FOREIGN KEY (`pid`) REFERENCES `Parent` (`pid`)
	);

#실습 2-6

#실습 2-7
CREATE TABLE `User4` (
	`seq`		INT AUTO_INCREMENT PRIMARY KEY,
	`name`	VARCHAR(10),
	`gender`	TINYINT,
	`age`		INT,
	`addr`	VARCHAR(255)
	);

#실습 2-8

#실습 2-9
CREATE TABLE `User5` (
	`name` 		VARCHAR(10) NOT NULL,
	`gender`		TINYINT,
	`age`			INT DEFAULT 1,
	`addr`		VARCHAR(10)
	);

#실습 2-10

#실습 2-11
ALTER TABLE `User5` ADD `hp` VARCHAR(20);
ALTER TABLE `User5` ADD `birth` CHAR(10) DEFAULT '0000-00-00' AFTER `name`;

#실습 2-12
ALTER TABLE `User5` MODIFY `hp` CHAR(13);
ALTER TABLE `User5` MODIFY `age` TINYINT;

#실습 2-13
ALTER TABLE `User5` CHANGE COLUMN `addr` `address` VARCHAR(100);

#실습 2-14
ALTER TABLE `User5` DROP `gender`;

#실습 2-15
CREATE TABLE `User6` LIKE `User5` ;

#실습 2-16
INSERT INTO `User6` SELECT * FROM `User5`;