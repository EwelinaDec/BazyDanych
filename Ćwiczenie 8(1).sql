USE AdventureWorks2022;

--SELECT * FROM Person.Person;
--SELECT * FROM HumanResources.Employee;
--SELECT * FROM HumanResources.EmployeePayHistory;

IF OBJECT_ID('tempdb..#TempEmployeeInfo') IS NOT NULL
	DROP TABLE #TempEmployeeInfo;


WITH Pay_CTE (FirstName, MiddleName, LastName, BirthDate, JobTitle, Rate)  
AS  
(
	SELECT pp.FirstName, pp.MiddleName, pp.LastName, emp.BirthDate, emp.JobTitle, eph.Rate
    FROM Person.Person AS pp
    JOIN HumanResources.Employee AS emp ON pp.BusinessEntityID = emp.BusinessEntityID
    JOIN HumanResources.EmployeePayHistory AS eph ON emp.BusinessEntityID = eph.BusinessEntityID
)  

SELECT *
INTO #TempEmployeeInfo
FROM Pay_CTE;  

SELECT * FROM #TempEmployeeInfo;


