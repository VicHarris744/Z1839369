/* This code is from my group project in my Database Management class */

/* This is the database for an auto parts company*/

/*Customers table*/
CREATE TABLE Customers(
    CustomerID INT NOT NULL,
    CompanyName VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    PhoneNumber INT NOT NULL,
    City CHAR(15) NOT NULL,
    State CHAR(2) NOT NULL,
    ZipCode MEDIUMINT NOT NULL,
	PRIMARY KEY (CustomerID)
);

CREATE TABLE Suppliers(
    VendorID VARCHAR(40) NOT NULL,
    SupplierName VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    PhoneNumber INT NOT NULL,
    City CHAR(15) NOT NULL,
    ZipCode MEDIUMINT NOT NULL,
    Revenue INT NOT NULL,
	PRIMARY KEY (VendorID)
);

CREATE  TABLE Department(
	DepartmentID Int NOT NULL,
	EmployeeQuatity INT NOT NULL,
	DepartmentType VarChar(25) NOT NULL,
	PRIMARY KEY (DepartmentID)
);


create table Material_Product(
   MaterialID INT NOT NULL,
   ProductID VARCHAR(100) NOT NULL,
   Weight VARCHAR(100) NOT NULL,
   Quantity VARCHAR(40) NOT NULL,
    Region VARCHAR(40) NOT NULL,
    MaterialCost VARCHAR(40) NOT NULL,
    WIP VARCHAR(40) NOT NULL,
    FinishedGoods VARCHAR(40) NOT NULL,
    RawMaterials VARCHAR(40) NOT NULL,
   VendorID  VARCHAR(40) NOT NULL,
    CostID VARCHAR(40) NOT NULL,
   PRIMARY KEY ( MaterialID ), 
	CONSTRAINT FK_VendorID FOREIGN KEY (VENDORID) REFERENCES Suppliers(VendorID)
);

create table Lineitem(
   ItemID INT NOT NULL,
   ProductID VARCHAR(100) NOT NULL,
   MaterialID INT NOT NULL,
     UnitPrice VARCHAR(40) NOT NULL,
     Quantity VARCHAR(40) NOT NULL,
     Total VARCHAR(40) NOT NULL,
   PRIMARY KEY ( ItemID ),
	CONSTRAINT FK_MaterialID FOREIGN KEY (MaterialID) REFERENCES Material_Product(MaterialID)
);

CREATE TABLE Costs(
    CostID INT NOT NULL,
    Inflation INT NOT NULL,
    Purchasing INT NOT NULL,
    MaterialCost INT NOT NULL, 
    ProductCost INT NOT NULL, 
    LaborCost INT NOT NULL, 
    AppraisalCost INT NOT NULL,
	PRIMARY KEY (CostID)
);

CREATE TABLE Shipping(
	ShippingID INT NOT NULL,
	CostID INT NOT NULL,
	TravelTime INT NOT NULL,
	Description VARCHAR(100) NOT NULL,
	PRIMARY KEY (ShippingID),
    CONSTRAINT FK_CostID FOREIGN KEY (CostID) REFERENCES Costs(CostID)
);

CREATE  TABLE Orders(
	OrderID Int NOT NULL,
   	ItemID Int NOT NULL,
	CustomerID INT NOT NULL,
	ShippingID INT NOT NULL,
	PRIMARY KEY (OrderID),
	CONSTRAINT FK_ItemID FOREIGN KEY (ItemId) REFERENCES Lineitem(ItemID),
	CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT FK_ShippingID FOREIGN KEY (ShippingID) REFERENCES Shipping(ShippingID)
);

CREATE TABLE Location(
	Region VARCHAR(40) NOT NULL,
	StoreProximity INT(100) NOT NULL,
	VendorID VARCHAR(40) NOT NULL,
	PRIMARY KEY (Region)
);
