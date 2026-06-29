USE RetailSalesDB;

-- Query 21

SELECT
    c.CustomerID,
    c.CustomerName,
    p.ProductName,
    o.OrderDate,
    o.Quantity
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID;

-- Query 22

SELECT
    o.OrderID,
    c.CustomerName,
    p.ProductName,
    p.Price,
    o.Quantity,
    p.Price * o.Quantity AS TotalAmount
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
INNER JOIN Products p
ON o.ProductID = p.ProductID;

-- Query 23

SELECT
    CustomerName,
    City
FROM Customers;

-- Query 24

SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName
ORDER BY TotalOrders DESC;

-- Query 25

SELECT
    c.CustomerName,
    SUM(o.Quantity) AS TotalItemsPurchased
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalItemsPurchased DESC;

-- Query 26

SELECT
    p.ProductName,
    SUM(o.Quantity * p.Price) AS Revenue
FROM Products p
INNER JOIN Orders o
ON p.ProductID = o.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC;

-- Query 27

SELECT
    p.ProductName,
    COUNT(o.OrderID) AS NumberOfOrders
FROM Products p
INNER JOIN Orders o
ON p.ProductID = o.ProductID
GROUP BY p.ProductName
ORDER BY NumberOfOrders DESC;

-- Query 28

SELECT
    p.Category,
    SUM(o.Quantity * p.Price) AS Revenue
FROM Products p
INNER JOIN Orders o
ON p.ProductID = o.ProductID
GROUP BY p.Category
ORDER BY Revenue DESC;

-- Query 29

SELECT
    c.CustomerName,
    ROUND(AVG(p.Price * o.Quantity),2) AS AverageOrderValue
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN Products p
ON o.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY AverageOrderValue DESC;

-- Query 30

SELECT DISTINCT
    c.CustomerName,
    p.Category
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN Products p
ON o.ProductID = p.ProductID
WHERE p.Category='Electronics';

-- Query 31

SELECT
    c.CustomerName,
    MAX(o.OrderDate) AS LatestOrder
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID=o.CustomerID
GROUP BY c.CustomerName;

-- Query 32

SELECT
    c.CustomerName,
    COUNT(*) AS OrdersPlaced
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID=o.CustomerID
GROUP BY c.CustomerName
HAVING COUNT(*)>5
ORDER BY OrdersPlaced DESC;

-- Query 33

SELECT
    o.OrderID,
    c.CustomerName,
    p.ProductName,
    o.Quantity,
    p.Price,
    (o.Quantity*p.Price) AS Revenue
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID=c.CustomerID
INNER JOIN Products p
ON o.ProductID=p.ProductID
ORDER BY Revenue DESC
LIMIT 10;

