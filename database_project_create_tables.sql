CREATE TABLE Department (
Department_ID int NOT NULL PRIMARY KEY,
Parent_ID int,
Short_description varchar(255) NOT NULL,
Title varchar(255) NOT NULL,
Description TEXT NOT NULL,
FOREIGN KEY(Parent_ID) REFERENCES Department(Department_ID)
);

CREATE TABLE User (
User_ID int NOT NULL PRIMARY KEY,
Last_name varchar(255) NOT NULL,
First_name varchar(255)NOT NULL,
E_mail varchar(255) NOT NULL,
`Password` varchar(255) NOT NULL,
Newsletter boolean NOT NULL,
Phone_number varchar(20) NOT NULL,
Postal_number varchar(50) NOT NULL,
City varchar(250) NOT NULL,
Street_adress varchar(250) NOT NULL,
SSN varchar(255) NOT NULL
);

CREATE TABLE Product (
Product_ID INT NOT NULL PRIMARY KEY,
Product_title VARCHAR(255) UNIQUE NOT NULL,
In_stock INT NOT NULL,
Description TEXT,
Price_without_tax DECIMAL(10,2) NOT NULL,
Tax DECIMAL(10,2) NOT NULL,
Discount DECIMAL(10,2),
Department_ID INT NOT NULL,
FOREIGN KEY(Department_ID) REFERENCES Department(Department_ID),
Featured BOOLEAN NOT NULL,
Discontinued BOOLEAN NOT NULL
)
;

CREATE TABLE Keyword (
Keyword_ID INT PRIMARY KEY,
Word varchar(255)
)
;

CREATE TABLE Product_Keyword (
Keyword_ID INT NOT NULL,
Product_ID INT,
FOREIGN KEY(Keyword_ID) REFERENCES Keyword(Keyword_ID),
FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID)
)
;

CREATE TABLE `Status` (
Status_ID int not null,
Short_description varchar(255) not null,
Long_description TEXT not null,
primary key(Status_ID)
);

CREATE TABLE `Order` (
Order_ID int not null,
User_ID int not null,
Status_ID int not null,
Payment_reference varchar(64) not null,
Order_date int not null,
Tracking_number int,
Date_of_last_change int,
Shipment_adress varchar(255) not null,
primary key(Order_ID, User_ID),
foreign key(User_ID) references `User`(User_ID),
foreign key(Status_ID) references `Status`(Status_ID)
);

CREATE TABLE `Order_Product` (
Order_ID int NOT null,
Product_ID int NOT null,
Quantity int NOT NULL,
Actual_price int NOT NULL, 
FOREIGN KEY(Order_ID) REFERENCES `Order`(Order_ID),
FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID),
PRIMARY KEY(Order_ID,Product_ID)
);

CREATE TABLE User_Product (
User_ID int not null,
Product_ID int not null,
Rating int,
Description TEXT,
primary key(User_ID, Product_ID),
foreign key(User_ID) references User (User_ID),
foreign key(Product_ID) references Product(Product_ID));
