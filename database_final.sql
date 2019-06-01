
CREATE DATABASE 
	LANKA_TOURS7
GO
------------------------------------------------------------------------------------------------------------------
USE
	LANKA_TOURS7
Go
------------------------------------------------------------------------------------------------------------------

CREATE TABLE
		Tour_Pakage
		(
			Tour_pakage_id varchar(10) NOT NULL,
			Tour_pakage_name varchar(30) NOT NULL,
			Tour_pakage_type varchar(20) NOT NULL,
			Tour_description text,
			
			CONSTRAINT 
				PK___TOUR_PAKAGE
			PRIMARY KEY
				(Tour_pakage_id)

		)

		
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Service_Provider
		(
			Service_provider_id varchar(10) NOT NULL,
			Servide_provider_name varchar(40) NOT NULL,
			Is_supply_accommodation bit NOT NULL,
			Is_supply_meal bit NOT NULL,
			Bank_account_num varchar(10),
			--"TRUE is converted to 1 and FALSE is converted to 0."--

			CONSTRAINT 
				PK___SERVICE_PROVIDER
			PRIMARY KEY
				(Service_provider_id)
		)

		
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Servide_Provider_Telephone_number
		(
			Service_provider_id varchar(10) NOT NULL,
			Telephone_number varchar(10) NOT NULL,
			
			CONSTRAINT
				Check_Telephone_Number
			CHECK 
				(Telephone_number NOT LIKE '%[^0-9]%'),
			
			CONSTRAINT 
				PK___Servide_Provider_Telephone_number
			PRIMARY KEY
				(Service_provider_id,Telephone_number),
				
			CONSTRAINT 
				FK___Servide_Provider_Telephone_number___Service_Provider
			FOREIGN KEY
				(Service_provider_id)
			REFERENCES
				Service_Provider(Service_provider_id)
				
		)
------------------------------------------------------------------------------------------------------------------

CREATE TABLE
		Service_Provider_Mail
		(
			Service_provider_id varchar(10) NOT NULL,
			Email varchar(60) NOT NULL,


			CONSTRAINT 
				PK___Service_Provider_Mail
			PRIMARY KEY
				(Service_provider_id,Email),

			CONSTRAINT 
				FK___Service_Provider___Service_Provider_Mail
			FOREIGN KEY
				(Service_provider_id)
			REFERENCES
				Service_Provider(Service_provider_id)
			
			 
		)
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Servide_Provider_Fax
		(
			Service_provider_id varchar(10) NOT NULL,
			Fax_number varchar(10) NOT NULL,
			
			CONSTRAINT
				Check_Fax_Number
			CHECK 
				(Fax_number NOT LIKE '%[^0-9]%'),
			
			CONSTRAINT 
				PK___Servide_Provider_Fax_number
			PRIMARY KEY
				(Service_provider_id,Fax_number),
				
			CONSTRAINT 
				FK___Servide_Provider_Fax___Service_Provider
			FOREIGN KEY
				(Service_provider_id)
			REFERENCES
				Service_Provider(Service_provider_id)
				
		)

--------------------------------------------------------------------------------------------------------------------

CREATE TABLE
		Accommodation
		(
			Accommodation_id varchar(10) NOT NULL,
			Accommodation_name Varchar(40) NOT NULL,
			[NO] char(8) NOT NULL,
			Street varchar(20) NOT NULL,
			City varchar(25) NOT NULL,
			Price money NOT NULL,
			No_of_people_can_stay int NOT NULL,

			CONSTRAINT 
				PK___Accommodation
			PRIMARY KEY 
				(Accommodation_id)
			 
		)

--------------------------------------------------------------------------------------------------------------------

								--Accommodation -> Accommodation_hotel-- 

CREATE TABLE 
		Accommodation_Hotel
		(
			Accommodation_id varchar(10) NOT NULL,
			Hotel_code varchar(20) NOT NULL UNIQUE,
			No_of_rooms int NOT NULL,
			luxury_type varchar,

			CONSTRAINT
				PK___Accommodation_Hotel
			PRIMARY KEY
				(Accommodation_id),

			CONSTRAINT 
				FK___Accommodation___Accommodation_hotel
			FOREIGN KEY
				(Accommodation_id)
			REFERENCES
				Accommodation(Accommodation_id)
				

		)

-------------------------------------------------------------------------------------------------------------------

								--Accommodation ->Accommodation_room--


CREATE TABLE 
		Accommodation_Room
		(
			Accommodation_id varchar(10) NOT NULL,
			Room_Type varchar(20) NOT NULL,


			CONSTRAINT
				PK___Accommodation_Room
			PRIMARY KEY
				(Accommodation_id),

			CONSTRAINT 
				FK___Accommodation___Accommodation_Room
			FOREIGN KEY
				(Accommodation_id)
			REFERENCES
				Accommodation(Accommodation_id)
				

		)


--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Places_To_Visit
		(
			Place_id varchar(10) NOT NULL,
			Place_name varchar(40) NOT NULL,

			CONSTRAINT
				PK___Places_To_vist
			PRIMARY KEY
				(Place_id),

		)

-------------------------------------------------------------------------------------------------------------------

							--Places_To_Visit -> Non_free_entance--

CREATE TABLE 
	Non_Free_Entrance
	(
		Place_id varchar(10) NOT NULL,
		Ticket_price money NOT NULL,

		CONSTRAINT
			PK___Non_Free_Entrance
		PRIMARY KEY
			(Place_id),

		CONSTRAINT 
			FK___Non_Free_Entrance___Places_To_Visit
		FOREIGN KEY
			(Place_id)
		REFERENCES 
			Places_To_Visit(Place_id)

	)

-------------------------------------------------------------------------------------------------------------------

							--Places_To_Visit -> Non_free_entance--

CREATE TABLE 
		Free_Entrance
		(
			Place_id varchar(10) NOT NULL,
			Special_rules text NOT NULL,

			CONSTRAINT
				PK___Free_Entrance
			PRIMARY KEY
				(Place_id),

			CONSTRAINT 
				FK___Free_Entrance___Places_To_Visit
			FOREIGN KEY
				(Place_id)
			REFERENCES 
				Places_To_Visit(Place_id)
	)

-------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Special_Activities
		(
			Special_activity_id varchar(10) NOT NULL,
			Special_activity_name varchar(40) NOT NULL,
			Discription text ,
			Price money,

			CONSTRAINT 
				PK___Special_activity
			PRIMARY KEY 
				(Special_activity_id)
		)

-------------------------------------------------------------------------------------------------------------------
CREATE TABLE 
		Dessert
		(
			Dessert_id varchar(10) NOT NULL,
			Dessert_type varchar(30) NOT NULL,
			Dessert_name varchar(30),

			CONSTRAINT 
				PK___Dessert
			PRIMARY KEY
				(Dessert_id)
		)


-------------------------------------------------------------------------------------------------------------------
CREATE TABLE 
		Liquor
		(
			Liquor_id varchar(10) NOT NULL,
			Liquor_type varchar(30) NOT NULL,
			Liquor_name varchar(30),

			CONSTRAINT 
				PK___Liquor
			PRIMARY KEY
				(Liquor_id )
		)

-------------------------------------------------------------------------------------------------------------------
CREATE TABLE 
		Meals
		(
			Meal_id varchar(10) NOT NULL,
			Meal_catragory varchar(30) NOT NULL,
			No_of_calories int ,
			Suger_level char(7),
			Dessert_id varchar(10),
			Liquor_id varchar(10),

			CONSTRAINT
				Check_Suger_level
			CHECK
				(Suger_level IN('High','Medium','Low','HIGH','MEDIUM','LOW','high','medium','low')),

			CONSTRAINT 
				PK___Meals
			PRIMARY KEY
				(Meal_id),

			CONSTRAINT 
				FK___Meals___Dessert
			FOREIGN KEY
				(Dessert_id)
			REFERENCES 
				Dessert(Dessert_id),

			CONSTRAINT 
				FK___Meals___Liquor
			FOREIGN KEY
				(Liquor_id)
			REFERENCES 
				Liquor(Liquor_id)
		)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE
		Transportation_medium 
		(
			Registation_number varchar(15) NOT NULL,
			Model varchar(30) NOT NULL,
			Vechile_Year int NOT NULL,
			Vechile_rate money NOT NULL,
			Transmission_type char(8),
			Last_insurance_date datetime NOT NULL,
			Last_service_date date NOT NULL,
			Next_service_date date NOT NULL,
			Color_basic varchar(15),

			CONSTRAINT
				Check_Vechile_Year
			CHECK
				(Vechile_Year BETWEEN 1800 and 3000),

			CONSTRAINT 
				PK___Transportation_medium 
			PRIMARY KEY
				(Registation_number)		
			 
		)

-------------------------------------------------------------------------------------------------------------------

								-- Transportation_medium -> Car --

CREATE TABLE
		Car
		(
			Registation_number varchar(15) NOT NULL,
			No_of_doors int,
			Car_type varchar(15),
			Size varchar(15),

			CONSTRAINT 
				PK___Car
			PRIMARY KEY
				(Registation_number),

			CONSTRAINT 
				FK___Car___Transportation_medium 
			FOREIGN KEY
				(Registation_number)
			REFERENCES 
				Transportation_medium(Registation_number)
		)
-------------------------------------------------------------------------------------------------------------------

								-- Transportation_medium -> Van --

CREATE TABLE
		Van
		(
			Registation_number varchar(15) NOT NULL,
			Van_type varchar(15),

			CONSTRAINT 
				PK___Van
			PRIMARY KEY
				(Registation_number),

			CONSTRAINT 
				FK___Van___Transportation_medium 
			FOREIGN KEY
				(Registation_number)
			REFERENCES 
				Transportation_medium(Registation_number)
		)
--------------------------------------------------------------------------------------------------------------------

								-- Transportation_medium -> Jeep --

CREATE TABLE
		Jeep
		(
			Registation_number varchar(15) NOT NULL,
			Jeep_type varchar(15),

			CONSTRAINT 
				PK___Jeep
			PRIMARY KEY
				(Registation_number),

			CONSTRAINT 
				FK___Jeep___Transportation_medium 
			FOREIGN KEY
				(Registation_number)
			REFERENCES 
				Transportation_medium(Registation_number)
		)
--------------------------------------------------------------------------------------------------------------------

								-- Transportation_medium -> Bus --

CREATE TABLE
		Bus
		(
			Registation_number varchar(15) NOT NULL,
			Bus_type varchar(15),

			CONSTRAINT 
				PK___Bus
			PRIMARY KEY
				(Registation_number),

			CONSTRAINT 
				FK___Bus___Transportation_medium 
			FOREIGN KEY
				(Registation_number)
			REFERENCES 
				Transportation_medium(Registation_number)
		)
--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Person
		(
			Person_id varchar(15) NOT NULL,
			First_name varchar(40) NOT NULL,
			Middle_name varchar(40) NOT NULL,
			Last_name varchar(40) NOT NULL,
			Nationality varchar(30) NOT NULL,
			Birthdate date NOT NULL,
			Gender CHAR(1) CHECK (Gender IN('F','M','f','m')) NOT NULL,

			CONSTRAINT 
				PK___Person
			PRIMARY KEY
				(Person_id)
		)
--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Person_Address
		(
			Person_id varchar(15) NOT NULL,
			Number varchar(10) NOT NULL,
			Street varchar(30) NOT NULL,
			City varchar(30) NOT NULL,
			[State] varchar(30) NOT NULL,
			Country varchar(30) NOT NULL,

			CONSTRAINT
				PK___Person_Address
			PRIMARY KEY
				(Person_id,Number,Street,City,[State],Country),

			CONSTRAINT 
				FK___Person_Address___Person
			FOREIGN KEY
				(Person_id)
			REFERENCES 
				Person(Person_id)

		)

--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Person_Telephone_Number
		(
			Person_id varchar(15) NOT NULL,
			Telephone_number varchar(14),

			CONSTRAINT 
				PK___Person_Telephone_Number
			PRIMARY KEY
				(Person_id,Telephone_number),

			CONSTRAINT 
				FK___Person_Telephone_Number___Person
			FOREIGN KEY
				(Person_id)
			REFERENCES 
				Person(Person_id)

		)
--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Person_Fax_Number
		(
			Person_id varchar(15) NOT NULL,
			Fax_number varchar(14),

			CONSTRAINT 
				PK___Person_Fax_Number
			PRIMARY KEY
				(Person_id,Fax_number),

			CONSTRAINT 
				FK___Person_Fax_Number
			FOREIGN KEY
				(Person_id)
			REFERENCES 
				Person(Person_id)

		)
--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Person_Email
		(
			Person_id varchar(15) NOT NULL,
			Email varchar(60),


			CONSTRAINT 
				PK___Person_Person_Email
			PRIMARY KEY
				(Person_id,Email),

			CONSTRAINT 
				FK___Person_Person_Email
			FOREIGN KEY
				(Person_id)
			REFERENCES 
				Person(Person_id)

		)
-------------------------------------------------------------------------------------------------------------------

												-- Person->Consumer --

CREATE TABLE 
		Consumer
		(
			Consumer_id varchar(15) NOT NULL,
			Additional_contact_person_name varchar(60),
			Additional_contact_person_number varchar(15),
			Consumer_status varchar(30),
			Special_intersrts text,

			CONSTRAINT 
				PK___Consumer
			PRIMARY KEY
				(Consumer_id),

			CONSTRAINT 
				FK___Consumer___Person
			FOREIGN KEY
				(Consumer_id)
			REFERENCES 
				Person(Person_id)

		)

-------------------------------------------------------------------------------------------------------------------

							-- Person->Employee --

CREATE TABLE 
		Employee
		(
			Employee_id varchar(15) NOT NULL,
			EPF_number varchar(8) NOT NULL UNIQUE,
			ETF_number varchar(8) NOT NULL UNIQUE,
			Job_role varchar(60) NOT NULL,
			Date_hired date NOT NULL,
			Bank_account_number varchar(15) NOT NULL,
			Educational_level varchar(50),
			Working_history text,
			 

			CONSTRAINT 
				PK___Employee
			PRIMARY KEY
				(Employee_id),

			CONSTRAINT 
				FK___Employee___Person
			FOREIGN KEY
				(Employee_id)
			REFERENCES 
				Person(Person_id)

		)
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		[Dependent]
		(
			Employee_id varchar(15) NOT NULL,
			First_name varchar(40) NOT NULL ,
			Middle_name varchar(40),
			Last_name varchar(40) NOT NULL,
			Relationship varchar(40) NOT NULL,
			Telephone_number varchar(15) NOT NULL,
			Email varchar(50),
			 

			CONSTRAINT 
				PK___Dependent
			PRIMARY KEY
				(Employee_id,First_name,Middle_name,Last_name),

			CONSTRAINT 
				FK___Dependent___Employee
			FOREIGN KEY
				(Employee_id)
			REFERENCES 
				Employee(Employee_id)

		)

-------------------------------------------------------------------------------------------------------------------

												
						-- Person->Driver --

CREATE TABLE 
		Driver
		(
			Driver_id varchar(15) NOT NULL,
			Licence_number varchar(8) NOT NULL UNIQUE,
			Licence_issue_date date NOT NULL,
			Licence_expire_date date NOT NULL,
			Medical_reports text,
			Traffic_rules_disobeying_records text,
			Vechile_catagory varchar(20),
			 

			CONSTRAINT 
				PK___Driver
			PRIMARY KEY
				(Driver_id),

			CONSTRAINT 
				FK___Driver___Person
			FOREIGN KEY
				(Driver_id)
			REFERENCES 
				Person(Person_id)

		)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE 
		Driver_Transportation_medium 
		(
			Driver_id varchar(15) NOT NULL,
			Registation_number varchar(15) NOT NULL,

			CONSTRAINT 
				PK___Driver_Transport_Medium
			PRIMARY KEY
				(Driver_id,Registation_number),

			CONSTRAINT 
				FK___Driver_Transportation_medium___Driver
			FOREIGN KEY
				(Driver_id)
			REFERENCES 
				Driver(Driver_id),

			CONSTRAINT 
				FK___Driver_Transportation_medium___Transportation_medium 
			FOREIGN KEY
				(Registation_number)
			REFERENCES 
				Transportation_medium(Registation_number)
					
		)

-------------------------------------------------------------------------------------------------------------------

												-- Person->Tour_Guide --

CREATE TABLE 
		Tour_Guide
		(
			Tour_guide_id varchar(15) NOT NULL,
			Special_skills text NOT NULL,
			 
			CONSTRAINT 
				PK___Tour_Guide
			PRIMARY KEY
				(Tour_guide_id),

			CONSTRAINT 
				FK___Tour_Guide___Person
			FOREIGN KEY
				(Tour_guide_id)
			REFERENCES 
				Person(Person_id)

		)

------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Tour_Guide_languages_speak
		(
			Tour_guide_id varchar(15) NOT NULL,
			[Language] varchar(10) NOT NULL,

			CONSTRAINT 
				PK___Tour_Guide_languages_speak
			PRIMARY KEY
				(Tour_guide_id,[Language]),

			CONSTRAINT 
				FK___Tour_Guide_languages_speak___Tour
			FOREIGN KEY
				(Tour_guide_id)
			REFERENCES 
				Tour_Guide(Tour_guide_id)

		)

--------------------------------------------------------------------------------------------------------------------
												
												-- Person->Maneger --

CREATE TABLE 
		Maneger
		(
			Maneger_id varchar(15) NOT NULL,
			Department varchar(20) NOT NULL,
			 
			CONSTRAINT 
				PK___Maneger
			PRIMARY KEY
				(Maneger_id),

			CONSTRAINT 
				FK___Maneger___Person
			FOREIGN KEY
				(Maneger_id)
			REFERENCES 
				Person(Person_id)

		)
