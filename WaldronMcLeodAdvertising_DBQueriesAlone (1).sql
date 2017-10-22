USE WaldronMcLeodAdvertising_DB;
GO
-- Show Everything--

SELECT * FROM AccountsDept;
SELECT * FROM CreativeDept;
SELECT * FROM Projects;
SELECT * FROM Product;
SELECT * FROM Billings;
SELECT * FROM Clients;

GO

-- Show the sum of our current costs and charges --

SELECT Sum(Cost) AS 'total Costs', Sum(Charge) AS 'Total Charges'
from Billings

--Show which accounts employee owns which projects --

Select AccountsDept.AccountsEmployeeID, AccountsDept.FirstName, AccountsDept.LastName, ProjectID, MediaType
from AccountsDept join Projects
on AccountsDept.AccountsEmployeeID = Projects.AccountsEmployeeID

-- Show all Clients that we have had, and if they are currently with us, which products are theirs-- 
SELECT Clients.ClientID, Clients.CompanyName, Product.ProductID
from Clients left outer join Product
on Clients.ClientID = Product.ClientID

--This query needs the left outer join because it is including all clients, regardless of whether or not they have a product with us currently. --

-- Show Clients, Product IDs, Project IDs, and charges for those clients who have charges that are greater than the average charge. --

SELECT Clients.CompanyName, Product.ProductID, Projects.ProjectID, Billings.Charge
FROM Clients join Product
on Clients.ClientID = Product.ClientID
join Projects
on Product.ProductID = Projects.ProductID
join Billings
on Projects.ProjectID = Billings.ProjectID
Where Billings.Charge >
	(Select AVG(Charge)
	From Billings)