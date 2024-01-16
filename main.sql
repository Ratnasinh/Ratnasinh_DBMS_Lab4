CREATE DATABASE _ECOMMERCEPROJECT;

USE _ECOMMERCEPROJECT;

CREATE TABLE SUPPLIER (
SUP_ID int,
 PRIMARY KEY(SUP_ID),
SUP_NAME varchar(50) NOT NULL,
SUP_CITY varchar(50)NOT NULL,
SUP_PHONE varchar(50) NOT NULL);

CREATE TABLE CUSTOMER (
CUST_ID int AUTO_INCREMENT PRIMARY KEY,
CUST_NAME varchar(20) NOT NULL,
CUST_PHONE varchar(10) NOT NULL,
CUST_CITY varchar(30) NOT NULL,
CUST_GENDER char);

CREATE TABLE CATEGORY (
CAT_ID int,
primary key(CAT_ID),
CAT_NAME varchar(20)NOT NULL);

CREATE TABLE PRODUCT (
PROD_ID int,
CAT_ID int,
PROD_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PROD_DESC varchar(60),
primary key(PROD_ID),
foreign key (CAT_ID) REFERENCES CATEGORY(CAT_ID));

CREATE TABLE SUPPLIER_PRICING (
PRICING_ID int,
primary key(PRICING_ID),
PROD_ID int not null,
foreign key (PROD_ID) REFERENCES PRODUCT(PROD_ID),
SUP_ID int,
foreign key (SUP_ID) REFERENCES SUPPLIER(SUP_ID),
SUP_PRICE INT DEFAULT 0);

CREATE TABLE IF NOT exists `ORDER` (
ORD_ID int AUTO_INCREMENT PRIMARY KEY,
ORD_AMOUNT int NOT NULL,
ORD_DATE date NOT NULL,
CUST_ID int,
foreign key (CUST_ID) REFERENCES CUSTOMER(CUST_ID),
PRICING_ID int,
foreign key (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID));

CREATE TABLE RATING (
RAT_ID int,
 PRIMARY KEY (RAT_ID),
 ORD_ID int,
foreign key (ORD_ID) REFERENCES `ORDER`(ORD_ID),
RAT_RATSTARS int NOT NULL);

INSERT INTO SUPPLIER (SUP_ID, SUP_NAME, SUP_CITY, SUP_PHONE)
VALUES
 (1,"Rajesh retails", "Delhi", '1234567890'),
 (2, "Appario Ltd.", "Mumbai", '2589631470'),
 (3, "Knome products", "Banglore", '9785462315'),
 (4, "Bansal Retails", "Kochi", '8975463285'),
 (5, "Mittal Ltd.", "Lucknow", '7898456532');

 INSERT INTO CUSTOMER (CUST_ID, CUST_NAME, CUST_PHONE, CUST_CITY, CUST_GENDER)
VALUES
 (1, "AAKASH", '9999999999', "DELHI", 'M'),
(2, "AMAN", '9785463215', "NOIDA", 'M'),
(3, "NEHA", '9999999999', "MUMBAI", 'F'),
(4, "MEGHA", '9994562399', "KOLKATA", 'F'),
(5, "PULKIT", '7895999999', "LUCKNOW", 'M');

INSERT INTO CATEGORY (CAT_ID, CAT_NAME)
VALUES
(1, "BOOKS"),
(2, "GAMES"),
(3, "GROCERIES"),
(4, "ELECTRONICS"),
(5, "CLOTHES");

