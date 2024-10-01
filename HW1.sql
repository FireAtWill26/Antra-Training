use AdventureWorks2019
go

--Problem 1
select ProductID, [Name], Color, ListPrice 
from Production.Product

--Problem 2
select ProductID, [Name], Color, ListPrice 
from Production.Product
where ListPrice != 0

--Problem 3
select ProductID, [Name], Color, ListPrice 
from Production.Product
where Color is Null

--Problem 4
select ProductID, [Name], Color, ListPrice 
from Production.Product
where Color is not Null

--Problem 5
select ProductID, [Name], Color, ListPrice 
from Production.Product
where Color is not Null and ListPrice > 0

--Problem 6
select ProductID, [Name] + ' ' + Color as [Name and Color], ListPrice 
from Production.Product
where Color is not Null

--Problem 7
select 'NAME: ' + [Name] + ' -- COLOR: ' + Color as Detail
from Production.Product
where [Name] like '%Crankarm%' or [Name] like 'Chainring%'
order by ProductNumber

--Problem 8
select ProductID, [Name]
from Production.Product
where ProductID between 400 and 500

--Problem 9
select ProductID, [Name], Color
from Production.Product
where Color in ('Blue', 'Black')

--Problem 10
select ProductID, [Name], Color, ListPrice  from
Production.Product
where [Name] like 'S%'

--Problem 11
select [Name], ListPrice
from Production.Product
where [Name] like 'S%'
order by [Name]

--Problem 12
select [Name], ListPrice
from Production.Product
where [Name] like 'S%' or [Name] like 'A%'
order by [Name]

--Problem 13
select [Name], ListPrice
from Production.Product
where [Name] like 'SPO[^K]%'
order by [Name]

--Problem 14
select distinct color
from Production.Product
order by color desc

--if exclude null

select distinct color
from Production.Product
where color is not null
order by color desc