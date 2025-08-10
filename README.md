# HR-Analytics-SQL-Project
SQL project for HR data analysis using MySQL – includes database creation and analytical


##  Project Overview
This project demonstrates SQL skills using MySQL to analyze HR datasets.  
We created and managed two related tables: `employees` and `jobs`.  
The project includes data cleaning, table joins, aggregation, and analytical queries.

---

##  Dataset
- **employees**: Employee details (ID, Name, DOB, Gender, Marital Status, Citizenship)
- **jobs**: Job information (Role, Department, Salary, Manager, Hire Date)

---

##  Tools Used
- MySQL 8.0
- CSV datasets

---

##  Key SQL Operations
1. **Database & Table Creation**
2. **Data Import using `LOAD DATA INFILE`**
3. **Data Cleaning** (handling NULLs, date formats)
4. **Joins** between `employees` and `jobs`
5. **Aggregations** (COUNT, AVG, SUM)
6. **Filtering** with `WHERE` clauses
7. **Sorting** and **LIMIT** for top results

---

##  Example Queries
```sql

1. List all employees with their job roles and departments.
SELECT e.EmpID, e.Employee_name, j.job_role, j.Department
FROM employees e
JOIN jobs j ON e.EmpID = j.EmpID;


2. List all employees hired after 1st Jan 2015.
SELECT e.EmpID, e.Employee_name, j.DateofHire
FROM employees e
JOIN jobs j ON e.EmpID = j.EmpID
WHERE j.DateofHire > '2015-01-01';


3. Get the total number of employees in each department.
SELECT COUNT(EmpID) AS Total_Employees, Department
FROM jobs
GROUP BY Department;


4. Find the highest salary in the company.
SELECT MAX(Salary) AS Highest_Salary FROM jobs;


5. Find the average salary in each department.
SELECT AVG(Salary) AS Average_Salary, Department
FROM jobs
GROUP BY Department;


6. List employees working in the 'IT' department.
SELECT e.EmpID, e.Employee_name, j.Department
FROM employees e
JOIN jobs j ON e.EmpID = j.EmpID
WHERE j.Department = 'IT';

7. Count the number of employees under each manager.
SELECT ManagerName, COUNT(EmpID) AS Employees_Under_Manager
FROM jobs
GROUP BY ManagerName;


8. List employees with salary greater than 70000 along with their department names.
SELECT e.EmpID, e.Employee_name, j.Salary, j.Department
FROM employees e
JOIN jobs j ON e.EmpID = j.EmpID
WHERE j.Salary > 70000;


9. Find the earliest hired employee.
SELECT e.EmpID, e.Employee_name, j.DateofHire
FROM employees e
JOIN jobs j ON e.EmpID = j.EmpID
ORDER BY j.DateofHire ASC
LIMIT 1;


10. Get the total salary expense for each department.
SELECT Department, SUM(Salary) AS Total_Salary_Expense
FROM jobs
GROUP BY Department;


11. List the top 10 highest paid employees along with their job roles and departments.
SELECT e.EmpID, e.Employee_name, j.job_role, j.Department, j.Salary
FROM employees e
JOIN jobs j ON e.EmpID = j.EmpID
ORDER BY j.Salary DESC
LIMIT 10;


12. Find the department with the highest total salary expense.
SELECT Department, SUM(Salary) AS Total_Salary_Expense
FROM jobs
GROUP BY Department
ORDER BY Total_Salary_Expense DESC
LIMIT 1;


13. List employees whose marital status is Single.
select * from employees where Marital_Status = 'Single';


14.  Show employees born after 1 Jan 1985.
select * from employees where DOB > '1985-01-01';


15.  Sort employees by Employee_name in ascending order.
select * from employees order by Employee_name;


16.  Retrieve employees who are Married and are Female.
select * from employees where Marital_Status = 'Married' and Gender = 'Female';


17.  Display employees whose DOB is between 1980-01-01 and 1990-12-31.
select * from employees where DOB between '1980-01-01' and '1990-12-31';


 ## "Added Task 4 HR Analytics SQL project with queries and results"`


