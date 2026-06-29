USE RetailSalesDB;

-- =====================================================
-- PHASE 4: SUBQUERIES & WINDOW FUNCTIONS
-- File: 06_Subqueries_WindowFunctions.sql
-- =====================================================

-- =====================================================
-- Query 34: Customers Who Placed More Orders Than the Average
-- =====================================================

SELECT
    CustomerID,
    CustomerName
FROM Customers
WHERE CustomerID IN
(
    SELECT CustomerID
    FROM Orders
    GROUP BY CustomerID
    HAVING COUNT(*) >
    (
        SELECT AVG(OrderCount)
        FROM
        (
            SELECT COUNT(*) AS OrderCount
            FROM Orders
            GROUP BY CustomerID
        ) AS AvgOrders
    )
);

-- =====================================================
-- Query 35: Most Expensive Product
-- =====================================================

SELECT *
FROM Products
WHERE Price =
(
    SELECT MAX(Price)
    FROM Products
);

-- =====================================================
-- Query 36: Products Costlier Than Average
-- =====================================================

SELECT
    ProductName,
    Price
FROM Products
WHERE Price >
(
    SELECT AVG(Price)
    FROM Products
);

-- =====================================================
-- Query 37: Top Customer by Revenue
-- =====================================================

SELECT
    c.CustomerName,
    SUM(o.Quantity * p.Price) AS Revenue
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY Revenue DESC
LIMIT 1;

-- =====================================================
-- Query 38: Rank Products by Price
-- =====================================================

SELECT
    ProductName,
    Price,
    RANK() OVER(ORDER BY Price DESC) AS PriceRank
FROM Products;

-- =====================================================
-- Query 39: Dense Rank Products by Price
-- =====================================================

SELECT
    ProductName,
    Price,
    DENSE_RANK() OVER(ORDER BY Price DESC) AS DenseRank
FROM Products;

-- =====================================================
-- Query 40: Row Number for Products by Price
-- =====================================================

SELECT
    ProductName,
    Price,
    ROW_NUMBER() OVER(ORDER BY Price DESC) AS RowNum
FROM Products;

-- =====================================================
-- Query 41: Top 3 Most Expensive Products in Each Category
-- =====================================================

SELECT *
FROM
(
    SELECT
        Category,
        ProductName,
        Price,
        ROW_NUMBER() OVER
        (
            PARTITION BY Category
            ORDER BY Price DESC
        ) AS rn
    FROM Products
) RankedProducts
WHERE rn <= 3;

-- =====================================================
-- Query 42: Running Revenue by Order Date
-- =====================================================

SELECT
    OrderDate,
    SUM(o.Quantity * p.Price) AS DailyRevenue,
    SUM(SUM(o.Quantity * p.Price))
        OVER(ORDER BY OrderDate) AS RunningRevenue
FROM Orders o
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY OrderDate
ORDER BY OrderDate;

-- =====================================================
-- Query 43: Monthly Sales Report
-- =====================================================

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(o.Quantity * p.Price) AS Revenue
FROM Orders o
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY
    Year,
    Month;

-- =====================================================
-- Query 44: Revenue by Payment Method
-- =====================================================

SELECT
    PaymentMethod,
    SUM(o.Quantity * p.Price) AS Revenue
FROM Orders o
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY PaymentMethod
ORDER BY Revenue DESC;

-- =====================================================
-- Query 45: Total Orders by Order Status
-- =====================================================

SELECT
    OrderStatus,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY OrderStatus
ORDER BY TotalOrders DESC;

-- =====================================================
-- Query 46: Revenue Lost Due to Cancelled Orders
-- =====================================================

SELECT
    SUM(o.Quantity * p.Price) AS LostRevenue
FROM Orders o
JOIN Products p
    ON o.ProductID = p.ProductID
WHERE OrderStatus = 'Cancelled';

-- =====================================================
-- Query 47: Top 5 Customers by Revenue
-- =====================================================

SELECT
    c.CustomerName,
    SUM(o.Quantity * p.Price) AS Revenue
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY Revenue DESC
LIMIT 5;