--------------------------------------------------------------------------------------------------------------------
CREATE TABLE 
		Manegement_reports
		(
			Report_id varchar(15) NOT NULL,
			Maneger_id varchar(15) NOT NULL,
			Report_date date NOT NULL,
			[Description] text NOT NULL,

			 
			CONSTRAINT 
				PK___Manegement_reports
			PRIMARY KEY
				(Report_id),

			CONSTRAINT 
				FK___Manegement_reports___Maneger
			FOREIGN KEY
				(Maneger_id)
			REFERENCES 
				Maneger(Maneger_id)

		)
--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Reservation
		(
			Reservation_id varchar(10) NOT NULL,
			Date_of_reservation date DEFAULT GETDATE(),
			Discription text,
			Contacted_person_id varchar(15) NOT NULL,
			Employee_handled varchar(15) NOT NULL,
			 
			CONSTRAINT 
				PK___Reservation
			PRIMARY KEY
				(Reservation_id),

			CONSTRAINT 
				FK___Reservation___Employee
			FOREIGN KEY
				(Employee_handled)
			REFERENCES 
				Employee(Employee_id),

			CONSTRAINT 
				FK___Reservation___Consumer
			FOREIGN KEY
				(Contacted_person_id)
			REFERENCES 
				Consumer(Consumer_id)



		)

--------------------------------------------------------------------------------------------------------------------
CREATE TABLE 
		Tour
		(
			Tour_id varchar(15) NOT NULL,
			[Start_date] date NOT NULL,
			End_date date NOT NULL,
			tour_status varchar(30) NOT NULL,
			Location_to_pick_up varchar(30) NOT NULL,
			Location_to_drop varchar(15) NOT NULL,
			Total_distance int Default 0,
			No_of_drivers  int,
			No_of_tour_guids int,
			No_of_vechiles int,
			Reservation_id varchar(10) NOT NULL,
			Tour_pakage_id varchar(10) NOT NULL,

			CONSTRAINT 
				PK___Tour
			PRIMARY KEY
				(Tour_id),

			CONSTRAINT 
				FK___Tour___Reservation
			FOREIGN KEY
				(Reservation_id)
			REFERENCES 
				Reservation(Reservation_id),

			CONSTRAINT 
				FK___Tour___Tour_pakage
			FOREIGN KEY
				(Tour_pakage_id)
			REFERENCES 
				Tour_pakage(Tour_pakage_id)

		)

--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Tour_Accommodation
		(
			Tour_id varchar(15) NOT NULL,
			Accommodation_id varchar(10) NOT NULL,

			CONSTRAINT 
				PK___Tour_Accommodation
			PRIMARY KEY
				(Tour_id,Accommodation_id),

			CONSTRAINT 
				FK___Tour_Accommodation___Accommodation
			FOREIGN KEY
				(Accommodation_id)
			REFERENCES 
				Accommodation(Accommodation_id),

			CONSTRAINT 
				FK___Tour_Accommodation___Tour
			FOREIGN KEY
				(Tour_id)
			REFERENCES 
				Tour(Tour_id)
		)


--------------------------------------------------------------------------------------------------------------------
CREATE TABLE 
		Tour_Places_To_Visit
		(
			Tour_id varchar(15) NOT NULL,
			Place_id varchar(10) NOT NULL,

			CONSTRAINT 
				PK___Tour_Places_To_Visit
			PRIMARY KEY
				(Tour_id,Place_id),

			CONSTRAINT 
				FK___Tour_Places_To_Visit___Places_To_Visit
			FOREIGN KEY
				(Place_id)
			REFERENCES 
				Places_To_Visit(Place_id),

			CONSTRAINT 
				FK___Tour_Places_To_Visit___Tour
			FOREIGN KEY
				(Tour_id)
			REFERENCES 
				Tour(Tour_id)
		)
---------------------------------------------------------------------------------------------------------------------
CREATE TABLE 
		Tour_Special_Activities
		(
			Tour_id varchar(15) NOT NULL,
			Special_activity_id varchar(10) NOT NULL,

			CONSTRAINT 
				PK___Tour_Special_Activities
			PRIMARY KEY
				(Tour_id,Special_activity_id),

			CONSTRAINT 
				FK___Tour_Special_Activities___Special_Activities
			FOREIGN KEY
				(Special_activity_id)
			REFERENCES 
				Special_Activities(Special_activity_id),

			CONSTRAINT 
				FK___Tour_Special_Activities___Tour
			FOREIGN KEY
				(Tour_id)
			REFERENCES 
				Tour(Tour_id)
		)
--------------------------------------------------------------------------------------------------------------------
CREATE TABLE 
		Tour_Consumer
		(
			Tour_id varchar(15) NOT NULL,
			Consumer_id varchar(15) NOT NULL,

			CONSTRAINT 
				PK___Tour_Consumer
			PRIMARY KEY
				(Tour_id,Consumer_id),

			CONSTRAINT 
				FK___Tour_Consumer___Consumer
			FOREIGN KEY
				(Consumer_id)
			REFERENCES 
				Consumer(Consumer_id),

			CONSTRAINT 
				FK___Tour_Consumer___Tour
			FOREIGN KEY
				(Tour_id)
			REFERENCES 
				Tour(Tour_id)
		)

--------------------------------------------------------------------------------------------------------------------
CREATE TABLE 
		Tour_Driver
		(
			Tour_id varchar(15) NOT NULL,
			Driver_id varchar(15) NOT NULL,
			Allowance int NOT NULL,

			CONSTRAINT 
				PK___Tour_Driver
			PRIMARY KEY
				(Tour_id,Driver_id),

			CONSTRAINT 
				FK___Tour_Driver___Consumer
			FOREIGN KEY
				(Driver_id)
			REFERENCES 
				Driver(Driver_id),

			CONSTRAINT 
				FK___Tour_Driver___Tour
			FOREIGN KEY
				(Tour_id)
			REFERENCES 
				Tour(Tour_id)
		)
--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Tour_Tour_Guide
		(
			Tour_id varchar(15) NOT NULL,
			Tour_guide_id varchar(15) NOT NULL,
			Allowance int NOT NULL,

			CONSTRAINT 
				PK___Tour__Guide
			PRIMARY KEY
				(Tour_id,Tour_guide_id),

			CONSTRAINT 
				FK___Tour_Tour_Guide___Tour_Guide
			FOREIGN KEY
				(Tour_guide_id)
			REFERENCES 
				Tour_Guide(Tour_guide_id),

			CONSTRAINT 
				FK___Tour_Tour_Guide___Tour
			FOREIGN KEY
				(Tour_id)
			REFERENCES 
				Tour(Tour_id)
		)

--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Tour_Meals
		(
			Tour_id varchar(15) NOT NULL,
			Meal_id varchar(10) NOT NULL,

			CONSTRAINT 
				PK___Tour_Meals
			PRIMARY KEY
				(Tour_id,Meal_id),

			CONSTRAINT 
				FK___Tour_Meals___Meals
			FOREIGN KEY
				(Meal_id)
			REFERENCES 
				Meals(Meal_id),

			CONSTRAINT 
				FK___Tour_Meals___Tour
			FOREIGN KEY
				(Tour_id)
			REFERENCES 
				Tour(Tour_id)
		)

--------------------------------------------------------------------------------------------------------------------


CREATE TABLE 
		Tour_Transpotation_medium
		(
			Tour_id varchar(15) NOT NULL,
			Transportation_medium_id varchar(15) NOT NULL,

			CONSTRAINT 
				PK___Tour_Transpotation_medium
			PRIMARY KEY
				(Tour_id,Transportation_medium_id),

			CONSTRAINT 
				FK___Tour_Transpotation_medium___Transpotation_medium
			FOREIGN KEY
				(Transportation_medium_id)
			REFERENCES 
				Transportation_Medium(Registation_number),

			CONSTRAINT 
				FK___Tour_Transpotation_mediums___Tour
			FOREIGN KEY
				(Tour_id)
			REFERENCES 
				Tour(Tour_id)
		)
--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		[Contract]
		(
			Contract_id  varchar(15) NOT NULL,
			Contract_type Varchar(15) NOT NULL,
			Pricing_Catogary varchar(30) NOT NULL,
			Maximum_people int NOT NULL,
			Minimum_people int NOT NULL,
			Contract_sign_date date NOT NULL,
			Tour_id varchar(15) NOT NULL,
			Service_provider_id varchar(10) NOT NULL,

			CONSTRAINT 
				PK___Contract
			PRIMARY KEY
				(Contract_id),

			CONSTRAINT 
				FK___Contract___Tour
			FOREIGN KEY
				(Tour_id)
			REFERENCES 
				Tour(Tour_id),

			CONSTRAINT 
				FK___Contract___Service_Provide
			FOREIGN KEY
				(Service_provider_id)
			REFERENCES
				Service_Provider(Service_provider_id)

		)
--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Contract_Accommodation
		(
			Contract_id  varchar(15) NOT NULL,
			Accommodation_id varchar(10) NOT NULL,

			CONSTRAINT 
				PK___Contract_Accommodation
			PRIMARY KEY
				(Contract_id,Accommodation_id),

			CONSTRAINT 
				FK___Contract_Accommodation___Contract
			FOREIGN KEY
				(Contract_id)
			REFERENCES 
				[Contract](Contract_id),

			CONSTRAINT 
				FK___Contract_Accommodation___Accommodation
			FOREIGN KEY
				(Accommodation_id)
			REFERENCES 
				Accommodation(Accommodation_id)

		)

--------------------------------------------------------------------------------------------------------------------

CREATE TABLE
		Contract_Meals	
		(
			Contract_id  varchar(15) NOT NULL,
			Meal_id varchar(10) NOT NULL,

			CONSTRAINT 
				PK___Contract_Meals
			PRIMARY KEY
				(Contract_id,Meal_id),

			CONSTRAINT 
				FK___Contract_Meals___Contract
			FOREIGN KEY
				(Contract_id)
			REFERENCES 
				[Contract](Contract_id),
			
			CONSTRAINT 
				FK___Contract_Meals___Meals
			FOREIGN KEY
				(Meal_id)
			REFERENCES 
				Meals(Meal_id)
		)

-------------------------------------------------------------------------------------------

CREATE TABLE 
		Payment
		(
			Payment_id varchar(15) NOT NULL,
			Payment_method varchar(30) NOT NULL,
			Payment_date date default GETDATE(),
			Tour_id varchar(15) NOT NULL,
			Reservation_id varchar(10) NOT NULL,
			Consumer_contacted_id varchar(15) NOT NULL,
			Employee_handled_id varchar(15) NOT NULL,
			Advance_payment_ammount money NOT NULL,
			Advance_payment_confirmation bit NOT NULL,
			Full_payment_ammount money NOT NULL,
			Full_payment_confirmation bit NOT NULL,

			CONSTRAINT
				Check_Advance_payment_ammount
			CHECK
				(Advance_payment_ammount > 0),

			CONSTRAINT
				Check_Full_payment_ammount
			CHECK
				(Full_payment_ammount > 0),

			CONSTRAINT 
				PK___Payment
			PRIMARY KEY
				(Payment_id),

			CONSTRAINT 
				FK___Payment___Tour
			FOREIGN KEY
				(Tour_id )
			REFERENCES 
				Tour(Tour_id),
			
			CONSTRAINT 
				FK___Payment___Reservation
			FOREIGN KEY
				(Reservation_id )
			REFERENCES 
				Reservation(Reservation_id ),

			CONSTRAINT 
				FK___Payment___Consumer
			FOREIGN KEY
				(Consumer_contacted_id )
			REFERENCES 
				Consumer(Consumer_id ),

			CONSTRAINT 
				FK___Payment___Employee
			FOREIGN KEY
				(Employee_handled_id)
			REFERENCES 
				Employee(Employee_id),

		)
--------------------------------------------------------------------------------------------------------------------

CREATE TABLE 
		Bill
		(
			Bill_id varchar(15) NOT NULL,
			Bill_date date DEFAULT GETDATE(),
			Bill_time time DEFAULT GETDATE(),
			Payment_id varchar(15) NOT NULL,

			Constraint
				PK___Bill
			PRIMARY KEY
				(Bill_id),

			CONSTRAINT 
				FK___Bill___Payment
			FOREIGN KEY
				(Payment_id )
			REFERENCES 
				Payment(Payment_id ),


		)
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

-------------------------------DUMPING DATA INTO TABLES----------------------------------------------------


-----------------------------------Tour_Pakage--------------------------------------------------------

       /*Insert Data Into Tour_Pakage Table
				[Tour_pakage_id],
				[Tour_pakage_name],
				[Tour_pakage_type],
				[Tour_description],		*/

				

   INSERT INTO
		[dbo].[Tour_Pakage]
			 (
			 [Tour_pakage_id],[Tour_pakage_name],[Tour_pakage_type],[Tour_description]
			 )
   VALUES
		('1000','Naturee','adventure tour','lets protect the Nature ');


   INSERT INTO
		[dbo].[Tour_Pakage]
			 (
			 [Tour_pakage_id],[Tour_pakage_name],[Tour_pakage_type],[Tour_description]
			 )
   VALUES
		('1001','Aryuvedika','ayurvada tour',' all to health be healthy');


		   INSERT INTO
		[dbo].[Tour_Pakage]
			 (
			 [Tour_pakage_id],[Tour_pakage_name],[Tour_pakage_type],[Tour_description]
			 )
   VALUES
		('1002','Vndana','pilgrimage tour',' Lets worship');


		 INSERT INTO
		[dbo].[Tour_Pakage]
			 (
			 [Tour_pakage_id],[Tour_pakage_name],[Tour_pakage_type],[Tour_description]
			 )
   VALUES
		('1003','cultura','culturl tour','Beuty of Srilankan atient ');



		INSERT INTO
		[dbo].[Tour_Pakage]
			 (
			 [Tour_pakage_id],[Tour_pakage_name],[Tour_pakage_type],[Tour_description]
			 )
   VALUES
		('1004','Luxury life','luxury tour','To have a luxury vacation');



		INSERT INTO
		[dbo].[Tour_Pakage]
			 (
			 [Tour_pakage_id],[Tour_pakage_name],[Tour_pakage_type],[Tour_description]
			 )
   VALUES
		('1005','adventura','adventure tour','lets be active and do advetures thing');


		INSERT INTO
		[dbo].[Tour_Pakage]
			 (
			 [Tour_pakage_id],[Tour_pakage_name],[Tour_pakage_type],[Tour_description]
			 )
   VALUES
		('1006','Around the contry','Country tour','travel and seek');


		INSERT INTO
		[dbo].[Tour_Pakage]
			 (
			 [Tour_pakage_id],[Tour_pakage_name],[Tour_pakage_type],[Tour_description]
			 )
   VALUES
		('1007','Reach city','City tour','Valuebal city tours in Srilanka');
		
		INSERT INTO
		[dbo].[Tour_Pakage]
			 (
			 [Tour_pakage_id],[Tour_pakage_name],[Tour_pakage_type],[Tour_description]
			 )
   VALUES
		('1008','Amaizing Suffari','Suffari tour','Seek the wild life');


		INSERT INTO
		[dbo].[Tour_Pakage]
			 (
			 [Tour_pakage_id],[Tour_pakage_name],[Tour_pakage_type],[Tour_description]
			 )
   VALUES
		('1009','sea rocks',' sea side tour','Under the see');


		INSERT INTO
		[dbo].[Tour_Pakage]
			 (
			 [Tour_pakage_id],[Tour_pakage_name],[Tour_pakage_type],[Tour_description]
			 )
   VALUES
		('1010','Islandia','Island  tour','Seeking Islands');


    
 ----------------------------------service-provider---------------------------------------------------------
 /* insert into service-provider table
       [Service_provider_id]
       [Servide_provider_name]
       [Is_supply_accommodation]
       [Is_supply_meal]
       [Bank_account_num]
*/

 
	     INSERT INTO
		  [dbo].[Service_Provider]
		           (
				   [Service_provider_id],[Servide_provider_name],[Is_supply_accommodation],[Is_supply_meal],[Bank_account_num]
				   )
	  VALUES ('001','Nishantha','1','0','980678213');

      
		 INSERT INTO
		   [dbo].[Service_Provider]
		   (
		   [Service_provider_id],[Servide_provider_name],[Is_supply_accommodation],[Is_supply_meal],[Bank_account_num]
		   )
      VALUES('002','Sunil','0','1','0221234543');


	     INSERT INTO
		  [dbo].[Service_Provider]
		  (
		  [Service_provider_id],[Servide_provider_name],[Is_supply_accommodation],[Is_supply_meal],[Bank_account_num]
		  )
	  VALUES('003','Anoma','0','1','7009468953');


	  INSERT INTO   
	      [dbo].[Service_Provider]
		  (
		  [Service_provider_id],[Servide_provider_name],[Is_supply_accommodation],[Is_supply_meal],[Bank_account_num]
		  )
	    VALUES('004','Kamal','1','1','0001987543');


	   


	  INSERT INTO
		  [dbo].[Service_Provider]
		  (
		  [Service_provider_id],[Servide_provider_name],[Is_supply_accommodation],[Is_supply_meal],[Bank_account_num]
		  )
	   VALUES('005','Sunil','0','1','0221234543');

	  INSERT INTO
		  [dbo].[Service_Provider]
		  (
		  [Service_provider_id],[Servide_provider_name],[Is_supply_accommodation],[Is_supply_meal],[Bank_account_num]
		  )
	   VALUES('006','Anil','0','1','0221234543');


       INSERT INTO
		  [dbo].[Service_Provider]
		  (
		  [Service_provider_id],[Servide_provider_name],[Is_supply_accommodation],[Is_supply_meal],[Bank_account_num]
		  )
      VALUES('007','Nisha','1','0','0221234543');


		INSERT INTO
		  [dbo].[Service_Provider]
		  (
		  [Service_provider_id],[Servide_provider_name],[Is_supply_accommodation],[Is_supply_meal],[Bank_account_num]
		  )
		 VALUES('009','Sujeewa','1','0','345234543');



         INSERT INTO
		  [dbo].[Service_Provider]
		  (
		  [Service_provider_id],[Servide_provider_name],[Is_supply_accommodation],[Is_supply_meal],[Bank_account_num]
		  )
	    VALUES('010','Nuawan','1','0','010945742');


         INSERT INTO
		  [dbo].[Service_Provider]
		  (
		  [Service_provider_id],[Servide_provider_name],[Is_supply_accommodation],[Is_supply_meal],[Bank_account_num]
		  )
		 VALUES('011','Malinga','0','1','211123543');


		 INSERT INTO
		  [dbo].[Service_Provider]
		  (
		  [Service_provider_id],[Servide_provider_name],[Is_supply_accommodation],[Is_supply_meal],[Bank_account_num]
		  )
		 VALUES('012','Suren','0','1','904592354');


