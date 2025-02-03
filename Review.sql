Create database Review ;
use Review;
--Basic Employee Management
--Create an Employees table with columns: EmployeeID, Name, Age, Department, and Salary.
create table Employees(
	EmployeeID int primary key,
	EmpName Varchar(50),
	Age int,
	Department Varchar(50),
	Salary Decimal(10,2)
);

--1.Write queries to:
--Insert 5 sample employee records.
Insert into Employees values(1,'Lakshmi',21,'cse',40000),
							(2,'Ambruta',27,'sap',30000),
							(3,'Viji',35,'ecs',20000),
							(4,'Ayesha',29,'ca',28000),
							(5,'John Doe',21,'ecs',50000);

Insert into Employees values(6,'Absc',21,'cse',60000),
							(7,'Amrita',27,'sap',80000),
							(8,'Vijay',35,'ecs',70000);
--Update the salary of an employee with EmployeeID = 3.
Update Employees Set Salary='30000' Where EmployeeID = 3; 
--Delete an employee whose Name = 'John Doe'.
Delete Employees where EmpName='John Doe';
--Retrieve all employee records.
Select * from Employees;
-----------------------------------------------------------------------------------
--2.Student Management System
--Create a Students table with columns: StudentID, Name, Class, DOB, and Grade.
Create table Students(
	StudentId int Primary Key,
	StuName Varchar(50),
	Class Varchar(5),
	DOB Date,
	Grade Char);
--Insert records for 10 students.
Insert into Students Values(1,'Pranita','12th','2003-01-23','A'),
							(2,'Akansha','10th','2003-01-23','b'),
							(3,'Amin','11th','2003-01-23','c'),
							(4,'Priya','9th','2003-01-23','A'),
							(5,'Lakshmi','10th','2003-01-23','c'),
							(6,'Ayesha','10th','2003-01-23','A'),
							(7,'viji','8th','2003-01-23','d'),
							(8,'Pranali','12th','2003-01-23','A'),
							(9,'Priyanka','12th','2003-01-23','c'),
							(10,'Pratik','6th','2003-01-23','A');
--Update the Grade of a student with StudentID = 5.
Update Students Set Grade ='A' where StudentId=5;
--Delete all students who belong to Class = '10th'.
Delete Students where Class='10th';
Select * from Students;
-----------------------------------------------------------------------------
--3.Create a Products table with columns: ProductID, ProductName, Price, Stock.
create table Products(
	ProductID int Primary key, 
	ProductName Varchar(50), 
	Price Decimal(10,2), 
	Stock int);
--Insert 7 sample products into the table.
Insert into Products Values (1,'Watch',2000,50),
							(2,'Smart Phone',20000,15),
							(3,'Ear Phone',500,13),
							(4,'Headset',2000,2),
							(5,'Smart Watch',6000,10),
							(6,'Tv',200000,3),
							(7,'Laptop',200000,4);
--Increase the price of all products by 10%.
Update Products Set Price=Price*1.10;
--Delete products where the stock is below 5.
Delete Products Where Stock <5;
select * from Products;
---------------------------------------------------------------------
--4)Create a Users table with columns: UserID, Username, Email, and Password.
--Apply constraints:
--Make UserID the primary key.
--Ensure Email is unique.
--Ensure Password has a minimum length of 8 characters.
--Write SQL queries to test these constraints by inserting and updating data.
------------------------------------------------------------------------------
--9)Create an Employees table with columns: EmployeeID, Name, Age, and Salary.
--Write queries to:
--Retrieve all employees with a salary greater than 50,000.
Select * from Employees where Salary > 50000;
--Retrieve all employees whose names start with the letter ‘A’.
Select * from Employees where EmpName Like 'A%';
--Retrieve employees aged between 25 and 35.
Select * from Employees where Age Between 25 and 35;
---------------------------------------------------------------------------------
--10)Create a Sales table with columns: SaleID, ProductID, Quantity, and SaleDate.
create Table Sales (
    SaleID int Primary key,  
    ProductID int,           
    Quantity int,            
    SaleDate date            
);
insert into Sales (SaleID, ProductID, Quantity, SaleDate) Values
											(1, 101, 500, '2025-01-01'),
											(2, 102, 3, '2025-01-02'),
											(3, 103, 100, '2025-01-03'),
											(4, 101, 7, '2025-01-04'),
											(5, 105, 2, '2025-01-05'),
											(6, 102, 400, '2025-01-06'),
											(7, 107, 60, '2025-01-07'),
											(8, 103, 8, '2025-01-08'),
											(9, 105, 151, '2025-01-09'),
											(10, 110, 12, '2025-01-10'
);
--Write queries to:
--Group sales by ProductID and calculate total quantity sold for each product.
Select ProductID,Sum(Quantity) As TotalQuantitySold from Sales Group By ProductID;
--Filter out products with total sales less than 50 using the HAVING clause.
Select ProductID,Sum(Quantity) As TotalQuantitySold from Sales Group By ProductID Having Sum(Quantity) < 50;
--11)Create an Orders table with columns: OrderID, CustomerID, OrderAmount, OrderDate.
create table orders (
    orderid int primary key,      
    customerid int,                
    orderamount decimal(10, 2),    
    orderdate date                 
);
insert into orders (orderid, customerid, orderamount, orderdate) values
(1, 101, 150.75, '2025-01-01'),
(2, 102, 200.50, '2025-01-02'),
(3, 103, 350.30, '2025-01-03'),
(4, 104, 120.00, '2025-01-04'),
(5, 105, 75.80, '2025-01-05'),
(6, 106, 500.00, '2025-01-06'),
(7, 107, 250.60, '2025-01-07'),
(8, 108, 300.40, '2025-01-08'),
(9, 109, 180.90, '2025-01-09'),
(10, 110, 450.25, '2025-01-10');

--Retrieve all orders sorted by OrderAmount in descending order.
--Retrieve the top 5 most recent orders.

