use sql_store;

select client.client_name from client where branch_id in
(select branch.branch_id from branch where branch_name='HR');

CREATE VIEW HR_Customers AS
select client.client_name from client where branch_id in
(select branch.branch_id from branch where branch_name='HR');

select * from HR_Customers;


