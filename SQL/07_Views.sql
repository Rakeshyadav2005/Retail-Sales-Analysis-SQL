USE RetailSalesDB;

-- ===========================================================
-- VIEW 1
-- Question:
-- Create a view to display complete sales details including
-- customer, product, category, quantity, price and total amount.
-- ===========================================================

CREATE OR REPLACE VIEW SalesReport AS
SELECT
    o.OrderID,
    c.CustomerName,
    p.ProductName,
    p.Category,
    o.Quantity,
    p.Price,
    (o.Quantity * p.Price) AS TotalAmount,
    o.OrderDate,
    o.PaymentMethod,
    o.OrderStatus
FROM Orders o
JOIN Customers c
ON o.CustomerID = c.CustomerID
JOIN Products p
ON o.ProductID = p.ProductID;

-- Display Sales Report
SELECT * FROM SalesReport;


-- ===========================================================
-- VIEW 2
-- Question:
-- Create a view to display total orders and total amount spent
-- by every customer.
-- ===========================================================

CREATE OR REPLACE VIEW CustomerSummary AS
SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.Quantity * p.Price) AS TotalSpent
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN Products p
ON o.ProductID = p.ProductID
GROUP BY
    c.CustomerID,
    c.CustomerName;

-- Display Customer Summary
SELECT * FROM CustomerSummary;


-- ===========================================================
-- VIEW 3
-- Question:
-- Create a view showing product-wise sales performance.
-- ===========================================================

CREATE OR REPLACE VIEW ProductPerformance AS
SELECT
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(o.Quantity) AS QuantitySold,
    SUM(o.Quantity * p.Price) AS Revenue
FROM Products p
JOIN Orders o
ON p.ProductID = o.ProductID
GROUP BY
    p.ProductID,
    p.ProductName,
    p.Category;

-- Display Product Performance
SELECT * FROM ProductPerformance;