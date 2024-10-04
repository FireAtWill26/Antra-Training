use Northwind
go

--Problem 1
select distinct city
from Employees
where city in (
	select City
	from Customers
)

--Problem 2 a
select distinct city
from Customers
where city not in (
	select City
	from Employees
)

--Problem 2 b
select distinct city
from Customers
except
select distinct city
from Employees

--Problem 3
select p.ProductID, p.ProductName, sum(od.Quantity) as TotalQuantity
from Products p join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductID, p.ProductName

--Problem 4 Distinct product
select c.City, count(distinct od.ProductID) as TotalQuantityOrdered
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
group by c.City
order by c.City

--Problem 4 Total quantity of products ordered
select c.City, sum(od.Quantity) as TotalQuantityOrdered
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
group by c.City
order by c.City

--Problem 5
select c.City, count(distinct c.CustomerID) as NumOfCustomers
from Customers c
group by c.City
having count(distinct c.CustomerID) >= 2

--Problem 6
select c.City, count(distinct od.ProductID) as KindOfProducts
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
group by c.City
having count(distinct od.ProductID) >= 2

--Problem 7
select distinct c.CustomerID, c.ContactName
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
where c.City != o.ShipCity

--Problem 8
select top 5 od.ProductID, sum(od.UnitPrice * od.Quantity)/sum(od.Quantity) as AvgPrice, sum(od.Quantity) as TotalQuantity, (
	select top 1 c1.City
	from Customers c1 join Orders o1 on c1.CustomerID = o1.CustomerID join [Order Details] od1 on o1.OrderID = od1.OrderID
	where od1.ProductID = od.ProductID
	group by c1.City
	order by sum(od1.Quantity) desc
	) as CitySellMost
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
group by od.ProductID
order by sum(od.Quantity) desc

--select od.ProductID, c.city, sum(od.Quantity)
--from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
--group by od.ProductID, c.City
--order by od.ProductID, sum(od.Quantity) desc

--Problem 9 a
select distinct e.City
from Employees e
where e.City not in (
	select distinct c.City
	from Customers c join Orders o on c.CustomerID = o.CustomerID
)

--Problem 9 b
select distinct City
from Employees
except
select distinct City
from Customers c join Orders o on c.CustomerID = o.CustomerID

--Problem 10
select ec.City
from (
	select top 1 e.EmployeeID, e.City, count(distinct o.OrderID) as OrderSold
	from Employees e join Orders o on e.EmployeeID = o.EmployeeID
	group by e.EmployeeID, e.City
	order by count(distinct o.OrderID) desc
) ec join (
	select top 1 c.City, sum(od.Quantity) as QuantitySold
	from Customers c join Orders o1 on c.CustomerID = o1.CustomerID join [Order Details] od on o1.OrderID = od.OrderID
	group by c.City
	order by sum(od.Quantity) desc
) sc on ec.City = sc.City

--Problem 11
--We can use local temp table to delete the replicate rows.
--Let's say we want to remove duplicates records from the table TABLE, we can do the following
select distinct *
from TABLE
into #LocTemp

delete from TABLE

insert into TABLE
select *
from #LocTemp