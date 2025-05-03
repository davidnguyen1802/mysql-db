CREATE DATABASE buoi2sql;
USE buoi2sql;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50),
    Age INT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, Name, Email, City, Age) VALUES
(1, 'Nguyen Van A', 'a1@gmail.com', 'Hanoi', 25),
(2, 'Tran Thi B', 'b2@gmail.com', 'HCMC', 30),
(3, 'Le Van C', 'c3@gmail.com', 'Da Nang', 22),
(4, 'Pham Thi D', 'd4@gmail.com', 'Hanoi', 28),
(5, 'Hoang Van E', 'e5@gmail.com', 'Can Tho', 35),
(6, 'Do Thi F', 'f6@gmail.com', 'Hanoi', 27),
(7, 'Nguyen Van G', 'g7@gmail.com', 'Hue', 31),
(8, 'Tran Thi H', 'h8@gmail.com', 'HCMC', 23),
(9, 'Le Van I', 'i9@gmail.com', 'Hanoi', 29),
(10, 'Pham Thi J', 'j10@gmail.com', 'Haiphong', 26),
(11, 'Nguyen Van K', 'k11@gmail.com', 'Hanoi', 24),
(12, 'Tran Thi L', 'l12@gmail.com', 'HCMC', 33),
(13, 'Le Van M', 'm13@gmail.com', 'Hue', 21),
(14, 'Pham Thi N', 'n14@gmail.com', 'Hanoi', 32),
(15, 'Hoang Van O', 'o15@gmail.com', 'Da Nang', 36),
(16, 'Do Thi P', 'p16@gmail.com', 'Hanoi', 25),
(17, 'Nguyen Van Q', 'q17@gmail.com', 'Can Tho', 38),
(18, 'Tran Thi R', 'r18@gmail.com', 'HCMC', 27),
(19, 'Le Van S', 's19@gmail.com', 'Hanoi', 29),
(20, 'Pham Thi T', 't20@gmail.com', 'Hue', 24),
(21, 'Nguyen Van U', 'u21@gmail.com', 'Hanoi', 23),
(22, 'Tran Thi V', 'v22@gmail.com', 'Da Nang', 34),
(23, 'Le Van W', 'w23@gmail.com', 'HCMC', 31),
(24, 'Pham Thi X', 'x24@gmail.com', 'Hanoi', 22),
(25, 'Hoang Van Y', 'y25@gmail.com', 'Hue', 28),
(26, 'Do Thi Z', 'z26@gmail.com', 'Hanoi', 26),
(27, 'Nguyen Van AA', 'aa27@gmail.com', 'HCMC', 35),
(28, 'Tran Thi BB', 'bb28@gmail.com', 'Haiphong', 30),
(29, 'Le Van CC', 'cc29@gmail.com', 'Hanoi', 27),
(30, 'Pham Thi DD', 'dd30@gmail.com', 'Da Nang', 32);

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop Dell', 'Electronics', 15000000),
(2, 'iPhone 13', 'Electronics', 21000000),
(3, 'Tivi Samsung', 'Electronics', 12000000),
(4, 'Bàn làm việc', 'Furniture', 3000000),
(5, 'Ghế xoay', 'Furniture', 1500000),
(6, 'Máy in Canon', 'Electronics', 2500000),
(7, 'Nồi cơm điện', 'Home Appliances', 1000000),
(8, 'Máy giặt LG', 'Home Appliances', 7000000),
(9, 'Bếp từ', 'Home Appliances', 4500000),
(10, 'Bàn phím cơ', 'Electronics', 900000),
(11, 'Chuột Logitech', 'Electronics', 600000),
(12, 'Tai nghe Sony', 'Electronics', 1200000),
(13, 'Tủ lạnh Sharp', 'Home Appliances', 8500000),
(14, 'Ghế gaming', 'Furniture', 2500000),
(15, 'Máy hút bụi', 'Home Appliances', 3500000),
(16, 'Máy sấy tóc', 'Home Appliances', 400000),
(17, 'iPad Air', 'Electronics', 17000000),
(18, 'MacBook Air', 'Electronics', 27000000),
(19, 'Quạt máy', 'Home Appliances', 600000),
(20, 'Tủ quần áo', 'Furniture', 4000000),
(21, 'Điện thoại Oppo', 'Electronics', 6000000),
(22, 'Máy lọc không khí', 'Home Appliances', 3200000),
(23, 'Giường ngủ', 'Furniture', 7000000),
(24, 'Bình đun siêu tốc', 'Home Appliances', 500000),
(25, 'Điện thoại Xiaomi', 'Electronics', 5000000),
(26, 'Đèn học LED', 'Home Appliances', 350000),
(27, 'Camera an ninh', 'Electronics', 2000000),
(28, 'Ổ cứng SSD', 'Electronics', 1500000),
(29, 'Router Wifi', 'Electronics', 1300000),
(30, 'TV LG OLED', 'Electronics', 29000000);

INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 1, 1, '2025-01-02'),
(2, 2, 2, 2, '2025-01-04'),
(3, 3, 3, 1, '2025-01-05'),
(4, 4, 4, 3, '2025-01-10'),
(5, 5, 5, 2, '2025-01-11'),
(6, 6, 6, 1, '2025-01-15'),
(7, 7, 7, 4, '2025-01-17'),
(8, 8, 8, 1, '2025-01-18'),
(9, 9, 9, 2, '2025-01-20'),
(10, 10, 10, 3, '2025-01-21'),
(11, 11, 11, 1, '2025-01-23'),
(12, 12, 12, 2, '2025-01-24'),
(13, 13, 13, 1, '2025-01-25'),
(14, 14, 14, 2, '2025-01-27'),
(15, 15, 15, 1, '2025-01-28'),
(16, 16, 16, 3, '2025-01-29'),
(17, 17, 17, 1, '2025-01-30'),
(18, 18, 18, 2, '2025-02-01'),
(19, 19, 19, 2, '2025-02-02'),
(20, 20, 20, 1, '2025-02-03'),
(21, 21, 21, 1, '2025-02-05'),
(22, 22, 22, 1, '2025-02-06'),
(23, 23, 23, 2, '2025-02-07'),
(24, 24, 24, 3, '2025-02-08'),
(25, 25, 25, 1, '2025-02-09'),
(26, 26, 26, 2, '2025-02-10'),
(27, 27, 27, 1, '2025-02-11'),
(28, 28, 28, 1, '2025-02-13'),
(29, 29, 29, 1, '2025-02-15'),
(30, 30, 30, 2, '2025-02-16');

-- 1) Tìm tất cả khách hàng ở thành phố "Hanoi"
SELECT *
FROM Customers
WHERE City = 'Hanoi';

-- 2) Tìm tất cả sản phẩm có giá trên 500,000 VND
SELECT *
FROM Products
WHERE Price > 500000;

-- 3) Đếm số đơn hàng theo từng khách hàng
SELECT
  c.CustomerID,
  c.Name,
  COUNT(o.OrderID) AS SoDonHang
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name;

-- 4) Tổng số lượng sản phẩm đã bán theo từng loại sản phẩm
SELECT
  p.Category,
  SUM(o.Quantity) AS TongSoLuong
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Category;

-- 5) Tìm những khách hàng đã đặt nhiều hơn 5 đơn hàng
SELECT
  c.CustomerID,
  c.Name,
  COUNT(o.OrderID) AS SoDonHang
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(o.OrderID) > 5;

-- 6) Tìm tổng doanh thu theo từng sản phẩm
SELECT
  p.ProductID,
  p.ProductName,
  SUM(o.Quantity * p.Price) AS DoanhThu
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName;

-- 7) Tìm sản phẩm có doanh thu trên 5 triệu
SELECT
  p.ProductID,
  p.ProductName,
  SUM(o.Quantity * p.Price) AS DoanhThu
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(o.Quantity * p.Price) > 5000000;

-- 8) Tìm những đơn hàng được đặt sau ngày 01/01/2025
SELECT *
FROM Orders
WHERE OrderDate > '2025-01-01';

-- 9) Đếm số lượng đơn hàng trong từng ngày
SELECT OrderDate, COUNT(*) AS SoDonHang
FROM Orders
GROUP BY OrderDate;

-- 10) Tìm thành phố có trên 3 khách hàng
SELECT City, COUNT(*) AS SoKhachHang
FROM Customers
GROUP BY City
HAVING COUNT(*) > 3;

-- 11) Danh sách đơn hàng kèm theo tên khách hàng và tên sản phẩm
SELECT
  o.OrderID,
  c.Name        AS CustomerName,
  p.ProductName,
  o.Quantity,
  o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p  ON o.ProductID  = p.ProductID;

-- 12) Tìm những khách hàng đã mua sản phẩm có giá > 10 triệu
SELECT DISTINCT c.CustomerID, c.Name
FROM Customers c
JOIN Orders o    ON c.CustomerID = o.CustomerID
JOIN Products p  ON o.ProductID  = p.ProductID
WHERE p.Price > 10000000;

-- 13) Tổng tiền mỗi khách hàng đã chi tiêu (Quantity * Price)
SELECT c.CustomerID, c.Name, SUM(o.Quantity * p.Price) AS TongChiTieu
FROM Customers c
JOIN Orders o   ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductID  = p.ProductID
GROUP BY c.CustomerID, c.Name;

-- 14) Danh sách các thành phố có tổng số tiền mua hàng > 20 triệu
SELECT c.City, SUM(o.Quantity * p.Price) AS TongDoanhThu
FROM Customers c
JOIN Orders o   ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductID  = p.ProductID
GROUP BY c.City
HAVING SUM(o.Quantity * p.Price) > 20000000;

-- 15) Tìm những khách hàng chưa từng đặt hàng
SELECT c.CustomerID, c.Name
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;


	





