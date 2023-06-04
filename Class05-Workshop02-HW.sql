--Declare scalar function (fn_FormatProductName) for retrieving the Product description for specific ProductId in the following format:
--  Second and Third character from the Code
--  Last three characters from the Name
--  Product Price

DROP FUNCTION  fn_FormatProductName

CREATE FUNCTION fn_FormatProductName(@ProductId INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN

DECLARE @Result NVARCHAR(MAX)

Select @Result = STRING_AGG(SUBSTRING(Code, 2, 3) + '-' + RIGHT(p.Name, 3) + '-' + CAST(p.Price AS NVARCHAR(MAX)), ', ')
From Products p
WHERE p.Id = @ProductId
RETURN @Result
END

Select dbo.fn_FormatProductName(1)

--This behaves same as the foreach cycle. We get the Id for each order, and we call the function with the Id
Select p.Id, p.Code, p.Name, p.Description, p.Weight, p.Price, p.Cost, dbo.fn_FormatProductName(p.Id) as FunctionOutput From Products p

