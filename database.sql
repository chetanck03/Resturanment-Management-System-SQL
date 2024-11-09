-- Drop the database if it exists
DROP DATABASE IF EXISTS `restaurant`;

-- Create the database
CREATE DATABASE `restaurant`;
USE `restaurant`;

-- USER table to store user information
DROP TABLE IF EXISTS `USER`;
CREATE TABLE `USER` (
    `User_Id` INT NOT NULL AUTO_INCREMENT,
    `Fname` VARCHAR(50) NOT NULL,
    `Lname` VARCHAR(50) NOT NULL,
    `Password` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert sample data into USER table
INSERT INTO `USER` (`Fname`, `Lname`, `Password`) VALUES
('Alice', 'Smith', 'alice123'),
('Bob', 'Johnson', 'bob456'),
('Charlie', 'Brown', 'charlie789');

-- RESTAURANT table to store restaurant details
DROP TABLE IF EXISTS `RESTAURANT`;
CREATE TABLE `RESTAURANT` (
    `Name` VARCHAR(100) NOT NULL,
    `Location` VARCHAR(100) NOT NULL,
    `Contact` VARCHAR(100) NOT NULL,
    `Opening_Closing_Time` VARCHAR(100) NOT NULL,
    `Details` VARCHAR(500) DEFAULT NULL,
    PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert sample data into RESTAURANT table
INSERT INTO `RESTAURANT` (`Name`, `Location`, `Contact`, `Opening_Closing_Time`, `Details`) VALUES
('Tandoori By Nature', 'Gandhi Nagar, Jammu', '09642540626', '10:00 AM - 12:00 AM', 'Specializes in North Indian Cuisine'),
('Pizza Palace', 'Rohini, Delhi', '09876543210', '11:00 AM - 11:00 PM', 'Famous for Italian Pizzas');

-- OWNER table to store restaurant owner details
DROP TABLE IF EXISTS `OWNER`;
CREATE TABLE `OWNER` (
    `Fname` VARCHAR(15) NOT NULL,
    `Lname` VARCHAR(15) NOT NULL,
    `Contact` VARCHAR(100) NOT NULL,
    `Rest_Name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`Fname`, `Lname`, `Contact`),
    FOREIGN KEY (`Rest_Name`) REFERENCES `RESTAURANT`(`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert sample data into OWNER table
INSERT INTO `OWNER` (`Fname`, `Lname`, `Contact`, `Rest_Name`) VALUES
('Yash', 'Vadalia', '9999999999', 'Tandoori By Nature'),
('Priya', 'Singh', '8888888888', 'Pizza Palace');

-- BILL table for order billing information
DROP TABLE IF EXISTS `BILL`;
CREATE TABLE `BILL` (
    `Order_Id` INT NOT NULL AUTO_INCREMENT,
    `Customer_Fname` VARCHAR(20) NOT NULL,
    `Customer_Lname` VARCHAR(20) NOT NULL,
    `Customer_id` INT NOT NULL,
    `Total_Amount` DOUBLE NOT NULL,	
    PRIMARY KEY (`Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert sample data into BILL table
INSERT INTO `BILL` (`Customer_Fname`, `Customer_Lname`, `Customer_id`, `Total_Amount`) VALUES
('John', 'Doe', 1, 450.00),
('Jane', 'Doe', 2, 300.00);

-- MENU_BILL table to link menu items with bills
DROP TABLE IF EXISTS `MENU_BILL`;
CREATE TABLE `MENU_BILL` (
    `Order_Id` INT NOT NULL,
    `Name` VARCHAR(100) NOT NULL,
    `Quantity` INT NOT NULL,
    `Price` DOUBLE NOT NULL,
    FOREIGN KEY(`Order_Id`) REFERENCES `BILL`(`Order_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert sample data into MENU_BILL table
INSERT INTO `MENU_BILL` (`Order_Id`, `Name`, `Quantity`, `Price`) VALUES
(1, 'Paneer Tikka', 2, 200.00),
(1, 'Garlic Naan', 3, 50.00),
(2, 'Margherita Pizza', 1, 300.00);

-- CUSTOMER table to store customer information
DROP TABLE IF EXISTS `CUSTOMER`;
CREATE TABLE `CUSTOMER` (
    `Customer_Id` INT NOT NULL AUTO_INCREMENT,
    `Fname` VARCHAR(15) NOT NULL,
    `Lname` VARCHAR(15) NOT NULL,
    `Contact` VARCHAR(20) DEFAULT NULL,
    `Email_Id` VARCHAR(50) DEFAULT NULL,	
    PRIMARY KEY (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert sample data into CUSTOMER table
INSERT INTO `CUSTOMER` (`Fname`, `Lname`, `Contact`, `Email_Id`) VALUES
('John', 'Doe', '9876543210', 'johndoe@example.com'),
('Jane', 'Doe', '9876543211', 'janedoe@example.com');

-- MANAGER table to store restaurant manager details
DROP TABLE IF EXISTS `MANAGER`;
CREATE TABLE `MANAGER` (
    `Manager_Id` INT NOT NULL AUTO_INCREMENT,
    `Fname` VARCHAR(15) NOT NULL,
    `Lname` VARCHAR(15) NOT NULL,
    `Contact` VARCHAR(20) NOT NULL,
    `Address` VARCHAR(30) DEFAULT NULL,
    `Salary` DECIMAL(10,2) DEFAULT NULL,
    `Sex` CHAR(1) DEFAULT NULL,
    `Bdate` DATE DEFAULT NULL,
    `Join_Date` DATE NOT NULL,
    PRIMARY KEY (`Manager_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert sample data into MANAGER table
INSERT INTO `MANAGER` (`Fname`, `Lname`, `Contact`, `Address`, `Salary`, `Sex`, `Bdate`, `Join_Date`) VALUES
('Amit', 'Sharma', '9876543212', 'Jammu City', 50000.00, 'M', '1985-06-15', '2022-01-10'),
('Sunita', 'Kumar', '9876543213', 'Delhi City', 55000.00, 'F', '1990-03-10', '2023-02-05');

-- WAITER table to store waiter details
DROP TABLE IF EXISTS `WAITER`;
CREATE TABLE `WAITER` (
    `Waiter_Id` INT NOT NULL AUTO_INCREMENT,
    `Fname` VARCHAR(15) NOT NULL,
    `Lname` VARCHAR(15) NOT NULL,
    `Contact` VARCHAR(20) NOT NULL,
    `Address` VARCHAR(30) DEFAULT NULL,
    `Salary` DECIMAL(10,2) DEFAULT NULL,
    `Sex` CHAR(1) DEFAULT NULL,
    `Bdate` DATE DEFAULT NULL,
    `Join_Date` DATE NOT NULL,
    PRIMARY KEY (`Waiter_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert sample data into WAITER table
INSERT INTO `WAITER` (`Fname`, `Lname`, `Contact`, `Address`, `Salary`, `Sex`, `Bdate`, `Join_Date`) VALUES
('Rahul', 'Verma', '9876543214', 'Rohini, Delhi', 25000.00, 'M', '1995-08-20', '2023-05-10'),
('Pooja', 'Rana', '9876543215', 'Gandhi Nagar, Jammu', 24000.00, 'F', '1998-11-15', '2024-01-15');

-- Display tables
SELECT * FROM `USER`;
SELECT * FROM `RESTAURANT`;
SELECT * FROM `OWNER`;
SELECT * FROM `BILL`;
SELECT * FROM `MENU_BILL`;
SELECT * FROM `CUSTOMER`;
SELECT * FROM `MANAGER`;
SELECT * FROM `WAITER`;
