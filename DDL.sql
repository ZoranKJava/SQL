/*
   Wednesday, March 27, 201911:44:36 PM
   User: sa
   Server: WIN-L57FOIC8QH3\SQLEXPRESS
   Database: CarRenting
   Application: 
*/

/* 1. Enable full-text search on your SQL Server instance. 
*
*  2. Open the script inside SQL Server Management Studio and enable SQLCMD mode. 
*    This option is in the Query menu.
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
CREATE DATABASE CarRenting
GO

USE CarRenting
GO

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO



CREATE TABLE dbo.Destination
	(
	DestinationID int IDENTITY (1,1) NOT NULL,
	City nvarchar(50) NULL,
	Country nvarchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Destination ADD CONSTRAINT
	PK_Destination PRIMARY KEY CLUSTERED 
	(
	DestinationID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Destination SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Address
	(
	AddressID int IDENTITY (1,1) NOT NULL,
	Street nvarchar(250) NULL,
	StreetNumber int NULL,
	ZipCode int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Address ADD CONSTRAINT
	PK_Address PRIMARY KEY CLUSTERED 
	(
	AddressID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Address SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Employee
	(
	EmployeeID int IDENTITY (1,1) NOT NULL,
	FirstName nvarchar(50) NULL,
	LastName nvarchar(50) NULL,
	AddressID int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Employee ADD CONSTRAINT
	PK_Employee PRIMARY KEY CLUSTERED 
	(
	EmployeeID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Employee ADD CONSTRAINT
	FK_Employee_Address FOREIGN KEY
	(
	AddressID
	) REFERENCES dbo.Address
	(
	AddressID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Employee SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Customer
	(
	CustomerID int IDENTITY (1,1) NOT NULL,
	FirstName nvarchar(50) NULL,
	LastName nvarchar(50) NULL,
	AddressID int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Customer ADD CONSTRAINT
	PK_Customer PRIMARY KEY CLUSTERED 
	(
	CustomerID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Customer ADD CONSTRAINT
	FK_Customer_Address FOREIGN KEY
	(
	AddressID
	) REFERENCES dbo.Address
	(
	AddressID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Customer SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Car
	(
	CarID int IDENTITY (1,1) NOT NULL,
	Brand nvarchar(50) NULL,
	Model nvarchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Car ADD CONSTRAINT
	PK_Car PRIMARY KEY CLUSTERED 
	(
	CarID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Car SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Rented
	(
	RentedID int IDENTITY (1,1) NOT NULL,
	CarID int NULL,
	CustomerID int NULL,
	EmployeeID int NULL,
	DestinationID int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Rented ADD CONSTRAINT
	PK_Rented PRIMARY KEY CLUSTERED 
	(
	RentedID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Rented ADD CONSTRAINT
	FK_Rented_Destination FOREIGN KEY
	(
	DestinationID
	) REFERENCES dbo.Destination
	(
	DestinationID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Rented ADD CONSTRAINT
	FK_Rented_Customer FOREIGN KEY
	(
	CustomerID
	) REFERENCES dbo.Customer
	(
	CustomerID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Rented ADD CONSTRAINT
	FK_Rented_Employee FOREIGN KEY
	(
	EmployeeID
	) REFERENCES dbo.Employee
	(
	EmployeeID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Rented ADD CONSTRAINT
	FK_Rented_Car FOREIGN KEY
	(
	CarID
	) REFERENCES dbo.Car
	(
	CarID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Rented SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
