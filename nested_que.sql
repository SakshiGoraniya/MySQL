use company;
#creating tables 
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);
CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


#inserting data into tables
INSERT INTO employee VALUES(100, 'sakshi', 'goraniya', '2000-10-13', 'F', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');
INSERT INTO branch VALUES(2, 'HR', 100, '2006-02-09');
INSERT INTO branch VALUES(3, 'Finance', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;


INSERT INTO employee VALUES(101, 'khushi', 'pambhar', '2001-09-09', 'F', 110000, 100, 1);

INSERT INTO employee VALUES(102, 'inshiya', 'nalawala', '2000-11-02', 'F', 75000, 100, NULL);

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;


INSERT INTO employee VALUES(103, 'Ishi', 'Shah', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Piu', 'Manna', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Hasti', 'Bujad', '1958-02-19', 'F', 69000, 102, 2);

INSERT INTO employee VALUES(106, 'Rutanshi', 'Khambhatiya', '1969-09-05', 'F', 78000, 100, 3);
INSERT INTO employee VALUES(107, 'Dhruval', 'Mayavanshi', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Akshit', 'Modi', '1978-10-01', 'M', 71000, 106, 3);



INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

/*select*/
SELECT *
FROM employee;
SELECT *
FROM branch;


UPDATE branch
SET mgr_id = 102
WHERE branch_id = 2;

UPDATE branch
SET mgr_id = 106
WHERE branch_id = 3;


UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;


/*nested queries in this database*/
-- Find names of all employees who have sold over 50,000
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (SELECT works_with.emp_id
                          FROM works_with
                          WHERE works_with.total_sales > 50000);

-- Find all clients who are handles by the branch that isnhiya manages
SELECT client.client_name from client where client.branch_id in 
(Select branch.branch_id from branch where branch.mgr_id in
 (Select employee.emp_id from employee where employee.first_name='inshiya'));
 
 
 -- Find the names of all clients who have spent more than 100,000 dollars
 SELECT client.client_name
FROM client
WHERE client.client_id IN (
                          SELECT client_id
                          FROM (
                                SELECT SUM(works_with.total_sales) AS totals, client_id
                                FROM works_with
                                GROUP BY client_id) AS total_client_sales
                          WHERE totals > 100000);
                          
                          
 -- Find the names of employees who work with clients handled by the hr branch
 SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
                         SELECT works_with.emp_id
                         FROM works_with
                         )
AND employee.branch_id = 2;

