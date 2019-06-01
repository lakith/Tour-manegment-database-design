/************************************** Triggers ******************************************/
/*********************************** Insert Triggers **************************************/
CREATE TRIGGER tr_Person_ForInsert
ON [dbo].[Person]
AFTER INSERT 
As
	BEGIN 
		SELECT * FROM inserted
	END
/*************************************************************************/
INSERT INTO Person VALUES ('61','Hansi','Ayshwari','Yapa','Sinhalese','1995/12/09','F')



/**************************** Trigger for tour insertion******************/
CREATE TRIGGER TR_Tour_FORINSERT
ON [dbo].[Tour]
AFTER INSERT
AS
	BEGIN 
		SELECT * FROM inserted
	END
/*************************************************************************/

INSERT INTO [dbo].[Tour] VALUES ('302','2017/12/21','2017/12/31','going','Horana','Colombo','250','2','1','2','RR','RR')


/*******************Creating a auddit table******************************/
CREATE TABLE
		 PaymentAudit 
		 (
		  Audit_id varchar(10) NOT NULL,
		  Audit_data varchar(200) NOT NULL,
		 )

/***********************************************************************/

CREATE TRIGGER tr_Payment_ForInsert
ON [dbo].[Payment]
AFTER INSERT 
AS 
	BEGIN 
		DECLARE @id int
		SELECT  @id = [Payment_id] FROM inserted
		INSERT INTO	
			[dbo].[PaymentAudit]
		VALUES 
			(CAST(@id AS varchar(10)),'PAYMENT WITH ID = '+CAST(@id AS varchar(10))+'IS ADDED AT '+CAST(GETDATE() AS varchar(20) ));
	END

/*************************************************************************/
SELECT * FROM [dbo].[PaymentAudit]

/******************************************************************************************************/
/*********************************** Delete Triggers **************************************/

CREATE TRIGGER tr_Eemployee_FORDELETE
ON [dbo].[Employee]
AFTER DELETE 
AS
	BEGIN
		SELECT * FROM [dbo].[Employee]
	END

/*************************************************************************/
INSERT INTO
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
VALUES ('89','Lakith','Udara','Muthugala','Sri lankan','1995-04-25','m');


INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('89','1234','321','tour guide','2011-12-16','123467890987','ordinary level ','tour guide');


DELETE FROM  [dbo].[Employee] WHERE Employee_id = '89'
/*************************************************************************/

/************************************** DELETE TRIGGER FOR CONSUMER *****************************/
CREATE TRIGGER tr_Consumer_FORDELETE
ON [dbo].[Consumer]
AFTER DELETE 
AS
	BEGIN
		SELECT * FROM [dbo].[Consumer]
	END

/*************************************************************************/
INSERT INTO
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
VALUES ('99','Lakith','Udara','Muthugala','Sri lankan','1995-04-25','m');

INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
VALUES ('99','shisha','071235567',' current customer','city tour');

DELETE FROM [dbo].[Consumer] WHERE [Consumer_id] = '99'
/*************************************************************************/
/************************************************************************************************/

CREATE TRIGGER tr_Payment2_ForDelete
ON [dbo].[Payment]
AFTER DELETE
AS 
	BEGIN 
		DECLARE @id int
		SELECT  @id = [Payment_id] FROM deleted
		INSERT INTO	
			[dbo].[PaymentAudit]
		VALUES 
			(CAST(@id AS varchar(10)),'PAYMENT WITH ID = '+CAST(@id AS varchar(10))+'WAS Deleted AT '+CAST(GETDATE() AS varchar(20) ));
	END
/*************************************************************************/
SELECT * FROM [dbo].[PaymentAudit]
/*************************************************************************/

/*************************************** Update Triggers*****************************************/

CREATE TRIGGER tr_Transportation_medium_ForUpdate
ON [dbo].[Transportation_medium]
AFTER UPDATE
As
	BEGIN
		SELECT * FROM [dbo].[Transportation_medium]
	END
	 
ALTER TRIGGER tr_Transportation_medium_ForUpdate
ON [dbo].[Transportation_medium]
AFTER UPDATE
As
	BEGIN
		SELECT * FROM [dbo].[Transportation_medium]
	END 

UPDATE [dbo].[Transportation_medium] SET [Model] = 'Micro' WHERE [Registation_number] ='00123';