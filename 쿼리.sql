#날짜 : 2023/06/16
#이름 : 박성용
#내용 : 1.SQL 기초 실습

#실습 1-1
CREATE DATABASE `UserDB`;
DROP DATABASE `UserDB`;

#실습 1-2
CREATE TABLE `User1` (
	`uid` 	VARCHAR(10),
	`name` 	VARCHAR(10),
	`hp`		CHAR(13),
	`age`		INT
	);

	
#실습 1-3
INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO `User1` VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', 45);
INSERT INTO `User1` SET `uid`='A105', `name`='이순신', `hp`='010-1234-5555';

#실습 1-4
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `AGE` >=30;
SELECT `uid`, `name`, `age` FROM `User1`;


#실습 1-5
UPDATE `User1` SET `hp` = '010-1234-4444' WHERE `uid` = 'A104';
UPDATE `User1` SET `age` = 51 WHERE `uid` = 'A105';
UPDATE `User1` SET `hp` = '010-1234-1001', `age` = 27 WHERE `uid` = 'A101';


#실습 1-6
DELETE FROM `User1` WHERE `uid`='A101';
DELETE FROM `User1` WHERE `uid`='A102' AND `age`=25;
DELETE FROM `User1` WHERE `age` >=30;

#실습 1-7
CREATE TABLE `TbiUSER` (
	`UserId` 	VARCHAR(10),
	`UserName`  VARCHAR(10),
	`userHp`		CHAR(13),
	`userAge`	TINYINT,
	`userAddr`	VARCHAR(20)
	);
	
CREATE TABLE `TbiProduct` (
	`prdCode` 		INT,
	`prdName`		VARCHAR(10),
	`prdPrice`  	INT,
	`prdAmout`  	INT,
	`prdCompany` 	VARCHAR(10),
	`prdMakeDate`	date
	);

#실습 1-8
INSERT INTO `TbiUSER` VALUES ('p101', '김유신', '010-1234-1001', 25, '서울시 중구'); 
INSERT INTO `TbiUSER` VALUES ('p102', '김춘추', '010-1234-1002', 23, '부산시 금정구'); 
INSERT INTO `TbiUSER` VALUES ('p103', '장보고', ' ', 31, '경기도 광주군'); 
INSERT INTO `TbiUSER` VALUES ('p104', '강감찬', ' ',  0, '경남 창원시'); 
INSERT INTO `TbiUSER` VALUES ('p105', '이순신', '010-1234-1005', 50, ' '); 

INSERT INTO `TbiProduct` VALUES (1, '냉장고', 800, 10, 'LG', '2022-01-06'); 
INSERT INTO `TbiProduct` VALUES (2, '노트북', 1200, 20, '삼성', '2022-01-06');
INSERT INTO `TbiProduct` VALUES (3, 'TV', 1400, 6, 'LG', '2022-01-06');
INSERT INTO `TbiProduct` VALUES (4, '세탁기', 1000, 8, 'LG', '2022-01-06');
INSERT INTO `TbiProduct` VALUES (5, '컴퓨터', 1100, 0, ' ', '2022-01-06');
INSERT INTO `TbiProduct` VALUES (6, '휴대폰', 900, 102, '삼성', '2022-01-06');

#실습 1-9
SELECT * FROM `TbiUser` ;
SELECT `userName` FROM `TbiUser`;
SELECT `userName`, `userHp` FROM `TbiUser`;
SELECT * FROM `TbiUser` WHERE `userId` = 'p102';
SELECT * FROM `TbiUser` WHERE `userId` = 'p104' OR `userId` = 'p105';
SELECT * FROM `TbiUser` WHERE `userAddr` = '부산시 금정구';
SELECT * FROM `TbiUser` WHERE `userAge` > 30;
SELECT * FROM `TbiUser` WHERE `userHP` IS NULL;
UPDATE `TbiUser` SET `userAge` = 42 WHERE `userID` = 'p104';
UPDATE `TbiUser` SET `userAddr`='경남 김해시' WHERE `userId`='p105';
DELETE FROM `TbiUser` WHERE `userId` = 'p103';

SELECT * FROM `TbiProduct`;
SELECT `prdName` FROM `TbiProduct`;
SELECT `prdName`, `prdPrice` FROM `TbiProduct`;
SELECT * FROM `TbiProduct` WHERE `prdCompany` = 'LG';
SELECT * FROM `TbiProduct` WHERE `prdCompany` = '삼성';
UPDATE `TbiProduct` SET
								`prdCompany`='삼성',
								`prdMakeDate` = '2021-01-01'
								WHERE 
								`prdCode`=5;