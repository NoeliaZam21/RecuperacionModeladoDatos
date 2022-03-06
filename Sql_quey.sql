SELECT Proposed_Construction_Type,
       Existing_Construction_Type,
       Existing_Construction_Type_Description,
       Proposed_Construction_Type_Description
  FROM Tipo;-- -----------dim_registro-------------------

SELECT Zipcode,
       Location,
       id_Permit,
       id_Tipo
  FROM Registro;

SELECT *
  FROM Registro;-- ----------DIM_PROPUESTA-----------------------

SELECT Plansets,
       Existing_Use,
       Existing_Units
  FROM Propuesta;-- ----------DIM_PERMISO--------------------------

SELECT Permit_Number,
       Permit_Type,
       Permit_Type_Definition,
       Permit_Creation_Date,
       id_street
  FROM Permisos;-- -----------dim_obra-------------------------------

SELECT Block,
       Neighborhoods_Analysis_Boundaries,
       Filed,
       Supervisor_District,
       Id_record,
       id_Estado
  FROM Obra;-- ------------dim_estado------------------------------

SELECT Street_Suffix,
       Current_Status,
       Current_Status_Date,
       Issued_Date,
       Completed_Date
  FROM Estado;-- ------------dim_disenio----------------------------

SELECT Unit,
       Number_of_Existing_Stories,
       Fire_Only_Permit,
       id_costo,
       id_Obra
  FROM Disenio;-- -----------dim_calle-------------------

SELECT Lot,
       Street_Number,
       Street_Name,
       First_Construction_Document_Date,
       Description
  FROM Calle;
  

-- -----------TABLA DE HECHOS---------------

       
SELECT *
  FROM Costos
       INNER JOIN
       Propuesta ON Propuesta.id_propuesta = Costos.id_propuesta
       INNER JOIN
       Disenio ON Disenio.id_costo = Costos.id_costo
       INNER JOIN
       Obra ON Obra.id_Obra = Disenio.id_Obra
       INNER JOIN
       Registro ON Obra.Id_record = Registro.Id_record
       INNER JOIN 
       Tipo ON Tipo.id_Tipo = Registro.id_Tipo
       INNER JOIN
       Permisos ON Permisos.id_Permit = Registro.id_Permit
       INNER JOIN
       Calle ON Calle.id_street = Permisos.id_street;
