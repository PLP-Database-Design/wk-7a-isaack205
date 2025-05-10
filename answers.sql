-- Question 1: Achieving 1NF (First Normal Form)
-- The original table ProductDetail violates 1NF because the Products column contains multiple values.
-- The table has been transformed into 1NF by ensuring each row represents a single product for an order.

CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(100)
);

-- Inserting data into ProductDetail table in 1NF format
INSERT INTO ProductDetail(OrderID, CustomerName, Products)
VALUES

(301, 'Sophia Turner', 'Camera'),
(301, 'Sophia Turner', 'Tripod'),
(302, 'Liam Johnson', 'Printer'),
(302, 'Liam Johnson', 'Ink Cartridge'),
(302, 'Liam Johnson', 'Paper Pack'),
(303, 'Olivia Brown', 'Smartphone');

-- Question 2: Achieving 2NF (Second Normal Form)
-- The original table OrderDetails violates 2NF because CustomerName depends only on OrderID (partial dependency).
-- To achieve 2NF, the data has been split into two tables: Orders and Product.
-- Orders table contains OrderID and CustomerName, ensuring no partial dependencies.

-- Creating Orders table to store order details
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Inserting data into Orders table
INSERT INTO orders (OrderID, CustomerName)
VALUES

(301, 'Sophia Turner'),
(302, 'Liam Johnson'),
(303, 'Olivia Brown');

-- Creating Product table to store product details
-- This table includes a foreign key (order_id) referencing the Orders table to maintain referential integrity.
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    productName VARCHAR(100),
    quantity INT,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(OrderID)
);

-- Inserting data into Product table
INSERT INTO product(product_id, productName, quantity, order_id)
VALUES 

(1, 'Camera', 1, 301),
(2, 'Tripod', 1, 301),
(3, 'Printer', 1, 302),
(4, 'Ink Cartridge', 2, 302),
(5, 'Paper Pack', 3, 302),
(6, 'Smartphone', 1, 303);

-- Notes:
-- 1. The ProductDetail table is used to demonstrate the transformation to 1NF.
-- 2. The Orders and Product tables demonstrate the transformation to 2NF by removing partial dependencies.
-- 3. Foreign key constraints ensure data integrity between Orders and Product tables.


