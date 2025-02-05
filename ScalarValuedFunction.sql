--Scalar valued Function

Create Function CalculatePriceWithTax
(
@Price decimal(10,2),
@Tax decimal(5,2)
)
returns decimal(10,2)
as 
begin
return @Price+(@Price*@Tax/100)
end;

--this user degined functions are stored in Programmability->functions
---execution
Select dbo.CalculatePriceWithTax(100.12,0.8);

select ProductName,Price,dbo.CalculatePriceWithTax(Price,0.8) as PriceWithTax from Products;