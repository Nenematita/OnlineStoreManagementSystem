-- 1. CREATE DATABASE
CREATE DATABASE OnlineStoreDB;
GO
USE OnlineStoreDB;
GO

-- 2. CREATE TABLES

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    JoinDate DATE DEFAULT GETDATE()
);

-- Products Table
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50),
    Price DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2)
);

-- OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    Price DECIMAL(10,2)
);

-- Staff Table
CREATE TABLE Staff (
    StaffID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100),
    Position NVARCHAR(50),
    Email NVARCHAR(100)
);

-- =====================
-- 3. INSERT SAMPLE DATA
-- =====================

-- Customers
INSERT INTO Customers (Name, Email, Phone) VALUES
('Alice Smith', 'alice@example.com', '1234567890'),
('Bob Johnson', 'bob@example.com', '0987654321');

-- Products
INSERT INTO Products (Name, Category, Price, Stock) VALUES
('Laptop', 'Electronics', 1200.00, 10),
('Smartphone', 'Electronics', 800.00, 20),
('Book: SQL Basics', 'Books', 25.00, 50);

-- Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2026-02-10', 1225.00),
(2, '2026-02-11', 800.00);

-- OrderItems
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 1200.00),
(1, 3, 1, 25.00),
(2, 2, 1, 800.00);

-- Staff
INSERT INTO Staff (Name, Position, Email) VALUES
('Manager John', 'Store Manager', 'john@onlinestore.com'),
('Assistant Mary', 'Sales Assistant', 'mary@onlinestore.com');

-- =====================
-- 4. CRUD & REPORT QUERIES
-- =====================

-- View all orders with customer name and total amount
SELECT o.OrderID, c.Name AS Customer, o.OrderDate, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

-- View all items in an order
SELECT oi.OrderItemID, o.OrderID, p.Name AS Product, oi.Quantity, oi.Price
FROM OrderItems oi
JOIN Orders o ON oi.OrderID = o.OrderID
JOIN Products p ON oi.ProductID = p.ProductID;

-- Add a new product
INSERT INTO Products (Name, Category, Price, Stock) VALUES ('Headphones', 'Electronics', 150.00, 30);

-- Update product stock
UPDATE Products
SET Stock = Stock - 1
WHERE ProductID = 1;

-- Delete a customer
DELETE FROM Customers
WHERE CustomerID = 2;

-- Total sales per product
SELECT p.Name AS Product, SUM(oi.Quantity * oi.Price) AS TotalSales
FROM OrderItems oi
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalSales DESC;

