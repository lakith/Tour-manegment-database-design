/***************************** View For displaying Employee information********************************/
CREATE VIEW		
		VW_Employee_Details
AS
		SELECT Person.Person_id , Person.First_name,Person.Middle_name,Person.Last_name,Person.Birthdate,Employee.Job_role,Employee.Date_hired,Employee.Working_history,Employee.EPF_number,Employee.ETF_number
		FROM Person
		Inner Join Employee
		ON Person.Person_id = Employee.Employee_id

SELECT * FROM  VW_Employee_Details

SP_HElPTEXT VW_Employee_Details
/*******************************************************************************************************/

/***************************** View For displaying Employee information********************************/
CREATE VIEW		
		VW_Consumer_details
AS
		SELECT Person.Person_id , Person.First_name,Person.Middle_name,Person.Last_name,Person.Birthdate,Consumer.Consumer_status,Consumer.Special_intersrts,Consumer.Additional_contact_person_name,Consumer.Additional_contact_person_number
		FROM Person
		Inner Join Consumer
		ON Person.Person_id = Consumer.Consumer_id

SELECT * FROM  VW_Consumer_details

SP_HElPTEXT VW_Consumer_details

/*******************************************************************************************************/

/*************************************VW_Trour_count****************************************************/
CREATE VIEW	
		VW_Tours_count
AS
		SELECT Tour_Pakage.Tour_pakage_name ,Count (Tour.Tour_id) As NO_Of_Tours
		FROM [dbo].[Tour_Pakage]
		JOIN [dbo].[Tour]
		ON [dbo].[Tour_Pakage].[Tour_pakage_id] = [dbo].[Tour].Tour_pakage_id
		Group By Tour_Pakage.Tour_pakage_name 

SELECT * FROM  VW_Tours_count

SP_HElPTEXT VW_Tours_count

/*******************************************************************************************************/
