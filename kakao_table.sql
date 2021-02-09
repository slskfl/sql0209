-- 테이블 생성하기
use kakao_bank;
CREATE TABLE client(
	client_id 	VARCHAR(20),
	name 		VARCHAR(30),
	address 	VARCHAR(50),
	phone 		VARCHAR(15),
	birth_day 	DATE
);

-- 테이블 목록 조회하기
use kakao_bank;
show tables;

-- 테이블 구조 보기
use kakao_bank;
desc client;

-- 레코드 삽입하기
insert into client(client_id, name, address, phone, birth_day)
values ('ryan', '라이언', '서울시 강남구','010-1111-2222','2000-02-08');

-- 레코드 조회하기
select * from client;

-- 레코드 삽입하기
insert into client
values ('muzi', '무지', '서울시 강남구','010-3333-4444','2001-02-08');

-- 레코드 조회하기
select * from client;

-- 레코드 삽입하기
insert into client(name, address, client_id)
values ('어피치', '서울시 강남구', 'apeach');

-- 레코드 조회하기
select * from client;
-- 레코드 선택하여 조회하기
select client_id, name from client;

-- 레코드 삽입하기
insert into client
values ('Tube', '튜브', '서울시 강남구','010-3333-4444','2001-02-08');

-- 레코드 조회하기
select * from client;

use kakao_bank;

CREATE TABLE `member`(
	id	VARCHAR(50),
	password	VARCHAR(50) 	NOT NULL,
	name		VARCHAR(50) 	NOT NULL,
	birthday 	Date 			NOT NULL,
	email		VARCHAR(50) 	NOT NULL,
	address		VARCHAR(50) 	NOT NULL,
	PRIMARY 	KEY(id)
);

alter table `member` add  tel VARCHAR(50) 	NOT NULL;

use kakao_bank;
desc `member`;

-- 상품 테이블 생성하기
create table `product`(
serial		INT 			AUTO_INCREMENT,
name		VARCHAR(50) 	NOT NULL,
standard	VARCHAR(50) 	NOT NULL,
price		INT 			NOT NULL,
PRIMARY KEY(serial)
);

use kakao_bank;
desc `product`;

-- 주문내역 테이블 생성하기
create table `order_list`(
serial		INT 			AUTO_INCREMENT,
date		TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP(),
order_id	VARCHAR(50)	 	NOT NULL,
product_id	INT 			NOT NULL,
price		INT 			NOT NULL,
PRIMARY KEY(serial),
FOREIGN KEY(order_id) REFERENCES `member`(id),
FOREIGN KEY(product_id) REFERENCES `product`(serial)
);

alter table `order_list` add qty INT DEFAULT 1;
alter table `order_list` drop price;
use kakao_bank;
desc `order_list`;
