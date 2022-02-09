-- Stored Procedures:

-- Without parameters:

USE `sql_store`;
DROP procedure IF EXISTS `show_customer_phone`;

DELIMITER $$
USE `sql_store`$$
CREATE PROCEDURE `show_customer_phone` ()
BEGIN
SELECT phone FROM customers;
END$$

DELIMITER ;

-- With parameters:

USE `sql_store`;
DROP procedure IF EXISTS `show_customer_phone`;

USE `sql_store`;
DROP procedure IF EXISTS `sql_store`.`show_customer_phone`;
;

DELIMITER $$
USE `sql_store`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_customer_phone`(
st varchar(60),pt int
)
BEGIN
SELECT first_name FROM customers 
WHERE state= 'st' AND points > pt;
END$$

DELIMITER ;



-- call show_customer_phone;
/*stored procedure call to find customer with points parameter*/
call show_customer_phone(1000);
/*stored procedure call to insert data with parameter*/
call insert_data (11,'sakshi','goraniya','2000-03-28','781-932-9754','indraprasth','gujarat','IN',2270);
call insert_data (13,'parita','goraniya','1997-03-28','701-932-9754','indraprasth','gujarat','IN',2970);
call insert_data (12,'khushi','pambhr','2000-04-28','781-932-9794','indrap','gujarat','IN',2770);
call insert_data (14,'divu','jadeja','1997-03-28','1995-08-13','ksd','gujarat','IN',9770);

call insert_data (15,'divu','jadeja','ksd','gujarat','IN',9770);
