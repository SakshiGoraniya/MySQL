

/*sql triggers*/
DROP TRIGGER IF EXISTS `sql_store`.`users_BEFORE_INSERT`;

DELIMITER $$
USE `sql_store`$$
CREATE DEFINER = CURRENT_USER TRIGGER `sql_store`.`users_BEFORE_INSERT` BEFORE INSERT ON `users` FOR EACH ROW
BEGIN
if new.age<0 then set new.age=0;
end if;
END$$

 insert into users values(1,-4,'sakshi');
  select * from users;
