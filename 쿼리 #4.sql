#날짜 : 2023/06/16
#이름 : 박성용
#내용 : 4. SQL 실습 준비하기

#실습 4-1

CREATE TABLE `Member` (
	`uid`			VARCHAR(10) PRIMARY KEY,
	`name`		VARCHAR(10),
	`hp`			CHAR(13) UNIQUE,
	`pos`			VARCHAR(10) DEFAULT '사원',
	`dep`			INT(30) NOT NULL,
	`rdate`		DATETIME(0)	
	);

	CREATE TABLE `Department` (
	`depNo`		INT(20) PRIMARY KEY,
	`name`		CHAR(10),
	`tel`			CHAR(12)
	);
	
	CREATE TABLE `Sales` (
	`seq`					INT(20) AUTO_INCREMENT PRIMARY KEY,
	`uid`					CHAR(10),
	`year`				YEAR(4),
	`month`				INT(20),
	`sale`				INT(20)
	);
	
	
#실습 4-2

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');

INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', 101, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a102', '김유신', '010-1234-1002', '차장', 101, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a103', '김춘추', '010-1234-1003', '사원', 101, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a104', '장보고', '010-1234-1004', '대리', 102, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a105', '강감찬', '010-1234-1005', '과장', 102, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a106', '이성계', '010-1234-1006', '차장', 103, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a107', '정철', '010-1234-1007', '차장', 103, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a108', '이순신', '010-1234-1008', '부장', 104, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a109', '허균', '010-1234-1009', '부장', 104, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a110', '정약용', '010-1234-1010', '사원', 105, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a111', '박지원', '010-1234-1011', '사원', 105, '2020-11-19 11:39:48');

INSERT INTO `Sales` VALUES (1, 'a101', 2018, 1, 98100);
INSERT INTO `Sales` VALUES (2, 'a102', 2018, 1, 136000);
INSERT INTO `Sales` VALUES (3, 'a103', 2018, 1, 80100);
INSERT INTO `Sales` VALUES (4, 'a104', 2018, 1, 78000);
INSERT INTO `Sales` VALUES (5, 'a105', 2018, 1, 93000);

INSERT INTO `Sales` VALUES (6, 'a101', 2018, 2, 23500);
INSERT INTO `Sales` VALUES (7, 'a102', 2018, 2, 126000);
INSERT INTO `Sales` VALUES (8, 'a103', 2018, 2, 18500);
INSERT INTO `Sales` VALUES (9, 'a105', 2018, 2, 19000);
INSERT INTO `Sales` VALUES (10, 'a106', 2018, 2, 53000);

INSERT INTO `Sales` VALUES (11, 'a101', 2019, 1, 24000);
INSERT INTO `Sales` VALUES (12, 'a102', 2019, 1, 109000);
INSERT INTO `Sales` VALUES (13, 'a103', 2019, 1, 101000);
INSERT INTO `Sales` VALUES (14, 'a104', 2019, 1, 53500);
INSERT INTO `Sales` VALUES (15, 'a107', 2019, 1, 24000);

INSERT INTO `Sales` VALUES (16, 'a102', 2019, 2, 160000);
INSERT INTO `Sales` VALUES (17, 'a103', 2019, 2, 101000);
INSERT INTO `Sales` VALUES (18, 'a104', 2019, 2, 43000);
INSERT INTO `Sales` VALUES (19, 'a105', 2019, 2, 24000);
INSERT INTO `Sales` VALUES (20, 'a106', 2019, 2, 109000);

INSERT INTO `Sales` VALUES (21, 'a102', 2020, 1, 201000);
INSERT INTO `Sales` VALUES (22, 'a104', 2020, 1, 63000);
INSERT INTO `Sales` VALUES (23, 'a105', 2020, 1, 74000);
INSERT INTO `Sales` VALUES (24, 'a106', 2020, 1, 122000);
INSERT INTO `Sales` VALUES (25, 'a107', 2020, 1, 111000);

INSERT INTO `Sales` VALUES (26, 'a102', 2020, 2, 120000);
INSERT INTO `Sales` VALUES (27, 'a103', 2020, 2, 93000);
INSERT INTO `Sales` VALUES (28, 'a104', 2020, 2, 84000);
INSERT INTO `Sales` VALUES (29, 'a105', 2020, 2, 180000);
INSERT INTO `Sales` VALUES (30, 'a108', 2020, 2, 76000);

