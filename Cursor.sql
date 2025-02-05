--Declare a cursor to iterate through all employees and print their names.
Declare @EmpName Varchar(50);

Declare EmpCursor Cursor for
Select EmpName from Employees;

open EmpCursor;
Fetch next from EmpCursor into @EmpName;
while @@FETCH_STATUS=0
begin 
print @EmpName;
Fetch next from EmpCursor into @EmpName;
End;

Close EmpCursor;
Deallocate EmpCursor;

--This example retrieves both EmployeeID and Salary and updates salary for each employee by 10 percent.

Declare @EmpID int,@Salary decimal(10,2);
Declare EmpUpdate Cursor for
Select EmployeeID,Salary from Employees;
Open EmpUpdate;
Fetch next from EmpUpdate into @EmpID,@Salary;
while @@FETCH_STATUS =0
begin
DECLARE @OldSalary DECIMAL(10,2);
    SET @OldSalary = @Salary;
Update Employees Set Salary = Salary * 0.10 where EmployeeID=@EmpID;
SELECT @Salary = Salary FROM Employees WHERE EmployeeID = @EmpID;

    -- Now print both old and new salary
    PRINT 'EmployeeID: ' + CAST(@EmpID AS NVARCHAR(10)) + 
          ' | Old Salary: ' + CAST(@OldSalary AS NVARCHAR(20)) + 
          ' | New Salary: ' + CAST(@Salary AS NVARCHAR(20));
Fetch next from EmpUpdate into @EmpID,@Salary;
end;

Close EmpUpdate;
Deallocate EmpUpdate;
