/* 
create index index_name on table_name
(column1,coulmn2...);
 
 Drop index index_name
 on table_name;
 
 index gets automatically created for primary /unique key
 index columns that are used fot joins to improve join performance
 */
 
 use sql_store;
 select * from users;
 select * from users where age>20;
  select * from users where name='sakshi';
 create index userage on users(age); 
 
 show index from users;
 
 select * from customers;
  select * from customers where birth_date>'1990-01-01';
  create index custdob on customers(birth_date); 
 
 #to view indexes on each table
 show index from customers;