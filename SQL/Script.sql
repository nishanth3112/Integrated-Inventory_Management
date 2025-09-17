CREATE DATABASE SpareSpa;
USE SpareSpa;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    PreferredPaymentMethod VARCHAR(50),
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    ManufacturerID INT,
    Price DECIMAL(10, 2),
    StockQuantity INT
);


CREATE TABLE Manufacturers (
    ManufacturerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50)
);


CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    PaymentID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Deliveries (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    DeliveryDate DATE,
    DeliveryAddress VARCHAR(255),
    DeliveryFee DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


CREATE TABLE PurchaseOrders (
    PurchaseOrderID INT AUTO_INCREMENT PRIMARY KEY,
    ManufacturerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID)
);

CREATE TABLE PurchaseOrderDetails (
    PurchaseOrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    PurchaseOrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrders(PurchaseOrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    ManufacturerID INT,
    ContactPerson VARCHAR(100),
    ContactNumber VARCHAR(20),
    FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID)
);



INSERT INTO Customers (Name, Email, Phone, PreferredPaymentMethod, Address) VALUES
('Sebastian Cromwell', 'sebastian.cromwell@example.com', '+44 20 7985 2030', 'Credit Card', '34 High Holborn, London'),
('Eliza Fairweather', 'eliza.fairweather@example.com', '+44 7512 673890', 'Apple Pay', '75 York Way, Camden, London'),
('Arthur Pendleton', 'arthur.pendleton@example.com', '+44 20 7930 9874', 'Zelle', '50 Green Street, Mayfair, London');

INSERT INTO Manufacturers (Name, Country) VALUES
('Imperial Auto Components', 'UK'),
('Schneider Motors', 'Germany'),
('Mécanique Française', 'France');


INSERT INTO Products (ProductName, ManufacturerID, Price, StockQuantity) VALUES
('Hydraulic Brake Disc', 1, 65.00, 120),
('Synthetic Engine Oil', 1, 40.00, 180),
('Turbocharger Kit', 2, 350.00, 75),
('Ignition Coil', 3, 25.00, 220);


INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, PaymentID) VALUES
(1, '2024-09-15', 130.00, 1),
(2, '2024-09-18', 195.00, 2),
(3, '2024-09-20', 400.00, 3);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 2, 65.00),
(2, 2, 3, 40.00),
(3, 3, 1, 350.00);


INSERT INTO Payments (OrderID, PaymentDate, PaymentMethod, Amount) VALUES
(1, '2024-09-15', 'Credit Card', 130.00),
(2, '2024-09-18', 'Apple Pay', 195.00),
(3, '2024-09-20', 'Zelle', 400.00);


INSERT INTO Deliveries (OrderID, DeliveryDate, DeliveryAddress, DeliveryFee) VALUES
(1, '2024-09-16', '34 High Holborn, London', 8.00),
(2, '2024-09-19', '75 York Way, Camden, London', 12.00),
(3, '2024-09-21', '50 Green Street, Mayfair, London', 10.00);


INSERT INTO PurchaseOrders (ManufacturerID, OrderDate, TotalAmount) VALUES
(1, '2024-08-10', 1500.00),
(2, '2024-08-12', 2500.00),
(3, '2024-08-14', 3000.00);


INSERT INTO PurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity) VALUES
(1, 1, 100),
(2, 3, 50),
(3, 4, 200);


INSERT INTO Suppliers (ManufacturerID, ContactPerson, ContactNumber) VALUES
(1, 'Beatrice Hawthorne', '+44 20 7985 1120'),
(2, 'Friedrich Müller', '+49 30 78912345'),
(3, 'Jacques Renault', '+33 1 87654321');



INSERT INTO Customers (Name, Email, Phone, PreferredPaymentMethod, Address) VALUES
('Liam Spencer', 'liam.spencer@example.com', '+44 20 7946 2021', 'PayPal', '15 King Street, London'),
('Olivia Grant', 'olivia.grant@example.com', '+44 20 7397 4063', 'Credit Card', '32 Whitechapel Road, London'),
('Henry Lloyd', 'henry.lloyd@example.com', '+44 20 7584 1234', 'Debit Card', '89 Broad Street, Birmingham');


INSERT INTO Manufacturers (Name, Country) VALUES
('Nordic Auto Supplies', 'Sweden'),
('Celtic Parts Ltd.', 'Ireland'),
('Iberian Engines', 'Spain');