---------------------------------Servide_Provider_Telephone_number-----------------------------------------------------------
/* insert into Servide_Provider_Telephone_number tabel
        [Service_provider_id]
        [Telephone_number]
*/
	
		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('001','0716382077');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('001','0112790884');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('002','0770776017');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('002','0118904567');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('003','0772924670');

       INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('003','0123456789');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('004','0756907017');
        
		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('004','0112274900');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('005','0786907017');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('005','0112875607');

		 INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('005','0117466550');

		 INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('006','0777233533');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('007','0112836617');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('007','0716893839');

			INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('009','0117652652');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('009','0774595176');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('010','0114338844');

		
		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('010','0112435842');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('011','0773826990');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('011','0112437776');

		INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('012','0113135432');

			INSERT INTO
		 [dbo].[Servide_Provider_Telephone_number]
		 (
		 [Service_provider_id],[Telephone_number]
		 )
		VALUES ('012','0112448720');



-----------------------------------------------Service_Provider_Mail----------------------------------------------------------
/* insert into Service_Provider_Mail tabel
        [Service_provider_id]
        [Email]

*/
/*	Service_provider_id varchar(10) NOT NULL,
			Email varchar(60) NOT NULL,

			CONSTRAINT
				Check_Email
			 [dbo].[Service_Provider_Mail]  add constraint chk_email2 check ([Email] like '%_@__%.__%')

			CONSTRAINT 
				PK___Service_Provider_Mail
			PRIMARY KEY
				(Service_provider_id,Email),

			CONSTRAINT 
				FK___Service_Provider___Service_Provider_Mail
			FOREIGN KEY
				(Service_provider_id)
			REFERENCES
				Service_Provider(Service_provider_id)
			 
		)*/

	  INSERT INTO
		 [dbo].[Service_Provider_Mail]
		 (
		 [Service_provider_id],[Email]
		 )
	   VALUES ('001','nishantha@gmail.com ');

	  INSERT INTO 
		[dbo].[Service_Provider_Mail]
		(
		[Service_provider_id],[Email]
		)
	  VALUES ('002','Sunilnanayakkara1@gmail.com');

		INSERT INTO 
		[dbo].[Service_Provider_Mail]
		( 
		[Service_provider_id],[Email]
		)
	 VALUES ('003','anomaarachchi99@gmail.com');

		INSERT INTO 
		[dbo].[Service_Provider_Mail]
		(
		[Service_provider_id],[Email]
		)
	 VALUES ('004','kamalprasannaarachchi34@gmail.com');

		INSERT INTO
		 [dbo].[Service_Provider_Mail]
		 (
		 [Service_provider_id],[Email]
		 )
		VALUES ('005','sunilweerasinha@gmail.com');

		INSERT INTO 
		[dbo].[Service_Provider_Mail]
		(
		[Service_provider_id],[Email]
		)
	  VALUES ('006','nishairosh55@gmail.com');

		INSERT INTO 
		[dbo].[Service_Provider_Mail]
		(
		[Service_provider_id],[Email]
		)
	 VALUES ('007','nishalasith99@gmail.com');

		INSERT INTO
		 [dbo].[Service_Provider_Mail]
		 (
		 [Service_provider_id],[Email]
		 )
		VALUES ('009','sujeewasinhajayantha@gmail.com');

	    INSERT INTO 
		[dbo].[Service_Provider_Mail]
		(
		[Service_provider_id],[Email]
		)
	   VALUES ('009','nuwanaranathunga96@gmail.com');

		INSERT INTO 
		[dbo].[Service_Provider_Mail]
		(
		[Service_provider_id],[Email]
		)
	 VALUES ('010','malingawickramasinha00@gmail.com');

		 INSERT INTO 
		 [dbo].[Service_Provider_Mail]
		 (
		 [Service_provider_id],[Email]
		 )
		 VALUES ('012','surenkashiwazaki@gmail.com');



--------------------------------------------Servide_Provider_Fax----------------------------------------------------------------
 /* insert into Servide_Provider_Fax tabel
		[Service_provider_id]
		[Fax_number]
*/

     
		INSERT INTO
				 [dbo].[Servide_Provider_Fax]
				 (
				 [Service_provider_id],[Fax_number]
				 )
		 VALUES ('001','2500897');

		INSERT INTO [dbo].[Servide_Provider_Fax]
		(
		[Service_provider_id],[Fax_number]
		)
     	 VALUES ('002','4563212');

		INSERT INTO [dbo].[Servide_Provider_Fax]
		( 
		[Service_provider_id],[Fax_number]
		)
	    VALUES ('003','2654879');

		INSERT INTO [dbo].[Servide_Provider_Fax]
		(
		[Service_provider_id],[Fax_number]
		)
	    VALUES ('004','3288727');

		INSERT INTO [dbo].[Servide_Provider_Fax]
		(
		[Service_provider_id],[Fax_number]
		)
	    VALUES ('005','1247657');

	    INSERT INTO [dbo].[Servide_Provider_Fax]
		(
		[Service_provider_id],[Fax_number]
		)
	    VALUES ('006','2687654');

		INSERT INTO [dbo].[Servide_Provider_Fax]
		(
		[Service_provider_id],[Fax_number]
		)
		 VALUES ('007','3546566');

		

		INSERT INTO [dbo].[Servide_Provider_Fax]
		(
		[Service_provider_id],[Fax_number]
		)
		 VALUES ('009','2565775');

		INSERT INTO [dbo].[Servide_Provider_Fax]
		(
		[Service_provider_id],[Fax_number]
		)
		 VALUES ('010','2456788');

		 
		INSERT INTO [dbo].[Servide_Provider_Fax]
		(
		[Service_provider_id],[Fax_number]
		)
		 VALUES ('011','2790884');

		 
		INSERT INTO [dbo].[Servide_Provider_Fax]
		(
		[Service_provider_id],[Fax_number]
		)
		 VALUES ('012','2886789');

		 

