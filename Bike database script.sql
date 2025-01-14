CREATE DATABASE Bike_Store;
USE Bike_Store;

-- Creating TABLE Stores

CREATE TABLE Stores (
    Store_ID INT PRIMARY KEY,
    Store_name VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(20),
    Store_Address VARCHAR(50),
    City VARCHAR(10),
    State VARCHAR(10),
    Zip_code INT
);

-- Creating TABLE Staffs

CREATE TABLE Staffs (
    Staff_ID INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(20),
    Phone VARCHAR(20),
    Active INT,
    Store_ID INT,
    Manager_ID INT,
    FOREIGN KEY (Store_ID)
        REFERENCES Stores (Store_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE staffs
MODIFY COLUMN email VARCHAR(50);
ALTER TABLE staffs
MODIFY COLUMN Manager_id VARCHAR(5);

INSERT INTO staffs
(Staff_ID, First_name, Last_name, Email, Phone, Active,Store_ID, Manager_ID)
VALUES
(1, "Fabiola", "Jackson", "fabiola.jackson@bikes.shop","(831) 555-5554",1,1,"null"),
(2, "Mireya", "Copeland", "mireya.copeland@bikes.shop","(831) 555-5555",1,1,1),
(3, "Genna", "Serrano", "genna.serrano@bikes.shop","(831) 555-5556",1,1,2),
(4, "Virgie", "Wiggins", "virgie.wiggins@bikes.shop","(831) 555-5557",1,1,2), 
(5, "Jannette", "David", "jannette.david@bikes.shop","(516) 379-4444",1,2,1),
(6, "Marcelene", "Boyer", "marcelene.boyer@bikes.shop","(516) 379-4445",1,2,5),
(7, "Venita", "Daniel", "venita.daniel@bikes.shop","(516) 379-4446",1,2,5), 
(8, "Kali", "Vargas", "kali.vargas@bikes.shop","(972) 530-5555",1,3,1),
(9, "Layla", "Terrell", "layla.terrell@bikes.shop","(972) 530-5556",1,3,7),
(10, "Bernardine", "Houston", "bernardine.houston@bikes.shop","(972) 530-5557",1,3,7);

-- Creating TABLE Categories

CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY,
    Category_name VARCHAR(50)
);

-- Creating TABLE Categories

CREATE TABLE Brands (
    Brand_ID INT PRIMARY KEY,
    Brand_name VARCHAR(50)
);

-- Creating TABLE Customers

CREATE TABLE Customers (
    Cust_ID INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(20),
    Cust_Address VARCHAR(50),
    City VARCHAR(10),
    State VARCHAR(10),
    Zip_code INT
);

-- Creating TABLE Products

CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_name VARCHAR(50),
    Brand_ID INT,
    Category_ID INT,
    Model_year INT,
    List_price INT,
    FOREIGN KEY (Brand_ID)
        REFERENCES Brands (Brand_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Category_ID)
        REFERENCES categories (Category_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creating TABLE Orders

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Cust_ID INT,
    Order_status INT,
    Order_date VARCHAR(10),
    Required_date VARCHAR(10),
    Shipped_date VARCHAR(10),
    Store_ID INT,
    Staff_ID INT,
    FOREIGN KEY (Cust_ID)
        REFERENCES Customers (Cust_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Store_ID)
        REFERENCES Stores (Store_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Staff_ID)
        REFERENCES Staffs (Staff_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creating TABLE Stocks

CREATE TABLE Stocks (
    Store_ID INT,
    Product_ID INT,
    Quantity INT,
    FOREIGN KEY (Store_ID)
        REFERENCES Stores (Store_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Product_ID)
        REFERENCES products (Product_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creating TABLE Order_items

CREATE TABLE Order_items (
    Order_ID INT,
    Item_ID INT,
    Product_ID INT,
    Quantity INT,
    List_price INT,
    Discount INT,
    FOREIGN KEY (Order_ID)
        REFERENCES Orders (Order_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Product_ID)
        REFERENCES Products (Product_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

