

INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('박지성', '영국 맨체스타',   '000-5000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('김연아', '대한민국 서울',   '000-6000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO `Customer`(`name`,`address`) VALUES ('박세리', '대한민국 대전');

INSERT INTO `Book` VALUES (1, '축구의 역사',        '굿스포츠',   7000);
INSERT INTO `Book` VALUES (2, '축구아는 여자',      '나무수',     13000);
INSERT INTO `Book` VALUES (3, '축구의 이해',        '대한미디어', 22000);
INSERT INTO `Book` VALUES (4, '골프 바이블',        '대한미디어', 35000);
INSERT INTO `Book` VALUES (5, '피겨 교본',          '굿스포츠',   8000);
INSERT INTO `Book` VALUES (6, '역도 단계별기술',    '굿스포츠',   6000);
INSERT INTO `Book` VALUES (7, '야구의 추억',        '이상미디어', 20000);
INSERT INTO `Book` VALUES (8, '야구를 부탁해',      '이상미디어', 13000);
INSERT INTO `Book` VALUES (9, '올림픽 이야기',      '삼성당',     7500);
INSERT INTO `Book` VALUES (10, 'Olympic Champions', 'Pearson',    13000);

INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (1, 1,6000,'2014-07-01');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (1, 3,21000,'2014-07-03');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (2, 5,8000,'2014-07-03');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (3, 6,6000,'2014-07-04');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (4, 7,20000,'2014-07-05');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (1, 2,12000,'2014-07-07');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (4, 8,13000,'2014-07-07');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (3,10,12000,'2014-07-08');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (2,10,7000,'2014-07-09');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (3, 8,13000,'2014-07-10');


INSERT INTO `Student` VALUES ('20201016', '김유신', '010-1234-1001', 3, NULL);
INSERT INTO `Student` VALUES ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시');
INSERT INTO `Student` VALUES ('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
INSERT INTO `Student` VALUES ('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
INSERT INTO `Student` VALUES ('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
INSERT INTO `Student` VALUES ('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

INSERT INTO `Lecture` VALUES (159, '인지행동심리학', 3, 40, '본304');
INSERT INTO `Lecture` VALUES (167, '운영체제론', 3, 25, '본B05');
INSERT INTO `Lecture` VALUES (234, '무역영문', 3, 20, '본201');
INSERT INTO `Lecture` VALUES (239, '세법개론', 3, 40, '본204');
INSERT INTO `Lecture` VALUES (248, '빅데이터 개론', 3, 20, '본B01');
INSERT INTO `Lecture` VALUES (253, '컴퓨팅사고와 코딩', 2, 10, '본B02');
INSERT INTO `Lecture` VALUES (349, '사회복지 마케팅', 2, 50, '본301');

INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201126', 234);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 248);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 253);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201126', 239);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20210216', 349);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20210326', 349);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20201016', 167);
INSERT INTO `Register` (`regStdNo`, `regLecNo`) VALUES ('20220416', 349);
