CREATE FUNCTION ciagF(@n INT)
RETURNS @numbers TABLE(number INT)
AS
BEGIN
    DECLARE @n1 INT = 0, @n2 INT = 1, @i INT = 0, @temp INT;
    INSERT INTO @numbers VALUES(@n1), (@n2);
    WHILE (@i <= @n - 2)
    BEGIN 
        INSERT INTO @numbers VALUES(@n2 + @n1);
        SET @temp = @n2;
        SET @n2 = @n2 + @n1;
        SET @n1 = @temp;
        SET @i += 1;
    END;
    
    RETURN;
END;
SELECT * FROM dbo.ciagF(10);
