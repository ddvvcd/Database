-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.33 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- bank 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `bank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bank`;

-- 테이블 bank.bank_account 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank_account` (
  `a_no` varchar(11) NOT NULL,
  `a_item_dist` varchar(2) NOT NULL,
  `a_item_name` varchar(20) NOT NULL,
  `a_c_no` varchar(20) NOT NULL,
  `a_balance` int NOT NULL DEFAULT '0',
  `a_open_date` date NOT NULL,
  PRIMARY KEY (`a_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bank.bank_account:~10 rows (대략적) 내보내기
INSERT INTO `bank_account` (`a_no`, `a_item_dist`, `a_item_name`, `a_c_no`, `a_balance`, `a_open_date`) VALUES
	('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 390000, '2005-07-21'),
	('101-11-1003', 'S1', '자유저축예금', '870830-1000004', 73000, '2007-02-17'),
	('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14'),
	('101-11-2002', 'S1', '자유저축예금', '361-22-42687', 4201000, '2008-12-30'),
	('101-11-2003', 'S1', '자유저축예금', '102-22-51094', 8325010, '2010-06-07'),
	('101-12-1002', 'S2', '정기적립예금', '830513-2000003', 1020000, '2011-05-13'),
	('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 720800, '2012-10-15'),
	('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 1200500, '2009-08-25'),
	('101-22-1006', 'L2', '예금담보대출', '730423-1000001', 25000, '2013-12-11'),
	('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23');

-- 테이블 bank.bank_customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank_customer` (
  `c_no` varchar(14) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `c_dist` int NOT NULL DEFAULT '0',
  `c_phone` varchar(20) NOT NULL,
  `c_addr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`c_no`),
  UNIQUE KEY `c_phone` (`c_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bank.bank_customer:~9 rows (대략적) 내보내기
INSERT INTO `bank_customer` (`c_no`, `c_name`, `c_dist`, `c_phone`, `c_addr`) VALUES
	('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구'),
	('220-82-52237', '(주)한국전산', 2, '02-134-1045', '서울시 강서구'),
	('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시'),
	('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시'),
	('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시'),
	('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구'),
	('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구'),
	('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시'),
	('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');

-- 테이블 bank.bank_transaction 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank_transaction` (
  `t_no` tinyint NOT NULL AUTO_INCREMENT,
  `t_a_no` char(11) NOT NULL,
  `t_dist` tinyint NOT NULL,
  `t_amount` int NOT NULL DEFAULT '0',
  `t_datetime` datetime NOT NULL,
  PRIMARY KEY (`t_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bank.bank_transaction:~10 rows (대략적) 내보내기
INSERT INTO `bank_transaction` (`t_no`, `t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES
	(1, '101-11-1001', 1, 50000, '2023-06-21 15:17:18'),
	(2, '101-11-1003', 2, 120000, '2023-06-21 15:17:18'),
	(3, '101-11-2001', 2, 300000, '2023-06-21 15:17:18'),
	(4, '101-12-1002', 1, 1000000, '2023-06-21 15:17:18'),
	(5, '101-11-1001', 3, 0, '2023-06-21 15:17:18'),
	(6, '101-13-1005', 1, 200000, '2023-06-21 15:17:18'),
	(7, '101-11-1001', 1, 450000, '2023-06-21 15:17:18'),
	(8, '101-11-2002', 2, 32000, '2023-06-21 15:17:18'),
	(9, '101-11-2003', 3, 0, '2023-06-21 15:17:18'),
	(10, '101-11-1003', 1, 75000, '2023-06-21 15:17:18');


-- bookstore 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `bookstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookstore`;

-- 테이블 bookstore.book 구조 내보내기
CREATE TABLE IF NOT EXISTS `book` (
  `bookId` int NOT NULL,
  `bookName` varchar(20) NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bookstore.book:~10 rows (대략적) 내보내기
INSERT INTO `book` (`bookId`, `bookName`, `publisher`, `price`) VALUES
	(1, '축구의 역사', '굿스포츠', 7000),
	(2, '축구아는 여자', '나무수', 13000),
	(3, '축구의 이해', '대한미디어', 22000),
	(4, '골프 바이블', '대한미디어', 35000),
	(5, '피겨 교본', '굿스포츠', 8000),
	(6, '역도 단계별기술', '굿스포츠', 6000),
	(7, '야구의 추억', '이상미디어', 20000),
	(8, '야구를 부탁해', '이상미디어', 13000),
	(9, '올림픽 이야기', '삼성당', 7500),
	(10, 'Olympic Champions', 'Pearson', 13000),
	(11, '스포츠의학', '한솔의학서적', NULL);

-- 테이블 bookstore.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `custId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`custId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bookstore.customer:~5 rows (대략적) 내보내기
INSERT INTO `customer` (`custId`, `name`, `address`, `phone`) VALUES
	(1, '박지성', '영국 맨체스타', '000-5000-0001'),
	(2, '김연아', '대한민국 서울', '000-6000-0001'),
	(3, '장미란', '대한민국 강원도', '000-7000-0001'),
	(4, '추신수', '미국 클리블랜드', '000-8000-0001');

-- 테이블 bookstore.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `custId` int NOT NULL,
  `bookId` int NOT NULL,
  `salePrice` int NOT NULL,
  `orderDate` date NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 bookstore.order:~10 rows (대략적) 내보내기
INSERT INTO `order` (`orderId`, `custId`, `bookId`, `salePrice`, `orderDate`) VALUES
	(1, 1, 1, 6000, '2014-07-01'),
	(2, 1, 3, 21000, '2014-07-03'),
	(3, 1, 3, 8000, '2014-07-03'),
	(4, 3, 6, 6000, '2014-07-04'),
	(5, 4, 7, 20000, '2014-07-05'),
	(6, 1, 2, 12000, '2014-07-07'),
	(7, 4, 8, 13000, '2014-07-07'),
	(8, 3, 10, 12000, '2014-07-08'),
	(9, 2, 10, 7000, '2014-07-09'),
	(10, 3, 8, 13000, '2014-07-10');


-- college 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `college` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `college`;

-- 테이블 college.lecture 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture` (
  `lecNo` int NOT NULL,
  `lecName` varchar(20) NOT NULL,
  `lecCredit` int NOT NULL,
  `lecTime` int NOT NULL,
  `lecClass` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`lecNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 college.lecture:~7 rows (대략적) 내보내기
INSERT INTO `lecture` (`lecNo`, `lecName`, `lecCredit`, `lecTime`, `lecClass`) VALUES
	(159, '인지행동심리학', 3, 40, '본304'),
	(167, '운영체제론', 3, 25, '본B05'),
	(234, '중급 영문법', 3, 20, '본201'),
	(239, '세법개론', 3, 40, '본204'),
	(248, '빅데이터개론', 3, 20, '본B01'),
	(253, '컴퓨팅사고와 코딩', 2, 10, '본B02'),
	(349, '사회복지 마케팅', 2, 50, '본301');

-- 테이블 college.register 구조 내보내기
CREATE TABLE IF NOT EXISTS `register` (
  `regStdNo` char(8) NOT NULL,
  `regLecNo` int NOT NULL,
  `regMidScore` int DEFAULT NULL,
  `regFinalScore` int DEFAULT NULL,
  `regTotalScore` int DEFAULT NULL,
  `regGrade` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 college.register:~8 rows (대략적) 내보내기
INSERT INTO `register` (`regStdNo`, `regLecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`) VALUES
	('20201126', 234, 36, 42, 78, 'C'),
	('20201016', 248, 24, 62, 86, 'B'),
	('20201016', 253, 28, 40, 68, 'D'),
	('20201126', 239, 37, 57, 94, 'A'),
	('20210216', 349, 28, 68, 96, 'A'),
	('20210326', 349, 16, 65, 81, 'B'),
	('20201016', 167, 18, 38, 56, 'F'),
	('20220416', 349, 25, 58, 83, 'B');

-- 테이블 college.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `stdNo` char(8) NOT NULL,
  `stdName` varchar(20) NOT NULL,
  `stdHp` char(13) NOT NULL,
  `stdYear` int NOT NULL,
  `stdAdress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stdNo`),
  UNIQUE KEY `stdHp` (`stdHp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 college.student:~6 rows (대략적) 내보내기
INSERT INTO `student` (`stdNo`, `stdName`, `stdHp`, `stdYear`, `stdAdress`) VALUES
	('20201016', '김유신', '010-1234-1001', 3, NULL),
	('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
	('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시'),
	('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
	('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구'),
	('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');


-- erd1 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `erd1` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `erd1`;

-- 테이블 erd1.department 구조 내보내기
CREATE TABLE IF NOT EXISTS `department` (
  `depNo` int NOT NULL,
  `depName` varchar(20) NOT NULL,
  `depTel` varchar(13) NOT NULL,
  PRIMARY KEY (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 erd1.department:~7 rows (대략적) 내보내기
INSERT INTO `department` (`depNo`, `depName`, `depTel`) VALUES
	(101, '영업1부', '051-512-1001'),
	(102, '영업2부', '051-512-1002'),
	(103, '영업3부', '051-512-1003'),
	(104, '영업4부', '051-512-1004'),
	(105, '영업5부', '051-512-1005'),
	(106, '영업지원부', '051-512-1006'),
	(107, '인사부', '051-512-1007');

-- 테이블 erd1.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `uid` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `hp` char(13) NOT NULL,
  `pos` varchar(20) DEFAULT NULL,
  `dep` int NOT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp_UNIQUE` (`hp`),
  KEY `fk_Member_Department_idx` (`dep`),
  CONSTRAINT `fk_Member_Department` FOREIGN KEY (`dep`) REFERENCES `department` (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 erd1.member:~11 rows (대략적) 내보내기
INSERT INTO `member` (`uid`, `name`, `hp`, `pos`, `dep`, `rdate`) VALUES
	('a101', '박혁거세', '010-1234-1001', '부장', 101, '2023-06-26 16:10:40'),
	('a102', '김유신', '010-1234-1002', '차장', 101, '2023-06-26 16:10:40'),
	('a103', '김춘추', '010-1234-1003', '사원', 101, '2023-06-26 16:10:40'),
	('a104', '장보고', '010-1234-1004', '대리', 102, '2023-06-26 16:10:40'),
	('a105', '강감찬', '010-1234-1005', '과장', 102, '2023-06-26 16:10:40'),
	('a106', '이성계', '010-1234-1006', '차장', 103, '2023-06-26 16:10:40'),
	('a107', '정철', '010-1234-1007', '차장', 103, '2023-06-26 16:10:40'),
	('a108', '이순신', '010-1234-1008', '부장', 104, '2023-06-26 16:10:40'),
	('a109', '허균', '010-1234-1009', '부장', 104, '2023-06-26 16:10:40'),
	('a110', '정약용', '010-1234-1010', '사원', 105, '2023-06-26 16:10:40'),
	('a111', '박지원', '010-1234-1011', '사원', 105, '2023-06-26 16:10:40');

-- 테이블 erd1.sales 구조 내보내기
CREATE TABLE IF NOT EXISTS `sales` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) NOT NULL,
  `year` year NOT NULL,
  `month` tinyint NOT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`seq`,`uid`),
  KEY `fk_Sales_Member1_idx` (`uid`),
  CONSTRAINT `fk_Sales_Member1` FOREIGN KEY (`uid`) REFERENCES `member` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 erd1.sales:~30 rows (대략적) 내보내기
INSERT INTO `sales` (`seq`, `uid`, `year`, `month`, `price`) VALUES
	(1, 'a101', '2018', 1, 98100),
	(2, 'a102', '2018', 1, 136000),
	(3, 'a103', '2018', 1, 80100),
	(4, 'a104', '2018', 1, 78000),
	(5, 'a105', '2018', 1, 93000),
	(6, 'a101', '2018', 2, 23500),
	(7, 'a102', '2018', 2, 126000),
	(8, 'a103', '2018', 2, 18500),
	(9, 'a105', '2018', 2, 19000),
	(10, 'a106', '2018', 2, 53000),
	(11, 'a101', '2019', 1, 24000),
	(12, 'a102', '2019', 1, 109000),
	(13, 'a103', '2019', 1, 101000),
	(14, 'a104', '2019', 1, 53500),
	(15, 'a107', '2019', 1, 24000),
	(16, 'a102', '2019', 2, 160000),
	(17, 'a103', '2019', 2, 101000),
	(18, 'a104', '2019', 2, 43000),
	(19, 'a105', '2019', 2, 24000),
	(20, 'a106', '2019', 2, 109000),
	(21, 'a102', '2020', 1, 201000),
	(22, 'a104', '2020', 1, 63000),
	(23, 'a105', '2020', 1, 74000),
	(24, 'a106', '2020', 1, 122000),
	(25, 'a107', '2020', 1, 111000),
	(26, 'a102', '2020', 2, 120000),
	(27, 'a103', '2020', 2, 93000),
	(28, 'a104', '2020', 2, 84000),
	(29, 'a105', '2020', 2, 180000),
	(30, 'a108', '2020', 2, 76000);


-- erd2 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `erd2` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `erd2`;

-- 테이블 erd2.book 구조 내보내기
CREATE TABLE IF NOT EXISTS `book` (
  `bookId` int NOT NULL,
  `bookName` varchar(20) DEFAULT NULL,
  `publisher` varchar(20) NOT NULL,
  `price` int DEFAULT '0',
  PRIMARY KEY (`bookId`),
  KEY `fk_Book_publisher1_idx` (`publisher`),
  CONSTRAINT `fk_Book_publisher1` FOREIGN KEY (`publisher`) REFERENCES `publisher` (`pubName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 erd2.book:~10 rows (대략적) 내보내기
INSERT INTO `book` (`bookId`, `bookName`, `publisher`, `price`) VALUES
	(1, '축구의 역사', '굿스포츠', 7000),
	(2, '축구아는 여자', '나무수', 13000),
	(3, '축구의 이해', '대한미디어', 22000),
	(4, '골프 바이블', '대한미디어', 35000),
	(5, '피겨 교본', '굿스포츠', 8000),
	(6, '역도 단계별기술', '굿스포츠', 6000),
	(7, '야구의 추억', '이상미디어', 20000),
	(8, '야구를 부탁해', '이상미디어', 13000),
	(9, '올림픽 이야기', '삼성당', 7500),
	(10, 'Olympic Champions', 'Pearson', 13000);

-- 테이블 erd2.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `custId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` char(13) DEFAULT NULL,
  PRIMARY KEY (`custId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 erd2.customer:~5 rows (대략적) 내보내기
INSERT INTO `customer` (`custId`, `name`, `address`, `phone`) VALUES
	(1, '박지성', '영국 맨체스타', '000-5000-0001'),
	(2, '김연아', '대한민국 서울', '000-6000-0001'),
	(3, '장미란', '대한민국 강원도', '000-7000-0001'),
	(4, '추신수', '미국 클리블랜드', '000-8000-0001'),
	(5, '박세리', '대한민국 대전', NULL);

-- 테이블 erd2.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `custId` int NOT NULL,
  `bookId` int NOT NULL,
  `salePrice` int DEFAULT '0',
  `orderDate` date DEFAULT NULL,
  PRIMARY KEY (`orderId`,`custId`,`bookId`),
  KEY `fk_Order_Book_idx` (`bookId`),
  KEY `fk_Order_Customer1_idx` (`custId`),
  CONSTRAINT `fk_Order_Book` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`),
  CONSTRAINT `fk_Order_Customer1` FOREIGN KEY (`custId`) REFERENCES `customer` (`custId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 erd2.order:~10 rows (대략적) 내보내기
INSERT INTO `order` (`orderId`, `custId`, `bookId`, `salePrice`, `orderDate`) VALUES
	(1, 1, 1, 6000, '2014-07-01'),
	(2, 1, 3, 21000, '2014-07-03'),
	(3, 2, 5, 8000, '2014-07-03'),
	(4, 3, 6, 6000, '2014-07-04'),
	(5, 4, 7, 20000, '2014-07-05'),
	(6, 1, 2, 12000, '2014-07-07'),
	(7, 4, 8, 13000, '2014-07-07'),
	(8, 3, 10, 12000, '2014-07-08'),
	(9, 2, 10, 7000, '2014-07-09'),
	(10, 3, 8, 13000, '2014-07-10');

-- 테이블 erd2.publisher 구조 내보내기
CREATE TABLE IF NOT EXISTS `publisher` (
  `pubName` varchar(20) NOT NULL,
  `pubTel` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`pubName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='	';

-- 테이블 데이터 erd2.publisher:~6 rows (대략적) 내보내기
INSERT INTO `publisher` (`pubName`, `pubTel`) VALUES
	('Pearson', '051-153-1239'),
	('굿스포츠', '051-153-1234'),
	('나무수', '051-153-1235'),
	('대한미디어', '051-153-1236'),
	('삼성당', '051-153-1238'),
	('이상미디어', '051-153-1237');


-- erd3 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `erd3` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `erd3`;

-- 테이블 erd3.lecture 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture` (
  `lecNo` int NOT NULL,
  `lecName` varchar(20) NOT NULL,
  `lecCredit` tinyint NOT NULL,
  `lectIME` int NOT NULL,
  `lecClass` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`lecNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 erd3.lecture:~7 rows (대략적) 내보내기
INSERT INTO `lecture` (`lecNo`, `lecName`, `lecCredit`, `lectIME`, `lecClass`) VALUES
	(159, '인지행동심리학', 3, 40, '본304'),
	(167, '운영체제론', 3, 25, '본B05'),
	(234, '무역영문', 3, 20, '본201'),
	(239, '세법개론', 3, 40, '본204'),
	(248, '빅데이터 개론', 3, 20, '본B01'),
	(253, '컴퓨팅사고와 코딩', 2, 10, '본B02'),
	(349, '사회복지 마케팅', 2, 50, '본301');

-- 테이블 erd3.register 구조 내보내기
CREATE TABLE IF NOT EXISTS `register` (
  `regStdNo` char(8) NOT NULL,
  `regLecNo` int NOT NULL,
  `regMidScore` tinyint DEFAULT NULL,
  `regFinalScore` tinyint DEFAULT NULL,
  `regTotalScore` tinyint DEFAULT NULL,
  `regGrade` char(1) DEFAULT NULL,
  PRIMARY KEY (`regStdNo`,`regLecNo`),
  KEY `fk_Register_Lecture_idx` (`regLecNo`),
  KEY `fk_Register_Student1_idx` (`regStdNo`),
  CONSTRAINT `fk_Register_Lecture` FOREIGN KEY (`regLecNo`) REFERENCES `lecture` (`lecNo`),
  CONSTRAINT `fk_Register_Student1` FOREIGN KEY (`regStdNo`) REFERENCES `student` (`stdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 erd3.register:~8 rows (대략적) 내보내기
INSERT INTO `register` (`regStdNo`, `regLecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`) VALUES
	('20201016', 167, NULL, NULL, NULL, NULL),
	('20201016', 248, NULL, NULL, NULL, NULL),
	('20201016', 253, NULL, NULL, NULL, NULL),
	('20201126', 234, NULL, NULL, NULL, NULL),
	('20201126', 239, NULL, NULL, NULL, NULL),
	('20210216', 349, NULL, NULL, NULL, NULL),
	('20210326', 349, NULL, NULL, NULL, NULL),
	('20220416', 349, NULL, NULL, NULL, NULL);

-- 테이블 erd3.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `stdNo` char(8) NOT NULL,
  `stdName` varchar(20) NOT NULL,
  `stdHp` char(13) NOT NULL,
  `stdYear` tinyint NOT NULL,
  `stdAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stdNo`),
  UNIQUE KEY `stdHp_UNIQUE` (`stdHp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 erd3.student:~6 rows (대략적) 내보내기
INSERT INTO `student` (`stdNo`, `stdName`, `stdHp`, `stdYear`, `stdAddress`) VALUES
	('20201016', '김유신', '010-1234-1001', 3, NULL),
	('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
	('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시'),
	('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
	('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구'),
	('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');


-- farmstory 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `farmstory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `farmstory`;

-- 테이블 farmstory.article 구조 내보내기
CREATE TABLE IF NOT EXISTS `article` (
  `no` int NOT NULL AUTO_INCREMENT,
  `parent` int DEFAULT '0',
  `comment` int DEFAULT '0',
  `cate` varchar(20) DEFAULT 'free',
  `title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `file` tinyint DEFAULT '0',
  `hit` int DEFAULT '0',
  `writer` varchar(20) NOT NULL,
  `regip` varchar(100) NOT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`no`),
  KEY `writer` (`writer`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`writer`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 farmstory.article:~1 rows (대략적) 내보내기
INSERT INTO `article` (`no`, `parent`, `comment`, `cate`, `title`, `content`, `file`, `hit`, `writer`, `regip`, `rdate`) VALUES
	(1, 0, 0, 'story', '2e2de2', '222w', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-17 15:00:09');

-- 테이블 farmstory.file 구조 내보내기
CREATE TABLE IF NOT EXISTS `file` (
  `fno` int NOT NULL AUTO_INCREMENT,
  `ano` int NOT NULL,
  `oriName` varchar(255) NOT NULL,
  `newName` varchar(255) NOT NULL,
  `download` int DEFAULT '0',
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`fno`),
  KEY `ano` (`ano`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`ano`) REFERENCES `article` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 farmstory.file:~0 rows (대략적) 내보내기

-- 테이블 farmstory.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `orderNo` int NOT NULL AUTO_INCREMENT,
  `orderProduct` int NOT NULL,
  `orderCount` int NOT NULL,
  `orderDelivery` int NOT NULL,
  `orderPrice` int NOT NULL,
  `orderTotal` int NOT NULL,
  `orderUser` varchar(20) NOT NULL,
  `orderDate` datetime NOT NULL,
  PRIMARY KEY (`orderNo`),
  KEY `orderProduct` (`orderProduct`),
  KEY `orderUser` (`orderUser`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`orderProduct`) REFERENCES `product` (`pno`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`orderUser`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 farmstory.order:~0 rows (대략적) 내보내기

-- 테이블 farmstory.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `pno` int NOT NULL AUTO_INCREMENT,
  `cate` tinyint NOT NULL,
  `pName` varchar(100) NOT NULL,
  `price` int DEFAULT '0',
  `delivery` int DEFAULT '0',
  `stock` int DEFAULT '0',
  `sold` int DEFAULT '0',
  `thumb1` varchar(255) NOT NULL,
  `thumb2` varchar(255) NOT NULL,
  `thumb3` varchar(255) NOT NULL,
  `seller` varchar(20) NOT NULL,
  `etc` varchar(255) DEFAULT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`pno`),
  KEY `seller` (`seller`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`seller`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 farmstory.product:~0 rows (대략적) 내보내기

-- 테이블 farmstory.terms 구조 내보내기
CREATE TABLE IF NOT EXISTS `terms` (
  `terms` text NOT NULL,
  `privacy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 farmstory.terms:~1 rows (대략적) 내보내기
INSERT INTO `terms` (`terms`, `privacy`) VALUES
	('여러분을 환영합니다.\r\n네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.\r\n\r\n네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.\r\n\r\n다양한 네이버 서비스를 즐겨보세요.\r\n네이버는 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.\r\n여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 네이버 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 네이버 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.\r\n\r\n네이버는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, \'청소년보호법\' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.\r\n\r\n네이버 서비스에는 기본적으로 본 약관이 적용됩니다만 네이버가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 네이버페이, V LIVE 등)가 있습니다. 그리고 네이버 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.\r\n\r\n회원으로 가입하시면 네이버 서비스를 보다 편리하게 이용할 수 있습니다.\r\n여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 네이버는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 네이버 회원가입 방법 등에서 확인해 주세요.\r\n\r\n네이버는 단체에 속한 여러 구성원들이 공동의 계정으로 네이버 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.\r\n따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 네이버 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.\r\n\r\n단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 네이버 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다.\r\n\r\n여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.\r\n네이버는 여러분이 게재한 게시물이 네이버 서비스를 통해 다른 이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다. 게시물은 여러분이 타인 또는 자신이 보게 할 목적으로 네이버 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 말합니다.\r\n\r\n네이버는 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을 약속 드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다.\r\n\r\n한편, 네이버 서비스를 통해 여러분이 게재한 게시물을 적법하게 제공하려면 해당 콘텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시, 배포, 2차적 저작물 작성(단, 번역에 한함) 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이 없는 라이선스)이 필요합니다.\r\n게시물 게재로 여러분은 네이버에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한 권리를 보유하고 있어야 합니다.\r\n\r\n네이버는 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 네이버 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할 것입니다.\r\n만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다.\r\n\r\n또한 여러분이 제공한 소중한 콘텐츠는 네이버 서비스를 개선하고 새로운 네이버 서비스를 제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 네이버 및 네이버 계열사에서 사용될 수 있습니다. 네이버는 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다.\r\n\r\n네이버는 여러분이 자신이 제공한 콘텐츠에 대한 네이버 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록 다양한 수단을 제공하기 위해 노력하고 있습니다. 여러분은 네이버 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이 제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개, 검색결과 제외 등의 조치를 요청할 수 있습니다.\r\n다만, 일부 네이버 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수 있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다.\r\n\r\n여러분의 개인정보를 소중히 보호합니다.\r\n네이버는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 네이버가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.\r\n\r\n네이버는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.\r\n\r\n타인의 권리를 존중해 주세요.\r\n여러분이 무심코 게재한 게시물로 인해 타인의 저작권이 침해되거나 명예훼손 등 권리 침해가 발생할 수 있습니다. 네이버는 이에 대한 문제 해결을 위해 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 및 ‘저작권법’ 등을 근거로 권리침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 게시중단요청서비스를 운영하고 있습니다. 보다 상세한 내용 및 절차는 고객센터 내 게시중단요청서비스 소개를 참고해 주세요.\r\n\r\n한편, 네이버 서비스를 통해 타인의 콘텐츠를 이용한다고 하여 여러분이 해당 콘텐츠에 대한 지식재산권을 보유하게 되는 것은 아닙니다. 여러분이 해당 콘텐츠를 자유롭게 이용하기 위해서는 그 이용이 저작권법 등 관련 법률에 따라 허용되는 범위 내에 있거나, 해당 콘텐츠의 지식재산권자로부터 별도의 이용 허락을 받아야 하므로 각별한 주의가 필요합니다.\r\n\r\n네이버는 여러분이 네이버 서비스를 마음껏 이용할 수 있도록 여러분께 네이버 서비스에 수반되는 관련 소프트웨어 사용에 관한 이용 권한을 부여합니다. 이 경우 여러분의 자유로운 이용은 네이버가 제시하는 이용 조건에 부합하는 범위 내에서만 허용되고, 이러한 권한은 양도가 불가능하며, 비독점적 조건 및 법적고지가 적용된다는 점을 유의해 주세요.\r\n\r\n네이버에서 제공하는 다양한 포인트를 요긴하게 활용해 보세요.\r\n네이버는 여러분이 네이버 서비스를 효율적으로 이용할 수 있도록 포인트를 부여하고 있습니다. 포인트는 여러분의 일정한 네이버 서비스 이용과 연동하여 네이버가 임의로 책정하거나 조정하여 지급하는 일정한 계산 단위를 갖는 서비스 상의 가상 데이터를 말합니다. 포인트는 재산적 가치가 없기 때문에 금전으로 환불 또는 전환할 수 없지만, 포인트의 많고 적음에 따라 여러분의 네이버 서비스 이용에 영향을 주는 경우가 있으므로 경우에 따라 적절히 활용해 보세요.\r\n\r\n네이버는 네이버 서비스의 효율적 이용을 지원하거나 서비스 운영을 개선하기 위해 필요한 경우 사전에 여러분께 안내 드린 후 부득이 포인트의 일부 또는 전부를 조정할 수 있습니다. 그리고 포인트는 네이버가 정한 기간에 따라 주기적으로 소멸할 수도 있으니 포인트가 부여되는 네이버 서비스 이용 시 유의해 주시기 바랍니다.\r\n\r\n네이버 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.\r\n네이버는 여러분이 네이버 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 다만, 여러분이 네이버 서비스를 보다 안전하게 이용하고 네이버 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다. 여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 네이버 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다.\r\n\r\n회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한 내용은 계정 운영정책을 참고해 주시기 바랍니다.\r\n타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다.\r\n관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.\r\n자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.\r\n자동화된 수단을 활용하는 등 네이버 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, 네이버 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 네이버 서비스 이용에 불편을 초래하고 더 나아가 네이버의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.\r\n네이버의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 네이버 서비스 회원으로 가입을 시도 또는 가입하거나, 네이버 서비스에 로그인을 시도 또는 로그인하거나, 네이버 서비스 상에 게시물을 게재하거나, 네이버 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), 네이버 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, 네이버 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 네이버 서비스의 제공 취지에 부합하지 않는 방식으로 네이버 서비스를 이용하거나 이와 같은 네이버 서비스에 대한 어뷰징(남용) 행위를 막기 위한 네이버의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다.\r\n네이버의 동의 없이 자동화된 수단에 의해 네이버 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다. 또한, 네이버 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다. 네이버 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). 그 밖에 바이러스나 기타 악성 코드를 업로드하거나 네이버 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다.\r\n네이버는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다.\r\n\r\n부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.\r\n네이버는 다양한 정보와 의견이 담긴 여러분의 콘텐츠를 소중히 다룰 것을 약속 드립니다만, 여러분이 게재한 게시물이 관련 법령, 본 약관, 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등에 위배되는 경우, 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수 있습니다. 다만, 이것이 네이버가 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다.\r\n\r\n또한 여러분이 관련 법령, 본 약관, 계정 및 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등을 준수하지 않을 경우, 네이버는 여러분의 관련 행위 내용을 확인할 수 있으며, 그 확인 결과에 따라 네이버 서비스 이용에 대한 주의를 당부하거나, 네이버 서비스 이용을 일부 또는 전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다. 한편, 이러한 이용 제한에도 불구하고 더 이상 네이버 서비스 이용계약의 온전한 유지를 기대하기 어려운 경우엔 부득이 여러분과의 이용계약을 해지할 수 있습니다.\r\n\r\n부득이 여러분의 서비스 이용을 제한해야 할 경우 명백한 법령 위반이나 타인의 권리침해로서 긴급한 위험 또는 피해 차단이 요구되는 사안 외에는 위와 같은 단계적 서비스 이용제한 원칙을 준수 하겠습니다. 명백한 법령 위반 등을 이유로 부득이 서비스 이용을 즉시 영구 정지시키는 경우 서비스 이용을 통해 획득한 포인트 및 기타 혜택 등은 모두 소멸되고 이에 대해 별도로 보상하지 않으므로 유의해 주시기 바랍니다. 서비스 이용 제한의 조건, 세부 내용 등은 계정 운영정책 및 각 개별 서비스에서의 운영정책을 참고하시기 바랍니다.\r\n\r\n네이버의 잘못은 네이버가 책임집니다.\r\n네이버는 여러분이 네이버 서비스를 이용함에 있어 네이버의 고의 또는 과실로 인하여 손해를 입게 될 경우 관련 법령에 따라 여러분의 손해를 배상합니다. 다만, 천재지변 또는 이에 준하는 불가항력으로 인하여 네이버가 서비스를 제공할 수 없거나 이용자의 고의 또는 과실로 인하여 서비스를 이용할 수 없어 발생한 손해에 대해서 네이버는 책임을 부담하지 않습니다.\r\n\r\n그리고 네이버가 손해배상책임을 부담하는 경우에도 통상적으로 예견이 불가능하거나 특별한 사정으로 인한 특별 손해 또는 간접 손해, 기타 징벌적 손해에 대해서는 관련 법령에 특별한 규정이 없는 한 책임을 부담하지 않습니다.\r\n\r\n한편, 네이버 서비스를 매개로 한 여러분과 다른 회원 간 또는 여러분과 비회원 간의 의견 교환, 거래 등에서 발생한 손해나 여러분이 서비스 상에 게재된 타인의 게시물 등의 콘텐츠를 신뢰함으로써 발생한 손해에 대해서도 네이버는 특별한 사정이 없는 한 이에 대해 책임을 부담하지 않습니다.\r\n\r\n언제든지 네이버 서비스 이용계약을 해지하실 수 있습니다.\r\n네이버에게는 참 안타까운 일입니다만, 회원은 언제든지 네이버 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 네이버는 관련 법령 등이 정하는 바에 따라 이를 지체 없이 처리하겠습니다.\r\n\r\n네이버 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 네이버가 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다. 다만, 이 경우에도 다른 회원이 별도로 담아갔거나 스크랩한 게시물과 공용 게시판에 등록한 댓글 등의 게시물은 삭제되지 않으므로 반드시 해지 신청 이전에 삭제하신 후 탈퇴하시기 바랍니다.\r\n\r\n일부 네이버 서비스에는 광고가 포함되어 있습니다.\r\n여러분이 다양한 네이버 서비스를 이용하다 보면 간혹 일부 개별 서비스에 광고가 포함된 경우가 있습니다. 네이버 서비스를 이용하면서 발생할 수 있는 데이터 통신요금은 가입하신 통신사업자와의 이용계약에 따라 여러분이 부담하며, 포함된 광고 열람으로 인해 추가적으로 발생하는 비용 역시 여러분이 부담합니다.\r\n\r\n원하는 네이버 서비스를 이용하기 위해 원하지 않는 광고를 봐야 하는 경우가 있습니다. 이는 여러분에게 제공하는 다양한 네이버 서비스를 원칙적으로 무료로 제공할 수 있게 해주는 데 기여하며, 더 나아가 네이버가 연구 개발에 투자하여 더 나은 서비스를 제공할 수 있는 기반이 됩니다. 최근 타사의 일부 서비스들이 광고 없는 서비스 이용을 강조하며 주된 서비스를 유료로 제공하고 있는 관행이 이를 뒷받침합니다.\r\n\r\n네이버는 여러분의 본의 아닌 불편이나 부담이 최소화될 수 있는 방법에 대해 항상 고민하고 개선해 나가겠습니다.\r\n\r\n서비스 중단 또는 변경 시 꼭 알려드리겠습니다.\r\n네이버는 연중 무휴, 1일 24시간 안정적으로 서비스를 제공하기 위해 최선을 다하고 있습니다만, 컴퓨터, 서버 등 정보통신설비의 보수점검, 교체 또는 고장, 통신두절 등 운영상 상당한 이유가 있는 경우 부득이 서비스의 전부 또는 일부를 중단할 수 있습니다.\r\n\r\n한편, 네이버는 서비스 운영 또는 개선을 위해 상당한 필요성이 있는 경우 서비스의 전부 또는 일부를 수정, 변경 또는 종료할 수 있습니다. 무료로 제공되는 서비스의 전부 또는 일부를 수정, 변경 또는 종료하게 된 경우 관련 법령에 특별한 규정이 없는 한 별도의 보상을 하지 않습니다.\r\n\r\n이 경우 네이버는 예측 가능한 경우 상당기간 전에 이를 안내하며, 만약 예측 불가능한 경우라면 사후 지체 없이 상세히 설명하고 안내 드리겠습니다. 또한 서비스 중단의 경우에는 여러분 자신의 콘텐츠를 백업할 수 있도록 합리적이고 충분한 기회를 제공하도록 하겠습니다.\r\n\r\n주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.\r\n네이버는 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다. 회원에게 통지를 하는 경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 개별적으로 알려 드릴 것이며, 다만 회원 전체에 대한 통지가 필요할 경우엔 7일 이상 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱) 초기 화면 또는 공지사항 등에 관련 내용을 게시하도록 하겠습니다.\r\n\r\n네이버는 여러분의 소중한 의견에 귀 기울이겠습니다. 여러분은 언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며, 네이버는 합리적 범위 내에서 가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다.\r\n\r\n여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.\r\n네이버는 본 약관의 내용을 여러분이 쉽게 확인할 수 있도록 서비스 초기 화면에 게시하고 있습니다.\r\n\r\n네이버는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며, 사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다.\r\n\r\n네이버는 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지 약관 변경에 대한 여러분의 의견을 기다립니다. 위 기간이 지나도록 여러분의 의견이 네이버에 접수되지 않으면, 여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 네이버로서는 매우 안타까운 일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상 불가능하게 될 수 있습니다.\r\n\r\n네이버 서비스에는 기본적으로 본 약관이 적용됩니다만, 부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다. 따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다.\r\n\r\n본 약관은 한국어를 정본으로 합니다. 본 약관 또는 네이버 서비스와 관련된 여러분과 네이버와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 네이버 서비스와 관련하여 여러분과 네이버 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 \'민사소송법\'에서 정한 절차를 따릅니다.\r\n\r\n공지 일자: 2018년 3월 30일\r\n적용 일자: 2018년 5월 1일\r\n네이버 서비스와 관련하여 궁금하신 사항이 있으시면 고객센터(대표번호: 1588 – 3820/ 평일 09:00~18:00)로 문의 주시기 바랍니다.', '개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.\r\n\r\n1. 수집하는 개인정보\r\n이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.\r\n\r\n회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.\r\n- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 실명 인증된 아이디로 가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만14세 미만 아동의 경우, 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.\r\n- 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.\r\n- 단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다.\r\n서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.\r\n- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.\r\n- 네이버 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.\r\n\r\n\r\n\r\n서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.\r\n구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다.\r\n서비스 이용 과정에서 위치정보가 수집될 수 있으며,\r\n네이버에서 제공하는 위치기반 서비스에 대해서는 \'네이버 위치기반서비스 이용약관\'에서 자세하게 규정하고 있습니다.\r\n이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.\r\n2. 수집한 개인정보의 이용\r\n네이버 및 네이버 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.\r\n\r\n- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.\r\n- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.\r\n- 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.\r\n- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.\r\n- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.\r\n- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.\r\n- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.\r\n3. 개인정보의 보관기간\r\n회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.\r\n단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.\r\n이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.\r\n- 부정 가입 및 이용 방지\r\n부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관\r\n탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관\r\n- QR코드 복구 요청 대응\r\nQR코드 등록 정보:삭제 시점으로부터6개월 보관\r\n- 스마트플레이스 분쟁 조정 및 고객문의 대응\r\n휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년\r\n- 네이버 플러스 멤버십 서비스 혜택 중복 제공 방지\r\n암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관\r\n- 지식iN eXpert 재가입 신청 및 부정 이용 방지\r\neXpert 서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관\r\n전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.\r\n- 전자상거래 등에서 소비자 보호에 관한 법률\r\n계약 또는 청약철회 등에 관한 기록: 5년 보관\r\n대금결제 및 재화 등의 공급에 관한 기록: 5년 보관\r\n소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관\r\n- 전자문서 및 전자거래 기본법\r\n공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관\r\n- 전자서명 인증 업무\r\n인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 10년 보관\r\n- 통신비밀보호법\r\n로그인 기록: 3개월\r\n\r\n참고로 네이버는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.\r\n\r\n4. 개인정보 수집 및 이용 동의를 거부할 권리\r\n이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.');

-- 테이블 farmstory.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `uid` varchar(20) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `nick` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'USER',
  `zip` char(5) DEFAULT NULL,
  `addr1` varchar(255) DEFAULT NULL,
  `addr2` varchar(255) DEFAULT NULL,
  `regip` varchar(100) DEFAULT NULL,
  `regDate` datetime DEFAULT NULL,
  `leaveDate` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `nick` (`nick`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 farmstory.user:~2 rows (대략적) 내보내기
INSERT INTO `user` (`uid`, `pass`, `name`, `nick`, `email`, `hp`, `role`, `zip`, `addr1`, `addr2`, `regip`, `regDate`, `leaveDate`) VALUES
	('a101', '1234', NULL, NULL, NULL, NULL, 'USER', NULL, NULL, NULL, NULL, NULL, NULL),
	('aa106', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '', '', 'green@naver.com', '010-0000-0000', 'USER', '', '', '', '0:0:0:0:0:0:0:1', '2023-08-16 18:04:23', NULL);


-- finance 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `finance` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `finance`;

-- 테이블 finance.account 구조 내보내기
CREATE TABLE IF NOT EXISTS `account` (
  `acc_id` varchar(14) NOT NULL,
  `cust_jumin` varchar(20) NOT NULL,
  `acc_type` varchar(20) NOT NULL,
  `acc_balance` int NOT NULL,
  `acc_card` char(1) NOT NULL,
  `acc_register_date` datetime DEFAULT NULL,
  PRIMARY KEY (`acc_id`),
  KEY `fk_Account_Customer1_idx` (`cust_jumin`),
  CONSTRAINT `fk_Account_Customer1` FOREIGN KEY (`cust_jumin`) REFERENCES `customer` (`cust_jumin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 finance.account:~10 rows (대략적) 내보내기
INSERT INTO `account` (`acc_id`, `cust_jumin`, `acc_type`, `acc_balance`, `acc_card`, `acc_register_date`) VALUES
	('1011-1001-1001', '760121-1234567', '자유입출금', 4160000, 'Y', '2020-01-21 13:00:02'),
	('1011-1001-1002', '890530-1234567', '자유입출금', 376000, 'Y', '2020-06-11 13:00:02'),
	('1011-1001-1003', '790413-1234567', '자유입출금', 1200000, 'Y', '2020-05-30 13:00:02'),
	('1011-1001-1007', '721128-1234567', '자유입출금', 7620500, 'Y', '2020-06-15 13:00:02'),
	('1011-1001-1009', '891209-1234567', '자유입출금', 1763000, 'Y', '2020-11-28 13:00:02'),
	('1011-1002-1005', '840615-1234567', '자유입출금', 8200000, 'Y', '2020-09-12 13:00:02'),
	('1011-1002-1006', '651021-1234567', '자유입출금', 3520000, 'Y', '2020-07-28 13:00:02'),
	('1011-2001-1004', '660912-1234567', '정기적금', 1000000, 'N', '2020-04-13 13:00:02'),
	('1011-2001-1008', '920907-1234567', '정기적금', 3400000, 'N', '2020-10-21 13:00:02'),
	('1011-2001-1010', '770314-1234567', '정기적금', 1080000, 'N', '2020-09-07 13:00:02');

-- 테이블 finance.card 구조 내보내기
CREATE TABLE IF NOT EXISTS `card` (
  `card_no` char(14) NOT NULL,
  `cust_jumin` varchar(20) NOT NULL,
  `acc_id` varchar(14) DEFAULT NULL,
  `card_register_date` date DEFAULT NULL,
  `card_limit_money` int DEFAULT NULL,
  `card_approve_date` date DEFAULT NULL,
  `card_type` varchar(10) NOT NULL,
  PRIMARY KEY (`card_no`),
  KEY `fk_Card_Account1_idx` (`acc_id`),
  KEY `fk_Card_Customer1_idx` (`cust_jumin`),
  CONSTRAINT `fk_Card_Account1` FOREIGN KEY (`acc_id`) REFERENCES `account` (`acc_id`),
  CONSTRAINT `fk_Card_Customer1` FOREIGN KEY (`cust_jumin`) REFERENCES `customer` (`cust_jumin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 finance.card:~10 rows (대략적) 내보내기
INSERT INTO `card` (`card_no`, `cust_jumin`, `acc_id`, `card_register_date`, `card_limit_money`, `card_approve_date`, `card_type`) VALUES
	('2011-1001-1003', '790413-1234567', '1011-1001-1003', '2020-05-30', 5000000, '2020-06-25', 'check'),
	('2041-1001-1002', '890530-1234567', '1011-1001-1002', '2020-06-11', 3000000, '2020-06-15', 'check'),
	('2111-1001-1001', '760121-1234567', '1011-1001-1001', '2020-01-21', 1000000, '2020-02-10', 'check'),
	('2144-1001-1009', '891209-1234567', '1011-1001-1009', '2020-11-28', 1000000, '2020-12-10', 'check'),
	('2221-1001-1008', '920907-1234567', NULL, '2020-10-21', 5000000, '2020-11-15', 'credit'),
	('2345-1001-1007', '721128-1234567', '1011-1001-1007', '2020-06-15', 2000000, '2020-07-25', 'check'),
	('2611-1001-1005', '840615-1234567', '1011-1002-1005', '2020-09-12', 1500000, '2020-10-10', 'check'),
	('2711-1001-1004', '660912-1234567', NULL, '2020-04-13', 1000000, '2020-05-10', 'credit'),
	('2781-1001-1006', '651021-1234567', '1011-1002-1006', '2020-07-28', 10000000, '2020-08-15', 'check'),
	('2789-1001-1010', '770314-1234567', NULL, '2020-09-07', 1000000, '2020-10-10', 'credit');

-- 테이블 finance.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `cust_jumin` varchar(20) NOT NULL,
  `cust_name` varchar(20) NOT NULL,
  `cust_addr` varchar(100) NOT NULL,
  `cust_birth` date NOT NULL,
  `cust_email` varchar(50) DEFAULT NULL,
  `cust_phnum` varchar(25) NOT NULL,
  `cust_job` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cust_jumin`),
  UNIQUE KEY `cust_email_UNIQUE` (`cust_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 finance.customer:~12 rows (대략적) 내보내기
INSERT INTO `customer` (`cust_jumin`, `cust_name`, `cust_addr`, `cust_birth`, `cust_email`, `cust_phnum`, `cust_job`) VALUES
	('651021-1234567', '김연아', '대구', '1965-10-21', 'yuna@daum.net', '010-5101-6510', '운동선수'),
	('660912-1234567', '원빈', '대전', '1966-09-12', 'one@daum.net', '010-2104-6609', '배우'),
	('721128-1234567', '유재석', '부산', '1972-11-28', NULL, '010-6101-7211', '개그맨'),
	('750611-1234567', '이정재', '서울', '1975-06-11', NULL, '010-1102-7506', '배우'),
	('760121-1234567', '정우성', '서울', '1976-01-21', NULL, '010-1101-7601', '배우'),
	('770314-1234567', '강동원', '광주', '1977-03-14', 'dong@naver.com', '010-8101-7703', '배우'),
	('790413-1234567', '이나영', '대전', '1979-04-13', 'lee@naver.com', '010-2101-7904', '회사원'),
	('790728-1234567', '장동건', '대구', '1979-07-28', 'jang@naver.com', '010-3101-7907', '배우'),
	('840615-1234567', '고소영', '대구', '1984-06-15', 'goso@daum.net', '010-4101-8406', '회사원'),
	('890530-1234567', '전지현', '대전', '1989-05-30', 'jjh@naver.com', '010-1103-8905', '자영업'),
	('891209-1234567', '조인성', '광주', '1989-12-09', 'join@gmail.com', '010-7104-8912', '배우'),
	('920907-1234567', '강호동', '부산', '1992-09-07', NULL, '010-7103-9209', '개그맨');

-- 테이블 finance.transaction 구조 내보내기
CREATE TABLE IF NOT EXISTS `transaction` (
  `trans_id` int NOT NULL AUTO_INCREMENT,
  `trans_acc_id` varchar(14) NOT NULL,
  `trans_type` varchar(20) DEFAULT NULL,
  `trans_message` varchar(50) DEFAULT NULL,
  `trans_money` int DEFAULT NULL,
  `trans_date` datetime NOT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `fk_Transaction_Account1_idx` (`trans_acc_id`),
  CONSTRAINT `fk_Transaction_Account1` FOREIGN KEY (`trans_acc_id`) REFERENCES `account` (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 finance.transaction:~10 rows (대략적) 내보내기
INSERT INTO `transaction` (`trans_id`, `trans_acc_id`, `trans_type`, `trans_message`, `trans_money`, `trans_date`) VALUES
	(1, '1011-1001-1001', '입금', '2월 정기급여', 3500000, '2020-02-10 12:36:12'),
	(2, '1011-1001-1003', '출금', 'ATM 출금', 300000, '2020-02-10 12:37:21'),
	(3, '1011-1001-1002', '입금', '2월 급여', 2800000, '2020-02-10 12:38:21'),
	(4, '1011-1001-1007', '출금', '2월 공과금', 116200, '2020-02-10 12:39:21'),
	(5, '1011-1002-1005', '출금', 'ATM 출금', 50000, '2020-02-10 12:40:21'),
	(6, '1011-1001-1007', '입금', '홍길동 이체', 400000, '2020-02-10 12:41:21'),
	(7, '1011-1001-1007', '출금', '2월 관리비', 145000, '2020-02-10 12:42:21'),
	(8, '1011-1001-1002', '입금', '홍길동 입금', 200000, '2020-02-10 12:43:21'),
	(9, '1011-1001-1009', '입금', '연말정산 환급', 112000, '2020-02-10 12:44:21'),
	(10, '1011-1002-1006', '출금', 'ATM 출금', 30000, '2020-02-10 12:45:21');


-- hospital 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;

-- 테이블 hospital.charts 구조 내보내기
CREATE TABLE IF NOT EXISTS `charts` (
  `chart_id` char(8) NOT NULL,
  `treat_no` int NOT NULL,
  `doc_id` char(7) NOT NULL,
  `pat_id` char(7) NOT NULL,
  `chart_contents` varchar(255) NOT NULL,
  PRIMARY KEY (`chart_id`,`treat_no`,`doc_id`,`pat_id`),
  KEY `fk_Charts_Treatments1_idx` (`treat_no`,`doc_id`,`pat_id`),
  CONSTRAINT `fk_Charts_Treatments1` FOREIGN KEY (`treat_no`, `doc_id`, `pat_id`) REFERENCES `treatments` (`treat_no`, `doc_id`, `pat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 hospital.charts:~12 rows (대략적) 내보내기
INSERT INTO `charts` (`chart_id`, `treat_no`, `doc_id`, `pat_id`, `chart_contents`) VALUES
	('C1021001', 1021001, 'D102101', 'P102101', '감기 주사 및 약 처방'),
	('C1021003', 1021003, 'D102104', 'P102102', '위내시경'),
	('C1021009', 1021009, 'D102104', 'P102103', '주사 처방'),
	('C1031002', 1031002, 'D103101', 'P103101', '입원 치료'),
	('C1031006', 1031006, 'D103101', 'P103102', '목 견인치료'),
	('C1041004', 1041004, 'D104101', 'P104101', '피부 감염 방지 주사'),
	('C1041007', 1041007, 'D104101', 'P104102', '여드름 치료약 처방'),
	('C1041012', 1041012, 'D104101', 'P104103', '화상 크림약 처방'),
	('C1051005', 1051005, 'D105101', 'P105101', '비염 치료'),
	('C1051011', 1051011, 'D105101', 'P105102', '귀 청소 및 약 처방'),
	('C1071010', 1071010, 'D107104', 'P107101', 'MRI 검사'),
	('C1081008', 1081008, 'D108101', 'P108101', '발목 깁스');

-- 테이블 hospital.departments 구조 내보내기
CREATE TABLE IF NOT EXISTS `departments` (
  `dep_no` char(3) NOT NULL,
  `dep_name` varchar(20) NOT NULL,
  `dep_manager` varchar(20) NOT NULL,
  `dep_tel` varchar(20) NOT NULL,
  PRIMARY KEY (`dep_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 hospital.departments:~12 rows (대략적) 내보내기
INSERT INTO `departments` (`dep_no`, `dep_name`, `dep_manager`, `dep_tel`) VALUES
	('101', '소아과', '김유신', '051-123-0101'),
	('102', '내과', '김춘추', '051-123-0102'),
	('103', '외과', '장보고', '051-123-0103'),
	('104', '피부과', '선덕여왕', '051-123-0104'),
	('105', '이비인후과', '강감찬', '051-123-0105'),
	('106', '산부인과', '신사임당', '051-123-0106'),
	('107', '흉부외과', '류성룡', '051-123-0107'),
	('108', '정형외과', '송상현', '051-123-0108'),
	('109', '신경외과', '이순신', '051-123-0109'),
	('110', '비뇨기과', '정약용', '051-123-0110'),
	('111', '안과', '박지원', '051-123-0111'),
	('112', '치과', '전봉준', '051-123-0112');

-- 테이블 hospital.doctors 구조 내보내기
CREATE TABLE IF NOT EXISTS `doctors` (
  `doc_id` char(7) NOT NULL,
  `doc_name` varchar(45) NOT NULL,
  `doc_birth` char(10) NOT NULL,
  `doc_gen` char(1) NOT NULL,
  `dep_no` char(3) NOT NULL,
  `doc_pos` varchar(45) NOT NULL,
  `doc_phone` varchar(20) NOT NULL,
  `doc_email` varchar(45) NOT NULL,
  PRIMARY KEY (`doc_id`),
  UNIQUE KEY `doc_phone_UNIQUE` (`doc_phone`),
  UNIQUE KEY `doc_email_UNIQUE` (`doc_email`),
  KEY `fk_Doctors_Departments1_idx` (`dep_no`),
  CONSTRAINT `fk_Doctors_Departments1` FOREIGN KEY (`dep_no`) REFERENCES `departments` (`dep_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 hospital.doctors:~12 rows (대략적) 내보내기
INSERT INTO `doctors` (`doc_id`, `doc_name`, `doc_birth`, `doc_gen`, `dep_no`, `doc_pos`, `doc_phone`, `doc_email`) VALUES
	('D101101', '김유신', '1976-01-21', 'M', '101', '과장', '010-1101-1976', 'kimys@bw.com'),
	('D101102', '계백', '1975-06-11', 'M', '101', '전문의', '010-1102-1975', 'gaeback@bw.com'),
	('D101103', '김관창', '1989-05-30', 'M', '101', '전문의', '010-1103-1989', 'kwanch@bw.com'),
	('D102101', '김춘추', '1979-04-13', 'M', '102', '과장', '010-2101-1979', 'kimcc@bw.com'),
	('D102104', '이사부', '1966-09-12', 'M', '102', '전문의', '010-2104-1966', 'leesabu@bw.com'),
	('D103101', '장보고', '1979-07-28', 'M', '103', '과장', '010-3101-1979', 'jangbg@bw.com'),
	('D104101', '선덕여왕', '1984-06-15', 'F', '104', '과장', '010-4101-1984', 'queen@bw.com'),
	('D105101', '강감찬', '1965-10-21', 'M', '105', '과장', '010-5101-1965', 'kang@bw.com'),
	('D106101', '신사임당', '1972-11-28', 'F', '106', '과장', '010-6101-1972', 'sinsa@bw.com'),
	('D107103', '이이', '1992-09-07', 'M', '107', '전문의', '010-7103-1992', 'leelee@bw.com'),
	('D107104', '이황', '1989-12-09', 'M', '107', '전문의', '010-7104-1989', 'hwang@bw.com'),
	('D108101', '송상현', '1977-03-14', 'M', '108', '과장', '010-8101-1977', 'ssh@bw.com');

-- 테이블 hospital.nurses 구조 내보내기
CREATE TABLE IF NOT EXISTS `nurses` (
  `nur_id` char(7) NOT NULL,
  `nur_name` varchar(45) NOT NULL,
  `nur_birth` char(10) NOT NULL,
  `nur_gender` char(1) NOT NULL,
  `dep_no` char(3) NOT NULL,
  `nur_pos` varchar(45) NOT NULL,
  `nur_phone` char(13) NOT NULL,
  `nur_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nur_id`),
  UNIQUE KEY `nur_phone_UNIQUE` (`nur_phone`),
  UNIQUE KEY `nur_email_UNIQUE` (`nur_email`),
  KEY `fk_Nurses_Departments1_idx` (`dep_no`),
  CONSTRAINT `fk_Nurses_Departments1` FOREIGN KEY (`dep_no`) REFERENCES `departments` (`dep_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 hospital.nurses:~10 rows (대략적) 내보내기
INSERT INTO `nurses` (`nur_id`, `nur_name`, `nur_birth`, `nur_gender`, `dep_no`, `nur_pos`, `nur_phone`, `nur_email`) VALUES
	('N101101', '송승헌', '1976-02-21', 'M', '101', '수간호사', '010-1101-7602', 'ssh@bw.com'),
	('N102101', '이영애', '1975-07-11', 'F', '102', '수간호사', '010-1102-7507', 'yung@bw.com'),
	('N102102', '엄정화', '1989-06-30', 'F', '102', '주임', '010-1103-8906', 'um@bw.com'),
	('N102103', '박명수', '1979-05-13', 'M', '102', '주임', '010-2101-7905', 'park@bw.com'),
	('N103101', '정준하', '1966-10-12', 'M', '103', '주임', '010-2104-6610', 'jung@bw.com'),
	('N104101', '김태희', '1979-08-28', 'F', '104', '주임', '010-3101-7908', 'taeh@w.com'),
	('N105101', '송혜교', '1984-07-15', 'F', '105', '주임', '010-4101-8407', 'song@bw.com'),
	('N106101', '공유', '1965-11-21', 'M', '106', '간호사', '010-5101-6511', 'gong@bw.com'),
	('N107101', '이병헌', '1972-12-28', 'M', '107', '간호사', '010-6101-7212', 'byung@bw.com'),
	('N108101', '송중기', '1992-10-07', 'M', '108', '간호사', '010-7103-9210', 'jungi@bw.com');

-- 테이블 hospital.patients 구조 내보내기
CREATE TABLE IF NOT EXISTS `patients` (
  `pat_id` char(7) NOT NULL,
  `doc_id` char(7) NOT NULL,
  `nur_id` char(7) NOT NULL,
  `pat_name` varchar(45) NOT NULL,
  `pat_jumin` char(14) NOT NULL,
  `pat_gen` char(1) NOT NULL,
  `pat_addr` varchar(100) NOT NULL,
  `pat_phone` varchar(45) NOT NULL,
  `pat_email` varchar(45) DEFAULT NULL,
  `pat_job` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pat_id`),
  UNIQUE KEY `pat_jumin_UNIQUE` (`pat_jumin`),
  UNIQUE KEY `pat_phone_UNIQUE` (`pat_phone`),
  UNIQUE KEY `pat_email_UNIQUE` (`pat_email`),
  KEY `fk_Patients_Doctors_idx` (`doc_id`),
  KEY `fk_Patients_Nurses1_idx` (`nur_id`),
  CONSTRAINT `fk_Patients_Doctors` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`doc_id`),
  CONSTRAINT `fk_Patients_Nurses1` FOREIGN KEY (`nur_id`) REFERENCES `nurses` (`nur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 hospital.patients:~12 rows (대략적) 내보내기
INSERT INTO `patients` (`pat_id`, `doc_id`, `nur_id`, `pat_name`, `pat_jumin`, `pat_gen`, `pat_addr`, `pat_phone`, `pat_email`, `pat_job`) VALUES
	('P102101', 'D102101', 'N102101', '정우성', '760121-1234567', 'M', '서울', '010-1101-7601', NULL, '배우'),
	('P102102', 'D102104', 'N102103', '전지현', '890503-1234567', 'F', '대전', '010-1103-8905', 'jjh@naver.com', '자영업'),
	('P102103', 'D102104', 'N102102', '유재석', '721128-1234567', 'M', '부산', '010-6101-7211', NULL, '개그맨'),
	('P103101', 'D103101', 'N103101', '이정재', '750611-1234567', 'M', '서울', '010-1102-7506', NULL, '배우'),
	('P103102', 'D103101', 'N103101', '장동건', '790728-1234567', 'M', '대구', '010-3101-7907', 'jang@naver.com', '배우'),
	('P104101', 'D104101', 'N104101', '이나영', '790413-1234567', 'F', '대전', '010-2101-7904', 'lee@naver.com', '회사원'),
	('P104102', 'D104101', 'N104101', '고소영', '840615-1234567', 'F', '대구', '010-4101-8406', 'goso@naver.com', '회사원'),
	('P104103', 'D104101', 'N104101', '강동원', '770314-1234567', 'M', '광주', '010-8101-7703', 'dong@naver.com', '배우'),
	('P105101', 'D105101', 'N105101', '원빈', '660912-1234567', 'M', '대전', '010-2104-6609', 'one@naver.com', '배우'),
	('P105102', 'D105101', 'N105101', '조인성', '891209-1234567', 'M', '광주', '010-7104-8912', 'join@naver.com', '배우'),
	('P107101', 'D107104', 'N107101', '강호동', '920907-1234567', 'M', '부산', '010-7103-9209', NULL, '개그맨'),
	('P108101', 'D108101', 'N108101', '김연아', '651021-1234567', 'F', '대구', '010-5101-6510', 'yuna@naver.com', '운동선수');

-- 테이블 hospital.treatments 구조 내보내기
CREATE TABLE IF NOT EXISTS `treatments` (
  `treat_no` int NOT NULL,
  `doc_id` char(7) NOT NULL,
  `pat_id` char(7) NOT NULL,
  `treat_contents` varchar(255) NOT NULL,
  `treat_datetime` datetime NOT NULL,
  PRIMARY KEY (`treat_no`,`doc_id`,`pat_id`),
  KEY `fk_Treatments_Doctors1_idx` (`doc_id`),
  KEY `fk_Treatments_Patients1_idx` (`pat_id`),
  CONSTRAINT `fk_Treatments_Doctors1` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`doc_id`),
  CONSTRAINT `fk_Treatments_Patients1` FOREIGN KEY (`pat_id`) REFERENCES `patients` (`pat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 hospital.treatments:~12 rows (대략적) 내보내기
INSERT INTO `treatments` (`treat_no`, `doc_id`, `pat_id`, `treat_contents`, `treat_datetime`) VALUES
	(1021001, 'D102101', 'P102101', '감기, 몸살', '2023-06-28 17:32:43'),
	(1021003, 'D102104', 'P102102', '위염, 장염', '2023-06-28 17:32:43'),
	(1021009, 'D102104', 'P102103', '소화불량', '2023-06-28 17:32:43'),
	(1031002, 'D103101', 'P103101', '교통사고 외상', '2023-06-28 17:32:43'),
	(1031006, 'D103101', 'P103102', '목 디스크', '2023-06-28 17:32:43'),
	(1041004, 'D104101', 'P104101', '피부 트러블', '2023-06-28 17:32:43'),
	(1041007, 'D104101', 'P104102', '여드름', '2023-06-28 17:32:43'),
	(1041012, 'D104101', 'P104103', '팔목 화상', '2023-06-28 17:32:43'),
	(1051005, 'D105101', 'P105101', '코막힘 및 비염', '2023-06-28 17:32:43'),
	(1051011, 'D105101', 'P105102', '귀 이명', '2023-06-28 17:32:43'),
	(1071010, 'D107104', 'P107101', '가슴 통증', '2023-06-28 17:32:43'),
	(1081008, 'D108101', 'P108101', '오른쪽 발목 뼈 골절', '2023-06-28 17:32:43');


-- jboard 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `jboard` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jboard`;

-- 테이블 jboard.article 구조 내보내기
CREATE TABLE IF NOT EXISTS `article` (
  `no` int NOT NULL AUTO_INCREMENT,
  `parent` int DEFAULT '0',
  `comment` int DEFAULT '0',
  `cate` varchar(20) DEFAULT 'free',
  `title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `file` tinyint DEFAULT '0',
  `hit` int DEFAULT '0',
  `writer` varchar(20) NOT NULL,
  `regip` varchar(100) NOT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`no`),
  KEY `writer` (`writer`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`writer`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jboard.article:~130 rows (대략적) 내보내기
INSERT INTO `article` (`no`, `parent`, `comment`, `cate`, `title`, `content`, `file`, `hit`, `writer`, `regip`, `rdate`) VALUES
	(1, 0, 2, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(2, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(3, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(4, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(6, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(7, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(8, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(9, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(13, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(14, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(15, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(16, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(17, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(18, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(19, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(20, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(28, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(29, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(30, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(31, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(32, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(33, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(34, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(35, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(36, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(37, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(38, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(39, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(40, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(41, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(42, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(43, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(59, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(60, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(61, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(62, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(63, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(64, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(65, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(66, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(67, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(68, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(69, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(70, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(71, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(72, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(73, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(74, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(75, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(76, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(77, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(78, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(79, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(80, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(81, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(82, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(83, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(84, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(85, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(86, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(87, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(88, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(89, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(90, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(122, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(123, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(124, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(125, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(126, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(127, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(128, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(129, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(130, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(131, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(132, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(133, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(134, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(135, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(136, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(137, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(138, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(139, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(140, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(141, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(142, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(143, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(144, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(145, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(146, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(147, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(148, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(149, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(150, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(151, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(152, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(153, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(154, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(155, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(156, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(157, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(158, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(159, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(160, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(161, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(162, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(163, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(164, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(165, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(166, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(167, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(168, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(169, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(170, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(171, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(172, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(173, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(174, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(175, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(176, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(177, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(178, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(179, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(180, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(181, 0, 0, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(182, 0, 0, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(183, 0, 1, 'free', '2', '22', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:40:03'),
	(184, 0, 1, 'free', '1', '1', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-08 11:39:59'),
	(260, 184, 0, 'free', NULL, 'fdsfdfdsfdsfdsfdsf', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-11 09:45:20'),
	(262, 183, 0, 'free', NULL, 'fdsfdsfdsfs', 0, 0, 'aa106', '0:0:0:0:0:0:0:1', '2023-08-11 09:46:27');

-- 테이블 jboard.file 구조 내보내기
CREATE TABLE IF NOT EXISTS `file` (
  `fno` int NOT NULL AUTO_INCREMENT,
  `ano` int NOT NULL,
  `oriName` varchar(255) NOT NULL,
  `newName` varchar(255) NOT NULL,
  `download` int DEFAULT '0',
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`fno`),
  KEY `ano` (`ano`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`ano`) REFERENCES `article` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jboard.file:~0 rows (대략적) 내보내기

-- 테이블 jboard.terms 구조 내보내기
CREATE TABLE IF NOT EXISTS `terms` (
  `terms` text NOT NULL,
  `privacy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jboard.terms:~0 rows (대략적) 내보내기
INSERT INTO `terms` (`terms`, `privacy`) VALUES
	('여러분을 환영합니다.\r\n네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.\r\n\r\n네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.\r\n\r\n다양한 네이버 서비스를 즐겨보세요.\r\n네이버는 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.\r\n여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 네이버 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 네이버 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.\r\n\r\n네이버는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, \'청소년보호법\' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.\r\n\r\n네이버 서비스에는 기본적으로 본 약관이 적용됩니다만 네이버가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 네이버페이, V LIVE 등)가 있습니다. 그리고 네이버 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.\r\n\r\n회원으로 가입하시면 네이버 서비스를 보다 편리하게 이용할 수 있습니다.\r\n여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 네이버는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 네이버 회원가입 방법 등에서 확인해 주세요.\r\n\r\n네이버는 단체에 속한 여러 구성원들이 공동의 계정으로 네이버 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.\r\n따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 네이버 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.\r\n\r\n단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 네이버 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다.\r\n\r\n여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.\r\n네이버는 여러분이 게재한 게시물이 네이버 서비스를 통해 다른 이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다. 게시물은 여러분이 타인 또는 자신이 보게 할 목적으로 네이버 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 말합니다.\r\n\r\n네이버는 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을 약속 드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다.\r\n\r\n한편, 네이버 서비스를 통해 여러분이 게재한 게시물을 적법하게 제공하려면 해당 콘텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시, 배포, 2차적 저작물 작성(단, 번역에 한함) 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이 없는 라이선스)이 필요합니다.\r\n게시물 게재로 여러분은 네이버에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한 권리를 보유하고 있어야 합니다.\r\n\r\n네이버는 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 네이버 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할 것입니다.\r\n만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다.\r\n\r\n또한 여러분이 제공한 소중한 콘텐츠는 네이버 서비스를 개선하고 새로운 네이버 서비스를 제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 네이버 및 네이버 계열사에서 사용될 수 있습니다. 네이버는 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다.\r\n\r\n네이버는 여러분이 자신이 제공한 콘텐츠에 대한 네이버 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록 다양한 수단을 제공하기 위해 노력하고 있습니다. 여러분은 네이버 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이 제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개, 검색결과 제외 등의 조치를 요청할 수 있습니다.\r\n다만, 일부 네이버 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수 있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다.\r\n\r\n여러분의 개인정보를 소중히 보호합니다.\r\n네이버는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 네이버가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.\r\n\r\n네이버는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.\r\n\r\n타인의 권리를 존중해 주세요.\r\n여러분이 무심코 게재한 게시물로 인해 타인의 저작권이 침해되거나 명예훼손 등 권리 침해가 발생할 수 있습니다. 네이버는 이에 대한 문제 해결을 위해 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 및 ‘저작권법’ 등을 근거로 권리침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 게시중단요청서비스를 운영하고 있습니다. 보다 상세한 내용 및 절차는 고객센터 내 게시중단요청서비스 소개를 참고해 주세요.\r\n\r\n한편, 네이버 서비스를 통해 타인의 콘텐츠를 이용한다고 하여 여러분이 해당 콘텐츠에 대한 지식재산권을 보유하게 되는 것은 아닙니다. 여러분이 해당 콘텐츠를 자유롭게 이용하기 위해서는 그 이용이 저작권법 등 관련 법률에 따라 허용되는 범위 내에 있거나, 해당 콘텐츠의 지식재산권자로부터 별도의 이용 허락을 받아야 하므로 각별한 주의가 필요합니다.\r\n\r\n네이버는 여러분이 네이버 서비스를 마음껏 이용할 수 있도록 여러분께 네이버 서비스에 수반되는 관련 소프트웨어 사용에 관한 이용 권한을 부여합니다. 이 경우 여러분의 자유로운 이용은 네이버가 제시하는 이용 조건에 부합하는 범위 내에서만 허용되고, 이러한 권한은 양도가 불가능하며, 비독점적 조건 및 법적고지가 적용된다는 점을 유의해 주세요.\r\n\r\n네이버에서 제공하는 다양한 포인트를 요긴하게 활용해 보세요.\r\n네이버는 여러분이 네이버 서비스를 효율적으로 이용할 수 있도록 포인트를 부여하고 있습니다. 포인트는 여러분의 일정한 네이버 서비스 이용과 연동하여 네이버가 임의로 책정하거나 조정하여 지급하는 일정한 계산 단위를 갖는 서비스 상의 가상 데이터를 말합니다. 포인트는 재산적 가치가 없기 때문에 금전으로 환불 또는 전환할 수 없지만, 포인트의 많고 적음에 따라 여러분의 네이버 서비스 이용에 영향을 주는 경우가 있으므로 경우에 따라 적절히 활용해 보세요.\r\n\r\n네이버는 네이버 서비스의 효율적 이용을 지원하거나 서비스 운영을 개선하기 위해 필요한 경우 사전에 여러분께 안내 드린 후 부득이 포인트의 일부 또는 전부를 조정할 수 있습니다. 그리고 포인트는 네이버가 정한 기간에 따라 주기적으로 소멸할 수도 있으니 포인트가 부여되는 네이버 서비스 이용 시 유의해 주시기 바랍니다.\r\n\r\n네이버 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.\r\n네이버는 여러분이 네이버 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 다만, 여러분이 네이버 서비스를 보다 안전하게 이용하고 네이버 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다. 여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 네이버 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다.\r\n\r\n회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한 내용은 계정 운영정책을 참고해 주시기 바랍니다.\r\n타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다.\r\n관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.\r\n자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.\r\n자동화된 수단을 활용하는 등 네이버 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, 네이버 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 네이버 서비스 이용에 불편을 초래하고 더 나아가 네이버의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.\r\n네이버의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 네이버 서비스 회원으로 가입을 시도 또는 가입하거나, 네이버 서비스에 로그인을 시도 또는 로그인하거나, 네이버 서비스 상에 게시물을 게재하거나, 네이버 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), 네이버 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, 네이버 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 네이버 서비스의 제공 취지에 부합하지 않는 방식으로 네이버 서비스를 이용하거나 이와 같은 네이버 서비스에 대한 어뷰징(남용) 행위를 막기 위한 네이버의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다.\r\n네이버의 동의 없이 자동화된 수단에 의해 네이버 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다. 또한, 네이버 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다. 네이버 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). 그 밖에 바이러스나 기타 악성 코드를 업로드하거나 네이버 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다.\r\n네이버는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다.\r\n\r\n부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.\r\n네이버는 다양한 정보와 의견이 담긴 여러분의 콘텐츠를 소중히 다룰 것을 약속 드립니다만, 여러분이 게재한 게시물이 관련 법령, 본 약관, 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등에 위배되는 경우, 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수 있습니다. 다만, 이것이 네이버가 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다.\r\n\r\n또한 여러분이 관련 법령, 본 약관, 계정 및 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등을 준수하지 않을 경우, 네이버는 여러분의 관련 행위 내용을 확인할 수 있으며, 그 확인 결과에 따라 네이버 서비스 이용에 대한 주의를 당부하거나, 네이버 서비스 이용을 일부 또는 전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다. 한편, 이러한 이용 제한에도 불구하고 더 이상 네이버 서비스 이용계약의 온전한 유지를 기대하기 어려운 경우엔 부득이 여러분과의 이용계약을 해지할 수 있습니다.\r\n\r\n부득이 여러분의 서비스 이용을 제한해야 할 경우 명백한 법령 위반이나 타인의 권리침해로서 긴급한 위험 또는 피해 차단이 요구되는 사안 외에는 위와 같은 단계적 서비스 이용제한 원칙을 준수 하겠습니다. 명백한 법령 위반 등을 이유로 부득이 서비스 이용을 즉시 영구 정지시키는 경우 서비스 이용을 통해 획득한 포인트 및 기타 혜택 등은 모두 소멸되고 이에 대해 별도로 보상하지 않으므로 유의해 주시기 바랍니다. 서비스 이용 제한의 조건, 세부 내용 등은 계정 운영정책 및 각 개별 서비스에서의 운영정책을 참고하시기 바랍니다.\r\n\r\n네이버의 잘못은 네이버가 책임집니다.\r\n네이버는 여러분이 네이버 서비스를 이용함에 있어 네이버의 고의 또는 과실로 인하여 손해를 입게 될 경우 관련 법령에 따라 여러분의 손해를 배상합니다. 다만, 천재지변 또는 이에 준하는 불가항력으로 인하여 네이버가 서비스를 제공할 수 없거나 이용자의 고의 또는 과실로 인하여 서비스를 이용할 수 없어 발생한 손해에 대해서 네이버는 책임을 부담하지 않습니다.\r\n\r\n그리고 네이버가 손해배상책임을 부담하는 경우에도 통상적으로 예견이 불가능하거나 특별한 사정으로 인한 특별 손해 또는 간접 손해, 기타 징벌적 손해에 대해서는 관련 법령에 특별한 규정이 없는 한 책임을 부담하지 않습니다.\r\n\r\n한편, 네이버 서비스를 매개로 한 여러분과 다른 회원 간 또는 여러분과 비회원 간의 의견 교환, 거래 등에서 발생한 손해나 여러분이 서비스 상에 게재된 타인의 게시물 등의 콘텐츠를 신뢰함으로써 발생한 손해에 대해서도 네이버는 특별한 사정이 없는 한 이에 대해 책임을 부담하지 않습니다.\r\n\r\n언제든지 네이버 서비스 이용계약을 해지하실 수 있습니다.\r\n네이버에게는 참 안타까운 일입니다만, 회원은 언제든지 네이버 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 네이버는 관련 법령 등이 정하는 바에 따라 이를 지체 없이 처리하겠습니다.\r\n\r\n네이버 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 네이버가 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다. 다만, 이 경우에도 다른 회원이 별도로 담아갔거나 스크랩한 게시물과 공용 게시판에 등록한 댓글 등의 게시물은 삭제되지 않으므로 반드시 해지 신청 이전에 삭제하신 후 탈퇴하시기 바랍니다.\r\n\r\n일부 네이버 서비스에는 광고가 포함되어 있습니다.\r\n여러분이 다양한 네이버 서비스를 이용하다 보면 간혹 일부 개별 서비스에 광고가 포함된 경우가 있습니다. 네이버 서비스를 이용하면서 발생할 수 있는 데이터 통신요금은 가입하신 통신사업자와의 이용계약에 따라 여러분이 부담하며, 포함된 광고 열람으로 인해 추가적으로 발생하는 비용 역시 여러분이 부담합니다.\r\n\r\n원하는 네이버 서비스를 이용하기 위해 원하지 않는 광고를 봐야 하는 경우가 있습니다. 이는 여러분에게 제공하는 다양한 네이버 서비스를 원칙적으로 무료로 제공할 수 있게 해주는 데 기여하며, 더 나아가 네이버가 연구 개발에 투자하여 더 나은 서비스를 제공할 수 있는 기반이 됩니다. 최근 타사의 일부 서비스들이 광고 없는 서비스 이용을 강조하며 주된 서비스를 유료로 제공하고 있는 관행이 이를 뒷받침합니다.\r\n\r\n네이버는 여러분의 본의 아닌 불편이나 부담이 최소화될 수 있는 방법에 대해 항상 고민하고 개선해 나가겠습니다.\r\n\r\n서비스 중단 또는 변경 시 꼭 알려드리겠습니다.\r\n네이버는 연중 무휴, 1일 24시간 안정적으로 서비스를 제공하기 위해 최선을 다하고 있습니다만, 컴퓨터, 서버 등 정보통신설비의 보수점검, 교체 또는 고장, 통신두절 등 운영상 상당한 이유가 있는 경우 부득이 서비스의 전부 또는 일부를 중단할 수 있습니다.\r\n\r\n한편, 네이버는 서비스 운영 또는 개선을 위해 상당한 필요성이 있는 경우 서비스의 전부 또는 일부를 수정, 변경 또는 종료할 수 있습니다. 무료로 제공되는 서비스의 전부 또는 일부를 수정, 변경 또는 종료하게 된 경우 관련 법령에 특별한 규정이 없는 한 별도의 보상을 하지 않습니다.\r\n\r\n이 경우 네이버는 예측 가능한 경우 상당기간 전에 이를 안내하며, 만약 예측 불가능한 경우라면 사후 지체 없이 상세히 설명하고 안내 드리겠습니다. 또한 서비스 중단의 경우에는 여러분 자신의 콘텐츠를 백업할 수 있도록 합리적이고 충분한 기회를 제공하도록 하겠습니다.\r\n\r\n주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.\r\n네이버는 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다. 회원에게 통지를 하는 경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 개별적으로 알려 드릴 것이며, 다만 회원 전체에 대한 통지가 필요할 경우엔 7일 이상 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱) 초기 화면 또는 공지사항 등에 관련 내용을 게시하도록 하겠습니다.\r\n\r\n네이버는 여러분의 소중한 의견에 귀 기울이겠습니다. 여러분은 언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며, 네이버는 합리적 범위 내에서 가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다.\r\n\r\n여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.\r\n네이버는 본 약관의 내용을 여러분이 쉽게 확인할 수 있도록 서비스 초기 화면에 게시하고 있습니다.\r\n\r\n네이버는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며, 사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다.\r\n\r\n네이버는 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지 약관 변경에 대한 여러분의 의견을 기다립니다. 위 기간이 지나도록 여러분의 의견이 네이버에 접수되지 않으면, 여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 네이버로서는 매우 안타까운 일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상 불가능하게 될 수 있습니다.\r\n\r\n네이버 서비스에는 기본적으로 본 약관이 적용됩니다만, 부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다. 따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다.\r\n\r\n본 약관은 한국어를 정본으로 합니다. 본 약관 또는 네이버 서비스와 관련된 여러분과 네이버와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 네이버 서비스와 관련하여 여러분과 네이버 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 \'민사소송법\'에서 정한 절차를 따릅니다.\r\n\r\n공지 일자: 2018년 3월 30일\r\n적용 일자: 2018년 5월 1일\r\n네이버 서비스와 관련하여 궁금하신 사항이 있으시면 고객센터(대표번호: 1588 – 3820/ 평일 09:00~18:00)로 문의 주시기 바랍니다.', '개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.\r\n\r\n1. 수집하는 개인정보\r\n이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.\r\n\r\n회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.\r\n- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 실명 인증된 아이디로 가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만14세 미만 아동의 경우, 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.\r\n- 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.\r\n- 단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다.\r\n서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.\r\n- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.\r\n- 네이버 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.\r\n\r\n\r\n\r\n서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.\r\n구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다.\r\n서비스 이용 과정에서 위치정보가 수집될 수 있으며,\r\n네이버에서 제공하는 위치기반 서비스에 대해서는 \'네이버 위치기반서비스 이용약관\'에서 자세하게 규정하고 있습니다.\r\n이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.\r\n2. 수집한 개인정보의 이용\r\n네이버 및 네이버 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.\r\n\r\n- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.\r\n- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.\r\n- 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.\r\n- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.\r\n- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.\r\n- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.\r\n- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.\r\n3. 개인정보의 보관기간\r\n회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.\r\n단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.\r\n이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.\r\n- 부정 가입 및 이용 방지\r\n부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관\r\n탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관\r\n- QR코드 복구 요청 대응\r\nQR코드 등록 정보:삭제 시점으로부터6개월 보관\r\n- 스마트플레이스 분쟁 조정 및 고객문의 대응\r\n휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년\r\n- 네이버 플러스 멤버십 서비스 혜택 중복 제공 방지\r\n암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관\r\n- 지식iN eXpert 재가입 신청 및 부정 이용 방지\r\neXpert 서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관\r\n전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.\r\n- 전자상거래 등에서 소비자 보호에 관한 법률\r\n계약 또는 청약철회 등에 관한 기록: 5년 보관\r\n대금결제 및 재화 등의 공급에 관한 기록: 5년 보관\r\n소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관\r\n- 전자문서 및 전자거래 기본법\r\n공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관\r\n- 전자서명 인증 업무\r\n인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 10년 보관\r\n- 통신비밀보호법\r\n로그인 기록: 3개월\r\n\r\n참고로 네이버는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.\r\n\r\n4. 개인정보 수집 및 이용 동의를 거부할 권리\r\n이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.');

-- 테이블 jboard.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `uid` varchar(20) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `nick` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'USER',
  `zip` char(5) DEFAULT NULL,
  `addr1` varchar(255) DEFAULT NULL,
  `addr2` varchar(255) DEFAULT NULL,
  `regip` varchar(100) DEFAULT NULL,
  `regDate` datetime DEFAULT NULL,
  `leaveDate` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `nick` (`nick`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jboard.user:~9 rows (대략적) 내보내기
INSERT INTO `user` (`uid`, `pass`, `name`, `nick`, `email`, `hp`, `role`, `zip`, `addr1`, `addr2`, `regip`, `regDate`, `leaveDate`) VALUES
	('', '', '', '', '', '', 'USER', '', '', '', '0:0:0:0:0:0:0:1', '2023-08-08 13:52:40', NULL),
	('a1010', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '김철수', '김철수', 'green@daum.net', '010-2222-2222', 'USER', '36759', '경북 안동시 풍천면 수호로 59', '', '0:0:0:0:0:0:0:1', '2023-08-03 16:31:25', NULL),
	('a102', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '김김김', '김김김', 'green@naver.com', '010-0000-0000', 'USER', '', '', '', '0:0:0:0:0:0:0:1', '2023-08-02 12:11:26', NULL),
	('a10355', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '님님님', '그린', 'green@gmail.com', '010-1111-2222', 'USER', '', '', '', '0:0:0:0:0:0:0:1', '2023-08-04 11:12:51', NULL),
	('a107', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '김김김', '김김', 'eee@naver.com', '010-1111-1111', 'USER', '', '', '', '0:0:0:0:0:0:0:1', '2023-08-16 12:26:40', NULL),
	('aa106', 'ffdc081bc1eaa98b54739f00d4d1d36e0e0bb195d8712a07a8b0a3336c33a668', '림림림', '6번째', 'lll@naver.com', '010-2222-2223', 'USER', '', '', 'rmfls123@', '0:0:0:0:0:0:0:1', '2023-08-04 12:19:04', NULL),
	('aa107', 'cfe4432c1de3863c1670ea0369601b435e61fad05c8eff3eb2f92ae4308fe96a', '그린컴터', '그린ZJA', 'fjfjfj@naver.com', '010-5555-1112', 'USER', '', '', '', '0:0:0:0:0:0:0:1', '2023-08-08 09:22:30', NULL),
	('aaa105', '5cb2437141c3476a5cad01dd789e05d80cea33a55e09abf029efb2a9a58f2a38', '딤딤딤', '8월4일', 'fff@naver.com', '010-1111-7777', 'USER', '', '', '', '0:0:0:0:0:0:0:1', '2023-08-04 12:17:00', NULL),
	('fff', '123', '림이러', '라아라이', 'ff@naver.com', '018-8888-8888', 'USER', '', '', '', '0:0:0:0:0:0:0:1', '2023-08-08 12:51:51', NULL),
	('gjgjgj', '58305e11847751eb2c3b4648fe53052323806df856197ff9cf86d596f86c7e93', '집집집', '집', 'ffffffffffff@naver.com', '010-1111-3333', 'USER', '', '', '', '0:0:0:0:0:0:0:1', '2023-08-04 11:23:32', NULL);


-- jboard2 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `jboard2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jboard2`;

-- 테이블 jboard2.article 구조 내보내기
CREATE TABLE IF NOT EXISTS `article` (
  `no` int NOT NULL AUTO_INCREMENT,
  `parent` int DEFAULT '0',
  `comment` int DEFAULT '0',
  `cate` varchar(20) DEFAULT 'free',
  `title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `file` tinyint DEFAULT '0',
  `hit` int DEFAULT '0',
  `writer` varchar(20) NOT NULL,
  `regip` varchar(100) NOT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`no`),
  KEY `writer` (`writer`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`writer`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jboard2.article:~0 rows (대략적) 내보내기

-- 테이블 jboard2.file 구조 내보내기
CREATE TABLE IF NOT EXISTS `file` (
  `fno` int NOT NULL AUTO_INCREMENT,
  `ano` int NOT NULL,
  `oriName` varchar(255) NOT NULL,
  `newName` varchar(255) NOT NULL,
  `download` int DEFAULT '0',
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`fno`),
  KEY `ano` (`ano`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`ano`) REFERENCES `article` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jboard2.file:~0 rows (대략적) 내보내기

-- 테이블 jboard2.terms 구조 내보내기
CREATE TABLE IF NOT EXISTS `terms` (
  `terms` text NOT NULL,
  `privacy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jboard2.terms:~0 rows (대략적) 내보내기
INSERT INTO `terms` (`terms`, `privacy`) VALUES
	('여러분을 환영합니다.\r\n네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.\r\n\r\n네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.\r\n\r\n다양한 네이버 서비스를 즐겨보세요.\r\n네이버는 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.\r\n여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 네이버 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 네이버 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.\r\n\r\n네이버는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, \'청소년보호법\' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.\r\n\r\n네이버 서비스에는 기본적으로 본 약관이 적용됩니다만 네이버가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 네이버페이, V LIVE 등)가 있습니다. 그리고 네이버 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.\r\n\r\n회원으로 가입하시면 네이버 서비스를 보다 편리하게 이용할 수 있습니다.\r\n여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 네이버는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 네이버 회원가입 방법 등에서 확인해 주세요.\r\n\r\n네이버는 단체에 속한 여러 구성원들이 공동의 계정으로 네이버 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.\r\n따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 네이버 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.\r\n\r\n단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 네이버 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다.\r\n\r\n여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.\r\n네이버는 여러분이 게재한 게시물이 네이버 서비스를 통해 다른 이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다. 게시물은 여러분이 타인 또는 자신이 보게 할 목적으로 네이버 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 말합니다.\r\n\r\n네이버는 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을 약속 드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다.\r\n\r\n한편, 네이버 서비스를 통해 여러분이 게재한 게시물을 적법하게 제공하려면 해당 콘텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시, 배포, 2차적 저작물 작성(단, 번역에 한함) 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이 없는 라이선스)이 필요합니다.\r\n게시물 게재로 여러분은 네이버에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한 권리를 보유하고 있어야 합니다.\r\n\r\n네이버는 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 네이버 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할 것입니다.\r\n만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다.\r\n\r\n또한 여러분이 제공한 소중한 콘텐츠는 네이버 서비스를 개선하고 새로운 네이버 서비스를 제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 네이버 및 네이버 계열사에서 사용될 수 있습니다. 네이버는 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다.\r\n\r\n네이버는 여러분이 자신이 제공한 콘텐츠에 대한 네이버 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록 다양한 수단을 제공하기 위해 노력하고 있습니다. 여러분은 네이버 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이 제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개, 검색결과 제외 등의 조치를 요청할 수 있습니다.\r\n다만, 일부 네이버 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수 있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다.\r\n\r\n여러분의 개인정보를 소중히 보호합니다.\r\n네이버는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 네이버가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.\r\n\r\n네이버는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.\r\n\r\n타인의 권리를 존중해 주세요.\r\n여러분이 무심코 게재한 게시물로 인해 타인의 저작권이 침해되거나 명예훼손 등 권리 침해가 발생할 수 있습니다. 네이버는 이에 대한 문제 해결을 위해 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 및 ‘저작권법’ 등을 근거로 권리침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 게시중단요청서비스를 운영하고 있습니다. 보다 상세한 내용 및 절차는 고객센터 내 게시중단요청서비스 소개를 참고해 주세요.\r\n\r\n한편, 네이버 서비스를 통해 타인의 콘텐츠를 이용한다고 하여 여러분이 해당 콘텐츠에 대한 지식재산권을 보유하게 되는 것은 아닙니다. 여러분이 해당 콘텐츠를 자유롭게 이용하기 위해서는 그 이용이 저작권법 등 관련 법률에 따라 허용되는 범위 내에 있거나, 해당 콘텐츠의 지식재산권자로부터 별도의 이용 허락을 받아야 하므로 각별한 주의가 필요합니다.\r\n\r\n네이버는 여러분이 네이버 서비스를 마음껏 이용할 수 있도록 여러분께 네이버 서비스에 수반되는 관련 소프트웨어 사용에 관한 이용 권한을 부여합니다. 이 경우 여러분의 자유로운 이용은 네이버가 제시하는 이용 조건에 부합하는 범위 내에서만 허용되고, 이러한 권한은 양도가 불가능하며, 비독점적 조건 및 법적고지가 적용된다는 점을 유의해 주세요.\r\n\r\n네이버에서 제공하는 다양한 포인트를 요긴하게 활용해 보세요.\r\n네이버는 여러분이 네이버 서비스를 효율적으로 이용할 수 있도록 포인트를 부여하고 있습니다. 포인트는 여러분의 일정한 네이버 서비스 이용과 연동하여 네이버가 임의로 책정하거나 조정하여 지급하는 일정한 계산 단위를 갖는 서비스 상의 가상 데이터를 말합니다. 포인트는 재산적 가치가 없기 때문에 금전으로 환불 또는 전환할 수 없지만, 포인트의 많고 적음에 따라 여러분의 네이버 서비스 이용에 영향을 주는 경우가 있으므로 경우에 따라 적절히 활용해 보세요.\r\n\r\n네이버는 네이버 서비스의 효율적 이용을 지원하거나 서비스 운영을 개선하기 위해 필요한 경우 사전에 여러분께 안내 드린 후 부득이 포인트의 일부 또는 전부를 조정할 수 있습니다. 그리고 포인트는 네이버가 정한 기간에 따라 주기적으로 소멸할 수도 있으니 포인트가 부여되는 네이버 서비스 이용 시 유의해 주시기 바랍니다.\r\n\r\n네이버 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.\r\n네이버는 여러분이 네이버 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 다만, 여러분이 네이버 서비스를 보다 안전하게 이용하고 네이버 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다. 여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 네이버 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다.\r\n\r\n회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한 내용은 계정 운영정책을 참고해 주시기 바랍니다.\r\n타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다.\r\n관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.\r\n자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.\r\n자동화된 수단을 활용하는 등 네이버 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, 네이버 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 네이버 서비스 이용에 불편을 초래하고 더 나아가 네이버의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.\r\n네이버의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 네이버 서비스 회원으로 가입을 시도 또는 가입하거나, 네이버 서비스에 로그인을 시도 또는 로그인하거나, 네이버 서비스 상에 게시물을 게재하거나, 네이버 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), 네이버 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, 네이버 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 네이버 서비스의 제공 취지에 부합하지 않는 방식으로 네이버 서비스를 이용하거나 이와 같은 네이버 서비스에 대한 어뷰징(남용) 행위를 막기 위한 네이버의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다.\r\n네이버의 동의 없이 자동화된 수단에 의해 네이버 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다. 또한, 네이버 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다. 네이버 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). 그 밖에 바이러스나 기타 악성 코드를 업로드하거나 네이버 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다.\r\n네이버는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다.\r\n\r\n부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.\r\n네이버는 다양한 정보와 의견이 담긴 여러분의 콘텐츠를 소중히 다룰 것을 약속 드립니다만, 여러분이 게재한 게시물이 관련 법령, 본 약관, 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등에 위배되는 경우, 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수 있습니다. 다만, 이것이 네이버가 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다.\r\n\r\n또한 여러분이 관련 법령, 본 약관, 계정 및 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등을 준수하지 않을 경우, 네이버는 여러분의 관련 행위 내용을 확인할 수 있으며, 그 확인 결과에 따라 네이버 서비스 이용에 대한 주의를 당부하거나, 네이버 서비스 이용을 일부 또는 전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다. 한편, 이러한 이용 제한에도 불구하고 더 이상 네이버 서비스 이용계약의 온전한 유지를 기대하기 어려운 경우엔 부득이 여러분과의 이용계약을 해지할 수 있습니다.\r\n\r\n부득이 여러분의 서비스 이용을 제한해야 할 경우 명백한 법령 위반이나 타인의 권리침해로서 긴급한 위험 또는 피해 차단이 요구되는 사안 외에는 위와 같은 단계적 서비스 이용제한 원칙을 준수 하겠습니다. 명백한 법령 위반 등을 이유로 부득이 서비스 이용을 즉시 영구 정지시키는 경우 서비스 이용을 통해 획득한 포인트 및 기타 혜택 등은 모두 소멸되고 이에 대해 별도로 보상하지 않으므로 유의해 주시기 바랍니다. 서비스 이용 제한의 조건, 세부 내용 등은 계정 운영정책 및 각 개별 서비스에서의 운영정책을 참고하시기 바랍니다.\r\n\r\n네이버의 잘못은 네이버가 책임집니다.\r\n네이버는 여러분이 네이버 서비스를 이용함에 있어 네이버의 고의 또는 과실로 인하여 손해를 입게 될 경우 관련 법령에 따라 여러분의 손해를 배상합니다. 다만, 천재지변 또는 이에 준하는 불가항력으로 인하여 네이버가 서비스를 제공할 수 없거나 이용자의 고의 또는 과실로 인하여 서비스를 이용할 수 없어 발생한 손해에 대해서 네이버는 책임을 부담하지 않습니다.\r\n\r\n그리고 네이버가 손해배상책임을 부담하는 경우에도 통상적으로 예견이 불가능하거나 특별한 사정으로 인한 특별 손해 또는 간접 손해, 기타 징벌적 손해에 대해서는 관련 법령에 특별한 규정이 없는 한 책임을 부담하지 않습니다.\r\n\r\n한편, 네이버 서비스를 매개로 한 여러분과 다른 회원 간 또는 여러분과 비회원 간의 의견 교환, 거래 등에서 발생한 손해나 여러분이 서비스 상에 게재된 타인의 게시물 등의 콘텐츠를 신뢰함으로써 발생한 손해에 대해서도 네이버는 특별한 사정이 없는 한 이에 대해 책임을 부담하지 않습니다.\r\n\r\n언제든지 네이버 서비스 이용계약을 해지하실 수 있습니다.\r\n네이버에게는 참 안타까운 일입니다만, 회원은 언제든지 네이버 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 네이버는 관련 법령 등이 정하는 바에 따라 이를 지체 없이 처리하겠습니다.\r\n\r\n네이버 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 네이버가 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다. 다만, 이 경우에도 다른 회원이 별도로 담아갔거나 스크랩한 게시물과 공용 게시판에 등록한 댓글 등의 게시물은 삭제되지 않으므로 반드시 해지 신청 이전에 삭제하신 후 탈퇴하시기 바랍니다.\r\n\r\n일부 네이버 서비스에는 광고가 포함되어 있습니다.\r\n여러분이 다양한 네이버 서비스를 이용하다 보면 간혹 일부 개별 서비스에 광고가 포함된 경우가 있습니다. 네이버 서비스를 이용하면서 발생할 수 있는 데이터 통신요금은 가입하신 통신사업자와의 이용계약에 따라 여러분이 부담하며, 포함된 광고 열람으로 인해 추가적으로 발생하는 비용 역시 여러분이 부담합니다.\r\n\r\n원하는 네이버 서비스를 이용하기 위해 원하지 않는 광고를 봐야 하는 경우가 있습니다. 이는 여러분에게 제공하는 다양한 네이버 서비스를 원칙적으로 무료로 제공할 수 있게 해주는 데 기여하며, 더 나아가 네이버가 연구 개발에 투자하여 더 나은 서비스를 제공할 수 있는 기반이 됩니다. 최근 타사의 일부 서비스들이 광고 없는 서비스 이용을 강조하며 주된 서비스를 유료로 제공하고 있는 관행이 이를 뒷받침합니다.\r\n\r\n네이버는 여러분의 본의 아닌 불편이나 부담이 최소화될 수 있는 방법에 대해 항상 고민하고 개선해 나가겠습니다.\r\n\r\n서비스 중단 또는 변경 시 꼭 알려드리겠습니다.\r\n네이버는 연중 무휴, 1일 24시간 안정적으로 서비스를 제공하기 위해 최선을 다하고 있습니다만, 컴퓨터, 서버 등 정보통신설비의 보수점검, 교체 또는 고장, 통신두절 등 운영상 상당한 이유가 있는 경우 부득이 서비스의 전부 또는 일부를 중단할 수 있습니다.\r\n\r\n한편, 네이버는 서비스 운영 또는 개선을 위해 상당한 필요성이 있는 경우 서비스의 전부 또는 일부를 수정, 변경 또는 종료할 수 있습니다. 무료로 제공되는 서비스의 전부 또는 일부를 수정, 변경 또는 종료하게 된 경우 관련 법령에 특별한 규정이 없는 한 별도의 보상을 하지 않습니다.\r\n\r\n이 경우 네이버는 예측 가능한 경우 상당기간 전에 이를 안내하며, 만약 예측 불가능한 경우라면 사후 지체 없이 상세히 설명하고 안내 드리겠습니다. 또한 서비스 중단의 경우에는 여러분 자신의 콘텐츠를 백업할 수 있도록 합리적이고 충분한 기회를 제공하도록 하겠습니다.\r\n\r\n주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.\r\n네이버는 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다. 회원에게 통지를 하는 경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 개별적으로 알려 드릴 것이며, 다만 회원 전체에 대한 통지가 필요할 경우엔 7일 이상 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱) 초기 화면 또는 공지사항 등에 관련 내용을 게시하도록 하겠습니다.\r\n\r\n네이버는 여러분의 소중한 의견에 귀 기울이겠습니다. 여러분은 언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며, 네이버는 합리적 범위 내에서 가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다.\r\n\r\n여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.\r\n네이버는 본 약관의 내용을 여러분이 쉽게 확인할 수 있도록 서비스 초기 화면에 게시하고 있습니다.\r\n\r\n네이버는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며, 사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다.\r\n\r\n네이버는 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지 약관 변경에 대한 여러분의 의견을 기다립니다. 위 기간이 지나도록 여러분의 의견이 네이버에 접수되지 않으면, 여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 네이버로서는 매우 안타까운 일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상 불가능하게 될 수 있습니다.\r\n\r\n네이버 서비스에는 기본적으로 본 약관이 적용됩니다만, 부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다. 따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다.\r\n\r\n본 약관은 한국어를 정본으로 합니다. 본 약관 또는 네이버 서비스와 관련된 여러분과 네이버와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 네이버 서비스와 관련하여 여러분과 네이버 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 \'민사소송법\'에서 정한 절차를 따릅니다.\r\n\r\n공지 일자: 2018년 3월 30일\r\n적용 일자: 2018년 5월 1일\r\n네이버 서비스와 관련하여 궁금하신 사항이 있으시면 고객센터(대표번호: 1588 – 3820/ 평일 09:00~18:00)로 문의 주시기 바랍니다.', '개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.\r\n\r\n1. 수집하는 개인정보\r\n이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.\r\n\r\n회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.\r\n- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 실명 인증된 아이디로 가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만14세 미만 아동의 경우, 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.\r\n- 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.\r\n- 단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다.\r\n서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.\r\n- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.\r\n- 네이버 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.\r\n\r\n\r\n\r\n서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.\r\n구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다.\r\n서비스 이용 과정에서 위치정보가 수집될 수 있으며,\r\n네이버에서 제공하는 위치기반 서비스에 대해서는 \'네이버 위치기반서비스 이용약관\'에서 자세하게 규정하고 있습니다.\r\n이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.\r\n2. 수집한 개인정보의 이용\r\n네이버 및 네이버 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.\r\n\r\n- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.\r\n- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.\r\n- 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.\r\n- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.\r\n- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.\r\n- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.\r\n- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.\r\n3. 개인정보의 보관기간\r\n회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.\r\n단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.\r\n이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.\r\n- 부정 가입 및 이용 방지\r\n부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관\r\n탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관\r\n- QR코드 복구 요청 대응\r\nQR코드 등록 정보:삭제 시점으로부터6개월 보관\r\n- 스마트플레이스 분쟁 조정 및 고객문의 대응\r\n휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년\r\n- 네이버 플러스 멤버십 서비스 혜택 중복 제공 방지\r\n암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관\r\n- 지식iN eXpert 재가입 신청 및 부정 이용 방지\r\neXpert 서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관\r\n전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.\r\n- 전자상거래 등에서 소비자 보호에 관한 법률\r\n계약 또는 청약철회 등에 관한 기록: 5년 보관\r\n대금결제 및 재화 등의 공급에 관한 기록: 5년 보관\r\n소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관\r\n- 전자문서 및 전자거래 기본법\r\n공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관\r\n- 전자서명 인증 업무\r\n인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 10년 보관\r\n- 통신비밀보호법\r\n로그인 기록: 3개월\r\n\r\n참고로 네이버는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.\r\n\r\n4. 개인정보 수집 및 이용 동의를 거부할 권리\r\n이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.');

-- 테이블 jboard2.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `uid` varchar(20) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `nick` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'USER',
  `zip` char(5) DEFAULT NULL,
  `addr1` varchar(255) DEFAULT NULL,
  `addr2` varchar(255) DEFAULT NULL,
  `regip` varchar(100) DEFAULT NULL,
  `regDate` datetime DEFAULT NULL,
  `leaveDate` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `nick` (`nick`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 jboard2.user:~0 rows (대략적) 내보내기


-- shop 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shop`;

-- 테이블 shop.child 구조 내보내기
CREATE TABLE IF NOT EXISTS `child` (
  `cid` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `pid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `hp` (`hp`),
  KEY `pid` (`pid`),
  CONSTRAINT `child_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.child:~0 rows (대략적) 내보내기

-- 테이블 shop.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `custId` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `hp` varchar(13) DEFAULT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `rdate` date NOT NULL,
  PRIMARY KEY (`custId`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.customer:~10 rows (대략적) 내보내기
INSERT INTO `customer` (`custId`, `name`, `hp`, `addr`, `rdate`) VALUES
	('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01'),
	('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02'),
	('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03'),
	('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04'),
	('c105', '이성계', NULL, NULL, '2022-01-05'),
	('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06'),
	('c107', '허준', NULL, NULL, '2022-01-07'),
	('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08'),
	('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09'),
	('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10'),
	('c99999', '김김김', '010-5555-5555', '부산시', '2023-07-13'),
	('ㄹ알아', '김김김', '010-555-5555', '부산시', '2023-07-13');

-- 테이블 shop.department 구조 내보내기
CREATE TABLE IF NOT EXISTS `department` (
  `depNo` int NOT NULL,
  `name` char(10) DEFAULT NULL,
  `tel` char(12) DEFAULT NULL,
  PRIMARY KEY (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.department:~7 rows (대략적) 내보내기
INSERT INTO `department` (`depNo`, `name`, `tel`) VALUES
	(101, '영업1부', '051-512-1001'),
	(102, '영업2부', '051-512-1002'),
	(103, '영업3부', '051-512-1003'),
	(104, '영업4부', '051-512-1004'),
	(105, '영업5부', '051-512-1005'),
	(106, '영업지원부', '051-512-1006'),
	(107, '인사부', '051-512-1007');

-- 테이블 shop.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `uid` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `hp` varchar(13) NOT NULL,
  `pos` varchar(13) NOT NULL DEFAULT '사원',
  `dep` int DEFAULT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.member:~11 rows (대략적) 내보내기
INSERT INTO `member` (`uid`, `name`, `hp`, `pos`, `dep`, `rdate`) VALUES
	('a101', '박혁거세', '010-1234-1001', '부장', 101, '2020-11-19 11:39:48'),
	('a102', '김유신', '010-1234-1002', '차장', 101, '2020-11-19 11:39:48'),
	('a103', '김춘추', '010-1234-1003', '사원', 101, '2020-11-19 11:39:48'),
	('a104', '장보고', '010-1234-1004', '대리', 102, '2020-11-19 11:39:48'),
	('a105', '강감찬', '010-1234-1005', '과장', 102, '2020-11-19 11:39:48'),
	('a106', '이성계', '010-1234-1006', '차장', 103, '2020-11-19 11:39:48'),
	('a107', '정철', '010-1234-1007', '차장', 103, '2020-11-19 11:39:48'),
	('a108', '이순신', '010-1234-1008', '부장', 104, '2020-11-19 11:39:48'),
	('a109', '허균', '010-1234-1009', '부장', 104, '2020-11-19 11:39:48'),
	('a110', '정약용', '010-1234-1010', '사원', 105, '2020-11-19 11:39:48'),
	('a111', '박지원', '010-1234-1011', '사원', 105, '2020-11-19 11:39:48'),
	('b101', '을지문덕', '010-5555-1234', '사장', 107, '2023-06-20 17:06:32');

-- 테이블 shop.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `orderNo` int NOT NULL AUTO_INCREMENT,
  `orderId` varchar(10) NOT NULL,
  `orderProduct` int NOT NULL,
  `orderCount` int DEFAULT '1',
  `orderDate` datetime NOT NULL,
  PRIMARY KEY (`orderNo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.order:~10 rows (대략적) 내보내기
INSERT INTO `order` (`orderNo`, `orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES
	(1, 'c102', 3, 2, '2022-07-01 13:15:10'),
	(2, 'c101', 4, 1, '2022-07-01 14:16:11'),
	(3, 'c108', 1, 1, '2022-07-01 17:23:18'),
	(4, 'c109', 6, 5, '2022-07-01 10:46:36'),
	(5, 'c102', 2, 1, '2022-07-01 09:15:37'),
	(6, 'c101', 7, 3, '2022-07-01 12:35:12'),
	(7, 'c110', 1, 2, '2022-07-01 16:55:36'),
	(8, 'c104', 2, 4, '2022-07-01 14:23:23'),
	(9, 'c102', 1, 3, '2022-07-01 21:54:34'),
	(10, 'c107', 6, 1, '2022-07-01 14:21:03'),
	(11, 'c102', 1, 20, '2023-07-14 12:13:04');

-- 테이블 shop.parent 구조 내보내기
CREATE TABLE IF NOT EXISTS `parent` (
  `pid` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.parent:~0 rows (대략적) 내보내기

-- 테이블 shop.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `prodNo` int NOT NULL,
  `prodName` varchar(10) NOT NULL,
  `stock` int DEFAULT '0',
  `price` int DEFAULT NULL,
  `company` varchar(20) NOT NULL,
  PRIMARY KEY (`prodNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.product:~7 rows (대략적) 내보내기
INSERT INTO `product` (`prodNo`, `prodName`, `stock`, `price`, `company`) VALUES
	(1, '새우깡', 4980, 1500, '농심'),
	(2, '초코파이', 2500, 2500, '오리온'),
	(3, '포카칩', 3540, 1700, '오리온'),
	(4, '양파링', 1250, 1800, '농심'),
	(5, '죠리퐁', 2200, NULL, '크라운'),
	(6, '마카렛트', 3500, 3500, '롯데'),
	(7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

-- 테이블 shop.sales 구조 내보내기
CREATE TABLE IF NOT EXISTS `sales` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `uid` char(10) DEFAULT NULL,
  `year` year DEFAULT NULL,
  `month` int DEFAULT NULL,
  `sale` int DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.sales:~30 rows (대략적) 내보내기
INSERT INTO `sales` (`seq`, `uid`, `year`, `month`, `sale`) VALUES
	(1, 'a101', '2018', 1, 98100),
	(2, 'a102', '2018', 1, 136000),
	(3, 'a103', '2018', 1, 80100),
	(4, 'a104', '2018', 1, 78000),
	(5, 'a105', '2018', 1, 93000),
	(6, 'a101', '2018', 2, 23500),
	(7, 'a102', '2018', 2, 126000),
	(8, 'a103', '2018', 2, 18500),
	(9, 'a105', '2018', 2, 19000),
	(10, 'a106', '2018', 2, 53000),
	(11, 'a101', '2019', 1, 24000),
	(12, 'a102', '2019', 1, 109000),
	(13, 'a103', '2019', 1, 101000),
	(14, 'a104', '2019', 1, 53500),
	(15, 'a107', '2019', 1, 24000),
	(16, 'a102', '2019', 2, 160000),
	(17, 'a103', '2019', 2, 101000),
	(18, 'a104', '2019', 2, 43000),
	(19, 'a105', '2019', 2, 24000),
	(20, 'a106', '2019', 2, 109000),
	(21, 'a102', '2020', 1, 201000),
	(22, 'a104', '2020', 1, 63000),
	(23, 'a105', '2020', 1, 74000),
	(24, 'a106', '2020', 1, 122000),
	(25, 'a107', '2020', 1, 111000),
	(26, 'a102', '2020', 2, 120000),
	(27, 'a103', '2020', 2, 93000),
	(28, 'a104', '2020', 2, 84000),
	(29, 'a105', '2020', 2, 180000),
	(30, 'a108', '2020', 2, 76000);

-- 테이블 shop.tbiproduct 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbiproduct` (
  `prdCode` int DEFAULT NULL,
  `prdName` varchar(10) DEFAULT NULL,
  `prdPrice` int DEFAULT NULL,
  `prdAmout` int DEFAULT NULL,
  `prdCompany` varchar(10) DEFAULT NULL,
  `prdMakeDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.tbiproduct:~6 rows (대략적) 내보내기
INSERT INTO `tbiproduct` (`prdCode`, `prdName`, `prdPrice`, `prdAmout`, `prdCompany`, `prdMakeDate`) VALUES
	(1, '냉장고', 800, 10, 'LG', '2022-01-06'),
	(2, '노트북', 1200, 20, '삼성', '2022-01-06'),
	(3, 'TV', 1400, 6, 'LG', '2022-01-06'),
	(4, '세탁기', 1000, 8, 'LG', '2022-01-06'),
	(5, '컴퓨터', 1100, 0, '삼성', '2021-01-01'),
	(6, '휴대폰', 900, 102, '삼성', '2022-01-06');

-- 테이블 shop.tbiuser 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbiuser` (
  `UserId` varchar(10) DEFAULT NULL,
  `UserName` varchar(10) DEFAULT NULL,
  `userHp` char(13) DEFAULT NULL,
  `userAge` tinyint DEFAULT NULL,
  `userAddr` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.tbiuser:~5 rows (대략적) 내보내기
INSERT INTO `tbiuser` (`UserId`, `UserName`, `userHp`, `userAge`, `userAddr`) VALUES
	('p101', '김유신', '010-1234-1001', 25, '서울시 중구'),
	('p102', '김춘추', '010-1234-1002', 23, '부산시 금정구'),
	('p104', '강감찬', '', 42, '경남 창원시'),
	('p105', '이순신', '010-1234-1005', 50, '경남 김해시');

-- 테이블 shop.user1 구조 내보내기
CREATE TABLE IF NOT EXISTS `user1` (
  `uid` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `age` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.user1:~1 rows (대략적) 내보내기
INSERT INTO `user1` (`uid`, `name`, `hp`, `age`) VALUES
	('A102', '김춘추', '010-1234-2222', 23);


-- shopping 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `shopping` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shopping`;

-- 테이블 shopping.carts 구조 내보내기
CREATE TABLE IF NOT EXISTS `carts` (
  `cartNo` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `prodNo` int NOT NULL,
  `cartProdCount` int DEFAULT '1',
  `cartProddate` datetime NOT NULL,
  PRIMARY KEY (`cartNo`,`userId`,`prodNo`),
  KEY `fk_Carts_Users2_idx` (`userId`),
  KEY `fk_Carts_Products2_idx` (`prodNo`),
  CONSTRAINT `fk_Carts_Products2` FOREIGN KEY (`prodNo`) REFERENCES `products` (`prodNo`),
  CONSTRAINT `fk_Carts_Users2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.carts:~10 rows (대략적) 내보내기
INSERT INTO `carts` (`cartNo`, `userId`, `prodNo`, `cartProdCount`, `cartProddate`) VALUES
	(1, 'user1', 100101, 1, '2023-06-29 16:47:09'),
	(2, 'user1', 100110, 2, '2023-06-29 16:47:09'),
	(3, 'user3', 120103, 1, '2023-06-29 16:47:09'),
	(4, 'user4', 130112, 1, '2023-06-29 16:47:09'),
	(5, 'user5', 130101, 1, '2023-06-29 16:47:09'),
	(6, 'user2', 110101, 3, '2023-06-29 16:47:09'),
	(7, 'user2', 160103, 1, '2023-06-29 16:47:09'),
	(8, 'user2', 170115, 1, '2023-06-29 16:47:09'),
	(9, 'user3', 110101, 1, '2023-06-29 16:47:09'),
	(10, 'user6', 130101, 1, '2023-06-29 16:47:09');

-- 테이블 shopping.categories 구조 내보내기
CREATE TABLE IF NOT EXISTS `categories` (
  `cateNo` int NOT NULL,
  `cateName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cateNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.categories:~10 rows (대략적) 내보내기
INSERT INTO `categories` (`cateNo`, `cateName`) VALUES
	(10, '여성의류패션'),
	(11, '남성의류패션'),
	(12, '식품·생필품'),
	(13, '취미·반려견'),
	(14, '홈·문구'),
	(15, '자동차·공구'),
	(16, '스포츠·건강'),
	(17, '컴퓨터·가전·디지털'),
	(18, '여행'),
	(19, '도서');

-- 테이블 shopping.orderitems 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderitems` (
  `itemNo` int NOT NULL AUTO_INCREMENT,
  `orderNo` char(11) NOT NULL,
  `prodNo` int NOT NULL,
  `itemPrice` int NOT NULL,
  `itemDiscount` tinyint NOT NULL,
  `itemCount` int DEFAULT '1',
  PRIMARY KEY (`itemNo`,`prodNo`),
  KEY `fk_OrderItems_Orders2_idx` (`orderNo`),
  KEY `fk_OrderItems_Products2_idx` (`prodNo`),
  CONSTRAINT `fk_OrderItems_Orders2` FOREIGN KEY (`orderNo`) REFERENCES `orders` (`orderNo`),
  CONSTRAINT `fk_OrderItems_Products2` FOREIGN KEY (`prodNo`) REFERENCES `products` (`prodNo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.orderitems:~13 rows (대략적) 내보내기
INSERT INTO `orderitems` (`itemNo`, `orderNo`, `prodNo`, `itemPrice`, `itemDiscount`, `itemCount`) VALUES
	(1, '22010210001', 100110, 38000, 15, 1),
	(2, '22010210001', 100101, 25000, 20, 1),
	(3, '22010210002', 120103, 21000, 10, 3),
	(4, '22010310001', 130112, 15000, 0, 1),
	(5, '22010310001', 130101, 56000, 0, 2),
	(6, '22010210010', 110101, 76000, 5, 1),
	(7, '22010310100', 160103, 120000, 0, 1),
	(8, '22010410101', 170115, 900000, 12, 1),
	(9, '22010510021', 110101, 76000, 5, 1),
	(10, '22010510027', 130101, 56000, 0, 2),
	(11, '22010510021', 100101, 25000, 20, 1),
	(12, '22010510031', 170115, 900000, 12, 1),
	(13, '22010710110', 120103, 21000, 10, 5);

-- 테이블 shopping.orders 구조 내보내기
CREATE TABLE IF NOT EXISTS `orders` (
  `orderNo` char(11) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `orderTotalPrice` int NOT NULL,
  `orderAddr` varchar(255) NOT NULL,
  `orderStatus` tinyint DEFAULT '0',
  `orderDate` datetime NOT NULL,
  PRIMARY KEY (`orderNo`,`userId`),
  KEY `fk_Orders_Users1_idx` (`userId`),
  CONSTRAINT `fk_Orders_Users1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.orders:~10 rows (대략적) 내보내기
INSERT INTO `orders` (`orderNo`, `userId`, `orderTotalPrice`, `orderAddr`, `orderStatus`, `orderDate`) VALUES
	('22010210001', 'user2', 52300, '서울시 마포구 121', 1, '2023-06-29 16:47:05'),
	('22010210002', 'user3', 56700, '서울시 강남구 21-1', 1, '2023-06-29 16:47:05'),
	('22010210010', 'user4', 72200, '서울시 강서구 큰대로 38', 2, '2023-06-29 16:47:05'),
	('22010310001', 'user5', 127000, '경기도 광주시 초월로 21', 1, '2023-06-29 16:47:05'),
	('22010310100', 'user1', 120000, '경기도 수원시 120번지', 0, '2023-06-29 16:47:05'),
	('22010410101', 'user6', 792000, '부산시 남구 21-1', 2, '2023-06-29 16:47:05'),
	('22010510021', 'user7', 92200, '부산시 부산진구 56 10층', 4, '2023-06-29 16:47:05'),
	('22010510027', 'user8', 112000, '대구시 팔달로 19', 3, '2023-06-29 16:47:05'),
	('22010510031', 'user10', 792000, '대전시 한밭로 24-1', 2, '2023-06-29 16:47:05'),
	('22010710110', 'user9', 94500, '광주시 충열로 11', 1, '2023-06-29 16:47:05');

-- 테이블 shopping.points 구조 내보내기
CREATE TABLE IF NOT EXISTS `points` (
  `pointNo` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `point` int NOT NULL,
  `pointDesc` varchar(45) NOT NULL,
  `pointDate` datetime NOT NULL,
  PRIMARY KEY (`pointNo`,`userId`),
  KEY `fk_Points_Users2_idx` (`userId`),
  CONSTRAINT `fk_Points_Users2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.points:~10 rows (대략적) 내보내기
INSERT INTO `points` (`pointNo`, `userId`, `point`, `pointDesc`, `pointDate`) VALUES
	(1, 'user1', 1000, '회원가입 1000 적립', '2023-06-29 16:46:53'),
	(2, 'user2', 6000, '상품구매 5% 적립', '2023-06-29 16:46:53'),
	(3, 'user3', 2835, '상품구매 5% 적립', '2023-06-29 16:46:53'),
	(4, 'user7', 3610, '상품구매 5% 적립', '2023-06-29 16:46:53'),
	(5, 'user5', 3000, '이벤트 응모 3000 적립', '2023-06-29 16:46:53'),
	(6, 'user2', 1000, '회원가입 1000 적립', '2023-06-29 16:46:53'),
	(7, 'user2', 2000, '이벤트 응모 2000 적립', '2023-06-29 16:46:53'),
	(8, 'user2', 2615, '상품구매 5% 적립', '2023-06-29 16:46:53'),
	(9, 'user3', 1500, '이벤트 응모 1500 적립', '2023-06-29 16:46:53'),
	(10, 'user6', 15840, '상품구매 2% 적립', '2023-06-29 16:46:53');

-- 테이블 shopping.products 구조 내보내기
CREATE TABLE IF NOT EXISTS `products` (
  `prodNo` int NOT NULL,
  `cateNo` int NOT NULL,
  `sellerNo` int NOT NULL,
  `prodName` varchar(20) NOT NULL,
  `prodPrice` int NOT NULL,
  `prodStock` int DEFAULT '0',
  `prodSold` int DEFAULT '0',
  `prodDiscount` tinyint DEFAULT '0',
  PRIMARY KEY (`prodNo`,`cateNo`),
  KEY `fk_Products_Seller1_idx` (`sellerNo`),
  CONSTRAINT `fk_Products_Seller1` FOREIGN KEY (`sellerNo`) REFERENCES `sellers` (`sellerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.products:~10 rows (대략적) 내보내기
INSERT INTO `products` (`prodNo`, `cateNo`, `sellerNo`, `prodName`, `prodPrice`, `prodStock`, `prodSold`, `prodDiscount`) VALUES
	(100101, 11, 10003, '반팔티 L~2XL', 869, 25000, 132, 20),
	(100110, 10, 10004, '트레이닝 통바지', 1602, 38000, 398, 15),
	(110101, 10, 10003, '신상 여성운동화', 160, 76000, 40, 5),
	(120101, 12, 10010, '암소 1등급 구이셋트 1.2kg', 150000, 0, 87, 15),
	(120103, 12, 10010, '바로구이 부채살 250g', 21000, 0, 61, 10),
	(130101, 13, 10006, '[ANF] 식스프리 강아지 사료', 58, 56000, 142, 0),
	(130112, 13, 10006, '중대형 사계절 강아지옷', 120, 15000, 80, 0),
	(141001, 14, 10001, '라떼 2인 소파/방수 패브릭', 320000, 0, 42, 0),
	(160103, 16, 10009, '치닝디핑 33BR 철봉', 32, 120000, 28, 0),
	(170115, 17, 10007, '지포스 3080 그래픽카드', 28, 900000, 12, 12);

-- 테이블 shopping.sellers 구조 내보내기
CREATE TABLE IF NOT EXISTS `sellers` (
  `sellerNo` int NOT NULL,
  `sellerBizName` varchar(45) NOT NULL,
  `sellerPhone` varchar(20) NOT NULL,
  `sellerManager` varchar(20) NOT NULL,
  `sellerAddr` varchar(100) NOT NULL,
  PRIMARY KEY (`sellerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.sellers:~10 rows (대략적) 내보내기
INSERT INTO `sellers` (`sellerNo`, `sellerBizName`, `sellerPhone`, `sellerManager`, `sellerAddr`) VALUES
	(10001, '(주)다팔아', '02-201-1976', '정우성', '서울'),
	(10002, '판매의민족', '02-102-1975', '이정재', '서울'),
	(10003, '멋남', '031-103-1989', '원빈', '경기'),
	(10004, '스타일살아', '032-201-1979', '이나영', '경기'),
	(10005, '(주)삼성전자', '02-214-1966', '장동건', '서울'),
	(10006, '복실이옷짱', '051-301-1979', '고소영', '부산'),
	(10007, '컴퓨존(주)', '055-401-1984', '유재석', '대구'),
	(10008, '(주)LG전자', '02-511-1965', '강호동', '서울'),
	(10009, '굿바디스포츠', '070-6101-1972', '조인성', '부산'),
	(10010, '누리푸드', '051-710-1992', '강동원', '부산');

-- 테이블 shopping.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `userId` varchar(20) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userBirth` char(10) NOT NULL,
  `userGender` char(1) NOT NULL,
  `userHp` char(13) NOT NULL,
  `userEmail` varchar(45) DEFAULT NULL,
  `userPoint` int DEFAULT '0',
  `userLevel` tinyint DEFAULT '1',
  `userAddr` varchar(100) DEFAULT NULL,
  `userRegDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userEmail_UNIQUE` (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 shopping.users:~10 rows (대략적) 내보내기
INSERT INTO `users` (`userId`, `userName`, `userBirth`, `userGender`, `userHp`, `userEmail`, `userPoint`, `userLevel`, `userAddr`, `userRegDate`) VALUES
	('user1', '김유신', '1976-01-21', 'M', '010-1101-1976', 'kimys@naver.com', 0, 1, '서울', '2023-06-29 16:46:50'),
	('user10', '허난설현', '1992-09-07', 'F', '010-7103-1992', NULL, 4100, 3, '광주', '2023-06-29 16:46:50'),
	('user2', '계백', '1975-06-11', 'M', '010-1102-1975', NULL, 1000, 1, '서울', '2023-06-29 16:46:50'),
	('user3', '김춘추', '1989-05-30', 'M', '010-1103-1989', NULL, 1200, 2, '서울', '2023-06-29 16:46:50'),
	('user4', '이사부', '1979-04-13', 'M', '010-2101-1979', 'leesabu@gmail.com', 2600, 1, '서울', '2023-06-29 16:46:50'),
	('user5', '장보고', '1966-09-12', 'M', '010-2104-1966', 'jangbg@naver.com', 9400, 4, '대전', '2023-06-29 16:46:50'),
	('user6', '선덕여왕', '1979-07-28', 'M', '010-3101-1979', 'queen@naver.com', 1600, 2, '대전', '2023-06-29 16:46:50'),
	('user7', '강감찬', '1984-06-15', 'F', '010-4101-1984', 'kang@daum.net', 800, 0, '대구', '2023-06-29 16:46:50'),
	('user8', '신사임당', '1965-10-21', 'M', '010-5101-1965', 'sinsa@gmail.com', 1500, 1, '대구', '2023-06-29 16:46:50'),
	('user9', '이이', '1972-11-28', 'F', '010-6101-1972', 'leelee@nate.com', 3400, 3, '부산', '2023-06-29 16:46:50');


-- university 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `university` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `university`;

-- 테이블 university.departments 구조 내보내기
CREATE TABLE IF NOT EXISTS `departments` (
  `depNo` int NOT NULL,
  `depName` varchar(20) NOT NULL,
  `depTel` char(14) NOT NULL,
  PRIMARY KEY (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 university.departments:~12 rows (대략적) 내보내기
INSERT INTO `departments` (`depNo`, `depName`, `depTel`) VALUES
	(10, '국어국문학과', '051-510-1010'),
	(11, '영어영문학과', '051-510-1011'),
	(20, '경영학과', '051-510-1020'),
	(21, '경제학과', '051-510-1021'),
	(22, '정치외교학과', '051-510-1022'),
	(23, '사회복지학과', '051-510-1023'),
	(30, '수학과', '051-510-1030'),
	(31, '통계학과', '051-510-1031'),
	(32, '생명과학과', '051-510-1032'),
	(40, '기계공학과', '051-510-1040'),
	(41, '전자공학과', '051-510-1041'),
	(42, '컴퓨터공학과', '051-510-1042');

-- 테이블 university.lectures 구조 내보내기
CREATE TABLE IF NOT EXISTS `lectures` (
  `lecNo` char(6) NOT NULL,
  `proNo` char(6) NOT NULL,
  `lecName` varchar(45) NOT NULL,
  `lecCredit` tinyint NOT NULL,
  `lecTime` tinyint NOT NULL,
  `lecClass` varchar(45) NOT NULL,
  PRIMARY KEY (`lecNo`,`proNo`),
  KEY `fk_Lectures_Professors1_idx` (`proNo`),
  CONSTRAINT `fk_Lectures_Professors1` FOREIGN KEY (`proNo`) REFERENCES `professors` (`proNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 university.lectures:~10 rows (대략적) 내보내기
INSERT INTO `lectures` (`lecNo`, `proNo`, `lecName`, `lecCredit`, `lecTime`, `lecClass`) VALUES
	('101001', 'P10101', '대학 글쓰기', 2, 10, '본102'),
	('101002', 'P10102', '한국어음운론', 3, 30, '본102'),
	('101003', 'P10102', '한국현대문학사', 3, 30, '본103'),
	('111011', 'P11103', '중세영문학', 3, 25, '본201'),
	('111012', 'P11104', '영미시', 3, 25, '본201'),
	('231110', 'P23102', '사회복지학개론', 1, 8, '별관103'),
	('311002', 'P31101', '통계학의 이해', 2, 16, '별관303'),
	('311003', 'P31104', '기초 통계학', 2, 26, '별관303'),
	('401019', 'P40101', '기계역학', 3, 36, '공학관 102'),
	('421012', 'P42103', '데이터베이스', 3, 32, '공학관 103');

-- 테이블 university.professors 구조 내보내기
CREATE TABLE IF NOT EXISTS `professors` (
  `proNo` char(6) NOT NULL,
  `depNo` int NOT NULL,
  `proName` varchar(20) NOT NULL,
  `proJumin` char(14) NOT NULL,
  `proHp` char(13) NOT NULL,
  `proEmail` varchar(45) NOT NULL,
  `proAddr` varchar(100) NOT NULL,
  PRIMARY KEY (`proNo`),
  UNIQUE KEY `proJumin_UNIQUE` (`proJumin`),
  UNIQUE KEY `proHp_UNIQUE` (`proHp`),
  KEY `fk_Professors_Departments1_idx` (`depNo`),
  CONSTRAINT `fk_Professors_Departments1` FOREIGN KEY (`depNo`) REFERENCES `departments` (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 university.professors:~12 rows (대략적) 내보내기
INSERT INTO `professors` (`proNo`, `depNo`, `proName`, `proJumin`, `proHp`, `proEmail`, `proAddr`) VALUES
	('P10101', 10, '김유신', '750120-1234567', '010-1101-1976', 'kimys@hg.ac.kr', '서울'),
	('P10102', 10, '계백', '740610-1234567', '010-1102-1975', 'gaeback@hg.ac.kr', '서울'),
	('P11101', 11, '김관창', '880529-1234567', '010-1103-1989', 'kwanch@hg.ac.kr', '대전'),
	('P11103', 11, '김춘추', '780412-1234567', '010-2101-1979', 'kimcc@hg.ac.kr', '대전'),
	('P11104', 11, '이사부', '650911-1234567', '010-2104-1966', 'leesabu@hg.ac.kr', '대전'),
	('P22110', 22, '장보고', '780727-1234567', '010-3101-1979', 'jangbg@hg.ac.kr', '대구'),
	('P23102', 23, '선덕여왕', '830614-1234567', '010-4101-1984', 'queen@hg.ac.kr', '대구'),
	('P31101', 31, '강감찬', '641020-1234567', '010-5101-1965', 'kang@hg.ac.kr', '대구'),
	('P31104', 31, '신사임당', '711127-1234567', '010-6101-1972', 'sinsa@hg.ac.kr', '부산'),
	('P40101', 40, '이이', '910906-1234567', '010-7103-1992', 'leelee@hg.ac.kr', '부산'),
	('P40102', 40, '이황', '881208-1234567', '010-7104-1989', 'hwang@hg.ac.kr', '광주'),
	('P42103', 42, '송상현', '760313-1234567', '010-7104-1977', 'hwang@hg.ac.kr', '광주');

-- 테이블 university.register 구조 내보내기
CREATE TABLE IF NOT EXISTS `register` (
  `stdNo` char(8) NOT NULL,
  `lecNo` char(6) NOT NULL,
  `proNo` char(6) NOT NULL,
  `regAttenScore` tinyint DEFAULT NULL,
  `regMidScore` tinyint DEFAULT NULL,
  `regFinalScore` tinyint DEFAULT NULL,
  `regEtcScore` tinyint DEFAULT NULL,
  `regTotal` tinyint DEFAULT NULL,
  `regGrade` char(1) DEFAULT NULL,
  PRIMARY KEY (`stdNo`,`lecNo`,`proNo`),
  KEY `fk_Register_Students1_idx` (`stdNo`),
  KEY `fk_Register_Lectures1_idx` (`lecNo`,`proNo`),
  CONSTRAINT `fk_Register_Lectures1` FOREIGN KEY (`lecNo`) REFERENCES `lectures` (`lecNo`),
  CONSTRAINT `fk_Register_Students1` FOREIGN KEY (`stdNo`) REFERENCES `students` (`stdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 university.register:~10 rows (대략적) 내보내기
INSERT INTO `register` (`stdNo`, `lecNo`, `proNo`, `regAttenScore`, `regMidScore`, `regFinalScore`, `regEtcScore`, `regTotal`, `regGrade`) VALUES
	('20101001', '101001', 'P10101', NULL, NULL, NULL, NULL, NULL, NULL),
	('20101001', '101002', 'P10102', NULL, NULL, NULL, NULL, NULL, NULL),
	('20101001', '101003', 'P10102', NULL, NULL, NULL, NULL, NULL, NULL),
	('20101001', '421012', 'P42103', NULL, NULL, NULL, NULL, NULL, NULL),
	('20111013', '111011', 'P11103', NULL, NULL, NULL, NULL, NULL, NULL),
	('20111013', '111012', 'P11104', NULL, NULL, NULL, NULL, NULL, NULL),
	('21231002', '231110', 'P23102', NULL, NULL, NULL, NULL, NULL, NULL),
	('22401001', '401019', 'P40101', NULL, NULL, NULL, NULL, NULL, NULL),
	('22421003', '311003', 'P31104', NULL, NULL, NULL, NULL, NULL, NULL),
	('22421003', '421012', 'P42103', NULL, NULL, NULL, NULL, NULL, NULL);

-- 테이블 university.students 구조 내보내기
CREATE TABLE IF NOT EXISTS `students` (
  `stdNo` char(8) NOT NULL,
  `depNo` int NOT NULL,
  `proNo` char(6) NOT NULL,
  `stdName` varchar(20) NOT NULL,
  `stdJumin` char(14) NOT NULL,
  `stdHp` char(13) NOT NULL,
  `stdEmail` varchar(45) DEFAULT NULL,
  `stdAddr` varchar(100) NOT NULL,
  PRIMARY KEY (`stdNo`),
  UNIQUE KEY `stdHp_UNIQUE` (`stdHp`),
  UNIQUE KEY `stdJumin_UNIQUE` (`stdJumin`),
  UNIQUE KEY `stdEmail_UNIQUE` (`stdEmail`),
  KEY `fk_Students_Professors_idx` (`proNo`),
  KEY `fk_Students_Departments1_idx` (`depNo`),
  CONSTRAINT `fk_Students_Departments1` FOREIGN KEY (`depNo`) REFERENCES `departments` (`depNo`),
  CONSTRAINT `fk_Students_Professors` FOREIGN KEY (`proNo`) REFERENCES `professors` (`proNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 university.students:~12 rows (대략적) 내보내기
INSERT INTO `students` (`stdNo`, `depNo`, `proNo`, `stdName`, `stdJumin`, `stdHp`, `stdEmail`, `stdAddr`) VALUES
	('20101001', 10, 'P10101', '정우성', '760121-1234567', '010-1101-7601', NULL, '서울'),
	('20101002', 10, 'P10101', '이정재', '750611-1234567', '010-1102-7506', NULL, '서울'),
	('20111011', 11, 'P11103', '전지현', '890530-1234567', '010-1103-8905', 'jjh@naver.com', '대전'),
	('20111013', 11, 'P11103', '이나영', '790413-1234567', '010-2101-7904', 'lee@naver.com', '대전'),
	('20111014', 11, 'P11104', '원빈', '660912-1234567', '010-2104-6609', 'one@daum.net', '대전'),
	('21221010', 22, 'P22110', '장동건', '790728-1234567', '010-3101-7907', 'jang@naver.com', '대구'),
	('21231002', 23, 'P23102', '고소영', '840615-1234567', '010-4101-8406', 'goso@daum.net', '대구'),
	('22311011', 31, 'P31104', '김연아', '651021-1234567', '010-5101-6510', 'yuna@daum.net', '대구'),
	('22311014', 31, 'P31104', '유재석', '721128-1234567', '010-6101-7211', NULL, '부산'),
	('22401001', 40, 'P40101', '강호동', '920907-1234567', '010-7103-9209', NULL, '부산'),
	('22401002', 40, 'P40101', '조인성', '891209-1234567', '010-7104-8912', 'join@gmail.com', '광주'),
	('22421003', 42, 'P42103', '강동원', '770314-1234567', '010-8101-7703', 'dong@naver.com', '광주');


-- userdb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `userdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `userdb`;

-- 테이블 userdb.child 구조 내보내기
CREATE TABLE IF NOT EXISTS `child` (
  `cid` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `pid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `hp` (`hp`),
  KEY `pid` (`pid`),
  CONSTRAINT `child_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.child:~0 rows (대략적) 내보내기
INSERT INTO `child` (`cid`, `name`, `hp`, `pid`) VALUES
	('c101', '이방원', '010-1234-1001', 'p101');

-- 테이블 userdb.department 구조 내보내기
CREATE TABLE IF NOT EXISTS `department` (
  `depNo` tinyint NOT NULL,
  `name` varchar(10) NOT NULL,
  `tel` char(12) NOT NULL,
  PRIMARY KEY (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.department:~7 rows (대략적) 내보내기
INSERT INTO `department` (`depNo`, `name`, `tel`) VALUES
	(101, '영업1부', '051-512-1001'),
	(102, '영업2부', '051-512-1002'),
	(103, '영업3부', '051-512-1003'),
	(104, '영업4부', '051-512-1004'),
	(105, '영업5부', '051-512-1005'),
	(106, '영업지원부', '051-512-1006'),
	(107, '인사부', '051-512-1007');

-- 테이블 userdb.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `uid` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `hp` char(13) NOT NULL,
  `pos` varchar(10) DEFAULT '사원',
  `dep` tinyint DEFAULT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.member:~12 rows (대략적) 내보내기
INSERT INTO `member` (`uid`, `name`, `hp`, `pos`, `dep`, `rdate`) VALUES
	('a101', '박혁거세', '010-1234-1001', '부장', 101, '2023-07-10 09:54:58'),
	('a102', '김유신', '010-1234-1002', '차장', 101, '2023-07-10 09:54:58'),
	('a103', '김춘추', '010-1234-1003', '사원', 101, '2023-07-10 09:54:58'),
	('a104', '장보고', '010-1234-1004', '대리', 102, '2023-07-10 09:54:58'),
	('a105', '강감찬', '010-1234-1005', '과장', 102, '2023-07-10 09:54:58'),
	('a106', '이성계', '010-1234-1006', '차장', 103, '2023-07-10 09:54:58'),
	('a107', '정철', '010-1234-1007', '차장', 103, '2023-07-10 09:54:58'),
	('a108', '이순신', '010-1234-1008', '부장', 104, '2023-07-10 09:54:58'),
	('a109', '허균', '010-1234-1009', '부장', 104, '2023-07-10 09:54:58'),
	('a110', '정약용', '010-1234-1010', '사원', 105, '2023-07-10 09:54:58'),
	('a111', '박지원', '010-1234-1011', '사원', 105, '2023-07-10 09:54:58'),
	('b101', '을지문덕', '010-5555-1234', '사장', 107, '2023-07-10 09:54:59');

-- 테이블 userdb.parent 구조 내보내기
CREATE TABLE IF NOT EXISTS `parent` (
  `pid` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.parent:~0 rows (대략적) 내보내기
INSERT INTO `parent` (`pid`, `name`, `hp`) VALUES
	('p101', '이성계', '010-1234-1111');

-- 테이블 userdb.sales 구조 내보내기
CREATE TABLE IF NOT EXISTS `sales` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `year` year NOT NULL,
  `month` tinyint NOT NULL,
  `sale` int NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.sales:~30 rows (대략적) 내보내기
INSERT INTO `sales` (`seq`, `uid`, `year`, `month`, `sale`) VALUES
	(1, 'a101', '2018', 1, 98100),
	(2, 'a102', '2018', 1, 136000),
	(3, 'a103', '2018', 1, 80100),
	(4, 'a104', '2018', 1, 78000),
	(5, 'a105', '2018', 1, 93000),
	(6, 'a101', '2018', 2, 23500),
	(7, 'a102', '2018', 2, 126000),
	(8, 'a103', '2018', 2, 18500),
	(9, 'a105', '2018', 2, 19000),
	(10, 'a106', '2018', 2, 53000),
	(11, 'a101', '2019', 1, 24000),
	(12, 'a102', '2019', 1, 109000),
	(13, 'a103', '2019', 1, 101000),
	(14, 'a104', '2019', 1, 53500),
	(15, 'a107', '2019', 1, 24000),
	(16, 'a102', '2019', 2, 160000),
	(17, 'a103', '2019', 2, 101000),
	(18, 'a104', '2019', 2, 43000),
	(19, 'a105', '2019', 2, 24000),
	(20, 'a106', '2019', 2, 109000),
	(21, 'a102', '2020', 1, 201000),
	(22, 'a104', '2020', 1, 63000),
	(23, 'a105', '2020', 1, 74000),
	(24, 'a106', '2020', 1, 122000),
	(25, 'a107', '2020', 1, 111000),
	(26, 'a102', '2020', 2, 120000),
	(27, 'a103', '2020', 2, 93000),
	(28, 'a104', '2020', 2, 84000),
	(29, 'a105', '2020', 2, 180000),
	(30, 'a108', '2020', 2, 76000);

-- 테이블 userdb.tblproduct 구조 내보내기
CREATE TABLE IF NOT EXISTS `tblproduct` (
  `prdCode` int DEFAULT NULL,
  `prdName` varchar(10) DEFAULT NULL,
  `prdPrice` int DEFAULT NULL,
  `prdAmount` int DEFAULT NULL,
  `prdCompany` varchar(10) DEFAULT NULL,
  `prdMakeDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.tblproduct:~12 rows (대략적) 내보내기
INSERT INTO `tblproduct` (`prdCode`, `prdName`, `prdPrice`, `prdAmount`, `prdCompany`, `prdMakeDate`) VALUES
	(1, '냉장고', 800, 10, 'LG', '2022-01-06'),
	(2, '노트북', 1200, 20, '삼성', '2022-01-06'),
	(3, 'TV', 1400, 6, 'LG', '2022-01-06'),
	(4, '세탁기', 1000, 8, 'LG', '2022-01-06'),
	(5, '컴퓨터', 1100, 0, '삼성', '2021-01-01'),
	(6, '휴대폰', 900, 102, '삼성', '2022-01-06'),
	(1, '냉장고', 800, 10, 'LG', '2022-01-06'),
	(2, '노트북', 1200, 20, '삼성', '2022-01-06'),
	(3, 'TV', 1400, 6, 'LG', '2022-01-06'),
	(4, '세탁기', 1000, 8, 'LG', '2022-01-06'),
	(5, '컴퓨터', 1100, 0, '삼성', '2021-01-01'),
	(6, '휴대폰', 900, 102, '삼성', '2022-01-06');

-- 테이블 userdb.tbluser 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbluser` (
  `userId` varchar(10) DEFAULT NULL,
  `userName` varchar(10) DEFAULT NULL,
  `userHp` char(13) DEFAULT NULL,
  `userAge` tinyint DEFAULT NULL,
  `userAddr` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.tbluser:~8 rows (대략적) 내보내기
INSERT INTO `tbluser` (`userId`, `userName`, `userHp`, `userAge`, `userAddr`) VALUES
	('p101', '김유신', '010-1234-1001', 25, '서울시 중구'),
	('p102', '김춘추', '010-1234-1002', 23, '부산시 금정구'),
	('p104', '강감찬', NULL, 42, '경남 창원시'),
	('p105', '이순신', '010-1234-1001', 50, '경남 김해시'),
	('p101', '김유신', '010-1234-1001', 25, '서울시 중구'),
	('p102', '김춘추', '010-1234-1002', 23, '부산시 금정구'),
	('p104', '강감찬', NULL, 42, '경남 창원시'),
	('p105', '이순신', '010-1234-1001', 50, '경남 김해시');

-- 테이블 userdb.user1 구조 내보내기
CREATE TABLE IF NOT EXISTS `user1` (
  `uid` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `age` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.user1:~0 rows (대략적) 내보내기

-- 테이블 userdb.user2 구조 내보내기
CREATE TABLE IF NOT EXISTS `user2` (
  `uid` varchar(20) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `age` tinyint DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.user2:~4 rows (대략적) 내보내기
INSERT INTO `user2` (`uid`, `name`, `hp`, `age`) VALUES
	('a102', '김춘추', '010-1234-1002', 23),
	('a103', '장보고', '010-1234-1003', 33),
	('a104', '강감찬', '010-1234-1004', 43),
	('a105', '이순신', '010-1234-1005', 53);

-- 테이블 userdb.user3 구조 내보내기
CREATE TABLE IF NOT EXISTS `user3` (
  `uid` varchar(20) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `age` tinyint DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.user3:~4 rows (대략적) 내보내기
INSERT INTO `user3` (`uid`, `name`, `hp`, `age`) VALUES
	('a103', '장보고', '010-1234-1003', 33),
	('a104', '강감찬', '010-1234-1004', 43),
	('a105', '이순신', '010-1234-1005', 53),
	('a701', '김김김', '010-1234-5555', 31);

-- 테이블 userdb.user4 구조 내보내기
CREATE TABLE IF NOT EXISTS `user4` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  `age` tinyint DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.user4:~3 rows (대략적) 내보내기
INSERT INTO `user4` (`seq`, `name`, `gender`, `age`, `addr`) VALUES
	(2, '신사임당', 2, 27, '강릉시'),
	(4, '신사임당', 2, 27, '강릉시');

-- 테이블 userdb.user5 구조 내보내기
CREATE TABLE IF NOT EXISTS `user5` (
  `uid` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `birth` char(10) DEFAULT '0000-00-00',
  `age` tinyint DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.user5:~0 rows (대략적) 내보내기

-- 테이블 userdb.user6 구조 내보내기
CREATE TABLE IF NOT EXISTS `user6` (
  `uid` varchar(20) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `age` tinyint DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 userdb.user6:~0 rows (대략적) 내보내기
INSERT INTO `user6` (`uid`, `name`, `hp`, `age`) VALUES
	('a101', '김김김', '01055555555', 31);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
