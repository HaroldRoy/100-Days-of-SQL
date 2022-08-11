/*
Insert a new record in the Customers table.
*/

INSERT INTO Customers (
    CustomerName, 
    Address, 
    City, 
    PostalCode,
    Country
)
VALUES
(
'Hekkan Burger',
'Gateveien 15',
'Sandnes',
'4306',
'Norway'
)
;

/*
Update the City value and the Country value.
*/

UPDATE Customers
SET City = 'Oslo',
    Country = 'Norway'
WHERE CustomerID = 32;

/*
Delete all the records from the Customers table where the Country value is 'Norway'.
*/

DELETE FROM Customers
WHERE Country = 'Norway';