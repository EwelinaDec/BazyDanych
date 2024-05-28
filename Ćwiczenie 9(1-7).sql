--1
USE AdventureWorks2022;
BEGIN TRANSACTION;
UPDATE Production.Product
SET ListPrice = ListPrice * 1.10
WHERE ProductID = 680;
COMMIT TRANSACTION;

SELECT * FROM Production.Product WHERE ProductID = 680;
--ROLLBACK;


--2
USE AdventureWorks2022;
BEGIN TRANSACTION;
DELETE FROM Production.Product
WHERE ProductID = 707;
ROLLBACK TRANSACTION;


--3
USE AdventureWorks2022;
BEGIN TRANSACTION;
INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, Size, SizeUnitMeasureCode, WeightUnitMeasureCode, Weight, DaysToManufacture, ProductLine, Class, Style, ProductSubcategoryID, ProductModelID, SellStartDate, SellEndDate, DiscontinuedDate, rowguid, ModifiedDate)
VALUES ('Nowy Produkt', 'NP-001', 1, 1, NULL, 100, 100, 10.00, 20.00, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, GETDATE(), NULL, NULL, NEWID(), GETDATE());
COMMIT TRANSACTION;

SELECT * FROM Production.Product 

--4
USE AdventureWorks2022;
BEGIN TRANSACTION;
UPDATE Production.Product
SET StandardCost = StandardCost * 1.10;
IF (SELECT SUM(StandardCost) FROM Production.Product) <= 50000
BEGIN
    COMMIT TRANSACTION;
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
END;

SELECT * FROM Production.Product;


--5
USE AdventureWorks2022;
BEGIN TRANSACTION;

IF NOT EXISTS (SELECT 1 FROM Production.Product WHERE ProductNumber = 'NP-002')
BEGIN
    INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, Size, SizeUnitMeasureCode, WeightUnitMeasureCode, Weight, DaysToManufacture, ProductLine, Class, Style, ProductSubcategoryID, ProductModelID, SellStartDate, SellEndDate, DiscontinuedDate, rowguid, ModifiedDate)
    VALUES ('Nowy Produkt2', 'NP-002', 1, 1, NULL, 100, 100, 10.00, 20.00, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, GETDATE(), NULL, NULL, NEWID(), GETDATE());
    COMMIT TRANSACTION;
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
END;

SELECT * FROM Production.Product 


--6
USE AdventureWorks2022;
BEGIN TRANSACTION;

IF NOT EXISTS (SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
BEGIN
    UPDATE Sales.SalesOrderDetail
    SET OrderQty = OrderQty - 1; 
    COMMIT TRANSACTION;
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
END;

SELECT * FROM Sales.SalesOrderDetail;

--7
USE AdventureWorks2022;
BEGIN TRANSACTION;

DECLARE @AvgStandardCost DECIMAL(18, 2);
SELECT @AvgStandardCost = AVG(StandardCost) FROM Production.Product;

DECLARE @ProductsToDeleteCount INT;
SELECT @ProductsToDeleteCount = COUNT(*) FROM Production.Product WHERE StandardCost > @AvgStandardCost;

IF @ProductsToDeleteCount <= 10
BEGIN
    DELETE FROM Production.Product WHERE StandardCost > @AvgStandardCost;
    COMMIT TRANSACTION;
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
END;


