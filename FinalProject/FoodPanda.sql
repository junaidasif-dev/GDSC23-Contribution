 -- In this file, I used DDL commands for creating a FoodPanda Database.

Show databases;
Create Database FoodPanda;
Use Foodpanda; 
Show tables;

Create TABLE Customers (
CustomerID INT Unsigned Primary Key,
CusName VARCHAR(25) NOT NULL,
Email VARCHAR(50) Unique Key NOT NULL,
PhoneNo INT Unique Key NOT NULL,
Address MediumText NOT NULL,
PaymentsInfo MediumText NOT NULL
);

Desc Customers;

Drop Table Customers;

Create Table Orders (
OrderID INT Unsigned Primary Key,
Date_Time datetime,
Status varchar(10),
CustomerID INT unsigned,
foreign key(CustomerID) references Customers(CustomerID),
PersonnelID INT unsigned,
foreign key(PersonnelID) references DelieveryPersonnel(PersonnelID)
);

Create Table DelieveryPersonnel (
PersonnelID INT unsigned primary key,
PersonnelName varchar(25),
PhoneNo int,
VehicleType varchar(10),
VehicleNo varchar(13)
);

create table Payment (
PaymentID int unsigned primary key,
Amout int unsigned,
Date_Time datetime,
Method varchar(20)
);

Desc orders;

ALTER TABLE ORDERS
ADD PaymentID INT UNSIGNED,
ADD foreign key(PaymentID) references Payment(PaymentID); 

create table Resturant(
ResturantID int unsigned,
ResName varchar(45),
Address mediumtext,
PhoneNo int,
OperatingHours int
);

alter table Resturant
Add constraint primary key(ResturantID);

alter table Resturant
Add constraint unique key(PhoneNo);

DESC Resturant;

Create table Menu(
ItemID int unsigned primary key,
ItemName varchar(25),
Description longtext,
Price int,
Category varchar(20),
ResturantID int unsigned,
foreign key(ResturantID) references Resturant(ResturantID)
);

ALTER TABLE Menu
ADD OrderID INT unsigned,
ADD foreign key (OrderID) references Orders(OrderID);

ALTER TABLE Orders
ADD ItemID INT unsigned,
ADD foreign key (ItemID) references Menu(ItemID);

create table Review_Ratings (
CustomerID INT unsigned,
ResturantID int unsigned,
Rating int,
TextReview mediumtext,
Date_Time datetime,
foreign key (CustomerID) references Customers(CustomerID),
foreign key (ResturantID) references Resturant(ResturantID)
);

Show Tables;