--Table Valued Function

create function TopMostPriceProduct
(	@MinPrice decimal(10,2))
returns table
as
return 
(select ProductID,ProductName,Price from Products where Price>@MinPrice)

--execution
select * from TopMostPriceProduct(7000);