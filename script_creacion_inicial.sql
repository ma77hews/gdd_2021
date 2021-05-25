CREATE SCHEMA SELECT_ASTERISCO
GO

-- procedure creacion de tablas --
CREATE PROCEDURE Creacion_de_Tablas	AS

	CREATE TABLE [GD1C2021].[SELECT_ASTERISCO].Ciudad 
	(
		ciudad_id			INT IDENTITY, 
		ciudad_descripcion	VARCHAR(255)
	);

	CREATE TABLE [GD1C2021].[SELECT_ASTERISCO].Sucursal 
	(
		sucursal_numero		INT IDENTITY, 
		sucursal_ciudad		INT,
		sucursal_direccion	VARCHAR(255),
		sucursal_mail		VARCHAR(255),
		sucursal_tel		VARCHAR(255),
	);

	CREATE TABLE [GD1C2021].[SELECT_ASTERISCO].Factura 
	(
		factura_id			INT IDENTITY,
		factura_numero		DECIMAL(18,0), 
		factura_fecha		DATETIME2(3) 
	);

	CREATE TABLE [GD1C2021].[SELECT_ASTERISCO].Accesorio 
	(
		accesorio_id				INT IDENTITY,
		accesorio_codigo			DECIMAL(18,0),
		accesorio_descripcion		NVARCHAR(255), 
		accesorio_fabricante		NVARCHAR(255),
		accesorio_cantidad			DECIMAL(18,0) 
	);

	CREATE TABLE [GD1C2021].[SELECT_ASTERISCO].Microprocesadores 
	(
		microprocesador_id				INT IDENTITY,
		microprocesador_codigo			NVARCHAR(50),
		microprocesador_cache			NVARCHAR(50),
		microprocesador_cant_hilos		DECIMAL(18,0),
		microprocesador_velocidad		NVARCHAR(50),
		microprocesador_fabricante		NVARCHAR(255) 
	);

	CREATE TABLE [GD1C2021].[SELECT_ASTERISCO].Gabinete 
	(
		gabinete_id				INT IDENTITY,
		gabinete_codigo			NVARCHAR(50),
		gabinete_modulo			NVARCHAR(255) 
	);

	CREATE TABLE [GD1C2021].[SELECT_ASTERISCO].Motherboard 
	(
		mother_id				INT IDENTITY,
		mother_codigo			NVARCHAR(50)
	);

	CREATE TABLE [GD1C2021].[SELECT_ASTERISCO].PlacaVideo 
	(
		placa_video_id				INT IDENTITY,
		placa_video_chipset			NVARCHAR(50),
		placa_video_modelo			NVARCHAR(50),
		placa_video_velocidad		NVARCHAR(50),
		placa_video_capacidad		NVARCHAR(255),
		placa_video_fabricante		NVARCHAR(255) 
	);

	CREATE TABLE [GD1C2021].[SELECT_ASTERISCO].DiscoRigido 
	(
		disco_rigido_id				INT IDENTITY,
		disco_rigido_codigo			NVARCHAR(255),
		disco_rigido_tipo			NVARCHAR(255),
		disco_rigido_capacidad		NVARCHAR(255),
		disco_rigido_velocidad		NVARCHAR(255),
		disco_rigido_fabricante		NVARCHAR(255)
	);

	CREATE TABLE [GD1C2021].[SELECT_ASTERISCO].Memoria 
	(
		memoria_ram_id				INT IDENTITY,
		memoria_ram_codigo			NVARCHAR(255),
		memoria_ram_tipo			NVARCHAR(255),
		memoria_ram_capacidad		NVARCHAR(255),
		memoria_ram_velocidad		NVARCHAR(255),
		memoria_ram_fabricante		NVARCHAR(255)
	);

	CREATE TABLE [GD1C2021].[SELECT_ASTERISCO].Cliente 
	(
		cliente_id					INT IDENTITY,
		cliente_apellido			NVARCHAR(255),
		cliente_nombre				NVARCHAR(255),
		cliente_direccion			NVARCHAR(255),
		cliente_dni					DECIMAL(18,0),
		cliente_fecha_nacimiento	DATETIME2(3),
		cliente_mail				NVARCHAR(255),
		cliente_telefono			INT
	);

	CREATE TABLE [GD1C2021].[SELECT_ASTERISCO].PC 
	(
		pc_id						INT IDENTITY,
		pc_codigo					NVARCHAR(50),
		pc_alto						DECIMAL(18,0),
		pc_ancho					DECIMAL(18,0),
		pc_profundidad				DECIMAL(18,0),
		pc_numero_de_serie			DECIMAL(18,0),
		pc_memoria_ram				INT,
		pc_disco_rigido				INT,
		pc_microprocesador			INT,
		pc_placa_video				INT,
		pc_gabinete					INT,
		pc_motherboard				INT
	);
