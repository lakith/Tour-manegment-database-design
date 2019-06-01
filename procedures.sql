CREATE PROCEDURE spGET_CurrentEmployee
AS
BEGIN 
	SELECT * FROM [dbo].[Consumer] WHERE Consumer.Consumer_status =' current customer'
END
	
EXECUTE [dbo].[spGET_CurrentEmployee]
-----------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE spGET_VECHILE
@Year int,
@color varchar(15)
AS
	BEGIN
		 SELECT * FROM [dbo].[Transportation_medium] WHERE [Vechile_Year] >= @Year AND  [Color_basic] = @color ORDER BY [Registation_number]
	END

EXECUTE spGET_VECHILE 2000,'white'
------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE spGET_GENDER
@gender char(1),
@personCount int output

AS
	BEGIN 
		SELECT  @personCount = COUNT([Person_id]) FROM [dbo].[Person] WHERE [Gender] = @gender
	END

DECLARE @Count_TAKE INT 
EXECUTE   spGET_GENDER 'm' , @Count_TAKE OUTPUT
PRINT @Count_TAKE
--------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE spGET_GENDERtype
@id varchar(15),
@gender char(1) output

AS
	BEGIN 
		SELECT  @gender = [Gender] FROM [dbo].[Person] WHERE [Person_id] = @id
	END

DECLARE @gender_TAKE char(1)
EXECUTE   spGET_GENDERtype '01' , @gender_TAKE OUTPUT
PRINT @gender_TAKE
---------------------------------------------------------------------------------------------------------------------------------