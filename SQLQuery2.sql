create database db;
use db;
create table Department(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(50) not null);

create table Employees(
	EmployeeID INT PRIMARY KEY,
	EmpName VARCHAR(50) not null,
	DepartmentID int FOREIGN KEY REFERENCES Department(DepartmentID),
	Salary Decimal(10,2),
	JoinDate Date,
	Age int);

create table Projects(
	ProjectID INT PRIMARY KEY ,
	ProjectName VARCHAR(50) not null,
	EmployeeID int FOREIGN KEY REFERENCES Employees(EmployeeID),
	HoursWorked int);

Insert into Department Values('1','IT'),('2','HR'),('3','Finance'),('4','COMP'),('5','CA');
Insert into Employees Values('1','Pranay','4','20000','2025-01-28','22'),
							('2','Vijay','3','50000','2023-04-25','26'),
							('3','Amit','2','30000','2026-08-13','24'),
							('4','Amin','5','10000','2022-06-17','24'),
							('5','Mahin','1','9000','2035-02-27','35');
Insert into Projects Values('1','.net','1','7'),('2','C','2','8'),('3','C++','3','5'),('4','Java','4','9'),('5','Python','5','7');

Select * from Department;
select * from Employees;
select * from Projects;

select
Employees.EmpName As EmployeeName,Department.DepartmentName
From Employees
INNER JOIN Department
ON Employees.DepartmentID = Department.DepartmentID;

select
Projects.ProjectName,Employees.EmpName As EmployeeName,Department.DepartmentName
From Projects
INNER JOIN Employees
ON Projects.EmployeeID = Employees.EmployeeID
INNER JOIN Department
ON Employees.DepartmentID = Department.DepartmentID;

