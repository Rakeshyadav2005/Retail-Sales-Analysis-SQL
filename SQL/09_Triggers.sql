USE RetailSalesDB;

-- ===========================================================
-- Question:
-- Create an audit table to store every new order inserted.
-- ===========================================================

CREATE TABLE IF NOT EXISTS OrderAudit(

    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ActionPerformed VARCHAR(20),
    ActionDate DATETIME

);

-- ===========================================================
-- Trigger 1
-- Question:
-- Automatically store a log whenever a new order is inserted.
-- ===========================================================

DELIMITER $$

CREATE TRIGGER trg_OrderInserted

AFTER INSERT
ON Orders

FOR EACH ROW

BEGIN

INSERT INTO OrderAudit
(
    OrderID,
    ActionPerformed,
    ActionDate
)

VALUES
(
    NEW.OrderID,
    'INSERT',
    NOW()
);

END$$

DELIMITER ;



-- ===========================================================
-- Test Trigger
-- ===========================================================

INSERT INTO Orders
(
OrderID,
CustomerID,
ProductID,
OrderDate,
Quantity,
PaymentMethod,
OrderStatus
)

VALUES
(
501,
5,
10,
'2026-06-29',
2,
'UPI',
'Delivered'
);


-- Verify Audit Table

SELECT *
FROM OrderAudit;