INSERT INTO Products (ProductName, ManufacturerID, Price, StockQuantity) VALUES
('Fuel Injector', 4, 80.00, 150),
('Radiator', 5, 120.00, 95),
('Alternator', 6, 110.00, 70);


INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, PaymentID) VALUES
(4, '2024-09-22', 260.00, 4),
(5, '2024-09-25', 480.00, 5);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(4, 5, 2, 120.00),
(5, 6, 3, 110.00);


INSERT INTO Payments (OrderID, PaymentDate, PaymentMethod, Amount) VALUES
(4, '2024-09-22', 'PayPal', 260.00),
(5, '2024-09-25', 'Credit Card', 480.00);


INSERT INTO Deliveries (OrderID, DeliveryDate, DeliveryAddress, DeliveryFee) VALUES
(4, '2024-09-23', '15 King Street, London', 15.00),
(5, '2024-09-26', '32 Whitechapel Road, London', 18.00);


INSERT INTO PurchaseOrders (ManufacturerID, OrderDate, TotalAmount) VALUES
(4, '2024-08-20', 1800.00),
(5, '2024-08-21', 2200.00);


INSERT INTO Suppliers (ManufacturerID, ContactPerson, ContactNumber) VALUES
(4, 'Sven Johansson', '+46 8 1234 5678'),
(5, 'Eoin O\'Sullivan', '+353 1 2345678');




--

INSERT INTO Customers (Name, Email, Phone, PreferredPaymentMethod, Address) VALUES
('Mia Thompson', 'mia.thompson@example.com', '+44 7400 123456', 'Credit Card', '10 Downing Street, London'),
('Jack Hargreaves', 'jack.hargreaves@example.com', '+44 7800 654321', 'PayPal', '221B Baker Street, London'),
('Sophia Green', 'sophia.green@example.com', '+44 20 1234 5678', 'Debit Card', '5 Fleet Street, London');

INSERT INTO Customers (Name, Email, Phone, PreferredPaymentMethod, Address) VALUES
('Johnathan Hargrove', 'johnathan.hargrove@example.com', '+44 7700 900123', 'Credit Card', '22 Baker Street, London, UK'),
('Lydia Quince', 'lydia.quince@example.com', '+44 7400 123456', 'Paypal', '130 Victoria Street, London, UK'),
('Miles Ainsworth', 'miles.ainsworth@example.com', '+44 7200 654321', 'Bank Transfer', '250 Oxford Road, Manchester, UK'),
('Isla Haddon', 'isla.haddon@example.com', '+44 7800 987654', 'Apple Pay', '12 Queensway, Birmingham, UK'),
('Noah Ellington', 'noah.ellington@example.com', '+44 7600 555333', 'Credit Card', '45 Old Street, Bristol, UK'),
('Sophia Langley', 'sophia.langley@example.com', '+44 7900 112233', 'Zelle', '88 King Street, Glasgow, UK'),
('Lucas Wyndham', 'lucas.wyndham@example.com', '+44 7300 445566', 'Debit Card', '72 Prince Street, Edinburgh, UK'),
('Amelia Knight', 'amelia.knight@example.com', '+44 7100 778899', 'Google Pay', '66 Market Street, Liverpool, UK'),
('Jacob Bramwell', 'jacob.bramwell@example.com', '+44 7500 332211', 'Credit Card', '33 Regent Street, Nottingham, UK'),
('Olivia Trelawney', 'olivia.trelawney@example.com', '+44 7800 889900', 'Paypal', '58 Green Park, Newcastle, UK'),
('Ethan Blackwood', 'ethan.blackwood@example.com', '+44 7700 990011', 'Apple Pay', '24 Union Street, Aberdeen, UK'),
('Charlotte Redmayne', 'charlotte.redmayne@example.com', '+44 7400 223344', 'Credit Card', '89 Grafton Way, Oxford, UK'),
('Harry Collingwood', 'harry.collingwood@example.com', '+44 7300 556677', 'Bank Transfer', '47 Abbey Road, Cambridge, UK'),
('Emily Radcliffe', 'emily.radcliffe@example.com', '+44 7100 998877', 'Credit Card', '16 Broadway, Belfast, UK'),
('Jack Stirling', 'jack.stirling@example.com', '+44 7600 334455', 'Paypal', '78 Kings Cross, Leicester, UK'),
('Mia Falkner', 'mia.falkner@example.com', '+44 7200 776655', 'Google Pay', '29 Piccadilly, Sheffield, UK'),
('Henry Sanderson', 'henry.sanderson@example.com', '+44 7500 223344', 'Credit Card', '99 St. John’s Road, Coventry, UK'),
('Grace Kinsley', 'grace.kinsley@example.com', '+44 7900 665544', 'Zelle', '56 North Street, Sunderland, UK'),
('Leo Pickering', 'leo.pickering@example.com', '+44 7800 334455', 'Apple Pay', '63 Rose Lane, Leeds, UK'),
('Ella Fairchild', 'ella.fairchild@example.com', '+44 7300 998822', 'Debit Card', '12 High Road, Southampton, UK');


