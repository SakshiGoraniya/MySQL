USE sql_store;

create table users (id int,age int,name varchar(30));

/*insert*/
INSERT INTO customers(first_name, phone, points)
VALUES
 ('sakshi', NULL, DEFAULT),
 ('divu', '1234', 10);
/*select statement*/

INSERT INTO `customers` VALUES (11,'divu','jadeja','1995-03-28','781-992-9754','prasth','gujarat','IN',2200);
 INSERT INTO `customers` VALUES (15,'divu','jadeja','ksd','gujarat','IN',9770);
INSERT INTO `customers` VALUES (1,'sakshi','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','MA',2273);
INSERT INTO `customers` VALUES  (13,'divu','jadeja','1995-08-13','ksd','gujarat','IN',9770);
  
  
  SELECT * FROM sql_store.customers ;
-- WHERE customer_id=1;
-- ORDER BY first_name;

SELECT 
	first_name,
    last_name,
    points,
    (points+10 )*100 as 'disount_factor'
    FROM customers;

SELECT distinct state FROM customers;

/* exercise*/
SELECT 
	name,
	unit_price,
    unit_price*1.1 as 'new_price'
    FROM products;
    
/*Logical Operators */ 
SELECT *
FROM customers
WHERE birth_date > '1900-01-01' AND points > 1000 ;

SELECT *
FROM customers
WHERE birth_date > '1990-01-01' OR points > 1000 ;

SELECT *
FROM customers
WHERE NOT (birth_date > '1990-01-01');   

#alter table
ALTER TABLE users
ADD Email varchar(255);

#alter row

UPDATE customers set points=1000 where customer_id=1;
select * from customers;

UPDATE users set Email='sakshi@gmail.com' where id=1;
select * from users;








/*IN */
-- To find customers in any of these states: VA, NY, CA
SELECT *
FROM customers
WHERE state IN ('VA', 'NY', 'CA');

/*BETWEEN Operator*/
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 2000;


/*LIKE Operator*/
-- to find  customers whose first name starts with b 

SELECT *
FROM customers
WHERE first_name LIKE 'b%';

/*REGEXP Operator*/
-- to find customers whose first name starts with a 
SELECT *
FROM customers
WHERE first_name REGEXP 'a$';

SELECT *
FROM customers
WHERE first_name REGEXP '^a';

-- to find customers whose first name starts with BA
-- or contains SE
SELECT * FROM customers WHERE first_name REGEXP '^ba|se';

-- to find customers whose first name contains B followed by
-- R or U
SELECT * FROM customers WHERE first_name REGEXP 'b[ru]';

-- to find customers whose first name ends with KA or ER 
SELECT * FROM customers WHERE first_name REGEXP 'ka$|er$';


/*IS NULL OPERATOR*/
-- to find customer who have no phone number
SELECT *
FROM customers
WHERE phone IS NULL;

/*ORDER BY*/
 -- to Sort customers by state (in ascending order), and then
-- by their first name (in descending order) 
SELECT *
FROM customers
ORDER BY state, first_name DESC;

/*LIMIT*/
-- Return only 3 customers 
SELECT *
FROM customers
LIMIT 4;



-- to Skip 6 customers and return 4
SELECT *
FROM customers
LIMIT 6, 4;

/*JOINS*/

/*INNER JOIN*/
SELECT *
FROM customers c
JOIN orders o
 ON c.customer_id = o.customer_id;
 
 
 /*Outer Join*/
-- to find all customers whether they have any orders or not

SELECT *
FROM customers c
LEFT JOIN orders o
 ON c.customer_id = o.customer_id;
 
 /*USING Clause (when same column name is there in both tables)*/
 SELECT *
FROM customers c
JOIN orders o
 USING (customer_id) ;
 
/*cross join*/
SELECT *
FROM customers
CROSS JOIN orders;


/*Unions*/
 --  to Combine records from multiple result sets

 
SELECT name, address
FROM customers
UNION
SELECT name
FROM shippers ;

SELECT first_name FROM customers 
WHERE state= 'VA'AND points > 900;
