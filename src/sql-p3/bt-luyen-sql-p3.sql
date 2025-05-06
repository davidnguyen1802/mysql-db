CREATE DATABASE mysql3;
USE mysql3;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Customers (CustomerID, CustomerName, City) VALUES
(1, 'Nguyen Van A', 'Hanoi'),
(2, 'Tran Thi B', 'Hanoi'),
(3, 'Le Van C', 'HCMC'),
(4, 'Pham Thi D', 'Danang'),
(5, 'Hoang Van E', 'Hue'),
(6, 'Bui Thi F', 'Can Tho'),
(7, 'Dang Van G', 'HCMC'),
(8, 'Ngo Thi H', 'Hanoi'),
(9, 'Do Van I', 'Hue'),
(10, 'Phan Thi J', 'Danang'),
(11, 'Vo Van K', 'HCMC'),
(12, 'Nguyen Thi L', 'Hanoi'),
(13, 'Tran Van M', 'Hanoi'),
(14, 'Le Thi N', 'Hue'),
(15, 'Pham Van O', 'Can Tho'),
(16, 'Hoang Thi P', 'Danang'),
(17, 'Bui Van Q', 'HCMC'),
(18, 'Dang Thi R', 'Hue'),
(19, 'Ngo Van S', 'Hanoi'),
(20, 'Do Thi T', 'HCMC');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2024-01-10', 200.00),
(102, 2, '2024-01-11', 150.00),
(103, 3, '2024-01-12', 350.00),
(104, 4, '2024-01-13', 400.00),
(105, 5, '2024-01-14', 100.00),
(106, 1, '2024-01-15', 250.00),
(107, 6, '2024-01-16', 180.00),
(108, 7, '2024-01-17', 300.00),
(109, 8, '2024-01-18', 220.00),
(110, 9, '2024-01-19', 130.00),
(111, 10, '2024-01-20', 500.00),
(112, 11, '2024-01-21', 270.00),
(113, 12, '2024-01-22', 310.00),
(114, 13, '2024-01-23', 410.00),
(115, 14, '2024-01-24', 90.00),
(116, 15, '2024-01-25', 600.00),
(117, 1, '2024-01-26', 150.00),
(118, 16, '2024-01-27', 470.00),
(119, 17, '2024-01-28', 510.00),
(120, 18, '2024-01-29', 190.00);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop Acer', 800.00),
(2, 'Laptop Dell', 950.00),
(3, 'iPhone 13', 1100.00),
(4, 'Samsung Galaxy S22', 1050.00),
(5, 'iPad Air', 650.00),
(6, 'Apple Watch', 450.00),
(7, 'AirPods Pro', 250.00),
(8, 'MacBook Pro', 2000.00),
(9, 'Dell Monitor', 300.00),
(10, 'Logitech Mouse', 40.00),
(11, 'Mechanical Keyboard', 120.00),
(12, 'Sony Headphones', 180.00),
(13, 'Xiaomi Phone', 500.00),
(14, 'Asus Zenbook', 950.00),
(15, 'HP Pavilion', 700.00),
(16, 'Canon Printer', 180.00),
(17, 'Nikon Camera', 900.00),
(18, 'Bluetooth Speaker', 130.00),
(19, 'Router TP-Link', 90.00),
(20, 'Portable SSD', 160.00);


-- 1. Khách hàng nào đã từng đặt hàng?
SELECT DISTINCT c.CustomerName -- Khử trùng phòng trường hợp có 1 cái tên xuất hiện 2 lần
FROM Customers c
WHERE CustomerID IN (
  SELECT o.CustomerID -- Khử trùng phòng trường hợp có 1 cái tên xuất hiện 2 lần
  FROM Orders o
);

-- 2. 
WITH OrderedCustomers AS (
  SELECT CustomerID
  FROM Orders
  GROUP BY CustomerID
)
SELECT
  c.CustomerName
FROM Customers c
LEFT JOIN OrderedCustomers oc
  ON c.CustomerID = oc.CustomerID
WHERE oc.CustomerID IS NULL;

-- 3.
SELECT o.OrderID, o.CustomerID, o.TotalAmount
FROM Orders o
WHERE TotalAmount = ( -- IN với = như nhau, nhưng = nhanh hơn trong nhiều trường hợp, IN nhanh hơn EXISTS
  SELECT MAX(TotalAmount)
  FROM Orders
);

-- 4.
WITH hanoitotaltable AS (
  SELECT c.CustomerID, c.CustomerName, SUM(o.TotalAmount) AS TotalSpend
  FROM Customers c
  JOIN Orders o ON c.CustomerID = o.CustomerID
  WHERE c.City = 'Hanoi'
  GROUP BY c.CustomerID, c.CustomerName
)
SELECT CustomerName
FROM hanoitotaltable
WHERE TotalSpend = (
  SELECT MAX(TotalSpend)
  FROM hanoitotaltable
);

-- 5. 
SELECT o.OrderID, o.CustomerID, o.TotalAmount
FROM Orders o
WHERE o.TotalAmount > (
  SELECT AVG(o.TotalAmount)
  FROM Orders o
);

-- 6. 
-- Cach 1
WITH CitySpending AS (
  SELECT c.City, SUM(o.TotalAmount) AS TotalChiTieu
  FROM Customers c
  JOIN Orders o
    ON c.CustomerID = o.CustomerID
  GROUP BY
    c.City
)
SELECT City
FROM CitySpending
WHERE TotalChiTieu > 1000;

-- Cach 2
SELECT c.City, SUM(o.TotalAmount) AS TotalChiTieu
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.City
HAVING TotalChiTieu > 1000;

-- 7.
WITH Average AS (
    SELECT AVG(o.TotalAmount) AS average_total_amount
    FROM Orders o
  ),
  CustomerStats AS (
    SELECT o.CustomerID, COUNT(*) AS cnt_orders, MIN(o.TotalAmount) AS min_amount
    FROM Orders o
    GROUP BY o.CustomerID
  )
SELECT c.CustomerName
FROM CustomerStats cs
JOIN Average a ON cs.min_amount > a.average_total_amount
JOIN Customers c ON cs.CustomerID = c.CustomerID
WHERE cs.cnt_orders > 1;
