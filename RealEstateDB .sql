create database RealEstateDB
use RealEstateDB 

CREATE TABLE SalesOffice (
    NUM INT PRIMARY KEY, 
    Loc NVARCHAR(255) 
);

CREATE TABLE Employee (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255),
    Office_NUM INT FOREIGN KEY REFERENCES SalesOffice(NUM) 
);

CREATE TABLE Property (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Zip NVARCHAR(20),
    Office_NUM INT FOREIGN KEY REFERENCES SalesOffice(NUM) 
);

CREATE TABLE Owner (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255)
);
ALTER TABLE SalesOffice 
ADD Manager_ID INT UNIQUE CONSTRAINT FK_Manager FOREIGN KEY (Manager_ID) REFERENCES Employee(ID);

 CREATE TABLE Property_Owner (
    Property_ID INT FOREIGN KEY REFERENCES Property(ID) ON DELETE CASCADE, 
    Owner_ID INT FOREIGN KEY REFERENCES Owner(ID) ON DELETE CASCADE,
    Percent_owned DECIMAL(5,2) CHECK (Percent_owned BETWEEN 0 AND 100),
    PRIMARY KEY (Property_ID, Owner_ID) 
);

INSERT INTO SalesOffice (NUM, Loc) VALUES (1, N'القاهرة');

INSERT INTO Employee (Name, Office_NUM) VALUES (N'أحمد علي', 1);

INSERT INTO Property (Address, City, State, Zip, Office_NUM) 
VALUES (N'شارع 123 الرئيسي', N'الجيزة', N'مصر', '12345', 1);

INSERT INTO Owner (Name) VALUES (N'محمد صلاح');

INSERT INTO Property_Owner (Property_ID, Owner_ID, Percent_owned) 
VALUES (1, 1, 100.00);

SELECT P.ID, P.Address, P.City, P.State, P.Zip 
FROM Property P
JOIN SalesOffice S ON P.Office_NUM = S.NUM
WHERE S.NUM = 1;

SELECT O.Name, PO.Percent_owned
FROM Owner O
JOIN Property_Owner PO ON O.ID = PO.Owner_ID
WHERE PO.Property_ID = 1;

SELECT E.ID, E.Name, S.Loc AS SalesOffice_Location
FROM Employee E
JOIN SalesOffice S ON E.Office_NUM = S.NUM;

SELECT * FROM Property;
SELECT * FROM SalesOffice;
SELECT * FROM Employee;