#실습 4-3
SELECT * FROM `Member` WHERE `name`='김유신';
SELECT * FROM `Member` WHERE `pos`='차장' AND `dep`=101;
SELECT * FROM `Member` WHERE `name` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';
SELECT * FROM `Member` WHERE `pos` = '사원' OR `pos` = '대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리');
SELECT * FROM `Member` WHERE `name` LIKE '%신';
SELECT * FROM `Member` WHERE `name` LIKE '김%';
SELECT * FROM `Member` WHERE `name` LIKE '김__';
SELECT * FROM `Member` WHERE `name` LIKE '_성_';
SELECT * FROM `Member` WHERE `name` LIKE '정_'; #'정'으로 시작하는 이름이 2자인 직원*/
SELECT * FROM `Sales` WHERE `sale` > 50000;
SELECT * FROM `Sales` WHERE `sale` >= 50000 AND `sale` < 100000 AND `month` = 1; 
SELECT * FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `sale` NOT BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `year` IN(2020);
SELECT * FROM `Sales` WHERE `month` IN(1, 2);



# 실습 4-4
SELECT * FROM `Sales` ORDER BY `sale`;
SELECT * FROM `Sales` ORDER BY `sale` ASC;
SELECT * FROM `Sales` ORDER BY `sale` DESC;
SELECT * FROM `Sales` 
WHERE `sale` > 50000
ORDER BY `sale` DESC;

SELECT * FROM `Sales` 
WHERE `sale` > 50000
ORDER BY
	`year` 	ASC, 
	`month`	ASC,
	`sale` 	DESC;

#실습 4-5 (LIMIT : 레코드 수를 제한해서 조회)
SELECT * FROM `Sales` LIMIT 3;
SELECT * FROM `Sales` LIMIT 0, 3; #(start , length) -> (0 부터 3까지) (3개 줄만  출력)
SELECT * FROM `Sales` LIMIT 1, 2;
SELECT * FROM `Sales` LIMIT 5, 3;
SELECT * FROM 
	`Sales`
WHERE 
	`sale` > 50000
ORDER BY 
	`year` 	DESC,
	`month` 	ASC,
	`sale`	DESC
LIMIT 
	5;
	
#실습 4-6
SELECT SUM(`sale`) AS `합계` FROM `Sales`; #합계 구하기
SELECT AVG(`sale`) FROM `Sales`; #평균 구하기
SELECT AVG(`sale`) AS `평균` FROM `Sales`; #평균 구하기
SELECT COUNT(`sale`) AS `갯수` FROM `Sales`; #데이터 갯수 구하기 
SELECT SUBSTRING(hp, 10, 4) AS '전화번호 끝자리' FROM `Member`;
#10 : start, 4 : length (출력하려는 갯수)

INSERT INTO `Member`  #NOW() : 현재 날짜 및 현재 시각
	VALUES ('b101', '을지문덕', '010-5555-1234', '사장', 107, NOW());
	
#실습 4-7
SELECT 
	SUM(`sale`) AS `총합`
FROM 
	`Sales` 
WHERE 
	`year` = 2018 AND `month` = 1;
	
#실습 4-8
SELECT 
		SUM(`sale`) AS `총합`, 
		AVG(`sale`) AS `평균` 
FROM `Sales` 
WHERE 
		`year` = 2019 
		AND 
		`month` = 2 
		AND
		`sale` >= 50000;

#실습 4-9
SELECT 
MIN(`sale`) AS `최저`,
MAX(`sale`) AS `최고`
FROM `Sales` 
WHERE `year` = 2020;

#실습 4-10
SELECT VERSION();
SELECT `uid` FROM `Sales` GROUP BY `uid`;		
SELECT `year` FROM `Sales` GROUP BY `year`;		
SELECT `uid`, `year` FROM `Sales` GROUP BY `uid`, `year`;			
SELECT  
	`uid`, 
	`year`,
	SUM(`sale`) AS `합계`
FROM 
	`Sales` 
GROUP BY `uid`, `year`;	

SELECT 
	`uid`,
	`year`,
	SUM(`sale`) AS `합계`
FROM
	`Sales`
WHERE
	`sale` >= 50000
GROUP BY
	`uid`, `year`
ORDER BY
	`합계` DESC;

#실습 4-11
SELECT 
	`uid`,
	`year`,
	SUM(`sale`) AS `합계`
FROM
	`Sales`
WHERE
	`sale` >= 50000
GROUP BY
	`uid`, `year`
HAVING
	`합계` >= 200000
ORDER BY
	`합계` DESC;

#실습 4-12
CREATE TABLE `Sales2` LIKE `Sales`;
INSERT INTO `Sales2` SELECT * FROM `Sales`;
UPDATE `Sales2` SET `year` = `year` + 3;

#실습 4-13
SELECT * FROM `Sales`
UNION	
SELECT * FROM `Sales2`

(SELECT `uid`, `year`, `sale` FROM `Sales`)
UNION	
(SELECT `uid`, `year`, `sale` FROM `Sales2`);

SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales`
GROUP BY `uid`, `year`
UNION
SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales2`
GROUP BY `uid`, `year`
ORDER BY `year` ASC, `합계` DESC;