--Script de la creación de la Base de datos DB transaccional--

create database DB_transaccional

GO
USE DB_transaccional
GO


CREATE TABLE Tipo(
Proposed_Construction_Type  varchar(50) primary key,
Existing_Construction_Type   varchar(100),
Existing_Construction_Type_Description  varchar(100),
Proposed_Construction_Type_Description varchar(100)
)

Go

CREATE TABLE Registro(
Id_record integer primary key,
Zipcode numeric(50),
Location varchar(100),
Permit_Number varchar(100) references Permisos(Permit_Number),
Proposed_Construction_Type  varchar(50) references Tipo(Proposed_Construction_Type)
)

go

CREATE TABLE Permisos(
Permit_Number varchar(100) primary key,
Permit_Type varchar(100),
Permit_Type_Definition varchar(300),
Permit_Creation_Date datetime,
Lot varchar(50) references Calle(Lot)
)

go

CREATE TABLE Calle(
Lot varchar(50) primary key,
Street_Number numeric(30),
Street_Name varchar(100),
First_Construction_Document_Date datetime,
Description varchar(300)
)

go

CREATE TABLE Obra(
Id_Block  varchar(50) primary key ,
Neighborhoods_Analysis_Boundaries  varchar(500),
Filed Date datetime,
Supervisor_District   numeric(50),
Id_record integer references Registro(Id_record),
Street_Suffix varchar(50) references Estado(Street_Suffix)
)

go

CREATE TABLE Estado(
Street_Suffix varchar(50) primary key,
Current_Status datetime,
Current_Status_Date datetime,
Issued_Date datetime,
Completed_Date datetime
)

go


CREATE TABLE Disenio(
Id_Unit varchar(10) primary key,
Structural_Notification varchar(300),
Number_of_Existing_Stories datetime,
Fire Only Permit  varchar(10), 
Permit Expiration Date  datetime,
Estimated_Cost integer references Costo(Estimated_Cost),
Id_Block  varchar(50) references Obra(Id_Block)
)

go



create table Propuesta(
Plansets varchar(10) primary key,
Existing_Use varchar(100),
Existing_Units numeric(10)
)

go

create table Costos(
Estimated_Cost numeric(10) primary key,
Revised_Cost varchar(100),
Plansets varchar(10) references Propuesta(Plansets)

)

