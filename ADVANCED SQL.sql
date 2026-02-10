CREATE DATABASE IF NOT EXISTS pwskills_db;
USE pwskills_db;

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);

CREATE TABLE IF NOT EXISTS Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales VALUES
(1, 1, 5, '2024-01-05'),
(2, 2, 10, '2024-01-06'),
(3, 3, 2, '2024-01-10'),
(4, 4, 1, '2024-01-11');

ANSWER 1
A CTE is a temporary result set created using the WITH clause.
It improves query readability, maintainability, and helps break complex queries into simpler parts.

ANSWER 2
A view is updatable when it is based on a single table without joins, group by, or aggregate functions.
A view is read-only when it uses JOIN, GROUP BY, DISTINCT, or calculations, because SQL cannot map updates to base tables.

ANSWER 3
Stored procedures:
Improve performance (precompiled)
Allow code reuse
Enhance security
Reduce network traffic
Make database logic easy to maintain

ANSWER 4
A trigger automatically executes when an INSERT, UPDATE, or DELETE occurs.
It is used to enforce business rules, maintain data integrity, and log changes automatically.

ANSWER 5
Data modelling organizes data and defines relationships between tables.
Normalization reduces data redundancy and ensures data consistency and integrity.

ANSWER 6
WITH RevenueCTE AS (
    SELECT 
        p.ProductID,
        p.ProductName,
        (p.Price * s.Quantity) AS Revenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
)
SELECT *
FROM RevenueCTE
WHERE Revenue > 3000;

ANSWER 7
CREATE OR REPLACE VIEW vw_CategorySummary AS
SELECT 
    Category,
    COUNT(*) AS TotalProducts,
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;

SELECT * FROM vw_CategorySummary

ANSWER 8
CREATE OR REPLACE VIEW vw_ProductPrice AS
SELECT ProductID, ProductName, Price
FROM Products;
UPDATE vw_ProductPrice
SET Price = 1500
WHERE ProductID = 1;
SELECT * FROM Products;

ANSWER 9
DELIMITER $$

CREATE PROCEDURE GetProductsByCategory(IN cat_name VARCHAR(50))
BEGIN
    SELECT *
    FROM Products
    WHERE Category = cat_name;
END $$

DELIMITER ;
CALL GetProductsByCategory('Electronics');

ANSWER 10
CREATE TABLE IF NOT EXISTS ProductArchive (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt TIMESTAMP
);
DELIMITER $$

CREATE TRIGGER after_product_delete
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductArchive
    VALUES (
        OLD.ProductID,
        OLD.ProductName,
        OLD.Category,
        OLD.Price,
        NOW()
    );
END $$

DELIMITER ;
DELETE FROM Products WHERE ProductID = 2;
SELECT * FROM ProductArchive;

