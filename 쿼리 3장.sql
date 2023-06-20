#날짜 : 2023/06/16
#이름 : 박성용
#내용 : 1.SQL 기초 실습

#실습1-1
create database `UserDB`;
drop database `UserDB`;

#실습1-2
create table `User1` (
	`uid`	varchar(10),
    `name`	varchar(10),
    `hp`	char(13),
    `age`	int
);

drop table `User1`;

#실습1-3
insert into `User1` values ('A101', '김유신', '010-1234-1111', 25);
insert into `User1` values ('A102', '김춘추', '010-1234-2222', 23);
insert into `User1` values ('A103', '장보고', '010-1234-3333', 32);
insert into `User1` (`uid`, `name`, `age`) values ('A104', '강감찬', 45);
insert into `User1` set 
					`uid`='A105',
                    `name`='이순신',
                    `hp`='010-1234-5555';

#실습1-4
select * from `User1`;
select * from `User1` where `uid`='A101';
select * from `User1` where `name`='김춘추';
select * from `User1` where `age` < 30;
select * from `User1` where `age` >= 30;
select `uid`, `name`, `age` from `User1`;

#실습1-5
update `User1` set `hp`='010-1234-4444' where `uid`='A101';
update `User1` set `age`=51 where `uid`='A105';
update `User1` set
					`hp`='010-1234-1001',
					`age`=27
				where
					`uid`='A101';

#실습1-6
delete from `User1` where `uid`='A101';
delete from `User1` where `uid`='A102' and `age`=23;
delete from `User1` where `age` >= 30;

#실습1-7
CREATE TABLE `TblUser` (
	`userId` VARCHAR(10),
	`userName` VARCHAR(10),
	`userHp` CHAR(13),
	`userAge` TINYINT,
	`userAddr` VARCHAR(20)
);

CREATE TABLE `TblProduct` (
	`prdCode` INT,
	`prdName` VARCHAR(10),
	`prdPrice` INT,
	`prdAmount` INT,
	`prdCompany` VARCHAR(10),
	`prdMakeDate` DATE
);

#실습1-8
insert into `TblUser` values ('p101', '김유신', '010-1234-1001', 25, '서울시 중구');
insert into `TblUser` values ('p102', '김춘추', '010-1234-1002', 23, '부산시 금정구');
insert into `TblUser` (`userId`, `userName`, `userAge`, `userAddr`) values ('p103', '장보고', 31, '경기도 광주군');
insert into `TblUser` (`userId`, `userName`, `userAddr`) values ('p104', '강감찬', '경남 창원시');
insert into `TblUser` set 
						`userId`='p105',
                        `userName`='이순신',
                        `userHp`='010-1234-1001',
                        `userAge`=50;

insert into `TblProduct` values (1, '냉장고', 800,  10, 'LG', '2022-01-06');
insert into `TblProduct` values (2, '노트북', 1200, 20, '삼성', '2022-01-06');
insert into `TblProduct` values (3, 'TV',   1400, 6, 'LG', '2022-01-06');
insert into `TblProduct` values (4, '세탁기', 1000, 8, 'LG', '2022-01-06');
insert into `TblProduct` values (5, '컴퓨터', 1100, 0, NULL, NULL);
insert into `TblProduct` values (6, '휴대폰', 900,  102, '삼성', '2022-01-06');

#실습1-9
SELECT * FROM `TblUser`;
SELECT `userName` FROM `TblUser`;
SELECT `userName`, `userHp` FROM `TblUser`;
SELECT * FROM `TblUser` WHERE `userId`='p102';
SELECT * FROM `TblUser` WHERE `userId`='p104' OR `userId`='p105';
SELECT * FROM `TblUser` WHERE `userAddr`='신라';
SELECT * FROM `TblUser` WHERE `userAge` > 30;
SELECT * FROM `TblUser` WHERE `userHP` IS NULL;
UPDATE `TblUser` SET `userAge`=42 WHERE `userID`='p104';
UPDATE `TblUser` SET `userAddr`='경남 김해시' WHERE `userId`='p105';
DELETE FROM `TblUser` WHERE `userId`='p103';
SELECT * FROM `TblProduct`;
SELECT `prdName` FROM `TblProduct`;
SELECT `prdName`, `prdPrice` FROM `TblProduct`;
SELECT * FROM `TblProduct` WHERE `prdCompany`='LG';
SELECT * FROM `TblProduct` WHERE `prdCompany`='삼성';
UPDATE `TblProduct` SET 
 `prdCompany`='삼성', 
 `prdMakeDate`='2021-01-01' 
 WHERE 
 `prdCode`=5
 109 changes: 109 additions & 0 deletions109  
