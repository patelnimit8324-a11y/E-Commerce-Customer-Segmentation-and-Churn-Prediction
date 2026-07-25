CREATE DATABASE EcommerceAnalytics;
go
use EcommerceAnalytics;
go
select *
from OnlineRetail


SELECT TOP 10 *
FROM OnlineRetail;

SELECT COUNT(*)
FROM OnlineRetail;

SELECT COUNT(*)
FROM OnlineRetail
WHERE CustomerID IS NULL;	

SELECT *,
COUNT(*) AS DuplicateCount
FROM OnlineRetail
GROUP BY
InvoiceNo,
StockCode,
Description,
Quantity,
InvoiceDate,
UnitPrice,
CustomerID,
Country
HAVING COUNT(*) > 1;

SELECT
SUM(Quantity * UnitPrice) AS TotalRevenue
FROM OnlineRetail;

SELECT
COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM OnlineRetail;

SELECT TOP 10
CustomerID,
SUM(Quantity * UnitPrice) AS Revenue
FROM OnlineRetail
GROUP BY CustomerID
ORDER BY Revenue DESC;

SELECT TOP 10
Description,
SUM(Quantity) AS TotalSold
FROM OnlineRetail
GROUP BY Description
ORDER BY TotalSold DESC;

SELECT *
INTO OnlineRetail_Backup
FROM OnlineRetail;

DELETE FROM OnlineRetail
WHERE CustomerID IS NULL;

SELECT COUNT(*)
FROM OnlineRetail
WHERE CustomerID IS NULL;

SELECT COUNT(*)
FROM OnlineRetail
WHERE Description IS NULL;

SELECT
InvoiceNo,
StockCode,
Description,
Quantity,
InvoiceDate,
UnitPrice,
CustomerID,
Country,
COUNT(*) AS DuplicateCount
FROM OnlineRetail
GROUP BY
InvoiceNo,
StockCode,
Description,
Quantity,
InvoiceDate,
UnitPrice,
CustomerID,
Country
HAVING COUNT(*) > 1;

ALTER TABLE OnlineRetail
ADD TransactionID INT IDENTITY(1,1);


WITH CTE AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY
InvoiceNo,
StockCode,
Description,
Quantity,
InvoiceDate,
UnitPrice,
CustomerID,
Country
ORDER BY TransactionID
) rn
FROM OnlineRetail
)
DELETE FROM CTE
WHERE rn > 1; 


SELECT COUNT(*)
FROM OnlineRetail
WHERE InvoiceNo LIKE 'C%';


DELETE FROM OnlineRetail
WHERE InvoiceNo LIKE 'C%';

SELECT COUNT(*)
FROM OnlineRetail
WHERE Quantity <= 0;


DELETE FROM OnlineRetail
WHERE Quantity <= 0;

select COUNT(*)
from OnlineRetail
where UnitPrice<=0

delete from OnlineRetail
where UnitPrice <=0

ALTER TABLE OnlineRetail
ADD Revenue DECIMAL(18,2);

UPDATE OnlineRetail
SET Revenue = Quantity * UnitPrice

SELECT TOP 5 InvoiceDate
FROM OnlineRetail;

SELECT SUM(Revenue)
FROM OnlineRetail;

SELECT COUNT(DISTINCT CustomerID)
FROM OnlineRetail;

SELECT COUNT(*)
FROM OnlineRetail;

SELECT COUNT(*) AS TotalTransactions
FROM OnlineRetail;

SELECT COUNT(distinct InvoiceNo) AS TotalOrders
FROM OnlineRetail;

select top 5 revenue
from OnlineRetail

select
sum(revenue) AS TOTALREVENUE
from OnlineRetail

select
SUM(Revenue) / 
COUNT (DISTINCT InvoiceNo) as avergeordervalue
from onlineretail;


select*
from OnlineRetail


select top 10
CustomerID,
SUM(Revenue) as revenuegenerated
from OnlineRetail
group by CustomerID 
order by revenuegenerated desc;


select top 10
Description,
SUM(Quantity) as totalquantitysold
from OnlineRetail
group by Description
order by totalquantitysold

select top 10
Description,
SUM(revenue) as revenuegeneratedproducts
from OnlineRetail 
group by Description
order by revenuegeneratedproducts desc

select
Country,
SUM(revenue) as countryrevenue
from OnlineRetail
group by Country
order by countryrevenue desc

select
MONTH(invoicedate) as salesmonth,
SUM(revenue) as revenue
from OnlineRetail
group by MONTH(invoicedate)
order by salesmonth desc