INSERT INTO Manufacturers (Name, Country) VALUES
('Atlantic Car Parts', 'USA'),
('Aussie Auto Supplies', 'Australia'),
('Tokyo Motors', 'Japan');
-- Insert 20 additional manufacturers into the Manufacturers table
INSERT INTO Manufacturers (Name, Country) VALUES
('AutoMasters Inc.', 'United States'),
('EcoDrive Parts', 'Canada'),
('MaxPerformance Co.', 'Germany'),
('SpeedZone Auto', 'Japan'),
('GreenParts Solutions', 'United Kingdom'),
('ElectroAuto Components', 'China'),
('PowerDrive Industries', 'South Korea'),
('CarParts Unlimited', 'Australia'),
('TurboTech Automotive', 'Italy'),
('Precision Gear Works', 'France'),
('Velocity Motors', 'Mexico'),
('PrimeAuto Supplies', 'India'),
('Elite Auto Parts', 'Brazil'),
('DynamicDrive Systems', 'Sweden'),
('PerformancePlus Components', 'Switzerland'),
('RoadSafe Equipment', 'Netherlands'),
('Universal CarTech', 'Spain'),
('ProAuto Accessories', 'Belgium'),
('QualityAuto Makers', 'Austria'),
('Durable Motors', 'South Africa');

INSERT INTO Products (ProductName, ManufacturerID, Price, StockQuantity) VALUES
('Brake Pads', 7, 45.00, 200),
('Oil Filter', 8, 15.00, 500),
('Air Filter', 9, 20.00, 450);


INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, PaymentID) VALUES
(6, '2024-10-02', 90.00, 6),
(7, '2024-10-05', 60.00, 7),
(8, '2024-10-10', 40.00, 8);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(6, 9, 2, 45.00),
(7, 10, 4, 15.00),
(8, 11, 2, 20.00);

INSERT INTO Payments (OrderID, PaymentDate, PaymentMethod, Amount) VALUES
(6, '2024-10-02', 'Credit Card', 90.00),
(7, '2024-10-05', 'PayPal', 60.00),
(8, '2024-10-10', 'Debit Card', 40.00);


INSERT INTO Deliveries (OrderID, DeliveryDate, DeliveryAddress, DeliveryFee) VALUES
(6, '2024-10-03', '10 Downing Street, London', 5.00),
(7, '2024-10-06', '221B Baker Street, London', 7.00),
(8, '2024-10-11', '5 Fleet Street, London', 6.00);


INSERT INTO PurchaseOrders (ManufacturerID, OrderDate, TotalAmount) VALUES
(6, '2024-09-01', 2000.00),
(7, '2024-09-15', 1750.00);


INSERT INTO PurchaseOrderDetails (PurchaseOrderID, ProductID, Quantity) VALUES
(6, 12, 250),
(7, 13, 300);


INSERT INTO Suppliers (ManufacturerID, ContactPerson, ContactNumber) VALUES
(6, 'John Smith', '+1 202 555 0191'),
(7, 'Kylie Robertson', '+61 2 1234 5678');

