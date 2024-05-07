USE AdventureWorks2022

GO
	CREATE TRIGGER taxRateMonitoring
	ON Sales.SalesTaxRate
	INSTEAD OF UPDATE
	AS
		IF NOT EXISTS ( SELECT * FROM SalesTaxRate WHERE (TaxRate + (TaxRate/3)) > (SELECT TaxRate FROM inserted))
			BEGIN
				RAISERROR('TaxRate podniesiono o wiecej niz 30 procent', 16, 1)
				ROLLBACK TRAN
			END
		ELSE
			BEGIN
				UPDATE Sales.SalesTaxRate
				SET TaxRate = (SELECT TaxRate FROM inserted)
				WHERE SalesTaxRateID = (SELECT SalesTaxRateID FROM inserted)
			END

	UPDATE Sales.SalesTaxRate
	SET TaxRate  = 10
	WHERE SalesTaxRateID = 1

	SELECT * FROM Sales.SalesTaxRate