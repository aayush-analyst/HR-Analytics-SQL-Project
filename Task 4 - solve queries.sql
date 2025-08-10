
-- Created a database for further use 
CREATE DATABASE hr_analytics;
use hr_analytics;
 
-- Created a table Employees  
CREATE TABLE employees(
Empid INT PRIMARY KEY,
Employee_name varchar(50) NOT NULL,
DOB DATE,
Gender varchar(10),
Martial_Status varchar(20),
Citizendesc varchar(25)
); 

-- Inserted some values in Employees table Manually
Insert INTO employees(Empid,Employee_name,DOB,Gender,Martial_Status,Citizendesc)
values(101,'Venkateh Kshirsagar','2002-09-19','Male', 'Unmarried', 'Eligible'),
(102,'Aayush Pardeshi','2002-10-07','Male', 'Unmarried', 'Eligible');


SHOW VARIABLES LIKE 'secure_file_priv';


-- Imported values from 'employees_data.csv'
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/employees_data.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Empid, Employee_name, DOB, Gender, Martial_Status, Citizendesc);

-- Shows all employees table values   
select * from employees;


-- Shows only first 10 rows of employees table. 
select * from employees Limit 10;


-- Deleted Manually Entered Values of Employees Table
delete from employees 
where Empid = 101;
select * from employees;

delete from employees 
where Empid = 102;
select * from employees;

-- Display only Employee_name and DOB of all employees.
select Employee_name,DOB from employees;

-- Find all employees whose gender is Male.
select * from employees where Gender = 'Male';

-- Renamed the column name of Employees table
alter table employees
rename column Martial_Status to Marital_Status;
desc employees;

-- List employees whose marital status is Single.
select * from employees where Marital_Status = 'Single';


-- Show employees born after 1 Jan 1985.
select * from employees where DOB > '1985-01-01';

-- Sort employees by Employee_name in ascending order.
select * from employees order by Employee_name;


-- Retrieve employees who are Married and are Female.
select * from employees where Marital_Status = 'Married' and Gender = 'Female';

-- Display employees whose DOB is between 1980-01-01 and 1990-12-31.
select * from employees where DOB between '1980-01-01' and '1990-12-31';

-- Created a table Jobs 
drop table jobs;
CREATE TABLE jobs(
Empid INT ,
job_role varchar(50) NOT NULL,
DeptID INT ,
Department varchar(30),
Salary numeric(10,2),
ManagerName varchar(50) NOT NULL,
DateofHire Date,
FOREIGN KEY (Empid) REFERENCES employees(Empid)
); 

describe jobs;

-- Imported values from 'jobs_data.csv'
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/jobs_data.csv'
INTO TABLE jobs
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Empid, job_role, DeptID, Department, Salary, ManagerName, @DateofHire)
SET DateofHire = REPLACE(TRIM(@DateofHire), '\r', '');

-- Shows Complted Table jobs
select * from jobs;

-- List all employees with their job roles and departments.
select e.Empid,e.Employee_name,j.job_role,j.department from employees e join jobs j ON e.Empid = j.Empid;

-- Find all employees hired after 2015-01-01.
select e.Empid,e.Employee_name,j.DateofHire from employees e join jobs j ON e.Empid = j.Empid where j.DateofHire > '2015-01-01';

-- Get the total number of employees in each department.
select count(Empid) AS Total_Employees,department from jobs Group by Department;


--  Show all female employees working in the ‘IT’ department.
select e.Empid, e.Employee_name, e.Gender,j.department from employees e join jobs j where e.Gender = 'Female' and j.Department LIKE 'IT%';

--  Find the average salary in each department.
select avg(salary) AS Average_Salary,department from jobs Group by department;


-- Get the highest and lowest salary for each department.
select department,MAX(Salary) as Maximum_Salary,MIN(Salary) as Minimum_Salary from jobs group by department;


-- List employees with salary greater than 70000 along with their department names.
select e.Empid, e.Employee_name, j.Salary,j.department from employees e join jobs j ON e.Empid = j.Empid where j.Salary > 70000;


-- Find employees whose marital status is ‘Single’ and who earn more than 50000.
select e.Empid, e.Employee_name,e.Marital_status,j.Salary from employees e join jobs j ON e.Empid = j.Empid where e.Marital_Status='Single' and j.Salary > 50000;


-- List the top 10 highest paid employees along with their job roles and departments.
SELECT e.Empid, e.Employee_name, j.job_role, j.Department, j.Salary
FROM employees e JOIN jobs j ON e.Empid = j.Empid
ORDER BY j.Salary DESC LIMIT 10;


-- Find the department with the highest total salary expense.
SELECT Department, SUM(Salary) AS Total_Salary_Expense FROM jobs
GROUP BY Department ORDER BY Total_Salary_Expense DESC LIMIT 1;

