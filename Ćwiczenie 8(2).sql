USE AdventureWorksLT2022;

--SELECT * FROM SalesLT.SalesOrderHeader;
--SELECT * FROM SalesLT.Customer;

WITH Sale_CTE (CompanyName, FirstName, LastName, TotalDue)  
AS  
(  
    SELECT CompanyName, FirstName, LastName, SUM(TotalDue) AS TotalDue
    FROM SalesLT.SalesOrderHeader AS soh
	JOIN SalesLT.Customer AS cst ON soh.CustomerID = cst.CustomerID
	GROUP BY CompanyName, FirstName, LastName
)  
SELECT CONCAT(CompanyName, ' (', FirstName, ' ', LastName, ')') AS CompanyContact, TotalDue AS Revenue
FROM Sale_CTE;  
