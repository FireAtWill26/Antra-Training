use AdventureWorks2019
go

--select *
--from Production.ProductInventory

--Problem 1
select count(p.ProductID) as CountOfProduct
from Production.Product p

--Problem 2
select count(p.ProductID) as CountOfProductInSubcategory
from Production.Product p
where p.ProductSubcategoryID is not null

--Problem 3
select p.ProductSubcategoryID, count(p.ProductID) as CountOfProduct
from Production.Product p
group by p.ProductSubcategoryID
having p.ProductSubcategoryID is not null

--Problem 4
select count(p.ProductID) as CountOfProductNotInSubcategory
from Production.Product p
where p.ProductSubcategoryID is null

--Problem 5
select pi.ProductID, sum(pi.Quantity) as TotalQuantity
from Production.ProductInventory pi
group by pi.ProductID

--Problem 6
select pi.ProductID, sum(pi.Quantity) as TheSum
from Production.ProductInventory pi
where pi.LocationID = 40
group by pi.ProductID
having sum(pi.Quantity) < 100

--Problem 7
select pi.Shelf ,pi.ProductID, sum(pi.Quantity) as TheSum
from Production.ProductInventory pi
where pi.LocationID = 40
group by pi.Shelf ,pi.ProductID
having sum(pi.Quantity) < 100

--Problem 8
select avg(pi.Quantity) as AvgQuantity
from Production.ProductInventory pi
where pi.LocationID = 10

--Problem 9
select pi.ProductID, pi.Shelf, avg(pi.Quantity) as TheAvg
from Production.ProductInventory pi
group by pi.ProductID, pi.Shelf

--Problem 10
select pi.ProductID, pi.Shelf, avg(pi.Quantity) as TheAvg
from Production.ProductInventory pi
group by pi.ProductID, pi.Shelf
having pi.Shelf != 'N/A'

--Problem 11
select p.Color, p.Class, count(p.ProductID) as TheCount, avg(p.ListPrice) as AvgPrice
from Production.Product p
group by p.Color, p.Class
having p.Color is not null and p.Class is not null

--Problem 12
select cr.[Name] as Country, sp.[Name] as Province
from Person.CountryRegion cr join Person.StateProvince sp on cr.CountryRegionCode = sp.CountryRegionCode
order by Country, Province

--Problem 13
select cr.[Name] as Country, sp.[Name] as Province
from Person.CountryRegion cr join Person.StateProvince sp on cr.CountryRegionCode = sp.CountryRegionCode
where cr.[Name] in ('Germany', 'Canada')
order by Country, Province

use Northwind
go

--Problem 14
select distinct p.ProductID, p.ProductName
from Products p join [Order Details] od on p.ProductID = od.ProductID join Orders o on od.OrderId = o.OrderID
where year(o.OrderDate) > year(getdate())-27

--Problem 15
select dt.ProductID, dt.ShipPostalCode, dt.QuantitySold
from (select od.ProductID, o.ShipPostalCode, sum(od.Quantity) as QuantitySold, row_number() over (partition by od.ProductID order by sum(od.Quantity) desc) as rank
from Orders o join [Order Details] od on o.OrderID = od.OrderID
group by od.ProductID, o.ShipPostalCode
having o.ShipPostalCode is not null) dt
where rank <= 5

--Problem 16
select dt.ProductID, dt.ShipPostalCode, dt.QuantitySold
from (select od.ProductID, o.ShipPostalCode, sum(od.Quantity) as QuantitySold, row_number() over (partition by od.ProductID order by sum(od.Quantity) desc) as rank
from Orders o join [Order Details] od on o.OrderID = od.OrderID
where year(o.OrderDate) > year(getdate())-27
group by od.ProductID, o.ShipPostalCode
having o.ShipPostalCode is not null) dt
where rank <= 5

--Problem 17
Select City, count(CustomerID) as NumOfCustomers
from Customers
group by City

--Problem 18
Select City, count(CustomerID) as NumOfCustomers
from Customers
group by City
having count(CustomerID) > 2

--Problem 19
Select Count(distinct c.CustomerID) as NumOfCustomers
from Customers c join Orders o on c.CustomerID = o.CustomerID
where o.Orderdate > '1998-01-01'

--Problem 20
Select c.CustomerID, c.ContactName, max(o.Orderdate) as MostRecentDate
from Customers c join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID, c.ContactName

--Problem 21
Select c.CustomerID, c.ContactName, sum(od.Quantity) as NumberOfProductBought
from Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on od.OrderID = o.OrderID
group by c.CustomerID, c.ContactName
order by c.CustomerID

--Problem 22
Select o.CustomerID, sum(od.Quantity) as NumberOfProductBought
from Orders o join [Order Details] od on od.OrderID = o.OrderID
group by o.CustomerID
having sum(od.Quantity) > 100
order by o.CustomerID

--Problem 23
select distinct s.CompanyName as [Supplier Company Name], o.ShipName as [Shipping Company Name]
from Suppliers s join Products p on s.SupplierID = p.SupplierID join [Order Details] od on p.ProductID = od.ProductID join Orders o on od.OrderID = o.OrderID

--Problem 24
select o.OrderDate, p.ProductName
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID
order by o.OrderDate

--Problem 25
select e1.FirstName + ' ' + e1.LastName as FirstEmployee, e2.FirstName + ' ' + e2.LastName as SecondEmployee
from Employees e1 join Employees e2 on e1.Title = e2.Title
where e1.EmployeeID < e2.EmployeeID

--Problem 26
select m.FirstName + ' ' + m.LastName as Manager, count(e.EmployeeID) as NumOfReportees
from Employees e join Employees m on e.ReportsTo = m.EmployeeID
group by m.FirstName, m.LastName
having count(e.EmployeeID) > 2

--Problem 27
select c.City, c.CompanyName as [Name], c.ContactName, 'Customer' as Type
from Customers c
union
select s.City, s.CompanyName as [Name], s.ContactName, 'Supplier' as Type
from Suppliers s