INSERT INTO PRODUCT (PROD_ID, PROD_NAME, PROD_DESC, CAT_ID)
VALUES 
(1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", '2'),
(2, "TSHIRT", "SIZE-L with Black, Blue and White variations", '5'),
(3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", '4'),
(4, "OATS", "Highly Nutritious from Nestle", '3'),
(5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", '1'),
(6, "MILK", "1L Toned MIlk", '3'),
(7, "Boat Earphones", "1.5Meter long Dolby Atmos", '4'),
(8, "Jeans", "Stretchable Denim Jeans with various sizes and color", '5'),
(9, "Project IGI", "compatible with windows 7 and above", '2'),
(10, "Hoodie", "Black GUCCI for 13 yrs and above", '5'),
(11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki", '1'),
(12, "Train Your Brain", "By Shireen Stephen", '1');

INSERT INTO SUPPLIER_PRICING (PRICING_ID, PROD_ID, SUP_ID, SUP_PRICE)
VALUES
(1, '1', '2', '1500'),
(2,'3', '5', '30000'),
(3, '5', '1', '3000'),
(4, '2', '3', '2500'),
(5, '4', '1', '1000'),
(6, '12', '2', '780'),
(7, '12', '4', '789'),
(8, '3', '1', '31000'),
(9, '1', '5', '1450'),
(10, '4', '2', '999'),
(11, '7', '3', '549'),
(12, '7', '4', '529'),
(13, '6', '2', '105'),
(14, '6', '1', '99'),
(15, '2', '5', '2999'),
(16, '5', '2', '2999');

INSERT `ORDER` (ORD_ID, ORD_AMOUNT, ORD_DATE, CUST_ID, PRICING_ID)
VALUES
(101, '1500', '2021-10-06', '2', '1'),
(102, '1000', '2021-10-12', '3', '5'),
(103, '30000', '2021-09-16', '5', '2'),
(104, '1500', '2021-10-05', '1', '1'),
(105, '3000', '2021-08-16', '4', '3'),
(106, '1450', '2021-08-18', '1', '9'),
(107, '789', '2021-09-01', '3', '7'),
(108, '780', '2021-09-07', '5', '6'),
(109, '3000', '2021-09-10', '5', '3'),
(110, '2500', '2021-09-10', '2', '4'),
(111, '1000', '2021-09-15', '4', '5'),
(112, '789', '2021-09-16', '4', '7'),
(113, '31000', '2021-09-16', '1', '8'),
(114, '1000', '2021-09-16', '3', '5'),
(115, '3000', '2021-09-16', '5', '3'),
(116, '99', '2021-09-17', '2', '14');

INSERT RATING (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES 
(1, '101', '4'),
(2, '102', '3'),
(3, '103', '1'),
(4, '104', '2'),
(5, '105', '4'),
(6, '106', '3'),
(7, '107', '4'),
(8, '108', '4'),
(9, '109', '3'),
(10, '110', '5'),
(11, '111', '3'),
(12, '112', '4'),
(13, '113', '2'),
(14, '114', '1'),
(15, '115', '1'),
(16, '116', '0');

SELECT c.CUST_GENDER, count(c.CUST_GENDER) as count
FROM CUSTOMER c
INNER JOIN
(
SELECT c.CUST_ID as customerId
FROM CUSTOMER c
INNER JOIN `ORDER` o ON o.CUST_ID=c.CUST_ID
where o.ord_amount>=3000
group by c.CUST_ID
) as v ON v.customerId=c.CUST_ID
group by c.cust_gender;

SELECT p.PROD_NAME, o.*
FROM `ORDER` o
INNER JOIN customer c ON c.CUST_ID=o.CUST_ID
INNER JOIN supplier_pricing sp ON sp.PRICING_ID=o.PRICING_ID
INNER JOIN PRODUCT p ON p.PROD_ID=sp.PROD_ID
where c.CUST_ID=2;

SELECT s.* ,v.totalProducts
FROM SUPPLIER s
INNER JOIN 
  (
  SELECT sp.SUP_ID, COUNT(sp.PROD_ID) as totalProducts 
  FROM SUPPLIER_PRICING sp
  GROUP BY SUP_ID
  ) as v ON v.SUP_ID=s.SUP_ID
  where v.totalProducts > 1;
  
  SELECT c.CAT_ID, c.CAT_NAME, min(min_price) as min_price FROM category c
  INNER JOIN(
  SELECT p.*, v.min_price
  FROM PRODUCT p
  INNER JOIN (
  SELECT sp.PROD_ID, MIN(sp.SUP_PRICE) as min_price
  FROM supplier_pricing sp
  GROUP BY sp.PROD_ID
   ) as v ON p.PROD_ID=v.PROD_ID
  ) as vv ON vv.CAT_ID=c.CAT_ID
	group by c.CAT_ID;
    
    SELECT
    a.ORD_ID AS order_id,
    p.PROD_ID AS product_id,
    p.PROD_NAME AS product_name
FROM
    `ORDER` AS a
INNER JOIN
    supplier_pricing AS sp ON a.PRICING_ID = sp.PRICING_ID
INNER JOIN
    product AS p ON p.PROD_ID = sp.PROD_ID
WHERE
    a.ORD_DATE > DATE("2021-10-05");

SELECT
    c.CUST_NAME AS Customer_Name,
    c.CUST_GENDER AS Gender
FROM
    customer AS c
WHERE
    c.CUST_NAME LIKE 'A%'
    OR c.CUST_NAME LIKE '%A';
    
    -- Stored Procedure
    
DELIMITER //

CREATE PROCEDURE `ECOMMERCESP` ()
BEGIN
    SELECT
        s1.SUP_ID AS ID,
        s1.SUP_NAME AS SupplierName,
        ROUND(AVG(s1.rating), 2) AS Rating,
        CASE
            WHEN AVG(s1.rating) = 5 THEN "Excellent Service"
            WHEN AVG(s1.rating) > 4 THEN "Good Service"
            WHEN AVG(s1.rating) > 2 THEN "Average Service"
            ELSE "Poor Service"
        END AS Type_of_Service
    FROM (
        SELECT
            s.SUP_ID,
            s.SUP_NAME,
            r.RAT_RATSTARS AS rating
        FROM `ORDER` AS o
        JOIN RATING AS r ON o.ORD_ID = r.ORD_ID
        JOIN SUPPLIER_PRICING AS sp ON sp.PRICING_ID = o.PRICING_ID
        JOIN SUPPLIER AS s ON s.SUP_ID = sp.SUP_ID
    ) AS s1
    GROUP BY s1.SUP_ID;
END //

DELIMITER ;

-- Call the stored procedure
CALL ECOMMERCESP();