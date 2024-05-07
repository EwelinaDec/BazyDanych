USE AdventureWorks2022
GO

CREATE TRIGGER LastNameToUpper
ON Person.Person
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE p
    SET p.LastName = UPPER(i.LastName)
    FROM Person.Person p
    INNER JOIN inserted i ON p.BusinessEntityID = i.BusinessEntityID;
END;

INSERT INTO Person.Person (BusinessEntityID, PersonType, NameStyle, Title, FirstName, MiddleName, LastName, Suffix, EmailPromotion, AdditionalContactInfo, Demographics, rowguid, ModifiedDate)
VALUES (20778, 'EM', 0, 'Mr.', 'Jonny', NULL, 'Winehouse', NULL, 0, NULL, NULL, NEWID(), GETDATE());

SELECT *
FROM Person.BusinessEntity
ORDER BY BusinessEntityID DESC;

SELECT BusinessEntityID, LastName
FROM Person.Person
ORDER BY BusinessEntityID DESC;

/*SET IDENTITY_INSERT Person.BusinessEntity ON;
INSERT INTO Person.BusinessEntity(BusinessEntityID, rowguid, ModifiedDate) VALUES(20779, NEWID(), GETDATE());
SET IDENTITY_INSERT Person.BusinessEntity OFF;*/
