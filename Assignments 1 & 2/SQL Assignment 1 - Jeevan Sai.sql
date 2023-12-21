create database Techshop;
use Techshop;

--2. Data Definition Language (DDL)
-- Create Tables 
create table Customers
(
CustomereId int Not null Primary key,
FirstName varchar(30),
LastName varchar(30),
Email varchar(100),
Phone char(10),
Address varchar(50),

 
);

create table Products
(
ProductID int primary key,
ProductName varchar(50),
Description varchar(150),
Price int
);

create table Orders
(
OrderId int primary key,
CustomerID int, 
OrderDate DATE,
TotalAmount int,
foreign key (CustomerID) references Customers(CustomereID)
);

create table OrderDetails
(
OrderDetailID int primary key,
OrderID int,
ProductID int,
Quantity int,
foreign key (OrderID) references  Orders(OrderId),
foreign key (ProductID) references  Products(ProductID)
);
create table Inventory
(

InventoryId int primary key,
ProductID int,
QuantityInStock int,
LastStockUpdate int,

foreign key (ProductID) references  Products(ProductID)
);

--3. Data Manipulation Language (DML):

-- a. Inserting data into tables

-- Customer table

INSERT INTO Customers (CustomereID, FirstName, LastName, Email, Phone, Address)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '1234567890', '123 Main St'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '9876543210', '456 Oak Ave'),
(3, 'Alice', 'Johnson', 'alice.j@email.com', '5551234567', '789 Pine Rd'),
(4, 'Bob', 'Williams', 'bob.w@email.com', '1112223333', '101 Elm Blvd'),
(5, 'Eva', 'Brown', 'eva.b@email.com', '9998887777', '202 Cedar Ln'),
(6, 'Michael', 'Jones', 'michael.j@email.com', '3334445555', '303 Birch Dr'),
(7, 'Sara', 'Taylor', 'sara.t@email.com', '7776668888', '404 Maple Ave'),
(8, 'David', 'Lee', 'david.l@email.com', '4445556666', '505 Pine St'),
(9, 'Sophia', 'Miller', 'sophia.m@email.com', '6667779999', '606 Oak Dr'),
(10, 'Chris', 'Clark', 'chris.c@email.com', '2223334444', '707 Cedar Rd');



-- Inserting data into products table

INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
(1, 'Laptop', 'Powerful laptop with high-performance specs.', 1200),
(2, 'Smartphone', 'Latest smartphone with advanced features.', 800),
(3, 'Desk Chair', 'Comfortable chair for your home office.', 150),
(4, 'Coffee Maker', 'Brew your favorite coffee at home.', 40),
(5, 'Running Shoes', 'Durable running shoes for active lifestyles.', 80),
(6, 'Desk Lamp', 'Modern and adjustable desk lamp.', 25),
(7, 'Backpack', 'Spacious backpack for daily use or travel.', 30),
(8, 'Kitchen Blender', 'Efficient blender for your kitchen needs.', 60),
(9, 'Gaming Mouse', 'High-precision gaming mouse for gamers.', 50),
(10, 'Digital Camera', 'Capture moments with this advanced camera.', 300);



-- Inserting data to Orders table

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
( 101,1, '2023-11-28', 120),
( 102,2, '2023-11-29', 80),
( 103,3, '2023-11-30', 150),
( 104,4, '2023-12-01', 40),
( 105,5, '2023-12-02', 200),
( 106,6, '2023-12-03', 50),
( 107,7, '2023-12-04', 30),
( 108,8, '2023-12-05', 60),
( 109,9, '2023-12-06', 90),
( 110,10, '2023-12-07', 75);

-- updating values in Products table because I give ProductId and CustomerId is same so I change it now

update Products set ProductID=1001 where ProductName='Laptop';
update Products set ProductID=1002 where ProductName='Smartphone';
update Products set ProductID=1003 where ProductName='Desk Chair';
update Products set ProductID=1004 where ProductName='Coffee Maker';
update Products set ProductID=1005 where ProductName='Running Shoes';
update Products set ProductID=1006 where ProductName='Desk Lamp';
update Products set ProductID=1007 where ProductName='Backpack';
update Products set ProductID=1008 where ProductName='Kitchen Blender';
update Products set ProductID=1009 where ProductName='Gaming Mouse';
update Products set ProductID=1010 where ProductName='Digital Camera';

