-- 회원정보 테이블 인덱스 생성 
CREATE INDEX idx_member_name ON `member`(name);

-- 회원정보 테이블 인덱스 조회 
SHOW INDEX FROM `member`;

-- 상품정보 테이블 인덱스 생성 
CREATE INDEX idx_product_name 
ON `product`(name);

-- 상품정보 테이블 인덱스 조회 
SHOW INDEX FROM `product`;

-- 뷰 생성하기
CREATE VIEW view_order
AS SELECT `order_list`.serial, 
	`member`.id, `member`.name, `member`.tel, `member`.address, 
    `product`.name AS product,`product`.standard, `product`.price, 
    `order_list`.qty, price*qty AS payment 
FROM `order_list`, `member`, `product`
WHERE `order_list`.order_id = `member`.id 
	AND `order_list`.product_id = `product`.serial;