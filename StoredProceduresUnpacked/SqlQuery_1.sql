-- IF THEN

ALTER PROC dbo.CalcPricePerPound
as
BEGIN
    DECLARE @pricePerPound float;
    DECLARE @totalAmount float;
    DECLARE @weight float;

    SET @totalAmount = 121.32;
    SET @weight = 2;

    IF @weight = 0 BEGIN
    PRINT 'weight is 0, this is not allowed, changing thweight to 1';
    SET @weight = 1.0;
    END
    ELSE BEGIN
    PRINT 'Valid weight entered, calulating price per pound.';
    END

    SET @pricePerPound = @totalAmount / @weight;
    PRINT 'The price per pound is ' + CAST(@pricePerPound as NVARCHAR)
END