-- CREATE DATABASE PROJECT;
-- Firstly, I Create tables 
-- Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactPerson VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address TEXT,
    ComplianceStatus VARCHAR(50)
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Description TEXT,
    UnitOfMeasure VARCHAR(20),
    BasePrice DECIMAL(10, 2)
);

-- Warehouse Table
CREATE TABLE Warehouse (
    WarehouseID INT PRIMARY KEY,
    LocationName VARCHAR(100),
    Capacity INT,
    CurrentOccupancy INT,
    ManagerName VARCHAR(100),
    Address TEXT
);

-- Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Role VARCHAR(50), 
    WarehouseID INT,
    ContactNumber VARCHAR(20),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

-- Batches Table
CREATE TABLE Batches (
    BatchID INT PRIMARY KEY,
    ProductID INT,
    SupplierID INT,
    Quantity INT,
    ManufactureDate DATE,
    ExpiryDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Tracking Table
CREATE TABLE Tracking (
    TrackingID INT PRIMARY KEY,
    BatchID INT,
    CurrentLocation VARCHAR(255),
    UpdateTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50),
    GPS_Coordinates VARCHAR(100),
    FOREIGN KEY (BatchID) REFERENCES Batches(BatchID)
);

-- Quality Assurance Table
CREATE TABLE QualityAssurance (
    QA_ID INT PRIMARY KEY,
    BatchID INT,
    StaffID INT,
    InspectionDate DATE,
    Result VARCHAR(10), 
    DefectDetails TEXT,
    Severity VARCHAR(50),
    FOREIGN KEY (BatchID) REFERENCES Batches(BatchID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Shipments Table
CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY,
    BatchID INT,
    StaffID INT,
    Origin VARCHAR(100),
    Destination VARCHAR(100),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    CarrierName VARCHAR(100),
    FOREIGN KEY (BatchID) REFERENCES Batches(BatchID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);


-- 2. DUMMY DATA INSERTION (20 Products & More)


-- Inserting Suppliers
INSERT INTO Suppliers VALUES 
(1, 'Agro Farms Ltd', 'Ali Khan', 'ali@agro.com', '0300-1112223', 'Multan Road, Lahore', 'Certified'),
(2, 'Global Tech Logistics', 'Sarah Ahmed', 'sarah@globaltech.com', '0321-4445556', 'I.I Chundrigar, Karachi', 'Pending'),
(3, 'Pure Dairy Co', 'Zain Malik', 'zain@puredairy.pk', '0311-9998887', 'Sahiwal Industrial Area', 'Certified');

-- Inserting 20 Products
INSERT INTO Products VALUES 
(1, 'Basmati Rice', 'Grains', 'Super Kernel Basmati', 'KG', 350.00),
(2, 'Refined Sugar', 'Essentials', 'Fine white sugar', 'KG', 140.00),
(3, 'Full Cream Milk', 'Dairy', 'Pasteurized milk', 'Litre', 210.00),
(4, 'Sunflower Oil', 'Oil', 'Vitamin A & D enriched', 'Litre', 550.00),
(5, 'Wheat Flour', 'Grains', 'Chakki Atta', 'KG', 120.00),
(6, 'Green Tea', 'Beverage', 'Organic Green Tea Leaves', 'Pack', 450.00),
(7, 'Tomato Ketchup', 'Condiments', 'Natural tomato paste', 'Bottle', 300.00),
(8, 'Iodized Salt', 'Essentials', 'Refined table salt', 'KG', 60.00),
(9, 'Organic Honey', 'Health', 'Pure Sidr Honey', 'Jar', 1200.00),
(10, 'Cheddar Cheese', 'Dairy', 'Aged 6 months', 'Block', 850.00),
(11, 'Red Lentils', 'Pulses', 'Masoor Dal Premium', 'KG', 280.00),
(12, 'Black Pepper', 'Spices', 'Whole black pepper', 'Pack', 150.00),
(13, 'Frozen Peas', 'Vegetables', 'Freshly frozen', 'Pack', 250.00),
(14, 'Almonds', 'Dry Fruit', 'California Almonds', 'KG', 2200.00),
(15, 'Milk Chocolate', 'Sweets', '70% Cocoa', 'Bar', 180.00),
(16, 'Apple Juice', 'Beverage', '100% Pure Juice', 'Litre', 280.00),
(17, 'Pasta', 'Italian', 'Durum Wheat Penne', 'Pack', 220.00),
(18, 'Dishwash Liquid', 'Cleaning', 'Lemon Fresh', 'Bottle', 350.00),
(19, 'Basmati Brown Rice', 'Grains', 'Diet friendly', 'KG', 400.00),
(20, 'Instant Coffee', 'Beverage', 'Roasted Arabica', 'Jar', 950.00);

-- Inserting Warehouses
INSERT INTO Warehouse VALUES 
(1, 'Central Hub Lahore', 5000, 1200, 'Rizwan Shah', 'Ferozepur Road'),
(2, 'Port Qasim Karachi', 10000, 4500, 'Usman Pirzada', 'Coastal Area');

-- Inserting Staff
INSERT INTO Staff VALUES 
(1, 'Ahmed Bilal', 'Inspector', 1, '0345-1234567'),
(2, 'Sajid Mehmood', 'Driver', 1, '0300-7654321'),
(3, 'Farhan Ali', 'Warehouse Manager', 2, '0333-1122334');

-- Inserting Batches
INSERT INTO Batches VALUES 
(101, 1, 1, 500, '2024-01-10', '2025-01-10', 'In Storage'),
(102, 3, 3, 200, '2024-05-01', '2024-05-15', 'Shipped'),
(103, 20, 2, 100, '2024-02-20', '2025-02-20', 'Pending Inspection');

-- Inserting Quality Assurance Records
INSERT INTO QualityAssurance VALUES 
(1, 101, 1, '2024-01-12', 'Pass', 'Standard quality met', 'None'),
(2, 102, 1, '2024-05-02', 'Pass', 'Fresh delivery', 'None');

-- Inserting Tracking Info
INSERT INTO Tracking VALUES 
(1, 102, 'Sheikhupura Interchange', CURRENT_TIMESTAMP, 'In Transit', '31.71, 73.98'),
(2, 101, 'Central Hub Lahore', CURRENT_TIMESTAMP, 'Received', '31.52, 74.35');


-- 3. TESTING QUERIES 


-- Query 1: Saare products aur unke suppliers ki details
SELECT P.ProductName, S.SupplierName, S.ComplianceStatus 
FROM Products P
JOIN Batches B ON P.ProductID = B.ProductID
JOIN Suppliers S ON B.SupplierID = S.SupplierID;

-- Query 2: Wo batches jo Quality check mein Pass huay
SELECT B.BatchID, P.ProductName, QA.Result, QA.InspectionDate 
FROM Batches B
JOIN Products P ON B.ProductID = P.ProductID
JOIN QualityAssurance QA ON B.BatchID = QA.BatchID
WHERE QA.Result = 'Pass';

-- Query 3: Real-time location check for a batch
SELECT B.BatchID, T.CurrentLocation, T.GPS_Coordinates, T.Status
FROM Batches B
JOIN Tracking T ON B.BatchID = T.BatchID;

-- Query 4 : Sirf wo batches dikhao jo quality check mein pass ho chukay hain aur shipment ke liye ready hain
SELECT B.BatchID, P.ProductName, Q.Result 
FROM Batches B
JOIN Products P ON B.ProductID = P.ProductID
JOIN QualityAssurance Q ON B.BatchID = Q.BatchID
WHERE Q.Result = 'Pass';

-- Query5 : location update karne ki query:
UPDATE Tracking 
SET CurrentLocation = 'Gujranwala Bypass', 
    GPS_Coordinates = '32.1872, 74.1945', 
    UpdateTimestamp = NOW()
WHERE BatchID = 102;

-- Query 6: ya check karna ka liya ka konsi product 15 dino ma expire hona wali ha 
SELECT BatchID, ProductID, ExpiryDate 
FROM Batches 
WHERE ExpiryDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 15 DAY);

-- Query 7: Ye command ensure karegi ke Result mein 'Pass' ya 'Fail' ke ilawa kuch enter na ho sake
ALTER TABLE QualityAssurance 
ADD CONSTRAINT check_result CHECK (Result IN ('Pass', 'Fail'));

-- Query 8: Ye command ensure karegi ke Supplier ka status 'Certified' ho tabhi batch enter ho (Logic)
SELECT SupplierName FROM Suppliers WHERE ComplianceStatus = 'Certified';