-- Insert 20 additional products into the Products table
INSERT INTO Products (ProductName, ManufacturerID, Price, StockQuantity) VALUES
('All-Weather Wiper Blades', 1, 15.99, 500),
('Ceramic Brake Pads', 2, 45.00, 150),
('Synthetic Transmission Fluid', 1, 30.00, 200),
('High-Performance Air Filter', 3, 22.50, 350),
('LED Headlight Conversion Kit', 2, 75.99, 100),
('Car Floor Mats Set', 1, 25.00, 300),
('Battery Charger and Maintainer', 3, 60.00, 90),
('Spark Plug Set', 2, 35.00, 120),
('Leather Seat Covers', 1, 55.00, 80),
('Wireless Car Charger', 3, 20.00, 250),
('Portable Jump Starter', 2, 110.00, 60),
('Car Wax Polish', 1, 12.00, 400),
('Engine Degreaser', 1, 10.50, 180),
('Rear-View Camera Kit', 3, 85.99, 70),
('Universal Roof Rack', 2, 125.00, 50),
('Portable Vacuum Cleaner', 3, 45.00, 140),
('Bluetooth FM Transmitter', 1, 15.00, 220),
('Mini Tire Inflator', 2, 40.00, 160),
('Anti-Theft Steering Wheel Lock', 3, 35.00, 130),
('GPS Navigation System', 1, 150.00, 55);


-- 1. Show all customers
SELECT * FROM Customers;

-- 2. Show all products
SELECT * FROM Products;

-- 3. Show all manufacturers
SELECT * FROM Manufacturers;

-- 4. Show all orders
SELECT * FROM Orders;

-- 5. Show all order details
SELECT * FROM OrderDetails;

-- 6. Show all payments
SELECT * FROM Payments;

-- 7. Show all deliveries
SELECT * FROM Deliveries;

-- 8. Show all purchase orders
SELECT * FROM PurchaseOrders;

-- 9. Show all purchase order details
SELECT * FROM PurchaseOrderDetails;

-- 10. Show all suppliers
SELECT * FROM Suppliers;



-- 1. List All Orders by Customer 'Sebastian Cromwell'
SELECT Orders.OrderID, Orders.OrderDate, Orders.TotalAmount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Name = 'Sebastian Cromwell';

-- 2. Retrieve All Products from Manufacturer 'Imperial Auto Components'
SELECT Products.ProductName, Products.Price, Products.StockQuantity
FROM Products
JOIN Manufacturers ON Products.ManufacturerID = Manufacturers.ManufacturerID
WHERE Manufacturers.Name = 'Imperial Auto Components';

-- 3. Show Total Amount Spent by Customer 'Eliza Fairweather'
SELECT Customers.Name, SUM(Orders.TotalAmount) AS TotalSpent
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Name = 'Eliza Fairweather'
GROUP BY Customers.Name;

-- 4. List All Payments Made Using 'Apple Pay'
SELECT Payments.PaymentID, Payments.PaymentDate, Payments.Amount
FROM Payments
WHERE Payments.PaymentMethod = 'Apple Pay';

-- 5. Display Products Ordered in Order Placed by 'Arthur Pendleton'
SELECT Products.ProductName, OrderDetails.Quantity, OrderDetails.UnitPrice
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Customers.Name = 'Arthur Pendleton';

-- 6. List All Deliveries Made to Address '34 High Holborn, London'
SELECT Deliveries.DeliveryID, Deliveries.DeliveryDate, Orders.OrderID
FROM Deliveries
JOIN Orders ON Deliveries.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Deliveries.DeliveryAddress = '34 High Holborn, London';

-- 7. Find All Manufacturers Supplying 'Turbocharger Kit'
SELECT Manufacturers.Name, Manufacturers.Country
FROM Manufacturers
JOIN Products ON Manufacturers.ManufacturerID = Products.ManufacturerID
WHERE Products.ProductName = 'Turbocharger Kit';

-- 8. Get All Orders with a Total Amount Greater Than £200
SELECT Orders.OrderID, Customers.Name, Orders.TotalAmount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.TotalAmount > 200;

-- 9. List Products with Stock Below 100 Units
SELECT ProductName, StockQuantity
FROM Products
WHERE StockQuantity < 100;

-- 10. Find Total Purchase Orders Sent to 'Schneider Motors'
SELECT Manufacturers.Name, COUNT(PurchaseOrders.PurchaseOrderID) AS TotalPurchaseOrders
FROM PurchaseOrders
JOIN Manufacturers ON PurchaseOrders.ManufacturerID = Manufacturers.ManufacturerID
WHERE Manufacturers.Name = 'Schneider Motors'
GROUP BY Manufacturers.Name;