2장_테이블 제약조건.sql
@@ -0,0 +1,109 @@
#날짜 : 2023/06/16
#이름 : 김철학
#내용 : 2.테이블 제약조건 실습

#실습 2-1
create table `User2` (
	`uid`	varchar(20) primary key,
    `name`	varchar(10),
    `hp`	char(13),
    `age`	tinyint
);

#실습 2-2
insert into `User2` values ('a201', '김유신', '010-1234-1001', 25);
insert into `User2` values ('a102', '김춘추', '010-1234-1002', 23);
insert into `User2` values ('a103', '장보고', '010-1234-1003', 33);
insert into `User2` values ('a104', '강감찬', '010-1234-1004', 43);
insert into `User2` values ('a105', '이순신', '010-1234-1005', 53);

#실습 2-3
create table `User3` (
	`uid`	varchar(20) primary key,
    `name`	varchar(10),
    `hp`	char(13) unique,
    `age`	tinyint
);

#실습 2-4
insert into `User3` values ('a301', '김유신', NULL, 25);
insert into `User3` values ('a102', '김춘추', '010-1234-1002', 23);
insert into `User3` values ('a103', '장보고', '010-1234-1003', 33);
insert into `User3` values ('a104', '강감찬', '010-1234-1004', 43);
insert into `User3` values ('a105', '이순신', '010-1234-1005', 53);

#실습 2-5
create table `Parent` (
	`pid`	varchar(10) primary key,
    `name`	varchar(10),
    `hp`	char(13) unique
);

create table `Child` (
	`cid`  	varchar(10) primary key,
    `name`	varchar(10),
    `hp`	char(13) unique,
    `pid`	varchar(10),
    foreign key (`pid`) references `Parent` (`pid`)
);

#실습 2-6
insert into `Parent` values ('p101', '이성계', '010-1234-1111');
insert into `Child` values ('c101', '이방원', '010-1234-1001', 'p101');

#실습 2-7
create table `User4` (
	`seq`	 int primary key auto_increment,
	`name`	 varchar(10),
    `gender` tinyint,
    `age`	 tinyint,
    `addr`	 varchar(255)
);

#실습 2-8
insert into `User4` (`name`, `gender`, `age`, `addr`) values ('김유신', 1, 25, '김해시');
insert into `User4` set 
						`name`='신사임당', 
						`gender`=2,
                        `age`=27,
                        `addr`='강릉시';

delete from `User4` where `name`='김유신';

#실습 2-9
create table `User5` (
	`name`	 varchar(10) not null,    
    `gender` tinyint,
    `age`	 tinyint default 1,
    `addr`	 varchar(10)
);

#실습 2-10
insert into `User5` (`name`) values ('김유신');
insert into `User5` set `name`='김춘추', `addr`='부산시';

#실습 2-11
delete from `User5`;

alter table `User5` add `hp` varchar(20);
alter table `User5` add `birth` char(10) default '0000-00-00' after `name`;
alter table `User5` add `uid` varchar(10) primary key first;

insert into `User5` values ('a101', '김유신', 1, 25, '김해시');
insert into `User5` values ('a102', '김춘추', 1, 23, '경주시');

#실습 2-12
ALTER TABLE `User5` MODIFY `hp` CHAR(13);
ALTER TABLE `User5` MODIFY `age` TINYINT;

#실습 2-13
ALTER TABLE `User5` CHANGE COLUMN `addr` `address` VARCHAR(100);

#실습 2-14
ALTER TABLE `User5` DROP `gender`;

#실습 2-15
create table `User6` like `User5`;

#실습 2-16
insert into `User6` select * from `User5`;
 14 changes: 14 additions & 0 deletions14  
3장_데이터베이스 관리.sql
@@ -0,0 +1,14 @@
#날짜 : 2023/06/16
#이름 : 김철학
#내용 : 3.데이터베이스 관리

#실습 3-1
CREATE DATABASE `TestDB`;
CREATE USER 'tester'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON TestDB.* TO 'tester'@'%';
FLUSH PRIVILEGES;

#실습 3-2
alter user 'tester'@'%' identified by '12345';
drop USER 'tester'@'%';
FLUSH PRIVILEGES;
 184 changes: 184 additions & 0 deletions184  
4장_SQL 고급.sql
@@ -0,0 +1,184 @@
#날짜 : 2023/06/16
#이름 : 김철학
#내용 : 4.SQL 고급 실습하기


