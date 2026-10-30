-- 1. Suppliers Table
CREATE TABLE Suppliers (
    SupplierID VARCHAR(10) PRIMARY KEY,
    SupplierName VARCHAR(100),
    AverageLeadTime_Days INT
);

-- 2. Locations Table
CREATE TABLE Locations (
    LocationID VARCHAR(10) PRIMARY KEY,
    FacilityName VARCHAR(100),
    Capacity INT
);

-- 3. Products Table
CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitCost NUMERIC(10, 2),
    UnitPrice NUMERIC(10, 2),
    SupplierID VARCHAR(10) REFERENCES Suppliers(SupplierID)
);

-- 4. Inventory_Batches Table
CREATE TABLE Inventory_Batches (
    BatchID VARCHAR(10) PRIMARY KEY,
    ProductID VARCHAR(10) REFERENCES Products(ProductID),
    LocationID VARCHAR(10) REFERENCES Locations(LocationID),
    QuantityReceived INT,
    CurrentStock INT,
    ManufacturingDate DATE,
    ExpiryDate DATE
);

-- 5. Sales_Records Table
CREATE TABLE Sales_Records (
    SaleID VARCHAR(10) PRIMARY KEY,
    BatchID VARCHAR(10) REFERENCES Inventory_Batches(BatchID),
    SaleDate DATE,
    QuantitySold INT
);
