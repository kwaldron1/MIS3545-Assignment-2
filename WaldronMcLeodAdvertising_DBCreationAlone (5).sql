CREATE DATABASE WaldronMcLeodAdvertising_DB;
GO

USE WaldronMcLeodAdvertising_DB;
GO
--Waldron McLeod Advertising Kyle Waldron and Michael McLeod--

CREATE TABLE AccountsDept(
  AccountsEmployeeID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Age bigint NOT NULL,
  YearsOfExperience bigint NOT NULL,
  YearsWithFirm bigint NOT NULL);

CREATE TABLE CreativeDept(
  CreativeEmployeeID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Age varchar(50) NOT NULL,
  YearsOfExperience varchar(50) NOT NULL,
  YearsWithFirm varchar(50) NOT NULL);

CREATE TABLE Projects(
  ProjectID bigint NOT NULL PRIMARY KEY,
  AccountsEmployeeID bigint NOT NULL,
  CreativeEmployeeID bigint NOT NULL,
  ProductID bigint NOT NULL,
  MediaType varchar(50) NOT NULL);

 CREATE TABLE Billings(
  BillID bigint NOT NULL PRIMARY KEY,
  ProjectID bigint NOT NULL,
  Cost bigint NOT NULL,
  Charge bigint NOT NULL);

CREATE TABLE Product(
  ProductID bigint NOT NULL PRIMARY KEY,
  ProductName varchar(50) NOT NULL,
  ClientID bigint);

CREATE TABLE Clients(
  ClientID bigint NOT NULL PRIMARY KEY,
  CompanyName varchar(50) NOT NULL,
  Adress varchar(50) NOT NULL,
  State varchar(50) NOT NULL,
  ZipCode varchar(50) NOT NULL,
  Country varchar(50) NOT NULL,);

-- Create the relationship: the first FK in Project -- 
ALTER TABLE Projects ADD CONSTRAINT FK_Projects_AccountsDept 
FOREIGN KEY (AccountsEmployeeID) REFERENCES AccountsDept(AccountsEmployeeID);
GO

-- Create the relationship: the first FK in Project --
ALTER TABLE Projects ADD CONSTRAINT FK_Projects_CreativeDept 
FOREIGN KEY (CreativeEmployeeID) REFERENCES CreativeDept(CreativeEmployeeID);
GO

-- Create the relationship: the first FK in Project --
ALTER TABLE Projects ADD CONSTRAINT FK_Project_Product 
FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
GO

-- Create the relationship: the first FK in Billings --
ALTER TABLE Billings ADD CONSTRAINT FK_Billings_Projects 
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID);
GO

-- Create the relationship: the first FK in Project --
ALTER TABLE Projects ADD CONSTRAINT FK_Projects_Product 
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);
GO

-- Create the relationship: the first FK in Project --
ALTER TABLE Product ADD CONSTRAINT FK_Product_Clients 
FOREIGN KEY (ClientID) REFERENCES Clients(ClientID);
GO

INSERT INTO AccountsDept(AccountsEmployeeID, FirstName, LastName, Age, YearsOfExperience, YearsWithFirm) VALUES 
(1, 'Jason', 'Miller', 42, 20, 8),
(2, 'Evan', 'Evans', 50, 24, 20),
(3, 'Colleen', 'Kiley', 25, 3, 3),
(4, 'Erica', 'Ericson', 32, 6, 1),
(5, 'Jamie', 'Jamison', 59, 30, 12),
(6, 'Dave', 'Roberts', 60, 40, 30),
(7, 'Nadira', 'James', 33, 4, 4),
(8, 'Eli', 'Levi', 44, 27, 10),
(9, 'Christine', 'Crawford', 29, 5, 1),
(10, 'Chanel', 'Vuitton', 40, 20, 7);

INSERT INTO CreativeDept(CreativeEmployeeID, FirstName, LastName, Age, YearsOfExperience, YearsWithFirm) VALUES 
(99, 'Edison', 'Miller', 37, 17, 8),
(98, 'Bud', 'Jackson', 60, 40, 40),
(97, 'Evan', 'Williams', 22, 1, 1),
(96, 'Daniel', 'Jackson', 30, 8, 2),
(95, 'Edward', 'Jamison', 41, 10, 6),
(94, 'Ruby', 'Morning', 59, 29, 23),
(93, 'Kyra', 'Foster', 52, 12, 12),
(92, 'Leon', 'Busch', 43, 19, 19),
(91, 'Michelle', 'Lob', 30, 5, 2),
(90, 'David', 'Molson', 48, 20, 20);


INSERT INTO Projects(ProjectID, AccountsEmployeeID, CreativeEmployeeID, ProductID, MediaType) VALUES
(101, 1, 99, 11, 'Television'),
(102, 2, 98, 12, 'Magazine'),
(103, 3, 97, 13, 'Radio'),
(104, 4, 96, 14, 'Magazine'),
(105, 5, 95, 15, 'Television'),
(106, 6, 94, 16, 'Television'),
(107, 7, 93, 17, 'Radio'),
(108, 8, 92, 18, 'Magazine'),
(109, 9, 91, 19, 'Television'),
(110, 10, 90, 20, 'Radio');


INSERT INTO Billings(BillID, ProjectID, Cost, Charge) VALUES
(200, 101, 7500, 10000),
(210, 102, 1000, 1700),
(220, 103, 1500, 1900),
(230, 104, 3000, 4200),
(240, 105, 2800, 3600),
(250, 106, 6000, 7300),
(260, 107, 6900, 9600),
(270, 108, 2000, 2500),
(280, 109, 4300, 5100),
(290, 110, 8000, 9800);

INSERT INTO Clients(ClientID, CompanyName, Adress, State, ZipCode, Country) VALUES
(50, 'Adecco', '58 Byffum Rd', 'MA', 02339, 'USA'),
(51, 'Entegee', '151 Fields Rd', 'MA', 02050, 'USA'),
(52, 'Bullhorn', '100 Summer St', 'MA', 02018, 'USA'),
(53, 'Tearbits', '900 Bellevue Ave', 'RI', 02840, 'USA'),
(54, 'BoxerDog', '43 Holla Ave', 'CT', 19850, 'USA'),
(55, 'Chateau Blanche', '1600 Pennsylvania Ave', 'Washington DC', 20500, 'USA'),
(56, 'Dalmation Industries', '12 Gillie Road', 'MA', 02101, 'USA'),
(57, 'Van Der Valk', '8 Andrew Circle', 'NJ', 30958, 'USA'),
(58, 'Dempseys Gym', '14 Bonnie Dr', 'MA', 06549, 'USA'),
(59, 'Marciannos', '678 Donut Circle', 'NH', 03646, 'USA'),
(60, 'Finishing Company', '123 ABC Way', 'VT', 04567, 'USA');


INSERT INTO Product(ProductID, ProductName, ClientID) VALUES
(11, 'Advertisement a', 59),
(12, 'Advertisement b', 58),
(13, 'Advertisement c', 57),
(14, 'Advertisement d', 56),
(15, 'Advertisement e', 55),
(16, 'Advertisement f', 54),
(17, 'Advertisement g', 53),
(18, 'Advertisement h', 52),
(19, 'Advertisement i', 51),
(20, 'Advertisement j', 50);

-- Show Everything--

SELECT * FROM AccountsDept;
SELECT * FROM CreativeDept;
SELECT * FROM Projects;
SELECT * FROM Product;
SELECT * FROM Billings;
SELECT * FROM Clients;

GO