GO

-- procedure PK y FK --
CREATE PROCEDURE PK_Y_FK AS 

	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].Ciudad				ADD PRIMARY KEY (ciudad_id)

	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].Sucursal				ADD PRIMARY KEY (sucursal_numero)
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].Sucursal				ADD FOREIGN KEY (sucursal_ciudad)		REFERENCES [GD1C2021].[SELECT_ASTERISCO].Ciudad(ciudad_id) ON DELETE NO ACTION ON UPDATE NO ACTION ;

	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].Factura				ADD PRIMARY KEY (factura_id)

	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].Accesorio				ADD PRIMARY KEY (accesorio_id)

	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].Microprocesadores		ADD PRIMARY KEY (microprocesador_id)

	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].Gabinete				ADD PRIMARY KEY (gabinete_id)

	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].Motherboard			ADD PRIMARY KEY (mother_id)

	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PlacaVideo			ADD PRIMARY KEY (placa_video_id)

	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].DiscoRigido			ADD PRIMARY KEY (disco_rigido_id)

	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].Memoria				ADD PRIMARY KEY (memoria_ram_id)

	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].Cliente				ADD PRIMARY KEY (cliente_id)

	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD PRIMARY KEY (pc_id)					
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD FOREIGN KEY (pc_memoria_ram)		REFERENCES [GD1C2021].[SELECT_ASTERISCO].Memoria(memoria_ram_id)					ON DELETE NO ACTION ON UPDATE NO ACTION ;
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD FOREIGN KEY (pc_disco_rigido)		REFERENCES [GD1C2021].[SELECT_ASTERISCO].DiscoRigido(disco_rigido_id)				ON DELETE NO ACTION ON UPDATE NO ACTION ;
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD FOREIGN KEY (pc_microprocesador)	REFERENCES [GD1C2021].[SELECT_ASTERISCO].Microprocesadores(microprocesador_id)	ON DELETE NO ACTION ON UPDATE NO ACTION ;
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD FOREIGN KEY (pc_placa_video)		REFERENCES [GD1C2021].[SELECT_ASTERISCO].PlacaVideo(placa_video_id)				ON DELETE NO ACTION ON UPDATE NO ACTION ;
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD FOREIGN KEY (pc_gabinete)			REFERENCES [GD1C2021].[SELECT_ASTERISCO].Gabinete(gabinete_id)					ON DELETE NO ACTION ON UPDATE NO ACTION ;
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD FOREIGN KEY (pc_motherboard)		REFERENCES [GD1C2021].[SELECT_ASTERISCO].Motherboard(mother_id)					ON DELETE NO ACTION ON UPDATE NO ACTION ;
GO

CREATE PROCEDURE Tabla_Ciudad AS
	INSERT INTO [GD1C2021].[SELECT_ASTERISCO].Ciudad
	SELECT		gd_esquema.Maestra.CIUDAD 
	FROM		gd_esquema.Maestra
	GROUP BY	gd_esquema.Maestra.CIUDAD
GO

CREATE PROCEDURE Tabla_Sucursal AS
	INSERT INTO [GD1C2021].[SELECT_ASTERISCO].Sucursal (sucursal_direccion, sucursal_mail,sucursal_tel, sucursal_ciudad)(
	SELECT		SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TEL,Ciudad.ciudad_id
	FROM		gd_esquema.Maestra
	join		[SELECT_ASTERISCO].Ciudad on [SELECT_ASTERISCO].Ciudad.ciudad_descripcion = gd_esquema.Maestra.CIUDAD
	GROUP BY	SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TEL,Ciudad.ciudad_id
	);
GO


-- procedure migracion -- 
CREATE PROCEDURE Migracion AS 
	
	EXEC Tabla_Ciudad
	EXEC Tabla_Sucursal


GO



CREATE PROCEDURE play AS 

	EXEC Creacion_de_Tablas;
	EXEC PK_Y_FK;
	EXEC Migracion;

GO

EXEC play