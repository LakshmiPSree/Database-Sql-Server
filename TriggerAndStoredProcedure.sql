Create Database Us;
Use Us;
create table Employee(
	EmpID Int identity(1,1) Primary Key,
	EmpName varchar(50),
	Age int);

Insert into Employee Values('Viji',21),('Ambruta',20);

create Procedure UserExistOrNot
@EmpName Varchar(50)
As
Begin
	if EXISTS(select 1 from Employee where EmpName=@EmpName)
	Begin
		Print 'User Exist'
	End
	Else
	Begin
		Print 'User Does not Exist'
	End
End;

Exec UserExistOrNot @EmpName ='Viji';
Exec UserExistOrNot @EmpName ='lakshmi';

create Procedure UsersUpdateData
@EmpName Varchar(50),
@NewEmpName Varchar(50)
As
Begin
	if EXISTS(select 1 from Employee where EmpName=@EmpName)
	Begin
		Print 'User Exist';
		Update Employee Set EmpName= @NewEmpName Where EmpName = @EmpName;
	End
	Else
	Begin
		Print 'User Does not Exist';
	End
End;

Exec UsersUpdateData @EmpName='Viji',@NewEmpName='Pranita';

Select * from Employee;
-------------------------------------------------------------------------------------------

Create Trigger AfterInsert
On Employee 
After Insert
As
Begin
	Print 'New Employee Inserted';
	Select * from inserted;
End

Insert Into Employee values('Priya',21);

Create Trigger AfterUpdate
On Employee 
After Update
As
Begin
	Print 'Updated Employee';
	Select * from inserted;
End

Update Employee Set EmpName='Ayesha' Where EmpName='Lakshmi';

Create Trigger AfterDelete
On Employee 
After Delete
As
Begin
	Print 'Employee Deleted';
	Select * from deleted;
End

Delete Employee Where EmpName='Ayesha';