-- Inserting data into OrderDetails

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(10001, 101, 1001, 20),
(10002, 102, 1002, 10),
(10003, 103, 1003, 30),
(10004, 104, 1004, 15),
(10005, 105, 1005, 25),
(10006, 106, 1006, 16),
(10007, 107, 1007, 40),
(10008, 108, 1008, 19),
(10009, 109, 1009, 27),
(10010, 110, 1010, 35);


-- Inserting data into Inventory table

INSERT INTO Inventory (InventoryId, ProductID, QuantityInStock, LastStockUpdate)
VALUES
(91, 1001, 50, 71),
(92, 1002, 100, 105),
(93, 1003, 30, 40),
(94, 1004, 75, 95),
(95, 1005, 120,150),
(96, 1006, 50, 80),
(97, 1007, 80, 100),
(98, 1008, 40,65),
(99, 1009, 60, 72),
(100, 1010, 90, 108);

-- Basic quires 

-- QNUM 3b (1)

select [FirstName],[LastName],[Email] from  [dbo].[Customers];

-- QNUM 3b (2)

SELECT [OrderDate],[FirstName],[LastName] FROM [dbo].[Customers] AS C
INNER JOIN [dbo].[Orders] AS O ON C.[CustomereId]=O.[CustomerID];

-- QNUM 3b (3)

INSERT INTO Customers (CustomereID, FirstName, LastName, Email, Phone, Address)
VALUES
(11, 'Johny', 'crisp', 'johny.crisp@email.com', '1234562220', '129 Main St');

-- QNUM 3b (40)

UPDATE Products SET price = price * 1.1 where ProductID=1001;
UPDATE Products SET price = price * 1.1 where ProductID=1002;
UPDATE Products SET price = price * 1.1 where ProductID=1003;
UPDATE Products SET price = price * 1.1 where ProductID=1004;
UPDATE Products SET price = price * 1.1 where ProductID=1005;
UPDATE Products SET price = price * 1.1 where ProductID=1006;
UPDATE Products SET price = price * 1.1 where ProductID=1007;
UPDATE Products SET price = price * 1.1 where ProductID=1008;
UPDATE Products SET price = price * 1.1 where ProductID=1009;
UPDATE Products SET price = price * 1.1 where ProductID=1010;

--QNUM 3b (5)

DECLARE @OrderIDToDelete INT; 
SET @OrderIDToDelete = 1; 
DELETE FROM OrderDetails
WHERE OrderID = @OrderIDToDelete;

DELETE FROM Orders
WHERE OrderID = @OrderIDToDelete;

--QNUM 3b (6)


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
( 111,11, '2022-10-25', 124);

--QNUM 3b (7)

DECLARE @CustomerIDToUpdate INT;
DECLARE @NewEmail VARCHAR(100);
DECLARE @NewAddress VARCHAR(50);

SET @CustomerIDToUpdate = 11; 
SET @NewEmail = 'new.email@example.com'; 
SET @NewAddress = '123 oak colony';

UPDATE Customers
SET email = @NewEmail,
    address = @NewAddress
WHERE CustomereId= @CustomerIDToUpdate;

-- QNUM 3b (8)

UPDATE Orders
SET TotalAmount = (
    SELECT SUM(od.quantity * p.price)
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID = Orders.OrderId
)

--QNUM 3b (9)

DECLARE @CustomerIDToDelete INT;
SET @CustomerIDToDelete = 5;

DELETE FROM OrderDetails
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerIDToDelete);

DELETE FROM Orders
WHERE CustomerID = @CustomerIDToDelete;

-- QNUM 3b (10)

INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES ('1011', 'Key board', 'Best sellert ever', 400);

-- QNUM 3b (11)

DECLARE @OrderIDToUpdate INT;
DECLARE @TotalAmount Int;


SET @OrderIDToUpdate = 104; 
SET @TotalAmount = 900; 

UPDATE Orders
SET TotalAmount = @TotalAmount
WHERE OrderId = @OrderIDToUpdate;

-- QNUM 3b (12)

DECLARE @NumberOfOrders INT
UPDATE Customers
SET @NumberOfOrders = (
    SELECT COUNT(OrderID) FROM Orders
    WHERE Customers.CustomereID = Orders.CustomerID);

-- 4. JOINS

-- QNUM 1

