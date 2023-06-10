USE master
CREATE DATABASE HardwareDW
GO

USE HardwareDW
GO

CREATE TABLE DimDate (
   [DateKey]  int   NOT NULL
,  [FullDate]  date   NULL
,  [DayNumberOfWeek]  tinyint   NOT NULL
,  [DayNameOfWeek]  nchar(10)   NOT NULL
,  [DayNumberOfMonth]  tinyint   NOT NULL
,  [DayNumberOfYear]  smallint   NOT NULL
,  [WeekNumberOfYear]  tinyint   NOT NULL
,  [MonthName]  nchar(10)   NOT NULL
,  [MonthNumberOfYear]  tinyint   NOT NULL
,  [CalendarQuarter]  tinyint   NOT NULL
,  [CalendarYear]  smallint   NOT NULL
, CONSTRAINT [PK_Hardware.DimDate] PRIMARY KEY CLUSTERED 
( [DateKey] )
) ON [PRIMARY]

CREATE TABLE DimCustomer (
   [CustomerKey]  int IDENTITY  NOT NULL
,  [CustomerID]  int   NOT NULL
,  [CustomerName]  nvarchar(255)   NOT NULL
,  [Address]  nvarchar(255)   NOT NULL
,  [Website]  nvarchar(255)   NOT NULL
,  [CreditLimit]  int   NOT NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
, CONSTRAINT [PK_Hardware.DimCustomer] PRIMARY KEY CLUSTERED 
( [CustomerKey] )
) ON [PRIMARY]
GO

CREATE TABLE DimGeography (
   [GeographyKey] int IDENTITY  NOT NULL
,  [LocationID]  int   NOT NULL
,  [Region]  nvarchar(50)   NOT NULL
,  [CountryCode]  char(2)   NOT NULL
,  [CountryName]  nvarchar(40) NOT NULL
,  [State]  nvarchar(50) NULL
,  [City]  nvarchar(50) NOT NULL
,  [PostalCode] nvarchar(20) NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899'  NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NULL
,  [RowChangeReason]  nvarchar(200)   NULL
, CONSTRAINT [PK_Hardware.DimGeography] PRIMARY KEY CLUSTERED 
( [GeographyKey] )
) ON [PRIMARY]
GO

CREATE TABLE DimProduct (
   [ProductKey]  int IDENTITY  NOT NULL
,  [ProductID]  int   NOT NULL
,  [ProductName]  nvarchar(255)   NOT NULL
,  [CategoryId]  int NOT NULL
,  [Description]  nvarchar(2000) NOT NULL
,  [StandardCost]  int NOT NULL
,  [ListPrice]  int NOT NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
, CONSTRAINT [PK_Hardware.DimProduct] PRIMARY KEY CLUSTERED 
( [ProductKey] )
) ON [PRIMARY]
Go

CREATE TABLE DimCategory (
   [CategoryKey]  int IDENTITY  NOT NULL
,  [CategoryID]  int   NOT NULL
,  [CategoryName]  nvarchar(255) NOT NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
, CONSTRAINT [PK_Hardware.DimCategory] PRIMARY KEY CLUSTERED 
( [CategoryKey] )
) ON [PRIMARY]
Go

CREATE TABLE DimEmployee (
   [EmployeeKey]  int IDENTITY  NOT NULL
,  [EmployeeID]  int   NOT NULL
,  [FirstName]  nvarchar(255)   NOT NULL
,  [LastName]  nvarchar(255)   NOT NULL
,  [Email]  nvarchar(255)   NOT NULL
,  [Phone]  nvarchar(50)   NOT NULL
,  [HireDate]  date NOT NULL
,  [ManagerID]  int 
,  [JobTitle]  nvarchar(255) NOT NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
, CONSTRAINT [PK_Hardware.DimEmployee] PRIMARY KEY CLUSTERED 
( [EmployeeKey] )
) ON [PRIMARY]
Go

CREATE TABLE DimInventory (
   [InventoryKey]  int IDENTITY  NOT NULL
,  [ProductID]  int   NOT NULL
,  [WarehouseId] int  NOT NULL
,  [WarehouseName] nvarchar(255)  NOT NULL
,  [RowIsCurrent]  bit  DEFAULT 1 NOT NULL
,  [RowStartDate]  datetime  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  datetime  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NULL
, CONSTRAINT [PK_Hardware.DimInventory] PRIMARY KEY CLUSTERED 
( [InventoryKey] )
) ON [PRIMARY]

