
/****************** Functions to calculte AGE **********************/
CREATE FUNCTION Age_Calculate(@DOB DATE)
RETURNS INT
AS 
BEGIN 
	DECLARE @AGE INT 
	SET @AGE = DATEDIFF(YEAR, @DOB,GETDATE()) -
		CASE 
			WHEN 
				(MONTH(@DOB) > MONTH(GETDATE())) OR
				(MONTH(@DOB) = MONTH(GETDATE()) AND DAY (@DOB) > DAY(GETDATE()))
				THEN 1
				Else 0
		 END
RETURN @AGE
END 

SELECT dbo.Age_Calculate('1995/04/25')
/***************************************************************/

/******** Function to find telephone number from the name *****/

CREATE FUNCTION FIND_TEL_NO(@NAME VARCHAR(30))
RETURNS VARCHAR(20)
AS
BEGIN 
	DECLARE @ID INT 
	DECLARE @TEL VARCHAR(20)
	SELECT @ID = Person_id FROM [dbo].[Person] WHERE [First_name] = @NAME
	SELECT @TEL = Telephone_number FROM [dbo].[Person_Telephone_Number] WHERE [Person_id] = @ID
	RETURN @TEL
END

SELECT dbo.FIND_TEL_NO('Lakith')
/********************************************************/

/************ Gender Filter ***************************/
CREATE FUNCTION FILTER_WITH_GENDER(@GENDER CHAR(1))
RETURNS TABLE 
AS
RETURN	
	(SELECT [First_name],[Middle_name],[Last_name],[Nationality],[Gender],[Email],[Telephone_number]
	 FROM [dbo].[Person]
	 JOIN [dbo].[Person_Email]
	  On [dbo].[Person].Person_id = [dbo].[Person_Email].Person_id
	 Join [dbo].[Person_Telephone_Number]
	   ON [dbo].[Person].Person_id = [dbo].[Person_Telephone_Number].Person_id
	  Where [dbo].[Person].Gender = @GENDER
	)

Select * FROM FILTER_WITH_GENDER('m')
/*************************************************/

/************************************************/

CREATE FUNCTION GETACCOMOTATIONPRICE()
RETURNS @Table TABLE (accomodation_name VARCHAR(40) ,Price MONEY)
AS
	BEGIN
		INSERT INTO @Table
		SELECT [Accommodation_name] , [Price] FROM [dbo].[Accommodation] ORDER BY [Accommodation_id]
		RETURN
	END

SELECT * FROM dbo.GETACCOMOTATIONPRICE()

/*************************************************/