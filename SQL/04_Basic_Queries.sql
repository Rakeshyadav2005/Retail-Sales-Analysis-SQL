USE RetailSalesDB;

-- Query 1
SELECT *
FROM Customers;

-- Query 2
SELECT *
FROM Products;

-- Query 3
SELECT *
FROM Orders;

-- Query 4
SELECT *
FROM Customers
WHERE City = 'Hyderabad';

-- Query 5
SELECT *
FROM Products
WHERE Price > 10000;

-- Query 6
SELECT *
FROM Products
WHERE Price BETWEEN 5000 AND 20000;

-- Query 7
SELECT *
FROM Products
WHERE Category = 'Electronics';

-- Query 8
SELECT *
FROM Customers
WHERE City <> 'Hyderabad';

-- Query 9
SELECT *
FROM Products
ORDER BY Price DESC;

-- Query 10
SELECT *
FROM Products
ORDER BY Price ASC;

-- Query 11
SELECT *
FROM Customers
LIMIT 10;

-- Query 12
SELECT DISTINCT City
FROM Customers;

-- Query 13
SELECT DISTINCT Category
FROM Products;

-- Query 14
SELECT COUNT(*) AS TotalCustomers
FROM Customers;

-- Query 15
SELECT COUNT(*) AS TotalProducts
FROM Products;

-- Query 16
SELECT MAX(Price) AS HighestPrice
FROM Products;

-- Query 17
SELECT MIN(Price) AS LowestPrice
FROM Products;

-- Query 18
SELECT AVG(Price) AS AveragePrice
FROM Products;

-- Query 19
SELECT SUM(Price) AS TotalInventoryValue
FROM Products;

-- Query 20
SELECT *
FROM Customers
WHERE CustomerName LIKE 'A%';