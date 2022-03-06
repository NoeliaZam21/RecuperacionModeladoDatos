--Script de la creación del DWH
create database DataWarehouse;

GO
USE DataWarehouse
GO;


CREATE TABLE dim_Tipo(
id_Tipo integer primary key autoincrement,
Proposed_Construction_Type  varchar(50),
Existing_Construction_Type   varchar(100),
Existing_Construction_Type_Description  varchar(100),
Proposed_Construction_Type_Description varchar(100)
)

Go;

CREATE TABLE dim_Registro(
Id_record integer primary key,
Zipcode numeric(50),
Location varchar(100)
)

go;

CREATE TABLE dim_Permisos(
id_Permit integer primary key autoincrement,
Permit_Number varchar(100),
Permit_Type varchar(100),
Permit_Type_Definition varchar(300),
Permit_Creation_Date datetime
);

go;

CREATE TABLE dim_Calle(
id_street integer primary key autoincrement,
Lot varchar(50),
Street_Number numeric(30),
Street_Name varchar(100),
First_Construction_Document_Date datetime,
Description varchar(300)
)

go

CREATE TABLE dim_Obra(
id_Obra integer primary key autoincrement,
Block  varchar(50),
Neighborhoods_Analysis_Boundaries  varchar(500),
Filed Date datetime,
Supervisor_District   numeric(50)
)

go

CREATE TABLE dim_Estado(
id_Estado integer primary key autoincrement,
Street_Suffix varchar(50),
Current_Status datetime,
Current_Status_Date datetime,
Issued_Date datetime,
Completed_Date datetime
)

go


CREATE TABLE dim_Disenio(
id_design integer primary key autoincrement,
Unit varchar(10),
Structural_Notification varchar(300),
Number_of_Existing_Stories datetime,
Fire Only Permit  varchar(10), 
Permit Expiration Date  datetime
)

go



create table dim_Propuesta(
id_propuesta integer primary key autoincrement,
Plansets varchar(10),
Existing_Use varchar(100),
Existing_Units numeric(10)
)

go

create table Fact_Costos(
id_costo integer primary key autoincrement,
Estimated_Cost numeric(10),
Revised_Cost varchar(100),
id_Obra integer references Obra(id_Obra),
id_Permit integer references Permisos(id_Permit),
id_Tipo integer references Tipo(id_Tipo),
id_street integer references Calle(id_street),
Id_record integer references Registro(Id_record),
id_Estado integer  references Estado(id_Estado),
id_propuesta integer  references Propuesta(id_propuesta),
id_design integer  references Propuesta(id_design)
)

