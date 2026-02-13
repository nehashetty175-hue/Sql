CREATE DATABASE company_db;
CREATE TABLE employees(
     emp_id INT,
     emp_name VARCHAR(50),
     emp_email VARCHAR(100),
     emp_phone VARCHAR(20),
     emp_gender VARCHAR(10),
     hire_date DATE,
     emp_salary DECIMAL(10.2),
     emp_department VARCHAR(30)
);
CREATE TABLE departments(
     department_id INT,
     department_name VARCHAR(50),
     department_location VARCHAR(50)
);
CREATE TABLE projects(
     project_id INT,
     project_name VARCHAR(50),
     start_date DATE,
     end_date DATE,
     budget DECIMAL(12,2)
);
ALTER TABLE employees ADD emp_status VARCHAR(20); 
ALTER TABLE employees MODIFY emp_department VARCHAR(50);
ALTER TABLE projects RENAME COLUMN budget TO project_budget ;

CREATE TABLE temp_employees(id INT);
TRUNCATE TABLE temp_employees;
DROP TABLE temp_employees;

INSERT INTO employees VALUES(01,'Anjali Pujari','anjalipujari176@gmail.com',9890940034,'Female','2021-01-01',90000,'Hr','Active');
INSERT INTO employees VALUES(02,'Shubhangi Santosh Arote','shubhangi04@gmail.com',7385592404,'Female','2023-03-10',60000,'Accounting','Inactive');
INSERT INTO employees VALUES(03,'Manish Chirag Patil','manish1234@gmail.com',7836293710,'Male','2019-08-23',30000,'Testing','Active');
INSERT INTO employees VALUES(04,'Abhishek Dattaray More','abhishek09@gmail.com',8208707499,'Male','2020-07-09',40000,'Assistant','Active');
INSERT INTO employees VALUES(05,'Vaishnavi Bandu Darwatkar','vaishnavi@gmail.com',9786375830,'Female','2022-05-01',100000,'Developer','Inactive');
INSERT INTO employees VALUES(06,'Prajwal Anil Vinchurkar','prajwal143@gmail.com',9826729712,'Male','2025-04-03',20000,'Marketing','Active');



INSERT INTO departments (department_id,department_name,department_location) VALUES
     (01,'IT','Remote'),
     (102,'Developer','Hybrid'),
     (103,'Engineer','Remote'),
     (104,'Assistant','Hybrid');

INSERT INTO projects VALUES(101,'Website Design','2024-04-23','2022-07-05',45000);
INSERT INTO projects VALUES(102,'App Development','2022-04-20','2017-06-30',60000);
INSERT INTO projects VALUES(103,'Password Generator','2023-08-18','2024-09-01',75000);
INSERT INTO projects VALUES(104,'Simple Calculator','2026-01-02','2025-12-01',89000);
INSERT INTO projects VALUES(105,'Stock Market Predicter','2025-10-23','2024-05-20',56000);

UPDATE employees 
SET emp_status = 'Active';

UPDATE employees 
SET emp_salary=10000
WHERE emp_salary<=20000;

DELETE FROM employees
WHERE emp_id=101;

DELETE FROM projects;

SELECT *FROM employees;
SELECT * FROM departments;

SELECT emp_id,emp_email,emp_salary FROM employees;
SELECT department_name, department_location FROM departments;

SELECT * FROM employees WHERE emp_gender='Female';
SELECT * FROM employees WHERE emp_salary>50000;
SELECT * FROM employees WHERE hire_date>'2021-01-01';
SELECT * FROM employees WHERE emp_department= 'IT' and emp_status='Active';
SELECT * FROM projects WHERE project_budget >100000 and end_date > 2024-12-31;
UPDATE employees SET emp_status='Unactive' WHERE emp_salary<30000;
DELETE FROM departments WHERE department_location='Remote';