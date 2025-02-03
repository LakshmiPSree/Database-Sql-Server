create database practice;
USE practice;
create table details(user_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
					user_name VARCHAR(50) NOT NULL,
					user_age INT NOT NULL)

Select * FROM Employee;

select TOP 3 Name,Salary FROM Employee Where Name LIKE '%E' ORDER BY Salary;

SELECT Name
FROM Employee
ORDER BY Name;

SELECT TOP 5 Name,Salary FROM Employee ORDER BY Salary DESC;

SELECT Name FROM Employee WHERE Name LIKE 'A%';

SELECT * FROM Employee 
ORDER BY EmployeeId
OFFSET 2 ROWS;