#실습 4-1
CREATE TABLE `Member` (
	`uid`	VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`hp`	CHAR(13) UNIQUE NOT NULL,
	`pos`	VARCHAR(10) default '사원',
	`dep`	TINYINT,
	`rdate`	DATETIME  NOT NULL
);

CREATE TABLE `Department` (
	`depNo`	TINYINT PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`tel`	CHAR(12) NOT NULL
);

CREATE TABLE `Sales` (
	`seq`	INT AUTO_INCREMENT PRIMARY KEY,
	`uid`	VARCHAR(10) NOT NULL,
	`year`	YEAR NOT NULL,
	`month`	TINYINT NOT NULL,
	`sale`	INT NOT NULL
);

#실습 4-2
INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', 101, NOW());
INSERT INTO `Member` VALUES ('a102', '김유신',   '010-1234-1002', '차장', 101, NOW());
INSERT INTO `Member` VALUES ('a103', '김춘추',   '010-1234-1003', '사원', 101, NOW());
INSERT INTO `Member` VALUES ('a104', '장보고',   '010-1234-1004', '대리', 102, NOW());
INSERT INTO `Member` VALUES ('a105', '강감찬',   '010-1234-1005', '과장', 102, NOW());
INSERT INTO `Member` VALUES ('a106', '이성계',   '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a107', '정철',     '010-1234-1007', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a108', '이순신',   '010-1234-1008', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a109', '허균',     '010-1234-1009', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a110', '정약용',   '010-1234-1010', '사원', 105, NOW());
INSERT INTO `Member` VALUES ('a111', '박지원',   '010-1234-1011', '사원', 105, NOW());

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);

#실습 4-3
SELECT * FROM `Member` WHERE `name`='김유신';
SELECT * FROM `Member` WHERE `pos`='차장' AND dep=101;
SELECT * FROM `Member` WHERE `pos`='차장' OR dep=101;
SELECT * FROM `Member` WHERE `name` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';
SELECT * FROM `Member` WHERE `pos`='사원' OR `pos`='대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리');
SELECT * FROM `Member` WHERE `dep` IN(101, 102, 103);
SELECT * FROM `Member` WHERE `name` LIKE '%신';
SELECT * FROM `Member` WHERE `name` LIKE '김%';
SELECT * FROM `Member` WHERE `name` LIKE '김_ _';
SELECT * FROM `Member` WHERE `name` LIKE '_성_';
SELECT * FROM `Member` WHERE `name` LIKE '정_';
SELECT * FROM `Sales` WHERE `sale` > 50000;
SELECT * FROM `Sales` WHERE `sale` >= 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `sale` NOT BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `year` IN(2020);
SELECT * FROM `Sales` WHERE `month` IN(1, 2);

#실습 4-4
SELECT * FROM `Sales` ORDER BY `sale`;
SELECT * FROM `Sales` ORDER BY `sale` ASC;
SELECT * FROM `Sales` ORDER BY `sale` DESC;

SELECT * FROM `Sales` 
WHERE `sale` > 50000
ORDER BY `sale`  DESC;

SELECT * FROM `Sales`
WHERE `sale` > 50000
ORDER BY 
	`year`  ASC,
	`month` ASC,
	`sale`  DESC;

#실습 4-5
SELECT * FROM `Sales` LIMIT 3;
SELECT * FROM `Sales` LIMIT 0, 3;
SELECT * FROM `Sales` LIMIT 1, 2;
SELECT * FROM `Sales` LIMIT 5, 3;

SELECT * 
FROM 
	`Sales`
WHERE 
	`sale` > 50000
ORDER BY 
	`year`  DESC,
	`month` ASC,
	`sale`  DESC
LIMIT 
	5;

#실습 4-6
SELECT SUM(`sale`) AS `합계` FROM `Sales`;
SELECT AVG(`sale`) AS `평균` FROM `Sales`;
SELECT COUNT(*) AS `갯수` FROM `Sales`;

SELECT SUBSTRING(`hp`, 10, 4) AS `전화번호 끝자리`
	FROM `Member`;

INSERT INTO `Member` 
	VALUES ('b101', '을지문덕', '010-5555-1234', '사장', 107, NOW());



#실습 4-7 부터는 4장으로
#실습 4-8
#실습 4-9
#실습 4-10
#실습 4-11
#실습 4-12
#실습 4-13
#실습 4-14
#실습 4-15
#실습 4-16
#실습 4-17