SELECT
    Orders.OrderId,
    Orders.OrderDate,
    Customers.FirstName,
    Customers.email,
    Customers.address
FROM
    Orders
iNNER JOIN
    Customers ON Orders.CustomerID = Customers.CustomereId;

-- QNUM 2


SELECT
    P.ProductName,
    SUM(OD.quantity * P.price) AS total_revenue
FROM
    Products P
Inner JOIN
    OrderDetails OD ON P.ProductID = OD.ProductID
Inner JOIN
    Orders O ON OD.OrderID = O.OrderID 
WHERE
    P.ProductName = 'Laptop'
GROUP BY
    P.ProductName;

--QNUM 3

SELECT
    C.CustomereId,
    C.FirstName,
    C.email,
    C.address
FROM
    Customers C
Inner JOIN
    Orders O ON C.CustomereId = O.CustomerID
GROUP BY
    C.CustomereId, C.FirstName, C.email, C.address;

--Qnum 4

SELECT
    P.ProductName,
    SUM(OD.quantity) AS total_quantity_ordered
FROM
    Products P
INNER JOIN
    OrderDetails OD ON P.ProductID = OD.ProductID
WHERE
    P.Price =1200
GROUP BY
    P.ProductName
ORDER BY
    total_quantity_ordered DESC

--QNUM 5

-- did not get this

--QNUM 6

SELECT
    customers.FirstName,
    AVG(orders.TotalAmount) AS average_order_value
FROM
    customers
Inner JOIN
    orders ON customers.CustomereId = orders.CustomerID
GROUP BY
    customers.CustomereId, customers.FirstName;

--QNUM 7

--i did not get this one

--QNUM 8

SELECT P.ProductID, P.ProductName, COUNT(OD.OrderDetailID) AS TimesOrdered
FROM Products AS P
LEFT JOIN OrderDetails AS OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY TimesOrdered DESC;

-- QNUM 9

SELECT DISTINCT C.CustomereId, C.FirstName, C.LastName, C.Email, C.Phone, C.Address
FROM Customers AS C
JOIN Orders AS O ON C.CustomereID = O.CustomerID
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
WHERE P.ProductName = 'Coffee Maker';

-- QNUM 10

SELECT SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM Orders AS O
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
WHERE O.OrderDate >= '2023-11-28' AND O.OrderDate <= '2023-12-04';


--5. Aggregate Functions and Subqueries:

--QNUM 1

SELECT C.CustomereID, C.FirstName, C.LastName, C.Email, C.Phone, C.Address
FROM Customers AS C
LEFT JOIN Orders AS O ON C.CustomereID = O.CustomerID
WHERE O.OrderID IS NULL;


--QNUM 2

SELECT COUNT(*) AS TotalProducts
FROM Products;

--QNUM 3

SELECT SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM Orders AS O
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID;

--QNUM 4

-- I did not get this one

-- QNUM 5

SELECT SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM Orders AS O
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
WHERE O.CustomerID = '7';

--QNUM 6

SELECT C.FirstName, C.LastName, COUNT(O.OrderID) AS NumberOfOrders
FROM Customers AS C
LEFT JOIN Orders AS O ON C.CustomereID = O.CustomerID
GROUP BY C.CustomereID, C.FirstName, C.LastName
ORDER BY NumberOfOrders DESC;


--QNUM 8

SELECT C.FirstName, C.LastName, SUM(OD.Quantity * P.Price) AS TotalSpending
FROM Customers AS C
JOIN Orders AS O ON C.CustomereID = O.CustomerID
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
WHERE P.Description = 'Efficient blender for your kitchen needs.'
GROUP BY C.CustomereID, C.FirstName, C.LastName
ORDER BY TotalSpending DESC;

--QNUM 9

SELECT DISTINCT C.FirstName, C.LastName, C.Email, C.Phone, C.Address
FROM Customers AS C
JOIN Orders AS O ON C.CustomereID = O.CustomerID
JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
WHERE P.ProductName = 'Laptop';

--QNUM 10

SELECT C.FirstName, C.LastName, COUNT(O.OrderID) AS OrderCount
FROM Customers AS C
LEFT JOIN Orders AS O ON C.CustomereID = O.CustomerID
GROUP BY C.CustomereID, C.FirstName, C.LastName
ORDER BY OrderCount DESC;