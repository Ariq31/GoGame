CREATE DATABASE GoGame
GO
USE GoGame
GO

CREATE TABLE customer (
    CustomerID CHAR(5) PRIMARY KEY CHECK(CustomerID LIKE ('CU[0-9][0-9][0-9]')),
    CustomerName VARCHAR(50) NOT NULL,
    CustomerGender VARCHAR(10) CHECK(CustomerGender IN ('Male', 'Female')) NOT NULL,
    CustomerDoB DATE NOT NULL,
    CustomerPhoneNumber VARCHAR(12) NOT NULL
)

CREATE TABLE staff (
    StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE ('ST[0-9][0-9][0-9]')),
    StaffName VARCHAR(50) NOT NULL,
    StaffGender VARCHAR(10) CHECK(StaffGender IN ('Male', 'Female')) NOT NULL,
    StaffDoB DATE NOT NULL,
    StaffSalary FLOAT NOT NULL,
    StaffAddress VARCHAR(255) NOT NULL,
    StaffPhoneNumber VARCHAR(12) NOT NULL
) 

CREATE TABLE supplier (
    SupplierID CHAR(5) PRIMARY KEY CHECK(SupplierID LIKE ('SU[0-9][0-9][0-9]')),
    SupplierName VARCHAR(50) NOT NULL,
    SupplierAddress VARCHAR(255) NOT NULL,
    SupplierPhoneNumber VARCHAR(12) NOT NULL
) 

CREATE TABLE game_type (
    GameTypeID CHAR(5) PRIMARY KEY CHECK(GameTypeID LIKE ('GT[0-9][0-9][0-9]')),
    GameTypeName VARCHAR(50) NOT NULL
) 

CREATE TABLE game (
    GameID CHAR(5) PRIMARY KEY CHECK(GameID LIKE ('GA[0-9][0-9][0-9]')),
    GameTypeID CHAR(5) REFERENCES game_type(GameTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    GameName VARCHAR(50) CHECK (LEN(GameName) >= 5) NOT NULL,
    GamePrice FLOAT NOT NULL,
    GameReleaseDate DATE CHECK (GameReleaseDate <= CAST(GETDATE() AS DATE)) NOT NULL
)

CREATE TABLE purchase_header (
    PurchaseID CHAR(5) PRIMARY KEY CHECK(PurchaseID LIKE ('PU[0-9][0-9][0-9]')),
    StaffID CHAR(5) REFERENCES staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    SupplierID CHAR(5) REFERENCES supplier(SupplierID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    PurchaseDate DATE CHECK (PurchaseDate <= CAST(GETDATE() AS DATE)) NOT NULL
)

CREATE TABLE purchase_detail (
    PurchaseID CHAR(5) CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
    GameID CHAR(5) REFERENCES game(GameID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    Quantity INT CHECK (Quantity > 0) NOT NULL,
	PRIMARY KEY (PurchaseID, GameID),
    FOREIGN KEY (PurchaseID) REFERENCES purchase_header(PurchaseID)
)

CREATE TABLE sales_header (
    SalesID CHAR(5) PRIMARY KEY CHECK(SalesID LIKE ('SA[0-9][0-9][0-9]')),
    StaffID CHAR(5) REFERENCES staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    CustomerID CHAR(5) REFERENCES customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    TransactionDate Date CHECK (TransactionDate <= CAST(GETDATE() AS DATE)) NOT NULL
)

CREATE TABLE sales_detail (
    SalesID CHAR(5) CHECK(SalesID LIKE ('SA[0-9][0-9][0-9]')),
    GameID CHAR(5) REFERENCES game(GameID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    Quantity INT CHECK(Quantity > 0) NOT NULL,
	PRIMARY KEY (SalesID, GameID),
    FOREIGN KEY (SalesID) REFERENCES sales_header(SalesID)
)