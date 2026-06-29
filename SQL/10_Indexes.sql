USE RetailSalesDB;

-- ===========================================================
-- Question:
-- Create an index on CustomerID to improve search performance.
-- ===========================================================

CREATE INDEX idx_customer
ON Orders(CustomerID);


-- ===========================================================
-- Question:
-- Create an index on ProductID.
-- ===========================================================

CREATE INDEX idx_product
ON Orders(ProductID);


-- ===========================================================
-- Question:
-- Create a composite index on OrderDate and OrderStatus.
-- ===========================================================

CREATE INDEX idx_date_status
ON Orders(OrderDate, OrderStatus);


-- ===========================================================
-- Display all indexes
-- ===========================================================

SHOW INDEXES FROM Orders;