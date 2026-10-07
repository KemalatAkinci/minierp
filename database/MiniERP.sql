create procedure sp_siparisolustur
	@customerID int,
	@productID int,
	@quantity int
as

begin
	DECLARE @currentstock decimal(13,2)
	DECLARE @unitprice decimal(13,2)
	DECLARE @newOrderID int

	select
		@currentstock = UnitsInStock,
		@unitprice = @unitprice
	from Products
	where ProductID = @productID

	IF @CurrentStock IS NULL
    BEGIN
        PRINT 'Hata: Belirtilen ProductID veritabanında bulunamadı';
        RETURN;
    END


    IF @CurrentStock < @Quantity
    BEGIN
        PRINT 'Hata: Yetersiz stok!';
        PRINT 'Mevcut Stok: ' + CAST(@CurrentStock AS NVARCHAR(10)) 
              + ', Talep Edilen: ' + CAST(@Quantity AS NVARCHAR(10));
        RETURN;
    END




end

