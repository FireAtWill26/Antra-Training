select ProductID, [Name], Color, ListPrice 
from Production.Product

select ProductID, [Name], Color, ListPrice 
from Production.Product
where ListPrice != 0

select ProductID, [Name], Color, ListPrice 
from Production.Product
where Color is Null

select ProductID, [Name], Color, ListPrice 
from Production.Product
where Color is not Null

select ProductID, [Name], Color, ListPrice 
from Production.Product
where Color is not Null and ListPrice > 0

select ProductID, [Name] + ' ' + Color as [Name and Color], ListPrice 
from Production.Product
where Color is not Null

select 'NAME: ' + [Name] + ' -- COLOR: ' + Color as Detail
from Production.Product
where [Name] like '%Crankarm%' or [Name] like 'Chainring%'
order by ProductNumber

select ProductID, [Name]
from Production.Product
where ProductID between 400 and 500

select ProductID, [Name], Color
from Production.Product
where Color in ('Blue', 'Black')

select ProductID, [Name], Color, ListPrice  from
Production.Product
where [Name] like 'S%'

select [Name], ListPrice
from Production.Product
where [Name] like 'S%'
order by [Name]

select [Name], ListPrice
from Production.Product
where [Name] like 'S%' or [Name] like 'A%'
order by [Name]

select [Name], ListPrice
from Production.Product
where [Name] like 'SPO[^K]%'
order by [Name]

select distinct color
from Production.Product
order by color desc

--if exclude null

select distinct color
from Production.Product
where color is not null
order by color desc