--------------------------------------------------Accommodation-----------------------------------------------------------------
/* insert into Accommodation tabel
		[Accommodation_id]
		[Accommodation_name]
		[NO]
		[Street]
		[City]
		[Price]
		[No_of_people_can_stay]
*/
/*	Accommodation
		(
			Accommodation_id varchar(10) NOT NULL,
			Accommodation_name Varchar(40) NOT NULL,
			[NO] char(8) NOT NULL,
			Street varchar(20) NOT NULL,
			City varchar(25) NOT NULL,
			Price money NOT NULL,
			No_of_people_can_stay int NOT NULL,

			CONSTRAINT 
				PK___Accommodation
			PRIMARY KEY 
				(Accommodation_id)
			 
		)*/

		INSERT INTO 
		[dbo].[Accommodation]
		(
		[Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		) 
		 VALUES ('1','The Town Naturepark','696/4','Anuradhapura Road',' Dambulla','16298','5');

		INSERT INTO 
		 [dbo].[Accommodation]
		 (
		 [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		 )
		 VALUES ('2','Dambulla Rock Arch','435 8',' canal Road',' Dambulla','7380','6');

		INSERT INTO  
		[dbo].[Accommodation]
		(
		[Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		)
		 VALUES ('3','Southern Comforts Guest House ','62A/2',' Light House Street',' Galle','26500','5');

		INSERT INTO  
		[dbo].[Accommodation]
		(
		[Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		)
		 VALUES ('4','Paul house','786/4','heenatigala',' Galle','8200','7');

		INSERT INTO
		  [dbo].[Accommodation]
		  (
		  [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		  )
		 VALUES ('5','City Capital Hostel ','244','New town','Anuradhapura ','1276','10');

		INSERT INTO 
		 [dbo].[Accommodation]
		 (
		 [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		 )
		 VALUES ('6','Golden Home','25','Sivan Veethi','pinnawala','34594','10');

		INSERT INTO 
		 [dbo].[Accommodation]
		 (
		 [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		 )
		 VALUES ('7','ArchAriyawan Rest','66','Navagampura RD',' Ampara','30750','15');

		INSERT INTO 
		 [dbo].[Accommodation]
		 (
		 [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		 )
		 VALUES ('8','Sea Breeze Guest Inn',' 430','Beach Road','Ampara','17374','15');

		INSERT INTO  
		[dbo].[Accommodation]
		(
		[Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		)
		 VALUES ('9','shangila ','654/4','hambantota road ','Hambantota','5074','2');

		INSERT INTO
		  [dbo].[Accommodation]
		  (
		  [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		  )
		 VALUES ('10','Red Banana','17','kandy Road','kandy','16913','10');

		 
		INSERT INTO 
		 [dbo].[Accommodation]
		 (
		 [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		 )
		 VALUES ('11','peradeniya Comforts Guest House ','278/1','Kandy Road','peradeniya','10000','5');

		 
		INSERT INTO  
		[dbo].[Accommodation]
		(
		[Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		)
		 VALUES ('12','kandy motel','65','kandy motel','kandy','20000','4');

		  
		INSERT INTO 
		 [dbo].[Accommodation]
		 (
		 [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		 )
		 VALUES ('13','sanchi  rest','45/3','sanchi rest','ella','16000','3');

		  

		  INSERT INTO
		    [dbo].[Accommodation]
			(
			[Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
			)
		 VALUES ('14','yala garden resort','89/9','yala gardens resort ','yala','9000','9');

		  
		INSERT INTO 
		 [dbo].[Accommodation]
		 (
		 [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		 )
		 VALUES ('15','rasanga hotel','77','rasanga hotel','kaneliya','6000','2');

		  
		INSERT INTO 
		 [dbo].[Accommodation]
		 (
		 [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		 )
		 VALUES ('16','Monarch hotel','15','kandy road','kandy','14000','6');

		  
		INSERT INTO 
		 [dbo].[Accommodation]
		 (
		 [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		 )
		 VALUES ('17','haggla resort','99','nuwaraeliya road','nuwaraeliya','40000','8');

		  
		INSERT INTO 
		 [dbo].[Accommodation]
		 (
		 [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		 )
		 VALUES ('18','beruwal resort','13','galle road','beruwala','1100','9');

		 
		INSERT INTO
		  [dbo].[Accommodation]
		  (
		  [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		  )
		 VALUES ('19','peradeniya gardens','16','Kandy road','peradeniya','2000','4');

		 INSERT INTO 
		  [dbo].[Accommodation]
		  (
		  [Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		  )
		 VALUES ('20','Sripada mountain','18','rathnapura road','rathnapura','3000','2');

		 INSERT INTO 
        [dbo].[Accommodation]
	    ( 
		[Accommodation_id],[Accommodation_name],[NO],[Street],[City],[Price],[No_of_people_can_stay]
		)
	     VALUES ('21','diyathalawa','25','nuwaraeliya road','diyathalawa','2500','4');


       



-------------------------------------------------Accommodation_Hotel----------------------------------------------------------------------------------
/* insert into Accommodation_Hotel tabel
		[Accommodation_id]
		[Hotel_code]
		[No_of_rooms]
		[luxury_type]
*/


		INSERT INTO 
		[dbo].[Accommodation_Hotel]
	    (
		[Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		)
	     VALUES ('1','045','2','5');
		

        INSERT INTO
		 [dbo].[Accommodation_Hotel]
		 (
		 [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		 )
		 VALUES ('2','050','5','3');


        INSERT INTO
		 [dbo].[Accommodation_Hotel]
		 (
		 [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		 )
		 VALUES ('3','055','5','7');


        INSERT INTO
		 [dbo].[Accommodation_Hotel]
		 (
		 [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		 )
		 VALUES ('4','062','3','3');

        INSERT INTO 
		[dbo].[Accommodation_Hotel]
		(
		[Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		)
		 VALUES ('5','065','4','3');


		  INSERT INTO 
		  [dbo].[Accommodation_Hotel]
		  (
		  [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		  )
		 VALUES ('6','007','4','5');

		 INSERT INTO 
		 [dbo].[Accommodation_Hotel]
		 (
		 [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		 )
		 VALUES ('7','223','6','5');

		 
        INSERT INTO 
		[dbo].[Accommodation_Hotel]
		(
		[Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		)
		 VALUES ('8','073','2','5');

		 
        INSERT INTO 
		[dbo].[Accommodation_Hotel]
		(
		[Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		)
		 VALUES ('9','013','9','7');

		 
        INSERT INTO 
		[dbo].[Accommodation_Hotel]
		(
		[Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		)
		 VALUES ('10','051','9','5');

		 
        INSERT INTO 
		[dbo].[Accommodation_Hotel]
		(
		[Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		)
		 VALUES ('11','096','1','5');

		 
        INSERT INTO 
		[dbo].[Accommodation_Hotel]
		(
		[Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		)
		 VALUES ('12','143','10','3');

		 
        INSERT INTO
		 [dbo].[Accommodation_Hotel]
		 (
		 [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		 )
		 VALUES ('13','011','4','2');

		  INSERT INTO
		 [dbo].[Accommodation_Hotel]
		 (
		 [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		 )
		 VALUES ('14','466','10','5');

		  INSERT INTO
		 [dbo].[Accommodation_Hotel]
		 (
		 [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		 )
		 VALUES ('15','068','8','3');

		  INSERT INTO
		 [dbo].[Accommodation_Hotel]
		 (
		 [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		 )
		 VALUES ('16','078','3','3');

		  INSERT INTO
		 [dbo].[Accommodation_Hotel]
		 (
		 [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		 )
		 VALUES ('17','333','7','5');

		  INSERT INTO
		 [dbo].[Accommodation_Hotel]
		 (
		 [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		 )
		 VALUES ('18','234','4','5');

		  INSERT INTO
		 [dbo].[Accommodation_Hotel]
		 (
		 [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		 )
		 VALUES ('19','889','9','5');

		  INSERT INTO
		 [dbo].[Accommodation_Hotel]
		 (
		 [Accommodation_id],[Hotel_code],[No_of_rooms],[luxury_type]
		 )
		 VALUES ('20','245','4','5');





		  

------------------------------------------------Accommodation_Room------------------------------------------------------------------------------------
/* insert into Accommodation_Room tabel
		[Accommodation_id]
		[Hotel_code]
		[No_of_rooms]
		[luxury_type]
*/

		INSERT INTO 
		[dbo].[Accommodation_Room]
	    (
		[Accommodation_id],[Room_Type]
		)
	     VALUES ('12','Non A/C');

		 	INSERT INTO 
		[dbo].[Accommodation_Room]
	    (
		[Accommodation_id],[Room_Type]
		)
	     VALUES ('13','A/C');

		 	INSERT INTO 
		[dbo].[Accommodation_Room]
	    (
		[Accommodation_id],[Room_Type]
		)
	     VALUES ('19','A/C');

		 	INSERT INTO 
		[dbo].[Accommodation_Room]
	    (
		[Accommodation_id],[Room_Type]
		)
	     VALUES ('20','A/C');

		 	INSERT INTO 
		[dbo].[Accommodation_Room]
	    (
		[Accommodation_id],[Room_Type]
		)
	     VALUES ('21','Non A/C');




		
		 

      
-----------------------------------------------Places_To_Visit---------------------------------------------------------------------------------------
/* insert into Places_To_Visit tabel
[Place_id]
[Place_name]
*/
        INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('01','Sigiriya');

		 INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('02','Kandy');

		 INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('03','peradeniya');

		 INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('04','dambulla');

         INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('05','galle');

		 INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('06','anuradhapura');

		 INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('07','anuradhapura');

		 INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('08','pinnawala');

		 INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('09','aruganbay');

       

		 INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('10','kumana national park');

         INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('11','yala national park');

		 INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('12','Knuckles montain range');

		 INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('13','Ella Rock');

		  INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('14','Dry zone botanical garden');

		  INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('15','kaneliya');


		  INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('16','Royal Botanical garden');

		  INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('17','hortan plains national park');

		  INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('18','beruwala beach');

		  INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('19','Kithulgala');

		  INSERT INTO
		 [dbo].[Places_To_Visit]
		 (
		 [Place_id],[Place_name]
		 )
		 VALUES ('20','Sripada');



-----------------------------------------------Non_Free_Entrance-------------------------------------------------------------------------------------
/* insert into Non_Free_Entrance tabel
[Place_id]
[Ticket_price]
*/   

        INSERT INTO 
		[dbo].[Non_Free_Entrance]
		(
		[Place_id],[Ticket_price]
		)
		 VALUES ('01','50');

        INSERT INTO 
		[dbo].[Non_Free_Entrance]
		(
		[Place_id],[Ticket_price]
		)
		 VALUES ('03','100');
     
	    INSERT INTO 
		[dbo].[Non_Free_Entrance]
		(
		[Place_id],[Ticket_price]
		)
		 VALUES ('07','50');


        INSERT INTO 
		[dbo].[Non_Free_Entrance]
		(
		[Place_id],[Ticket_price]
		)
		 VALUES ('08','250');


        INSERT INTO 
		[dbo].[Non_Free_Entrance]
		(
		[Place_id],[Ticket_price]
		)
		 VALUES ('10','100');


       INSERT INTO 
		[dbo].[Non_Free_Entrance]
		(
		[Place_id],[Ticket_price]
		)
		 VALUES ('11','100.00');

        INSERT INTO 
		[dbo].[Non_Free_Entrance]
		(
		[Place_id],[Ticket_price]
		)
		 VALUES ('14','150.00');

        INSERT INTO 
		[dbo].[Non_Free_Entrance]
		(
		[Place_id],[Ticket_price]
		)
		 VALUES ('16','250.00');

        INSERT INTO 
		[dbo].[Non_Free_Entrance]
		(
		[Place_id],[Ticket_price]
		)
		 VALUES ('19','150.00');

        INSERT INTO 
		[dbo].[Non_Free_Entrance]
		(
		[Place_id],[Ticket_price]
		)
		 VALUES ('20','150.00');





------------------------------------------------Free_Entrance-------------------------------------------------------------------------------------
/* insert into Non_Free_Entrance tabel
[Place_id]
[Special_rules]
*/
          INSERT INTO 
		 [dbo].[Free_Entrance]
		(
		[Place_id],[Special_rules]
		)
		 VALUES ('02','behave your self'); 

		 INSERT INTO 
		 [dbo].[Free_Entrance]
		(
		[Place_id],[Special_rules]
		)
		 VALUES ('04','No smoking');

		 INSERT INTO 
		 [dbo].[Free_Entrance]
		(
		[Place_id],[Special_rules]
		)
		 VALUES ('05','behave your self ');

		 INSERT INTO 
		 [dbo].[Free_Entrance]
		(
		[Place_id],[Special_rules]
		)
		 VALUES ('09','Do not shout out loud');

		 INSERT INTO 
		 [dbo].[Free_Entrance]
		(
		[Place_id],[Special_rules]
		)
		 VALUES ('11','Do not eat in here');

		  INSERT INTO 
		 [dbo].[Free_Entrance]
		(
		[Place_id],[Special_rules]
		)
		 VALUES ('12','Do not eat in here');

		  INSERT INTO 
		 [dbo].[Free_Entrance]
		(
		[Place_id],[Special_rules]
		)
		 VALUES ('13','Do not leave camp without plenty of water and snacks');

		 INSERT INTO 
		 [dbo].[Free_Entrance]
		(
		[Place_id],[Special_rules]
		)
		 VALUES ('15','Plese behave nice ');
		 
		  INSERT INTO 
		 [dbo].[Free_Entrance]
		(
		[Place_id],[Special_rules]
		)
		 VALUES ('17','protect the natuer ');

		  INSERT INTO 
		 [dbo].[Free_Entrance]
		(
		[Place_id],[Special_rules]
		)
		 VALUES ('18','Plese behave nice ');		


-------------------------------------------------Special_Activities-----------------------------------------------------------------------
/* insert into Special_Activities tabel
		[Special_activity_id]
		[Special_activity_name]
		[Discription]
		[Price]
*/
          INSERT INTO
		   [dbo].[Special_Activities]
		   (
		   [Special_activity_id],[Special_activity_name],[Discription],[Price]
		   )
	    VALUES ('10','Hiking ','Hike before get old','250');

	   INSERT INTO
	    [dbo].[Special_Activities]
		(
		[Special_activity_id],[Special_activity_name],[Discription],[Price]
		)
	    VALUES ('11','Hiking and Trekking','Hike before get old','450');

		INSERT INTO 
		[dbo].[Special_Activities]
		(
		[Special_activity_id],[Special_activity_name],[Discription],[Price]
		)
	    VALUES ('12','Worship Buddha','Be calm and have a relaxed mind','');

	 
	   INSERT INTO
	    [dbo].[Special_Activities]
		(
		[Special_activity_id],[Special_activity_name],[Discription],[Price]
		)
	    VALUES ('13','Diving and Diving Courses','If you love to travel lern to drive','4500');

	   INSERT INTO 
	   [dbo].[Special_Activities]
	   (
	   [Special_activity_id],[Special_activity_name],[Discription],[Price]
	   )
	    VALUES ('14','serfing','go against to the see','');


	   INSERT INTO
	    [dbo].[Special_Activities]
		(
		[Special_activity_id],[Special_activity_name],[Discription],[Price]
		)
	    VALUES ('15','Milk feeding,fruit feeding','care animal world','2500');

	   INSERT INTO
	    [dbo].[Special_Activities]
		(
		[Special_activity_id],[Special_activity_name],[Discription],[Price]
		)
	    VALUES ('16','surfing ,swming','save the border','4500');


	   INSERT INTO
	    [dbo].[Special_Activities]
		(
		[Special_activity_id],[Special_activity_name],[Discription],[Price]
		)
	    VALUES ('17','watching Aciant things ','Acient Goods will protect us','150');

	   INSERT INTO
	    [dbo].[Special_Activities]
		(
		[Special_activity_id],[Special_activity_name],[Discription],[Price]
		)
	    VALUES ('18','Safari','lets fall in love with animals','5000');


	   INSERT INTO 
	   [dbo].[Special_Activities]
	   (
	   [Special_activity_id],[Special_activity_name],[Discription],[Price]
	   )
	    VALUES ('19','Nature visit','Protect  Natuer then natuer will protect us back','500');


		 INSERT INTO 
		 [dbo].[Special_Activities]
		 (
		 [Special_activity_id],[Special_activity_name],[Discription],[Price]
		 )
	    VALUES ('20','water rafting','River Rafting Guide & Splash life jackets.','5500');

		 
    


---------------------------------------------------------Dessert-----------------------------------------------------------------------------------
/* insert into Dessert tabel
		[Dessert_id]
		[Dessert_type]
		[Dessert_name]
*/
        INSERT INTO 
		[dbo].[Dessert]
		(
		[Dessert_id],[Dessert_type],[Dessert_name]
		)
	    VALUES ('01','apple crumble','Apple crisp');

	   INSERT INTO
	    [dbo].[Dessert]
		(
		[Dessert_id],[Dessert_type],[Dessert_name]
		)
	    VALUES ('02','cream custerd','custerd');

	   INSERT INTO
	    [dbo].[Dessert]
		(
		[Dessert_id],[Dessert_type],[Dessert_name]
		)
	    VALUES ('03','cool ice cream','Highland');

	   INSERT INTO 
	   [dbo].[Dessert]
	   (
	   [Dessert_id],[Dessert_type],[Dessert_name]
	   )
	    VALUES ('04','cherry pie ','cherro');

	   INSERT INTO
	    [dbo].[Dessert]
		(
		[Dessert_id],[Dessert_type],[Dessert_name]
		)
	    VALUES ('05','choco chip brownies','lava cake');
 
        INSERT INTO 
		[dbo].[Dessert]
		(
		[Dessert_id],[Dessert_type],[Dessert_name]
		)
	    VALUES ('06','fruits','fruit salad');

	   INSERT INTO
	    [dbo].[Dessert]
		(
		[Dessert_id],[Dessert_type],[Dessert_name]
		)
	    VALUES ('07','cramal puddin','creamy pudding');

	   INSERT INTO
	    [dbo].[Dessert]
		(
		[Dessert_id],[Dessert_type],[Dessert_name]
		)
	    VALUES ('08','chocolate caramal','choco caramal');

	   INSERT INTO
	    [dbo].[Dessert]
		(
		[Dessert_id],[Dessert_type],[Dessert_name]
		)
	    VALUES ('09','bread pudding','breadoo');

	   INSERT INTO
	    [dbo].[Dessert]
		(
		[Dessert_id],[Dessert_type],[Dessert_name]
		)
	    VALUES ('10','fruit triple','fruty');
---------------------------------------------------------Liquor----------------------------------------------------------------------------
 /* insert into Liquor tabel
		[Liquor_id]
		[Liquor_type]
		[Liquor_name]
*/     
        INSERT INTO 
        [dbo].[Liquor]
		(
		[Liquor_id],[Liquor_type],[Liquor_name]
		)
	    VALUES ('001','starters','shampain ');

	   INSERT INTO
	    [dbo].[Liquor]
		(
		[Liquor_id],[Liquor_type],[Liquor_name]
		)
	    VALUES ('002','starters','whisky');

	   INSERT INTO
	    [dbo].[Liquor]
		(
		[Liquor_id],[Liquor_type],[Liquor_name]
		)
	    VALUES ('003','dark alcohol','brandy');
		
	   INSERT INTO
	    [dbo].[Liquor]
		(
		[Liquor_id],[Liquor_type],[Liquor_name]
		)
	    VALUES ('004','cocktail','gin');

	   INSERT INTO
	    [dbo].[Liquor]
		(
		[Liquor_id],[Liquor_type],[Liquor_name]
		)
	    VALUES ('005','healthy','osake');


       INSERT INTO
	    [dbo].[Liquor]
		(
		[Liquor_id],[Liquor_type],[Liquor_name]
		)
	    VALUES ('006','alcoholic beverages','beer');


	   INSERT INTO 
	   [dbo].[Liquor]
	   (
	   [Liquor_id],[Liquor_type],[Liquor_name]
	   )
	    VALUES ('007','alcoholic beverages','red lable');


	   INSERT INTO
	    [dbo].[Liquor]
		(
		[Liquor_id],[Liquor_type],[Liquor_name]
		)
	    VALUES ('008','alcoholic beverages','black lable');

	   INSERT INTO 
	   [dbo].[Liquor]
	   (
	   [Liquor_id],[Liquor_type],[Liquor_name]
	   )
	    VALUES ('009','alcohol free','vine');
		
	   INSERT INTO
	    [dbo].[Liquor]
		(
		[Liquor_id],[Liquor_type],[Liquor_name]
		)
	    VALUES ('010','alcoholic beverages','vodka');


      

-----------------------------------------------------------Meals-------------------------------------------------------------------------
/* insert into Meals tabel
		[Meal_id]
		[Meal_catragory]
		[No_of_calories]
		[Suger_level]
		[Dessert_id]
		[Liquor_id]
*/
      

	    INSERT INTO
		 [dbo].[Meals]
		 (
		 [Meal_id],[Meal_catragory],[No_of_calories],[Suger_level],[Dessert_id],[Liquor_id]
		 )
	   VALUES ('101','Lunch','80','high','02','006');

       INSERT INTO
		 [dbo].[Meals]
		 (
		 [Meal_id],[Meal_catragory],[No_of_calories],[Suger_level],[Dessert_id],[Liquor_id]
		 )
	   VALUES ('102','Dinner','70','medium','03','010');

	      INSERT INTO
		 [dbo].[Meals]
		 (
		 [Meal_id],[Meal_catragory],[No_of_calories],[Suger_level],[Dessert_id],[Liquor_id]
		 )
	   VALUES ('103','morning meal','88','low','04','009');

	      INSERT INTO
		 [dbo].[Meals]
		 (
		 [Meal_id],[Meal_catragory],[No_of_calories],[Suger_level],[Dessert_id],[Liquor_id]
		 )
	   VALUES ('104','cocktail','90','medium','06','002');

	      INSERT INTO
		 [dbo].[Meals]
		 (
		 [Meal_id],[Meal_catragory],[No_of_calories],[Suger_level],[Dessert_id],[Liquor_id]
		 )
	   VALUES ('105','teatime','50','low','07','005');

	      INSERT INTO
		 [dbo].[Meals]
		 (
		 [Meal_id],[Meal_catragory],[No_of_calories],[Suger_level],[Dessert_id],[Liquor_id]
		 )
	   VALUES ('106','weekend buffet','100','high','10','008');

----------------------------------------------------Transportation_medium--------------------------------------------------------------------
/* insert into Transportation_medium tabel
		[Registation_number]
		[Model]
		[Vechile_Year]
		[Vechile_rate]
		[Transmission_type]
		[Last_insurance_date]
		[Last_service_date]
		[Next_service_date]
		[Color_basic]
*/
     
      INSERT INTO
	   [dbo].[Transportation_medium]
	   (
	   [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	   )
	  VALUES ('11011','HILUX','2003','65,000','cash','2010-09-13','2017-10-11','2017-03-21','white');

	 INSERT INTO 
	 [dbo].[Transportation_medium]
	 (
	 [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	 )
	  VALUES ('12234','TATA','2005','34000','loan','2011-08-22','2017-12-19','2017-04-19','white');

	 INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	  VALUES ('19765','CARVAN','2010',' 20000','cash','2010-06-11','2017-11-19','2017-03-12','gray');
	
	 INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	  VALUES ('19098','Ashok Leyland','2002','15000','cash','2015-11-03','2017-02-02','2017-06-02','white');

	 INSERT INTO 
	 [dbo].[Transportation_medium]
	 (
	 [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	 )
	  VALUES ('10752','Ashok Leyland','2007','23000','cash','2014-07-05','2018-01-07','2017-06-07','white');

	 INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	   VALUES ('74368','Fit','2005','10000','cash','2013-09-26','2017-01-14','2017-06-04','blue');

	 INSERT INTO 
	 [dbo].[Transportation_medium]
	 (
	 [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	 )
	  VALUES ('96356','Aqua','2005','20000','cash','2013-10-17','2017-08-15','2017-11-30','black');

	 
	 INSERT INTO 
	 [dbo].[Transportation_medium]
	 (
	 [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	 )
	  VALUES ('46324','Ashok Leyland','2013','24000','cash','2016-12-09','2017-08-21','2018-01-12','white');

	 INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	  VALUES ('25743','HONDA VEZEL','2015','18000','cash','2015-09-13','2017-04-30','2017-12-15','black');

	  INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	  VALUES ('12903','CIVIC','2010','14000','cash','2010-09-19','2017-7-29','2018-02-22','red');

	  INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	  VALUES ('56092','Discovery','2015','20000','cash','2015-11-30','2017-9-28','2018-08-22','white');

	    INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	  VALUES ('65443','rexton','2015','18000','cash','2014-01-23','2017-11-23','2019-10-22','blue');

	     INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	  VALUES ('00842','land rover','2016','20000','cash','2016-01-23','2017-09-2','2018-10-22','black');

	     INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	  VALUES ('00123','MICRO','2000','43000','cash','2010-1-31','2016-11-23','2017-01-22','white');

	     INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	  VALUES ('12345','land cruser','2013','28000','cash','2012-04-24','2017-3-13','2018-3-12','blue');

	     INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	  VALUES ('98707','Defender','1995','30000','cash','2015-05-06','2016-07-07','2019-07-22','black');

	     INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	  VALUES ('32890','4weelcab','2003','21000','cash','2016-01-23','2017-04-15','2018-04-14','red');

	     INSERT INTO
	  [dbo].[Transportation_medium]
	  (
	  [Registation_number],[Model],[Vechile_Year],[Vechile_rate],[Transmission_type],[Last_insurance_date],[Last_service_date],[Next_service_date],[Color_basic]
	  )
	  VALUES ('12983','hybrid','2009','10000','cash','2017-01-23','2017-12-23','2018-10-22','yellow');







-------------------------------------------Car------------------------------------------------------------------------------------------------------------------------------------------------
/* insert into Car tabel
		[Registation_number]
		[No_of_doors]
		[Car_type]
		[Size]
*/
       INSERT INTO 
	   [dbo].[Car]
	   (
	   [Registation_number],[No_of_doors],[Car_type],[Size]
	   )
	  VALUES ('74368','4','tour','large');

	 INSERT INTO
	  [dbo].[Car]
	  (
	  [Registation_number],[No_of_doors],[Car_type],[Size]
	  )
	  VALUES ('12903','4','tour','small');

	 INSERT INTO 
	 [dbo].[Car]
	 (
	 [Registation_number],[No_of_doors],[Car_type],[Size]
	 )
	  VALUES ('00123','2','sport','small');

	 INSERT INTO
	  [dbo].[Car]
	  (
	  [Registation_number],[No_of_doors],[Car_type],[Size]
	  )
	  VALUES ('12983','4','regular','very large');

	  INSERT INTO
	  [dbo].[Car]
	  (
	  [Registation_number],[No_of_doors],[Car_type],[Size]
	  )
	  VALUES ('96356','4','regular','very large');
     

---------------------------------------------Van---------------------------------------------------------------------------------------------------
/* insert into Van tabel
		[Registation_number]
		[Van_type]
*/
           
     INSERT INTO 
	 [dbo].[Van]
	 (
	 [Registation_number],[Van_type]
	 )
	  VALUES ('19765','high roof');

	 INSERT INTO 
	 [dbo].[Van]
	 (
	 [Registation_number],[Van_type]
	 )
	  VALUES ('11011',' high roof');




-----------------------------------------------------------Jeep----------------------------------------------------------------------------------
/* insert into Jeep tabel
		[Registation_number]
		[Jeep_type]
*/
        INSERT INTO
		 [dbo].[Jeep]
		 (
		 [Registation_number],[Jeep_type]
		 )
	  VALUES ('25743','luxury');

	  INSERT INTO
		 [dbo].[Jeep]
		 (
		 [Registation_number],[Jeep_type]
		 )
	  VALUES ('56092','luxury');

	  INSERT INTO
		 [dbo].[Jeep]
		 (
		 [Registation_number],[Jeep_type]
		 )
	  VALUES ('00842','hevey');

	  INSERT INTO
		 [dbo].[Jeep]
		 (
		 [Registation_number],[Jeep_type]
		 )
	  VALUES ('12345','strong');

	  INSERT INTO
		 [dbo].[Jeep]
		 (
		 [Registation_number],[Jeep_type]
		 )
	  VALUES ('65443','luxury');

	  INSERT INTO
		 [dbo].[Jeep]
		 (
		 [Registation_number],[Jeep_type]
		 )
	  VALUES ('98707','very strong');

	  INSERT INTO
		 [dbo].[Jeep]
		 (
		 [Registation_number],[Jeep_type]
		 )
	  VALUES ('32890','4weel');

	





        

    


----------------------------------------------------------Bus--------------------------------------------------------------------------------
/* insert into Bus tabel
		[Registation_number]
		[Bus_type]
*/
          INSERT INTO
		   [dbo].[Bus]
		   (
		   [Registation_number],[Bus_type]
		   )
	     VALUES ('12234','coach');

		 INSERT INTO
		   [dbo].[Bus]
		   (
		   [Registation_number],[Bus_type]
		   )
	     VALUES ('19098','transit');


   


----------------------------------------------------------Person-------------------------------------------------------------------------
/* insert into Person tabel
		[Person_id]
		[First_name]
		[Middle_name]
		[Last_name]
		[Nationality]
		[Birthdate]
		[Gender]
*/
          INSERT INTO
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('01','Lakith','Udara','Muthugala','Sri lankan','1995-04-25','m');

	       INSERT INTO 
	       [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('02','Chalana','Kalpitha','Karunarathna','Sri lankan','1995-05-25','m');

	       INSERT INTO 
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('03','Sachin','Nimesh','Nayakkara','Mongoliyan','1995-08-05','m');

	       INSERT INTO 
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('04','Ishari','Anuradha','Jayasooriya','Sri lankan','1995-06-03','f');

	  INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('05','Kushani ','Maleesha','Handunge','Sri lankan','1995-03-25','f');

	 INSERT INTO 
	[dbo].[Person]
	(
	[Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	)
	 VALUES ('06','Virat','Kohli','Singh','Indian','1985-04-15','m');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('07','Anushka','Shetti','Sharma','Indian','1988-11-23','f');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('08','Clark','Super','Kent','Amarican','1956-04-25','m');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('09','Vidura','Supun','Wijayabandara','Sri lankan','1995-05-22','m');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('10','Farique','Mohomad','Maisoor','Sri lankan','1993-07-11','m');


       INSERT INTO
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('11','Nimesha','pasha','perera','Sri lankan','1996-03-28','f');

	       INSERT INTO 
	       [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('12','Naduni','Kaushala','mannapperuma','Sri lankan','1997-12-25','f');

	       INSERT INTO 
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('13','Waruni','Warsha','peris','sri lankan','1993-08-01','f');

	       INSERT INTO 
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('14','tomohiro','miyazaki','Jayasooriya','thai','1990-06-08','m');

	  INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('15','Kushlani; ','nishi','gunathilaka','Sri lankan','1994-03-11','f');

	 INSERT INTO 
	[dbo].[Person]
	(
	[Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	)
	 VALUES ('16','sanath','priyadasun','ranaSingha','Srilankan','1965-09-15','m');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('17','shona','Sinhania','Sharma','Indian','1968-1-23','f');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('18','keneth','nikalodium','kethen','Amarican','1976-04-9','m');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('19','Neal','Rajkumar','Handunge','Sri lankan','1968-08-31','m');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('20','nafeez','Mohomad','Marikkar','Sri lankan','1993-11-11','m');

   INSERT INTO
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('21','Lakish','lukshan','Maruthugala','Sri lankan','1997-12-25','m');

	       INSERT INTO 
	       [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('22','Chulani','mukesh','sinhaniya','indian','1990-6-20','m');

	       INSERT INTO 
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('23','Sachinthani','Nirushika','Nayakkara','srilankan','1995-10-05','f');

	       INSERT INTO 
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('24','Irushari','Anurudhikaa','Jayasinhe','Sri lankan','1993-1-03','f');

	  INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('25','kameshi ','leesha','Hangama','Sri lankan','1985-03-25','f');

	 INSERT INTO 
	[dbo].[Person]
	(
	[Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	)
	 VALUES ('26','Veronika','Kaheli','Singhum','Indian','1965-01-15','m');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('27','mallika','sedara','hetti','srilankan','1969-12-13','f');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('28','akeela','Sheron','kuk','Amarican','1996-12-25','m');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('29','shehara','Supun','akuloma','Sri lankan','1993-08-08','m');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('30','sameer','Mohomad','Makkori','pakisthan','1983-07-11','m');

   INSERT INTO
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('31','nirman','sedara','agalawatta','Sri lankan','1995-09-12','m');

	       INSERT INTO 
	       [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('32','Chinthaka','Kapila','Karunathunga','Sri lankan','1985-05-25','m');

	       INSERT INTO 
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('33','Sachini','Nimesha','Nannari','srilankan','1994-09-01','f');

	       INSERT INTO 
		   [dbo].[Person]
		   (
		   [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
		   )
	 VALUES ('34','Ishan','mohomad','badurdeen','Sri lankan','1992-06-06','m');

	  INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('35','keshali ','nirukia','Handunge','Sri lankan','1995-03-21','f');

	 INSERT INTO 
	[dbo].[Person]
	(
	[Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	)
	 VALUES ('36','shakila','Kohli','Singhaniya','Indian','1995-04-13','m');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('37','Nisha','shakila','hirodya','srilankan','1998-11-23','f');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('38','shanil','Superimium',' akash','srilankan','1996-04-23','m');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('39','dilsha','hasani','kishori','Sri lankan','1992-01-22','m');

	INSERT INTO
	 [dbo].[Person]
	 (
	 [Person_id],[First_name],[Middle_name],[Last_name],[Nationality],[Birthdate],[Gender]
	 )
	 VALUES ('40','nawodya','pamudidni','hettiwtata','Sri lankan','1992-07-12','f');

	
--------------------------------------Person_Address---------------------------------------------------------------------
/* insert into Person_Address tabel
		[Person_id]
		[Number]
		[Street]
		[City]
		[State]
		[Country]
*/
           
	INSERT INTO
	 [dbo].[Person_Address]
	 (
	 [Person_id],[Number],[Street],[City],[State],[Country]
	 )
	 VALUES ('01','432','thilakawila road','horana','western province','sri lanka');

	INSERT INTO
	 [dbo].[Person_Address]
	 (
	 [Person_id],[Number],[Street],[City],[State],[Country]
	 )
	 VALUES ('02','567','aruggoda road','panadra','western province','sri lank');

	INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('03','4372','waduramulla road','bandaragama','western province','sri lank');

	INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('04','632/a','kottawa road','homagama','western province','sri lank');

	INSERT INTO
	 [dbo].[Person_Address]
	 (
	 [Person_id],[Number],[Street],[City],[State],[Country]
	 )
	 VALUES ('05','5662/B','galle road','kottawa','western province','sri lank');

	INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('06','65','panjabi road','dhilli','punjab','india');

	INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('07','43','rajasthan road','rajasthan','rajasthan','india');

	INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('08','560','manhataon road','new york','blackhat','america');

	INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('09','212','kalutara road','kalutara','western province','sri lank');

	INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('10','989','thiyari road','mahanuwara','western province','sri lank');


	 INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('11','134','aloka road','maharagama','western province','sri lanka');

      INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('12','487/19','thalangama north','battaramulla','western province','sri lanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('13','14','bodiya road','thalangama','western province','sri lanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('14','12/1','kiha road','shikihama','western province','thailand');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('15','1/4','dematagoda','wennapuwa','western province','sri lanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('16','12/1','kotte road','rajagiriya','western province','sri lanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('17','134','mariayana road','kashmir','western province','India');
    

	 INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('18','555','newyork rd','new amsterdan','western province','America');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('19','90/4','kotahena road','colombo12','western province','sri lanka');


	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('20','78/9','kolonnwa road','kolonnawa','western province','sri lanka');


	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('21','43/2','creepy road','maharagama','western province','sri lanka');

	   INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('22','12/5','kurikurma road','nepal','western province','india');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('23','12/3','nigambo road','nigambo','western province','sri lanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('24','123/1','kaleniya road','godagama','western province','sri lanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('25','12/5','wkala road','ekala','western province','sri lanka');


	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('26','78/1','nigara road','nepal','western province','india');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('27','879','malgahawatta road','maharagama','western province','sri lanka');


	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('28','1234','alexa road','new town','western province','America');


	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('29','134','nimsari road','meerigama','western province','sri lanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('30','1233','pakshnye road','rappu','western province','pakistan');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('31','114','kahanthota road','maharagama','western province','sri lanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('32','888','sheela road','rathnapura','western province','sri lanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('33','14','galle road','kirulapone','western province','sri lanka');

	 	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('34','31','panadura road','horana','western province','srilanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('35','61','nigi road','thirwkkuram','western province','india');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('36','4/19','galle road','galle','sothern province','sri lanka');



	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('37','134','kurulu uyana  road','meepe','western province','sri lanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('38','','lakshapana road','hanwella','western province','sri lanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('39','','igurana road','ingiriya','western province','sri lanka');

	  INSERT INTO 
	[dbo].[Person_Address]
	(
	[Person_id],[Number],[Street],[City],[State],[Country]
	)
	 VALUES ('40','1/1','nawaloka road','nawaloka','western province','sri lanka');
----------------------------------------------------------Person_Telephone_Number------------------------------------------------------------
/* insert into Person_Telephone_Number tabel
		[Person_id]
		[Telephone_number]
*/

       
	  INSERT INTO
	   [dbo].[Person_Telephone_Number]
	   (
	   [Person_id],[Telephone_number]
	   )
	 VALUES ('01','0711234567');

	INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('02','0775955050');

	INSERT INTO
	 [dbo].[Person_Telephone_Number]
	 (
	 [Person_id],[Telephone_number]
	 )
	 VALUES ('03','0756686944');

	INSERT INTO
	 [dbo].[Person_Telephone_Number]
	 (
	 [Person_id],[Telephone_number]
	 )
	 VALUES ('04','0775497479');

	INSERT INTO
	 [dbo].[Person_Telephone_Number]
	 (
	 [Person_id],[Telephone_number]
	 )
	 VALUES ('05','0704389375');

	INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('06','0715958744');

	INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('07','0775444532');

	 INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('07','01123434554');

	INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('08','0786655421');

	INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('09','0755767757');

	 	INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('09','0112790467');

	INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('10','0786557756');

	 INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('10','0705665566');

	 
	 INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('11','0705669076');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('11','0756907017');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('12','0716382077');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('13','0770776017');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('14','0772924670');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('14','0112885767');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('15','0708659100');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('16','0756907818');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('16','0117692592');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('17','0764567890');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('17','076613875');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('18','071638790');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('19','0712389006');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('20','0713689780');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('21','0712345678');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('21','0116789273');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('22','0770776923');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('23','0769156091');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('23','0309781123');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('24','0712345680');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('24','0715628299');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('25','0773932077');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('26','0756181910');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('27','0705669076');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('28','075698016');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('29','0717892690');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('30','0778920891');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('31','0701231234');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('32','0771122330');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('33','0033778899');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('34','0719906677');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('35','0715969076');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('36','0775669076');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('37','0765669076');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('38','0705089076');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('39','07056690091');

	  INSERT INTO 
	[dbo].[Person_Telephone_Number]
	(
	[Person_id],[Telephone_number]
	)
	 VALUES ('40','0778891234');





-----------------------------------------Person_Fax_Number--------------------------------------------------------------------
/* insert into Person_Fax_Number tabel
		[Person_id]
		[Fax_number]
*/

   INSERT INTO
    [dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('01','02156783');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('02','02188976');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('03','02172342');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('04','02157543');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('05','02132288');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('06','02199634');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('07','02156754');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('08','02187326');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('09','02198565');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('10','02188843');

	 INSERT INTO
    [dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('11','0215356');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('12','0218971');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('13','02172344');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('14','02157545');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('15','02132299');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('16','02199631');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('17','02156756');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('18','02187329');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('19','02198562');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('20','02188847');

	 INSERT INTO
    [dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('21','02159783');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('22','02188977');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('23','02172341');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('24','02157541');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('25','02132289');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('26','02199630');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('27','02156758');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('28','02187316');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('29','02298565');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('30','02198843');

	 INSERT INTO
    [dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('31','02156785');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('32','02182976');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('33','02172292');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('34','02857543');

	INSERT INTO 
	[dbo].[Person_Fax_Number]
	(
	[Person_id],[Fax_number]
	)
	 VALUES ('35','02139288');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('36','02199234');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('37','02150754');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('38','02197326');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('39','02198575');

	INSERT INTO
	 [dbo].[Person_Fax_Number]
	 (
	 [Person_id],[Fax_number]
	 )
	 VALUES ('40','02188943');


	
--------------------------------------Person_Email----------------------------------------------------------------------
/* insert into Person_Email tabel
		[Person_id]
		[Email]
*/
           
     INSERT INTO
	  [dbo].[Person_Email]
	  (
	  [Person_id],[Email]
	  )
     VALUES ('01','Lakithmuthugala1995@gmailcom');

    INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('02','chalanakalpitha72@gmailcom');

    INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('03','sachinnanayakkara99@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('04','isharijayasooriya@gmailcom');

	INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('05','kushanimaleesha45@gmailcom');

	INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('06','virathkholi32@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('07','anushkasharma1234@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('08','superman3344@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('09','vidurasupun1995@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('10','maisurfarque7776@gmailcom');

	    INSERT INTO
	  [dbo].[Person_Email]
	  (
	  [Person_id],[Email]
	  )
     VALUES ('11','nimesha95@gmailcom');

    INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('12','naduni22@gmailcom');

    INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('13','waruni99@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('14','tomohiroa@gmailcom');

	INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('15','kushlani5@gmailcom');

	INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('16','shona092@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('17','sana1234@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('18','keneth3344@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('19','neal1995@gmailcom');

	    INSERT INTO
	  [dbo].[Person_Email]
	  (
	  [Person_id],[Email]
	  )
     VALUES ('20','nafeex5@gmailcom');

    INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('21','lakish092@gmailcom');

    INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('22','chulani90@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('23','sachinthani2@gmailcom');

	INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('24','irushari95@gmailcom');

	INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('25','kameshi02@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('26','veronika34@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('27','mallika44@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('28','5akeel@gmailcom');

	 INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('29','sheharata@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('30','sameer76@gmailcom');


	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('31','6nirman@gmailcom');

	    INSERT INTO
	  [dbo].[Person_Email]
	  (
	  [Person_id],[Email]
	  )
     VALUES ('32','chinthaka22@gmailcom');

    INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('33','sachinipitha72@gmailcom');

    INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('34','ishani99@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('35','shakila12@gmailcom');

	INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('36','vasci05@gmailcom');

	INSERT INTO
	 [dbo].[Person_Email]
	 (
	 [Person_id],[Email]
	 )
	 VALUES ('37','shamil132@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('38','dilsha34@gmailcom');

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('39','navodya44@gmailcom');

	

	INSERT INTO 
	[dbo].[Person_Email]
	(
	[Person_id],[Email]
	)
	 VALUES ('40','shishi776@gmailcom');


	  

-----------------------------------------Consumer----------------------------------------------------------------------
/* insert into Consumer tabel
[Consumer_id]
[Additional_contact_person_name]
[Additional_contact_person_number]
[Consumer_status]
[Special_intersrts]
*/
         INSERT INTO 
		 [dbo].[Consumer]
		 (
		 [Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
		 )
	 VALUES ('01','Kanchana','0772387656','old customer','adventures tours');

	INSERT INTO
	 [dbo].[Consumer]
	 (
	 [Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	 )
	 VALUES ('06','Mahendra','0112387656','new customer',' ayurvedic tour');

	INSERT INTO
	 [dbo].[Consumer]
	 (
	 [Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	 )
	 VALUES ('07','Deepika','0752334656','new customer','ayurvedic tour');

	INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
	 VALUES ('08','Dayana','0342387677','current customer','adventures tour');

    	INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
	 VALUES ('09','kanchnari','0772387657',' old customer','adventures tour');
    
		INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
	 VALUES ('14','kathyana','0772387756',' new customer','adventures tour');
    
		INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
	 VALUES ('17','hironthi','0712344567',' old customer','country tour');

	 	INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
	 VALUES ('18','ramesha','0712344567',' current customer','country tour');

	 
	 	INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
	 VALUES ('22','shisha','071235567',' current customer','city tour');

	 
	 	INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
	 VALUES ('26','chamini','0712009467',' old customer','ayurvedic tour');


	 
	 	INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
	 VALUES ('28','keshaki','0778909567',' current customer','country tour');

	 
	 	INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
	 VALUES ('30','anoma','0772726670',' new customer','ayurvedic tour');

	 
	 	INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
	 VALUES ('31','heshan','0710094567','old customer','adventures tour');

	 
	 	INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
	 VALUES ('32','akesshi','0710934567',' current customer','country tour');

	 
	 	INSERT INTO 
	[dbo].[Consumer]
	(
	[Consumer_id],[Additional_contact_person_name],[Additional_contact_person_number],[Consumer_status],[Special_intersrts]
	)
	 VALUES ('36','wageesha','076789023',' new customer','city tour');

	 
--------------------------------------------------Employee----------------------------------------------------------------------
/* insert into Employee tabel
[Employee_id]
[EPF_number]
[ETF_number]
[Job_role]
[Date_hired]
[Bank_account_number]
[Educational_level]
[Working_history]
*/
         INSERT INTO
		  [dbo].[Employee]
		  (
		  [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
		  )
	    VALUES ('02','845','476','Manager','2013-01-10','354567686765','degree holder','it manager');

	INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('03','853','483','Manager','2012-03-20','364666542234','degree holder','genaral manager');

	INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('04','860','491','Tour guide','2000-04-9','355795875557','advance level','');

	INSERT INTO 
	[dbo].[Employee]
	(
	[Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	)
	 VALUES ('05','862','493','Tour guide','2017-06-19','375495754334','advance level','');

	INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('10','790','511','Driver','2015-09-6','356846868466','advance level ','driving');

	INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('11','799','599','tour guid','2016-10-6','35112368466','advance level ','language director');

   INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('12','198','971','tour guid','2013-09-6','990046868466','advance level ','tour guide');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('13','786','019','tour guide','2011-12-16','123467890987','ordinary level ','tour guide');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('15','111','222','manager','2013-09-7','111234445556','degree ','managing director');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('16','222','333','driver','2000-11-16','11113468466','advance level ','driver');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('19','444','555','manager','2000-12-26','112233448466','degree ','hr manager');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('20','888','991','driver','2017-02-16','351234566466','advance level ','');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('21','239','131','tour guid','2015-11-17','25456768466','advance level ','language director');


      INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('23','777','114','tour guid','2013-11-23','32233445566','advance level ','language director');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('24','350','531','tour guid','2014-03-22','009916868466','advance level ','language director');
      
	  INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('25','372','961','tour guid','2016-12-6','351122266','advance level ','language director');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('27','122','211','tour guid','2017-2-6','314790868466','advance level ','language director');

      INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('29','128','931','manager','2014-01-4','35009898776','degree ','manager director');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('33','1001','5111','driver','2012-03-26','1122336868466','advance level ','');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('34','1002','1111','driver','2012-03-26','1778836868466','advance level ','');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('35','1003','5511','driver','2016-3-26','100986868466','advance level ','driver');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('37','1004','8811','driver','2011-12-14','1998876868466','advance level ','');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('38','1005','7711','driver','2015-06-16','1122336899006','advance level ','');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('39','1006','3331','driver','2017-03-22','199116868466','advance level ','driver');

	 INSERT INTO
	 [dbo].[Employee]
	 (
	 [Employee_id],[EPF_number],[ETF_number],[Job_role],[Date_hired],[Bank_account_number],[Educational_level],[Working_history]
	 )
	 VALUES ('40','1007','2222','driver','2010-01-26','1556666868466','advance level ','');







------------------------------------------[Dependent]-----------------------------------------------------------------------------------------------
/* insert into [Dependent] tabel
		[Employee_id]
		[First_name]
		[Middle_name]
		[Last_name]
		[Relationship]
		[Telephone_number]
		[Email]
*/      

       	
   INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('02','Hansi','Yapa','Abewardhana','wife','0703452171','hansiyapa234@gmail.com');


   INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('03','Pamudi','Subhasha','Hadunneththige','wife','0112452171','pamudisubhaha@gmail.com');


   INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('04','visura','Nirman','Abesooriya','son','0712365411','isharijayasooriya@gmailcom');


   INSERT INTO
    [dbo].[Dependent]
	(
	[Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
	)
    VALUES ('05','Sandun','Nimsara','Rajapaksha','husbond','0342262011','sandunnimsara22@gmail.com');


   INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('10','Shashika','Nisansala','Perea','wife','0762347650','shashikanisansala@gmail.com');

	
   INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('11','Shanika','sansala','Peris','mother','0762368050','shanisansala@gmail.com');

	
   INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('12','dumidu','lakshan','Perea','father','0713589650','dumiduperera@gmail.com');
	
	
   INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('13','dushen','vihanga',' ','wife','0762347650','shashikanisansala@gmail.com');


	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('15','dulshan','hansa',' ','brother','0712347650','dulshanhansa@gmail.com');

	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('16','weransa','ganga',' ','wife','0762300990','weransaganga@gmail.com');

	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('19','hiral','kamla',' ','father','0712347650','hiralkamla@gmail.com');

	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('20','laila','kumuduni',' ','mother','0712347650','lalilakumuduni@gmail.com');


	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('21','rushani','kiyanga',' nimmi','mother','07123347650','rushanikiyanga@gmail.com');

	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('29','lakshi','kumari',' ','mother','0790747650','lakshikumari@gmail.com');

	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('33','amal','perera',' ','mother','0762399650','amalperera@gmail.com');

	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('34','sisaa','kasuni',' ','mother','0762121230','sisakasuni@gmail.com');

	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('35','malinda','madunga',' ','father','0762112250','malindamadunga@gmail.com');

	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('37','kamal','hasan',' ','father','071237650','kamalhasan@gmail.com');

	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('38','chammi','palehawadan',' ','father','0778347650','chammiyaa@gmail.com');

	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('39','susantha','wikramarachchi',' ','husband','0709947650','susantha@gmail.com');

	 INSERT INTO 
   [dbo].[Dependent]
   (
   [Employee_id],[First_name],[Middle_name],[Last_name],[Relationship],[Telephone_number],[Email]
   )
    VALUES ('40','himasha','thathuria',' ','mother','071237650','hima65a@gmail.com');

-------------------------------------Driver-------------------------------------------------------------------------------
/* insert into Driver tabel
		[Driver_id]
		[Licence_number]
		[Licence_issue_date]
		[Licence_expire_date]
		[Medical_reports]
		[Traffic_rules_disobeying_records]
		[Vechile_catagory]
*/            
             INSERT INTO
             [dbo].[Driver]
			 (
			 [Driver_id],[Licence_number],[Licence_issue_date],[Licence_expire_date],[Medical_reports],[Traffic_rules_disobeying_records],[Vechile_catagory]
			 )
			 VALUES('10','001','2007-03-21','2020-03-21','healthy','no','long vehical');
   
             INSERT INTO
             [dbo].[Driver]
			 (
			 [Driver_id],[Licence_number],[Licence_issue_date],[Licence_expire_date],[Medical_reports],[Traffic_rules_disobeying_records],[Vechile_catagory]
			 )
			 VALUES('16','002','2010-06-1','2030-06-1','healthy','no','small vehical');
   
             INSERT INTO
             [dbo].[Driver]
			 (
			 [Driver_id],[Licence_number],[Licence_issue_date],[Licence_expire_date],[Medical_reports],[Traffic_rules_disobeying_records],[Vechile_catagory]
			 )
			 VALUES('33','003','2014-09-2','2024-09-2','healthy','no','long vehical');
              
             INSERT INTO
             [dbo].[Driver]
			 (
			 [Driver_id],[Licence_number],[Licence_issue_date],[Licence_expire_date],[Medical_reports],[Traffic_rules_disobeying_records],[Vechile_catagory]
			 )
			 VALUES('20','004','2012-05-16','2022-05-14','healthy','no','two weel');
   
             INSERT INTO
             [dbo].[Driver]
			 (
			 [Driver_id],[Licence_number],[Licence_issue_date],[Licence_expire_date],[Medical_reports],[Traffic_rules_disobeying_records],[Vechile_catagory]
			 )
			 VALUES('34','005','2015-09-21','2025-09-21','sugar','no','long vehical');
             
			 INSERT INTO
             [dbo].[Driver]
			 (
			 [Driver_id],[Licence_number],[Licence_issue_date],[Licence_expire_date],[Medical_reports],[Traffic_rules_disobeying_records],[Vechile_catagory]
			 )
			 VALUES('35','006','2006-08-2','2026-08-2','healthy','no','long vehical');
   
             INSERT INTO
             [dbo].[Driver]
			 (
			 [Driver_id],[Licence_number],[Licence_issue_date],[Licence_expire_date],[Medical_reports],[Traffic_rules_disobeying_records],[Vechile_catagory]
			 )
			 VALUES('37','007','2016-07-7','2026-7-17','healthy','no','long vehical');
                 
              INSERT INTO
             [dbo].[Driver]
			 (
			 [Driver_id],[Licence_number],[Licence_issue_date],[Licence_expire_date],[Medical_reports],[Traffic_rules_disobeying_records],[Vechile_catagory]
			 )
			 VALUES('38','008','2007-05-28','2027-05-28','healthy','no','long vehical');
             
			INSERT INTO
             [dbo].[Driver]
			 (
			 [Driver_id],[Licence_number],[Licence_issue_date],[Licence_expire_date],[Medical_reports],[Traffic_rules_disobeying_records],[Vechile_catagory]
			 )
			 VALUES('39','009','2016-10-27','2026-10-27','healthy','no','long vehical');
              
			INSERT INTO
             [dbo].[Driver]
			 (
			 [Driver_id],[Licence_number],[Licence_issue_date],[Licence_expire_date],[Medical_reports],[Traffic_rules_disobeying_records],[Vechile_catagory]
			 )
			 VALUES('40','010','2012-12-21','2030-12-21','healthy','no','long vehical');
   






---------------------------------------Driver_Transportation_medium---------------------------------------------------------------------------------------------------
/* insert into Driver_Transportation_medium tabel
		[Driver_id]
		[Registation_number]
*/            
           INSERT INTO
           [dbo].[Driver_Transportation_medium]
		   (
		   [Driver_id],[Registation_number]
		   )
		   VALUES('10','11011');

		  

		   INSERT INTO
           [dbo].[Driver_Transportation_medium]
		   (
		   [Driver_id],[Registation_number]
		   )
		   VALUES('16','12234');

		   INSERT INTO
           [dbo].[Driver_Transportation_medium]
		   (
		   [Driver_id],[Registation_number]
		   )
		   VALUES('20','19098');

		   INSERT INTO
           [dbo].[Driver_Transportation_medium]
		   (
		   [Driver_id],[Registation_number]
		   )
		   VALUES('33','19098');

		   INSERT INTO
           [dbo].[Driver_Transportation_medium]
		   (
		   [Driver_id],[Registation_number]
		   )
		   VALUES('34','10752');

		   INSERT INTO
           [dbo].[Driver_Transportation_medium]
		   (
		   [Driver_id],[Registation_number]
		   )
		   VALUES('35','74368');

		   INSERT INTO
           [dbo].[Driver_Transportation_medium]
		   (
		   [Driver_id],[Registation_number]
		   )
		   VALUES('37','96356');

		   INSERT INTO
           [dbo].[Driver_Transportation_medium]
		   (
		   [Driver_id],[Registation_number]
		   )
		   VALUES('38','46324');

		   INSERT INTO
           [dbo].[Driver_Transportation_medium]
		   (
		   [Driver_id],[Registation_number]
		   )
		   VALUES('39','25743');

		   INSERT INTO
           [dbo].[Driver_Transportation_medium]
		   (
		   [Driver_id],[Registation_number]
		   )
		   VALUES('40','12903');


-------------------------------------------Tour_Guide-------------------------------------------------------------------------------------
/* insert into Tour_Guide tabel
		[Tour_guide_id]
		[Special_skills]
*/     
      INSERT INTO
           [dbo].[Tour_Guide]
		   (
		   [Tour_guide_id],[Special_skills]
		   )
		   VALUES('04','4 language knowledge');
     
	 INSERT INTO
           [dbo].[Tour_Guide]
		   (
		   [Tour_guide_id],[Special_skills]
		   )
		   VALUES('05','3 language knowledge');

		   INSERT INTO
           [dbo].[Tour_Guide]
		   (
		   [Tour_guide_id],[Special_skills]
		   )
		   VALUES('11','expirienced tour guide');

		   INSERT INTO
           [dbo].[Tour_Guide]
		   (
		   [Tour_guide_id],[Special_skills]
		   )
		   VALUES('12','4 language knowledge');

		   INSERT INTO
           [dbo].[Tour_Guide]
		   (
		   [Tour_guide_id],[Special_skills]
		   )
		   VALUES('13','good knowledge');

            INSERT INTO
           [dbo].[Tour_Guide]
		   (
		   [Tour_guide_id],[Special_skills]
		   )
		   VALUES('21','4 language knowledge');

		   INSERT INTO
           [dbo].[Tour_Guide]
		   (
		   [Tour_guide_id],[Special_skills]
		   )
		   VALUES('23','2 language knowledge');

		    INSERT INTO
           [dbo].[Tour_Guide]
		   (
		   [Tour_guide_id],[Special_skills]
		   )
		   VALUES('24','multi language knowledge');

		    INSERT INTO
           [dbo].[Tour_Guide]
		   (
		   [Tour_guide_id],[Special_skills]
		   )
		   VALUES('25','well expirienced');

		    INSERT INTO
           [dbo].[Tour_Guide]
		   (
		   [Tour_guide_id],[Special_skills]
		   )
		   VALUES('27','2 language knowledge');

		  

----------------------------------------Tour_Guide_languages_speak-----------------------------------------------------------
/* insert into Tour_Guide_languages_speak tabel
		[Tour_guide_id]
		[Language]
*/        
         INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('04','sinhala');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('04','english');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('04','tamil');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('04','thai');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('05','japanese');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('05','sinhala');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('05','english');

		 	  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('11','tamil');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('11','thai');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('12','japanese');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('12','sinhala');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('12','english');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('13','sinhala');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('13','english');

		 	  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('13','tamil');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('21','thai'); 
		  
		  
		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('21','sinhala');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('21','english');

		 	  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('21','german');

		 
		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('23','sinhala');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('23','english');

		 	  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('23','tamil');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('24','sinhala');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('24','english');

		 	  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('24','tamil');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('24','russian');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('24','thelingu');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('25','lathin');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('25','french');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('25','chinese');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('27','hindi');

		  INSERT INTO
         [dbo].[Tour_Guide_languages_speak]
          (
		  [Tour_guide_id],[Language]
		  )
         VALUES('27','urudu');
------------------------------------------------Maneger------------------------------------------------------------------------------
/* insert into Maneger tabel
		[Maneger_id]
		[Department]
*/           
            INSERT INTO
            [dbo].[Maneger]
			(
			[Maneger_id],[Department]
			)  
			VALUEs ('02','human dept');

			  INSERT INTO
            [dbo].[Maneger]
			(
			[Maneger_id],[Department]
			)  
			VALUEs ('03','it dept');

			  INSERT INTO
            [dbo].[Maneger]
			(
			[Maneger_id],[Department]
			)  
			VALUEs ('15','genral dept');

			  INSERT INTO
            [dbo].[Maneger]
			(
			[Maneger_id],[Department]
			)  
			VALUEs ('19','oprational dept');

			  INSERT INTO
            [dbo].[Maneger]
			(
			[Maneger_id],[Department]
			)  
			VALUEs ('29','human resorce dept');

---------  -----------------------------Manegement_reports--------------------------------------------------------------------------------
/* insert into Manegement_reports tabel
		[Report_id]
		[Maneger_id]
		[Report_date]
		[Description]
*/
         INSERT INTO
        [dbo].[Manegement_reports]
		(
		[Report_id],[Maneger_id],[Report_date],[Description]
		)
		VALUES ('011','02','2017-06-12','good');
  
      INSERT INTO
        [dbo].[Manegement_reports]
		(
		[Report_id],[Maneger_id],[Report_date],[Description]
		)
		VALUES ('012','03','2017-08-1','good');

		   INSERT INTO
        [dbo].[Manegement_reports]
		(
		[Report_id],[Maneger_id],[Report_date],[Description]
		)
		VALUES ('013','15','2017-10-12','good');

		   INSERT INTO
        [dbo].[Manegement_reports]
		(
		[Report_id],[Maneger_id],[Report_date],[Description]
		)
		VALUES ('014','19','2017-11-21','good');

		   INSERT INTO
        [dbo].[Manegement_reports]
		(
		[Report_id],[Maneger_id],[Report_date],[Description]
		)
		VALUES ('015','29','2017-12-12','good');

-----------------------------------------------  Reservation---------------------------------------------------------
 /*insert into Reservation tabel
		[Reservation_id]
	    [Date_of_reservation] 
		[Discription]
		[Contacted_person_id]
		[Employee_handled]
		*/

		INSERT INTO
        [dbo].[Reservation]
		(
		[Reservation_id],[Date_of_reservation],[Discription],[Contacted_person_id],
		[Employee_handled]
		)
		VALUES ('001','2017-3-10','ayurvedi vacation','01','04');
       
	    INSERT INTO
        [dbo].[Reservation]
		(
		[Reservation_id],[Date_of_reservation],[Discription],[Contacted_person_id],
		[Employee_handled]
		)
		VALUES ('002','2017-10-11','good vacation','06','05');

		INSERT INTO
        [dbo].[Reservation]
		(
		[Reservation_id],[Date_of_reservation],[Discription],[Contacted_person_id],
		[Employee_handled]
		)
		VALUES ('003','2017-11-10','amaizing vacation','07','10');

		INSERT INTO
        [dbo].[Reservation]
		(
		[Reservation_id],[Date_of_reservation],[Discription],[Contacted_person_id],
		[Employee_handled]
		)
		VALUES ('004','2017-12-10','ayurvedi vacation','08','11');

		INSERT INTO
        [dbo].[Reservation]
		(
		[Reservation_id],[Date_of_reservation],[Discription],[Contacted_person_id],
		[Employee_handled]
		)
		VALUES ('005','2017-12-1','healthy vacation','09','12');

		INSERT INTO
        [dbo].[Reservation]
		(
		[Reservation_id],[Date_of_reservation],[Discription],[Contacted_person_id],
		[Employee_handled]
		)
		VALUES ('006','2018-3-10','nice vacation','14','13');

		INSERT INTO
        [dbo].[Reservation]
		(
		[Reservation_id],[Date_of_reservation],[Discription],[Contacted_person_id],
		[Employee_handled]
		)
		VALUES ('007','2018-1-10','educational vacation','17','15');

		INSERT INTO
        [dbo].[Reservation]
		(
		[Reservation_id],[Date_of_reservation],[Discription],[Contacted_person_id],
		[Employee_handled]
		)
		VALUES ('008','2017-12-20','ayurvedi vacation','18','16');

		INSERT INTO
        [dbo].[Reservation]
		(
		[Reservation_id],[Date_of_reservation],[Discription],[Contacted_person_id],
		[Employee_handled]
		)
		VALUES ('009','2018-3-10','luxury vacation','22','20');

		INSERT INTO
        [dbo].[Reservation]
		(
		[Reservation_id],[Date_of_reservation],[Discription],[Contacted_person_id],
		[Employee_handled]
		)
		VALUES ('010','2018-4-10','ayurvedi vacation','26','27');

----------------------------------------------Tour ---------------------------------------
 /* insert into Tour tabel
		[Tour_id]
	    [Start_date]
		[End_date]
		[tour_status]
		[Location_to_pick_up]
		[Location_to_drop]
		[Total_distance]
		[No_of_drivers]
		[No_of_tour_guids]
		[No_of_vechiles]
		[Reservation_id]
		[Tour_pakage_id]
*/     
       INSERT INTO
        [dbo].[Tour]
		(
		[Tour_id],[Start_date],[End_date],[tour_status],
        [Location_to_pick_up],[Location_to_drop],[Total_distance],
        [No_of_drivers],[No_of_tour_guids],[No_of_vechiles],[Reservation_id],
        [Tour_pakage_id]
		)
		VALUES ('100','2017-3-4','2017-5-2','adventuer','colombo','colombo','129',
		         '2','3','3','001','1000');

           INSERT INTO
        [dbo].[Tour]
		(
		[Tour_id],[Start_date],[End_date],[tour_status],
        [Location_to_pick_up],[Location_to_drop],[Total_distance],
        [No_of_drivers],[No_of_tour_guids],[No_of_vechiles],[Reservation_id],
        [Tour_pakage_id]
		)
		VALUES ('101','2017-10-4','2017-12-2','aryuvedic','nigambo','colombo',
		'159', '3','2','2','002','1001');

		    INSERT INTO
        [dbo].[Tour]
		(
		[Tour_id],[Start_date],[End_date],[tour_status],
        [Location_to_pick_up],[Location_to_drop],[Total_distance],
        [No_of_drivers],[No_of_tour_guids],[No_of_vechiles],[Reservation_id],
        [Tour_pakage_id]
		)
		VALUES ('102','2018-3-4','2018-3-10','adventuer','colombo','colombo','139',
		         '2','3','3','002','1002');


           INSERT INTO
        [dbo].[Tour]
		(
		[Tour_id],[Start_date],[End_date],[tour_status],
        [Location_to_pick_up],[Location_to_drop],[Total_distance],
        [No_of_drivers],[No_of_tour_guids],[No_of_vechiles],[Reservation_id],
        [Tour_pakage_id]
		)
		VALUES ('103','2017-10-4','2017-12-12','aryuvedic','boralla','colombo',
		'179', '3','2','2','003','1003');

		           INSERT INTO
        [dbo].[Tour]
		(
		[Tour_id],[Start_date],[End_date],[tour_status],
        [Location_to_pick_up],[Location_to_drop],[Total_distance],
        [No_of_drivers],[No_of_tour_guids],[No_of_vechiles],[Reservation_id],
        [Tour_pakage_id]
		)
		VALUES ('104','2017-10-4','2017-12-2','aryuvedic','colombo','colombo',
		'199', '3','2','2','004','1004');

		           INSERT INTO
        [dbo].[Tour]
		(
		[Tour_id],[Start_date],[End_date],[tour_status],
        [Location_to_pick_up],[Location_to_drop],[Total_distance],
        [No_of_drivers],[No_of_tour_guids],[No_of_vechiles],[Reservation_id],
        [Tour_pakage_id]
		)
		VALUES ('105','2017-10-4','2017-12-2','city','nigambo','colombo',
		'159', '2','2','2','005','1005');

		           INSERT INTO
        [dbo].[Tour]
		(
		[Tour_id],[Start_date],[End_date],[tour_status],
        [Location_to_pick_up],[Location_to_drop],[Total_distance],
        [No_of_drivers],[No_of_tour_guids],[No_of_vechiles],[Reservation_id],
        [Tour_pakage_id]
		)
		VALUES ('106','2017-11-4','2017-12-2','aryuvedic','colombo','colombo',
		'159', '3','2','1','006','1006');

		           INSERT INTO
        [dbo].[Tour]
		(
		[Tour_id],[Start_date],[End_date],[tour_status],
        [Location_to_pick_up],[Location_to_drop],[Total_distance],
        [No_of_drivers],[No_of_tour_guids],[No_of_vechiles],[Reservation_id],
        [Tour_pakage_id]
		)
		VALUES ('107','2017-12-4','2018-2-2','colombo','colmbo','colombo',
		'179', '3','2','2','007','1007');

		           INSERT INTO
        [dbo].[Tour]
		(
		[Tour_id],[Start_date],[End_date],[tour_status],
        [Location_to_pick_up],[Location_to_drop],[Total_distance],
        [No_of_drivers],[No_of_tour_guids],[No_of_vechiles],[Reservation_id],
        [Tour_pakage_id]
		)
		VALUES ('108','2017-11-4','2017-12-2','aryuvedic','nigambo','colombo',
		'189', '3','2','2','008','1008');

		           INSERT INTO
        [dbo].[Tour]
		(
		[Tour_id],[Start_date],[End_date],[tour_status],
        [Location_to_pick_up],[Location_to_drop],[Total_distance],
        [No_of_drivers],[No_of_tour_guids],[No_of_vechiles],[Reservation_id],
        [Tour_pakage_id]
		)
		VALUES ('109','2018-04-4','2018-05-2','city tour','colombo','colombo',
		'159', '3','2','2','009','1009');

		           INSERT INTO
        [dbo].[Tour]
		(
		[Tour_id],[Start_date],[End_date],[tour_status],
        [Location_to_pick_up],[Location_to_drop],[Total_distance],
        [No_of_drivers],[No_of_tour_guids],[No_of_vechiles],[Reservation_id],
        [Tour_pakage_id]
		)
		VALUES ('110','2017-10-4','2017-12-2','aryuvedic','matara','colombo',
		'199', '3','2','2','010','1010');

--------------------------------------Contract---------------------------------------------------------
  /* insert into Contract tabel
		[Contract_id]
	    [Contract_type]
		[Pricing_Catogary]
	    [Maximum_people]
		[Minimum_people]
		[Contract_sign_date]
		[Tour_id]
        [Service_provider_id]
		*/

		INSERT INTO
        [dbo].[Contract]
		(
		[Contract_id],[Contract_type],[Pricing_Catogary],[Maximum_people],[Minimum_people],
        [Contract_sign_date],[Tour_id],[Service_provider_id]
		)
		VALUES ('01','breakfast','1300-2000','5','10','2009-12-01','100','001');

		
		INSERT INTO
        [dbo].[Contract]
		(
		[Contract_id],[Contract_type],[Pricing_Catogary],[Maximum_people],[Minimum_people],
        [Contract_sign_date],[Tour_id],[Service_provider_id]
		)
		VALUES ('02','lunch','1800-2000','10','30','2010-1-01','101','002');

		
		INSERT INTO
        [dbo].[Contract]
		(
		[Contract_id],[Contract_type],[Pricing_Catogary],[Maximum_people],[Minimum_people],
        [Contract_sign_date],[Tour_id],[Service_provider_id]
		)
		VALUES ('03','breakfast','1200-2000','8','15','2016-01-07','102','003');
       
	   
		INSERT INTO
        [dbo].[Contract]
		(
		[Contract_id],[Contract_type],[Pricing_Catogary],[Maximum_people],[Minimum_people],
        [Contract_sign_date],[Tour_id],[Service_provider_id]
		)
		VALUES ('04','dinner','1600-2600','15','35','2014-01-09','103','004');

		
		INSERT INTO
        [dbo].[Contract]
		(
		[Contract_id],[Contract_type],[Pricing_Catogary],[Maximum_people],[Minimum_people],
        [Contract_sign_date],[Tour_id],[Service_provider_id]
		)
		VALUES ('05','breakfast','800-1100','5','15','2013-01-07','104','005');

		
		INSERT INTO
        [dbo].[Contract]
		(
		[Contract_id],[Contract_type],[Pricing_Catogary],[Maximum_people],[Minimum_people],
        [Contract_sign_date],[Tour_id],[Service_provider_id]
		)
		VALUES ('06','lunch','2000-4000','20','45','2015-01-15','105','006');

		
		INSERT INTO
        [dbo].[Contract]
		(
		[Contract_id],[Contract_type],[Pricing_Catogary],[Maximum_people],[Minimum_people],
        [Contract_sign_date],[Tour_id],[Service_provider_id]
		)
		VALUES ('07','dinner','4200-5000','10','15','2012-01-09','106','007');

		
		INSERT INTO
        [dbo].[Contract]
		(
		[Contract_id],[Contract_type],[Pricing_Catogary],[Maximum_people],[Minimum_people],
        [Contract_sign_date],[Tour_id],[Service_provider_id]
		)
		VALUES ('08','breakfast','2300-3000','20','50','2016-01-07','107','009');

       
		INSERT INTO
        [dbo].[Contract]
		(
		[Contract_id],[Contract_type],[Pricing_Catogary],[Maximum_people],[Minimum_people],
        [Contract_sign_date],[Tour_id],[Service_provider_id]
		)
		VALUES ('09','lunch','2500-3000','50','100','2014-01-20','108','010');

		
		INSERT INTO
        [dbo].[Contract]
		(
		[Contract_id],[Contract_type],[Pricing_Catogary],[Maximum_people],[Minimum_people],
        [Contract_sign_date],[Tour_id],[Service_provider_id]
		)
		VALUES ('10','dinner','2300-3000','50','100','2016-01-27','109','011');
 
 
 --------------------------------------contract accomadation---------------------------------------------------------
/* insert into Contract_Accommodationtabel
		[Contract_id]
		[Accommodation_id]
		*/

		INSERT INTO
        [dbo].[Contract_Accommodation]
		(
		[Contract_id],[Accommodation_id]
		)
		VALUES('01','1');

		INSERT INTO
        [dbo].[Contract_Accommodation]
		(
		[Contract_id],[Accommodation_id]
		)
		VALUES('02','2');

		INSERT INTO
        [dbo].[Contract_Accommodation]
		(
		[Contract_id],[Accommodation_id]
		)
		VALUES('03','3');

		INSERT INTO
        [dbo].[Contract_Accommodation]
		(
		[Contract_id],[Accommodation_id]
		)
		VALUES('04','4');

		INSERT INTO
        [dbo].[Contract_Accommodation]
		(
		[Contract_id],[Accommodation_id]
		)
		VALUES('05','5');

		INSERT INTO
        [dbo].[Contract_Accommodation]
		(
		[Contract_id],[Accommodation_id]
		)
		VALUES('06','6');

		INSERT INTO
        [dbo].[Contract_Accommodation]
		(
		[Contract_id],[Accommodation_id]
		)
		VALUES('07','7');

		INSERT INTO
        [dbo].[Contract_Accommodation]
		(
		[Contract_id],[Accommodation_id]
		)
		VALUES('08','8');

		INSERT INTO
        [dbo].[Contract_Accommodation]
		(
		[Contract_id],[Accommodation_id]
		)
		VALUES('09','9');

		INSERT INTO
        [dbo].[Contract_Accommodation]
		(
		[Contract_id],[Accommodation_id]
		)
		VALUES('10','10');

 --------------------------------------contract MEAL---------------------------------------------------------
/* insert into Contract_meal tabel
		[Contract_id]
		[Meal_id]
		*/
		
		INSERT INTO
        [dbo].[Contract_Meals]
		(
		[Contract_id],[Meal_id]
		)
		VALUES('01','101');

		INSERT INTO
        [dbo].[Contract_Meals]
		(
		[Contract_id],[Meal_id]
		)
		VALUES('02','101');

		INSERT INTO
        [dbo].[Contract_Meals]
		(
		[Contract_id],[Meal_id]
		)
		VALUES('03','102');

		INSERT INTO
        [dbo].[Contract_Meals]
		(
		[Contract_id],[Meal_id]
		)
		VALUES('04','103');

		INSERT INTO
        [dbo].[Contract_Meals]
		(
		[Contract_id],[Meal_id]
		)
		VALUES('05','104');

		INSERT INTO
        [dbo].[Contract_Meals]
		(
		[Contract_id],[Meal_id]
		)
		VALUES('06','105');

		INSERT INTO
        [dbo].[Contract_Meals]
		(
		[Contract_id],[Meal_id]
		)
		VALUES('07','106');

		INSERT INTO
        [dbo].[Contract_Meals]
		(
		[Contract_id],[Meal_id]
		)
		VALUES('08','106');

		INSERT INTO
        [dbo].[Contract_Meals]
		(
		[Contract_id],[Meal_id]
		)
		VALUES('09','105');

		INSERT INTO
        [dbo].[Contract_Meals]
		(
		[Contract_id],[Meal_id]
		)
		VALUES('10','106');


---------------------------------Tour_Accomadation ---------------------------------------------------------------------------
  /* insert into Tour_Accomadation tabel
		[Tour_id]
	    [Accommodation_id]
*/     
          INSERT INTO
         [dbo].[Tour_Accommodation]
		 (
		 [Tour_id],[Accommodation_id]
		 )
		 VALUES('100','1');

		     INSERT INTO
         [dbo].[Tour_Accommodation]
		 (
		 [Tour_id],[Accommodation_id]
		 )
		 VALUES('101','2');

		     INSERT INTO
         [dbo].[Tour_Accommodation]
		 (
		 [Tour_id],[Accommodation_id]
		 )
		 VALUES('102','3');

		     INSERT INTO
         [dbo].[Tour_Accommodation]
		 (
		 [Tour_id],[Accommodation_id]
		 )
		 VALUES('103','4');

		     INSERT INTO
         [dbo].[Tour_Accommodation]
		 (
		 [Tour_id],[Accommodation_id]
		 )
		 VALUES('105','5');

		     INSERT INTO
         [dbo].[Tour_Accommodation]
		 (
		 [Tour_id],[Accommodation_id]
		 )
		 VALUES('106','6');

		     INSERT INTO
         [dbo].[Tour_Accommodation]
		 (
		 [Tour_id],[Accommodation_id]
		 )
		 VALUES('107','7');

		     INSERT INTO
         [dbo].[Tour_Accommodation]
		 (
		 [Tour_id],[Accommodation_id]
		 )
		 VALUES('108','8');

		     INSERT INTO
         [dbo].[Tour_Accommodation]
		 (
		 [Tour_id],[Accommodation_id]
		 )
		 VALUES('109','9');

		     INSERT INTO
         [dbo].[Tour_Accommodation]
		 (
		 [Tour_id],[Accommodation_id]
		 )
		 VALUES('110','10');


---------------------------------Tour_CONSUMER ---------------------------------------------------------------------------
  /* insert into Tour_CONSUMER tabel
		[Tour_id],[Consumer_id]
*/		    
           INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('100','01');

		    INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('101','06');

		    INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('102','07');

		    INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('103','08');

		    INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('104','09');

		    INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('105','14');

		    INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('106','17');

		    INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('107','18');

		    INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('108','22');

		  INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('109','26');

		  INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('109','22');

		  INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('108','28');

		  INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('110','30');

		  INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('110','31');

		  INSERT INTO
         [dbo].[Tour_Consumer]
		 (
	       [Tour_id],[Consumer_id]
		 )
		 VALUES('110','32');
--------------------------------TOUR DRIVER ---------------------------------------------------------------------------
  /* insert into Tour_DRIVER tabel
		[Tour_id]
        [Driver_id]
        [Allowance]
*/         


        INSERT INTO
         [dbo].[Tour_Driver]
		 (
	       [Tour_id],[Driver_id],[Allowance]
		 )
		 VALUES('100','10','2000');

		 

        INSERT INTO
         [dbo].[Tour_Driver]
		 (
	       [Tour_id],[Driver_id],[Allowance]
		 )
		 VALUES('101','16','5000');

		 

        INSERT INTO
         [dbo].[Tour_Driver]
		 (
	       [Tour_id],[Driver_id],[Allowance]
		 )
		 VALUES('103','20','7999');

		  INSERT INTO
         [dbo].[Tour_Driver]
		 (
	       [Tour_id],[Driver_id],[Allowance]
		 )
		 VALUES('104','33','8700');

		  INSERT INTO
         [dbo].[Tour_Driver]
		 (
	       [Tour_id],[Driver_id],[Allowance]
		 )
		 VALUES('105','34','5654');

		  INSERT INTO
         [dbo].[Tour_Driver]
		 (
	       [Tour_id],[Driver_id],[Allowance]
		 )
		 VALUES('106','35','9000');

		  INSERT INTO
         [dbo].[Tour_Driver]
		 (
	       [Tour_id],[Driver_id],[Allowance]
		 )
		 VALUES('107','37','16400');

		  INSERT INTO
         [dbo].[Tour_Driver]
		 (
	       [Tour_id],[Driver_id],[Allowance]
		 )
		 VALUES('108','38','54345');

		  INSERT INTO
         [dbo].[Tour_Driver]
		 (
	       [Tour_id],[Driver_id],[Allowance]
		 )
		 VALUES('109','39','43453')

		  INSERT INTO
         [dbo].[Tour_Driver]
		 (
	       [Tour_id],[Driver_id],[Allowance]
		 )
		 VALUES('110','40','5656456');


 --------------------------------TOUR MEAL ---------------------------------------------------------------------------
  /* insert into [Tour_Meals] tabel
	[Tour_id]
	[Meal_id]	
*/

     INSERT INTO
         [dbo].[Tour_Meals]
		 (
	       [Tour_id],[Meal_id]
		 )
		 VALUES('100','101');


		   INSERT INTO
         [dbo].[Tour_Meals]
		 (
	       [Tour_id],[Meal_id]
		 )
		 VALUES('101','101');

		    INSERT INTO
         [dbo].[Tour_Meals]
		 (
	       [Tour_id],[Meal_id]
		 )
		 VALUES('102','102');

		    INSERT INTO
         [dbo].[Tour_Meals]
		 (
	       [Tour_id],[Meal_id]
		 )
		 VALUES('103','103');

		    INSERT INTO
         [dbo].[Tour_Meals]
		 (
	       [Tour_id],[Meal_id]
		 )
		 VALUES('104','104');

		    INSERT INTO
         [dbo].[Tour_Meals]
		 (
	       [Tour_id],[Meal_id]
		 )
		 VALUES('105','105');

		    INSERT INTO
         [dbo].[Tour_Meals]
		 (
	       [Tour_id],[Meal_id]
		 )
		 VALUES('106','106');


		    INSERT INTO
         [dbo].[Tour_Meals]
		 (
	       [Tour_id],[Meal_id]
		 )
		 VALUES('108','105');

		    INSERT INTO
         [dbo].[Tour_Meals]
		 (
	       [Tour_id],[Meal_id]
		 )
		 VALUES('109','106');

		    INSERT INTO
         [dbo].[Tour_Meals]
		 (
	       [Tour_id],[Meal_id]
		 )
		 VALUES('110','104');
		 
-----------------------------------Tour_Places_To_Visit ---------------------------------------------------------------------------
  /* insert into Tour_Places_To_Visit tabel
	[Tour_id]
	[Place_id]	
*/   

      
		    INSERT INTO
         [dbo].[Tour_Places_To_Visit]
		 (
	       [Tour_id],[Place_id]
		 )
		 VALUES('100','01');

		 
		    INSERT INTO
         [dbo].[Tour_Places_To_Visit]
		 (
	       [Tour_id],[Place_id]
		 )
		 VALUES('101','02');

		 
		    INSERT INTO
         [dbo].[Tour_Places_To_Visit]
		 (
	       [Tour_id],[Place_id]
		 )
		 VALUES('102','02');

		 
		    INSERT INTO
         [dbo].[Tour_Places_To_Visit]
		 (
	       [Tour_id],[Place_id]
		 )
		 VALUES('103','03');

		 
		    INSERT INTO
         [dbo].[Tour_Places_To_Visit]
		 (
	       [Tour_id],[Place_id]
		 )
		 VALUES('104','04');

		 
		    INSERT INTO
         [dbo].[Tour_Places_To_Visit]
		 (
	       [Tour_id],[Place_id]
		 )
		 VALUES('105','05');

		 
		    INSERT INTO
         [dbo].[Tour_Places_To_Visit]
		 (
	       [Tour_id],[Place_id]
		 )
		 VALUES('106','06');


		 
		    INSERT INTO
         [dbo].[Tour_Places_To_Visit]
		 (
	       [Tour_id],[Place_id]
		 )
		 VALUES('107','07');

		 
		    INSERT INTO
         [dbo].[Tour_Places_To_Visit]
		 (
	       [Tour_id],[Place_id]
		 )
		 VALUES('108','08');

		 
		    INSERT INTO
         [dbo].[Tour_Places_To_Visit]
		 (
	       [Tour_id],[Place_id]
		 )
		 VALUES('109','09');

		 
		    INSERT INTO
         [dbo].[Tour_Places_To_Visit]
		 (
	       [Tour_id],[Place_id]
		 )
		 VALUES('110','10');

-----------------------------------Tour special activities ---------------------------------------------------------------------------
  /* insert into Tour special activites tabel
	[Tour_id]
	[Special_activity_id]
	
*/  


		    INSERT INTO
         [dbo].[Tour_Special_Activities]
		 (
	       [Tour_id],[Special_activity_id]
		 )
		 VALUES('100','10');

		   INSERT INTO
         [dbo].[Tour_Special_Activities]
		 (
	       [Tour_id],[Special_activity_id]
		 )
		 VALUES('101','11');

		   INSERT INTO
         [dbo].[Tour_Special_Activities]
		 (
	       [Tour_id],[Special_activity_id]
		 )
		 VALUES('102','12');

		   INSERT INTO
         [dbo].[Tour_Special_Activities]
		 (
	       [Tour_id],[Special_activity_id]
		 )
		 VALUES('103','13');

		   INSERT INTO
         [dbo].[Tour_Special_Activities]
		 (
	       [Tour_id],[Special_activity_id]
		 )
		 VALUES('104','14');

		   INSERT INTO
         [dbo].[Tour_Special_Activities]
		 (
	       [Tour_id],[Special_activity_id]
		 )
		 VALUES('105','15');

		   INSERT INTO
         [dbo].[Tour_Special_Activities]
		 (
	       [Tour_id],[Special_activity_id]
		 )
		 VALUES('106','16');

		   INSERT INTO
         [dbo].[Tour_Special_Activities]
		 (
	       [Tour_id],[Special_activity_id]
		 )
		 VALUES('107','17');

		   INSERT INTO
         [dbo].[Tour_Special_Activities]
		 (
	       [Tour_id],[Special_activity_id]
		 )
		 VALUES('108','18');

		   INSERT INTO
         [dbo].[Tour_Special_Activities]
		 (
	       [Tour_id],[Special_activity_id]
		 )
		 VALUES('109','19');

		   INSERT INTO
         [dbo].[Tour_Special_Activities]
		 (
	       [Tour_id],[Special_activity_id]
		 )
		 VALUES('110','20');

-----------------------------------Tour guide ---------------------------------------------------------------------------
  /* insert into Tour guide tabel
	[Tour_id]
	[Tour_guide_id]
     [Allowance]
	
*/  
      INSERT INTO
         [dbo].[Tour_Tour_Guide]
		 (
	       [Tour_id],[Tour_guide_id], [Allowance]
		 )
		 VALUES('100','04','5000');

		 INSERT INTO
         [dbo].[Tour_Tour_Guide]
		 (
	       [Tour_id],[Tour_guide_id], [Allowance]
		 )
		 VALUES('101','05','120000');

		 INSERT INTO
         [dbo].[Tour_Tour_Guide]
		 (
	       [Tour_id],[Tour_guide_id], [Allowance]
		 )
		 VALUES('102','11','34777');

		 INSERT INTO
         [dbo].[Tour_Tour_Guide]
		 (
	       [Tour_id],[Tour_guide_id], [Allowance]
		 )
		 VALUES('103','12','89900');

		 INSERT INTO
         [dbo].[Tour_Tour_Guide]
		 (
	       [Tour_id],[Tour_guide_id], [Allowance]
		 )
		 VALUES('104','13','32000');

		 INSERT INTO
         [dbo].[Tour_Tour_Guide]
		 (
	       [Tour_id],[Tour_guide_id], [Allowance]
		 )
		 VALUES('105','21','3322')

		 INSERT INTO
         [dbo].[Tour_Tour_Guide]
		 (
	       [Tour_id],[Tour_guide_id], [Allowance]
		 )
		 VALUES('106','23','58000');

		 INSERT INTO
         [dbo].[Tour_Tour_Guide]
		 (
	       [Tour_id],[Tour_guide_id], [Allowance]
		 )
		 VALUES('107','24','12000');

		 INSERT INTO
         [dbo].[Tour_Tour_Guide]
		 (
	       [Tour_id],[Tour_guide_id], [Allowance]
		 )
		 VALUES('108','25','12000');

		 INSERT INTO
         [dbo].[Tour_Tour_Guide]
		 (
	       [Tour_id],[Tour_guide_id], [Allowance]
		 )
		 VALUES('109','27','12000');

-----------------------------------Tour transport medium ---------------------------------------------------------------------------
  /* insert into Tour transport medium tabel
	[Tour_id]
	[Transportation_medium_id]
	
*/ 		 
        INSERT INTO
         [dbo].[Tour_Transpotation_medium]
		 (
	       [Tour_id],[Transportation_medium_id]
		 )
		 VALUES('100','11011');

		  INSERT INTO
         [dbo].[Tour_Transpotation_medium]
		 (
	       [Tour_id],[Transportation_medium_id]
		 )
		 VALUES('101','12234');

		  INSERT INTO
         [dbo].[Tour_Transpotation_medium]
		 (
	       [Tour_id],[Transportation_medium_id]
		 )
		 VALUES('102','19765');

		  INSERT INTO
         [dbo].[Tour_Transpotation_medium]
		 (
	       [Tour_id],[Transportation_medium_id]
		 )
		 VALUES('103','19098');

		  INSERT INTO
         [dbo].[Tour_Transpotation_medium]
		 (
	       [Tour_id],[Transportation_medium_id]
		 )
		 VALUES('104','10752');

		  INSERT INTO
         [dbo].[Tour_Transpotation_medium]
		 (
	       [Tour_id],[Transportation_medium_id]
		 )
		 VALUES('105','74368');

		  INSERT INTO
         [dbo].[Tour_Transpotation_medium]
		 (
	       [Tour_id],[Transportation_medium_id]
		 )
		 VALUES('106','96356');

		  INSERT INTO
         [dbo].[Tour_Transpotation_medium]
		 (
	       [Tour_id],[Transportation_medium_id]
		 )
		 VALUES('107','46324');

		  INSERT INTO
         [dbo].[Tour_Transpotation_medium]
		 (
	       [Tour_id],[Transportation_medium_id]
		 )
		 VALUES('108','25743');

		  INSERT INTO
         [dbo].[Tour_Transpotation_medium]
		 (
	       [Tour_id],[Transportation_medium_id]
		 )
		 VALUES('109','12903');

--------------------------------------Payment ---------------------------------------------------------------------------
  /* insert into payment tabel
	[Payment_id]
     [Payment_method]
     [Payment_date]
	 [Tour_id]
	[Reservation_id]
	[Consumer_contacted_id]
    [Employee_handled_id]
    [Advance_payment_ammount]
    [Advance_payment_confirmation]
    [Full_payment_ammount]
   [Full_payment_confirmation]



*/ 		 
       INSERT INTO
         [dbo].[Payment] 
		 (
	      [Payment_id],
          [Payment_method],
          [Payment_date],
	      [Tour_id],
	      [Reservation_id],
	       [Consumer_contacted_id],
          [Employee_handled_id],
          [Advance_payment_ammount],
          [Advance_payment_confirmation],
          [Full_payment_ammount],
          [Full_payment_confirmation]
		 )
		 VALUES('10','cash','2017-12-12','100','001','01','02','20000','15000','40000','35000');
         

		 INSERT INTO
         [dbo].[Payment] 
		 (
	      [Payment_id],
          [Payment_method],
          [Payment_date],
	      [Tour_id],
	      [Reservation_id],
	       [Consumer_contacted_id],
          [Employee_handled_id],
          [Advance_payment_ammount],
          [Advance_payment_confirmation],
          [Full_payment_ammount],
          [Full_payment_confirmation]
		 )
		 VALUES('20','cash','2017-12-12','101','002','06','03','20000','15000','40000','35000');

		 INSERT INTO
         [dbo].[Payment] 
		 (
	      [Payment_id],
          [Payment_method],
          [Payment_date],
	      [Tour_id],
	      [Reservation_id],
	       [Consumer_contacted_id],
          [Employee_handled_id],
          [Advance_payment_ammount],
          [Advance_payment_confirmation],
          [Full_payment_ammount],
          [Full_payment_confirmation]
		 )
		 VALUES('30','card','2017-12-12','103','003','07','04','20000','15000','40000','35000');

		 INSERT INTO
         [dbo].[Payment] 
		 (
	      [Payment_id],
          [Payment_method],
          [Payment_date],
	      [Tour_id],
	      [Reservation_id],
	       [Consumer_contacted_id],
          [Employee_handled_id],
          [Advance_payment_ammount],
          [Advance_payment_confirmation],
          [Full_payment_ammount],
          [Full_payment_confirmation]
		 )
		 VALUES('40','cash','2017-12-12','104','004','08','05','20000','15000','40000','35000');

		 INSERT INTO
         [dbo].[Payment] 
		 (
	      [Payment_id],
          [Payment_method],
          [Payment_date],
	      [Tour_id],
	      [Reservation_id],
	       [Consumer_contacted_id],
          [Employee_handled_id],
          [Advance_payment_ammount],
          [Advance_payment_confirmation],
          [Full_payment_ammount],
          [Full_payment_confirmation]
		 )
		 VALUES('50','card','2017-12-12','105','005','09','10','20000','15000','40000','35000');

		 INSERT INTO
         [dbo].[Payment] 
		 (
	      [Payment_id],
          [Payment_method],
          [Payment_date],
	      [Tour_id],
	      [Reservation_id],
	       [Consumer_contacted_id],
          [Employee_handled_id],
          [Advance_payment_ammount],
          [Advance_payment_confirmation],
          [Full_payment_ammount],
          [Full_payment_confirmation]
		 )
		 VALUES('60','cash','2017-12-12','106','006','14','11','20000','15000','40000','35000');

		 INSERT INTO
         [dbo].[Payment] 
		 (
	      [Payment_id],
          [Payment_method],
          [Payment_date],
	      [Tour_id],
	      [Reservation_id],
	       [Consumer_contacted_id],
          [Employee_handled_id],
          [Advance_payment_ammount],
          [Advance_payment_confirmation],
          [Full_payment_ammount],
          [Full_payment_confirmation]
		 )
		 VALUES('70','cash','2017-12-12','107','007','17','12','20000','15000','40000','35000');

		 INSERT INTO
         [dbo].[Payment] 
		 (
	      [Payment_id],
          [Payment_method],
          [Payment_date],
	      [Tour_id],
	      [Reservation_id],
	       [Consumer_contacted_id],
          [Employee_handled_id],
          [Advance_payment_ammount],
          [Advance_payment_confirmation],
          [Full_payment_ammount],
          [Full_payment_confirmation]
		 )
		 VALUES('80','cash','2017-12-12','108','008','18','13','20000','15000','40000','35000');

		 INSERT INTO
         [dbo].[Payment] 
		 (
	      [Payment_id],
          [Payment_method],
          [Payment_date],
	      [Tour_id],
	      [Reservation_id],
	       [Consumer_contacted_id],
          [Employee_handled_id],
          [Advance_payment_ammount],
          [Advance_payment_confirmation],
          [Full_payment_ammount],
          [Full_payment_confirmation]
		 )
		 VALUES('90','cash','2017-12-12','109','009','22','15','20000','15000','40000','35000');

		 INSERT INTO
         [dbo].[Payment] 
		 (
	      [Payment_id],
          [Payment_method],
          [Payment_date],
	      [Tour_id],
	      [Reservation_id],
	       [Consumer_contacted_id],
          [Employee_handled_id],
          [Advance_payment_ammount],
          [Advance_payment_confirmation],
          [Full_payment_ammount],
          [Full_payment_confirmation]
		 )
		 VALUES('100','cash','2017-12-12','110','010','26','20','20000','15000','40000','35000');


--------------------------------------Bill ---------------------------------------------------------------------------
  /* insert into Bill tabel
	[Bill_id]
	[Bill_date]
	[Bill_time]
	[Payment_id]
	
*/ 		 
           INSERT INTO
          [dbo].[Bill]
		 (
	      [Bill_id],[Bill_date],[Bill_time],[Payment_id]
		 )
		 VALUES('111','2017-12-20','3:00:00','10');
		 
		       INSERT INTO
          [dbo].[Bill]
		 (
	      [Bill_id],[Bill_date],[Bill_time],[Payment_id]
		 )
		 VALUES('112','2017-11-20','10:00:00','20');	
		 
		       INSERT INTO
          [dbo].[Bill]
		 (
	      [Bill_id],[Bill_date],[Bill_time],[Payment_id]
		 )
		 VALUES('113','2018-03-20','11:00:00','40');	

		       INSERT INTO
          [dbo].[Bill]
		 (
	      [Bill_id],[Bill_date],[Bill_time],[Payment_id]
		 )
		 VALUES('114','2017-12-20','6:00:00','50');

		       INSERT INTO
          [dbo].[Bill]
		 (
	      [Bill_id],[Bill_date],[Bill_time],[Payment_id]
		 )
		 VALUES('115','2017-11-20','3:00:00','60');

		       INSERT INTO
          [dbo].[Bill]
		 (
	      [Bill_id],[Bill_date],[Bill_time],[Payment_id]
		 )
		 VALUES('116','2017-10-20','2:00:00','70');

		       INSERT INTO
          [dbo].[Bill]
		 (
	      [Bill_id],[Bill_date],[Bill_time],[Payment_id]
		 )
		 VALUES('117','2017-12-20','9:00:00','80');

		       INSERT INTO
          [dbo].[Bill]
		 (
	      [Bill_id],[Bill_date],[Bill_time],[Payment_id]
		 )
		 VALUES('118','2018-4-20','3:00:00','90');

		       INSERT INTO
          [dbo].[Bill]
		 (
	      [Bill_id],[Bill_date],[Bill_time],[Payment_id]
		 )
		 VALUES('119','2017-12-20','7:00:00','100');



