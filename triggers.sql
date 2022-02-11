USE sql_store;


/*sql triggers*/

#before insert trigger
DROP TRIGGER IF EXISTS `sql_store`.`users_BEFORE_INSERT`;

DELIMITER $$
USE `sql_store`$$
CREATE DEFINER = CURRENT_USER TRIGGER `sql_store`.`users_BEFORE_INSERT` BEFORE INSERT ON `users` FOR EACH ROW
BEGIN
if new.age<0 then set new.age=0;
end if;
END$$

 insert into users values(3,-4,'sakshiii');
  select * from users;
  select * from message;
  
  
  #after insert trigger
  
  create table message
  (
  id int auto_increment,
  messageid int,
  message varchar(300),primary key(id,messageid)
  );
  
  
  
  delimeter //
  create trigger
  check_null_dobb
  after insert
  on users
  for each row
  begin
  if new.Email is null 
  then
  INSERT INTO message(messageId,message)
  values (new.id,concat('Hi',new.name,'please update your email ontp te profile'));
  end if;
  end//
  delimeter;
  
  insert into users(id,age,name,Email)
  values (2,19,'kkk',NULL);
  
  
  
  
  --Triggers for company
  USE company;
  
  CREATE TABLE trigger_test (
     message VARCHAR(100)
);

DROP TRIGGER IF EXISTS `company`.`employee_AFTER_INSERT`;

DELIMITER $$
USE `company`$$
CREATE DEFINER = CURRENT_USER TRIGGER `company`.`employee_AFTER_INSERT` AFTER INSERT ON `employee` FOR EACH ROW
BEGIN
INSERT INTO trigger_test VALUES('added new employee');
END$$
DELIMITER ;

  
INSERT INTO employee
VALUES(109, 'sweety', 'patel', '1998-02-19', 'F', 69000, 106, 3);
  
  
 