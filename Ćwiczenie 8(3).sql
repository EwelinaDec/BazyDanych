USE AdventureWorksLT2022;

--SELECT * FROM SalesLT.SalesOrderDetail;
--SELECT * FROM SalesLT.Product;
--SELECT * FROM SalesLT.ProductCategory;

WITH Category_CTE (Name, SalesValue)  
AS  
(  
    SELECT prc.Name, CAST(SUM(LineTotal) AS decimal(16,2)) AS SalesValue
    FROM SalesLT.SalesOrderDetail AS sod
	JOIN SalesLT.Product AS prd ON sod.ProductID = prd.ProductID
	JOIN SalesLT.ProductCategory AS prc ON prd.ProductCategoryID = prc.ProductCategoryID
	GROUP BY prc.Name
)  
SELECT Name, SalesValue
FROM Category_CTE; 