Go

CREATE TABLE FactSales (
   [DateKey]  int   NOT NULL
,  [CustomerKey]  int   NOT NULL
,  [EmployeeKey]  int   NOT NULL
,  [ProductKey]  int   NOT NULL
,  [UnitPrice]  int   NOT NULL
,  [Quantity]  int   NOT NULL
,  [SalesAmount]  int   NOT NULL
, CONSTRAINT [PK_Hardware.FactSales] PRIMARY KEY NONCLUSTERED 
( [DateKey],[ProductKey] )
) ON [PRIMARY]
Go

CREATE TABLE FactHumanResources (
   [HireDateKey]  int   NOT NULL
,  [EmployeeKey]  int   NOT NULL
,  [Quater]  int   NOT NULL
,  [Year]  int   NOT NULL
,  [JobTitle]  nvarchar(25)   NOT NULL
,  [JobtitleCount]  int   NOT NULL
, CONSTRAINT [PK_Hardware.FactHumanResources ] PRIMARY KEY NONCLUSTERED 
(  [HireDateKey], [EmployeeKey])
) ON [PRIMARY]
Go

CREATE TABLE FactProductInventory (
  [GeographyKey]  int   NOT NULL
,  [InventoryKey]  int    NOT NULL
,  [CategoryKey]  int   NOT NULL
,  [ProductKey]  int   NOT NULL
,  [Quantity]  int   NOT NULL
, CONSTRAINT [PK_Hardware.FactProductInventory] PRIMARY KEY NONCLUSTERED 
( [InventoryKey], [ProductKey] )
) ON [PRIMARY]
Go

ALTER TABLE FactSales ADD CONSTRAINT
   FK_Hardware_FactSales_DateKey FOREIGN KEY
   (
   DateKey
   ) REFERENCES DimDate
   ( DateKey)
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
GO

ALTER TABLE FactSales ADD CONSTRAINT
   FK_Hardware_FactSales_CustomerKey FOREIGN KEY
   (
   CustomerKey
   ) REFERENCES DimCustomer
   ( CustomerKey)
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
GO

ALTER TABLE FactSales ADD CONSTRAINT
   FK_Hardware_FactSales_EmployeeKey FOREIGN KEY
   (
   EmployeeKey
   ) REFERENCES DimEmployee
   ( EmployeeKey)
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
GO


ALTER TABLE FactSales ADD CONSTRAINT
   FK_Hardware_FactSales_ProductKey FOREIGN KEY
   (
   ProductKey
   ) REFERENCES DimProduct
   ( ProductKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
GO


ALTER TABLE FactProductInventory ADD CONSTRAINT
   FK_Hardware_FactProductInventory_GeographyKey FOREIGN KEY
   (
   GeographyKey
   ) REFERENCES DimGeography
   ( GeographyKey)
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
GO

ALTER TABLE FactProductInventory ADD CONSTRAINT
   FK_Hardware_FactProductInventory_InventoryKey FOREIGN KEY
   (
   InventoryKey
   ) REFERENCES DimInventory
   ( InventoryKey)
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
GO

ALTER TABLE FactProductInventory ADD CONSTRAINT
   FK_Hardware_FactProductInventory_CategoryKey FOREIGN KEY
   (
   CategoryKey
   ) REFERENCES DimCategory
   ( CategoryKey)
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
GO

ALTER TABLE FactProductInventory ADD CONSTRAINT
   FK_Hardware_FactProductInventory_ProductKey FOREIGN KEY
   (
   ProductKey
   ) REFERENCES DimProduct
   ( ProductKey)
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
GO

ALTER TABLE FactHumanResources ADD CONSTRAINT
   FK_Hardware_FactHumanResources_DatetKey FOREIGN KEY
   (
   HireDateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
GO


ALTER TABLE FactHumanResources ADD CONSTRAINT
   FK_Hardware_FactHumanResources_EmployeeKey FOREIGN KEY
   (
   EmployeeKey
   ) REFERENCES DimEmployee
   ( EmployeeKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
GO
