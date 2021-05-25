-------------------------------- procedure para la creacion de tablas -------------------------------------------------
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
-------------------------------- procedure para agregar las PK y FK ---------------------------------------------------
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
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD FOREIGN KEY (pc_memoria_ram)		REFERENCES [GD1C2021].[SELECT_ASTERISCO].Memoria(memoria_ram_id)				ON DELETE NO ACTION ON UPDATE NO ACTION ;
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD FOREIGN KEY (pc_disco_rigido)		REFERENCES [GD1C2021].[SELECT_ASTERISCO].DiscoRigido(disco_rigido_id)			ON DELETE NO ACTION ON UPDATE NO ACTION ;
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD FOREIGN KEY (pc_microprocesador)	REFERENCES [GD1C2021].[SELECT_ASTERISCO].Microprocesadores(microprocesador_id)	ON DELETE NO ACTION ON UPDATE NO ACTION ;
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD FOREIGN KEY (pc_placa_video)		REFERENCES [GD1C2021].[SELECT_ASTERISCO].PlacaVideo(placa_video_id)				ON DELETE NO ACTION ON UPDATE NO ACTION ;
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD FOREIGN KEY (pc_gabinete)			REFERENCES [GD1C2021].[SELECT_ASTERISCO].Gabinete(gabinete_id)					ON DELETE NO ACTION ON UPDATE NO ACTION ;
	ALTER TABLE [GD1C2021].[SELECT_ASTERISCO].PC					ADD FOREIGN KEY (pc_motherboard)		REFERENCES [GD1C2021].[SELECT_ASTERISCO].Motherboard(mother_id)					ON DELETE NO ACTION ON UPDATE NO ACTION ;
GO
-------------------------------- procedures para realizar las migraciones de las tablas -------------------------------- 
CREATE PROCEDURE Insercion_Tabla_Ciudad AS 
	INSERT INTO [GD1C2021].[SELECT_ASTERISCO].Ciudad 
	SELECT		CIUDAD 
	FROM		[GD1C2021].[gd_esquema].Maestra
	GROUP BY	CIUDAD
GO

CREATE PROCEDURE Insercion_Tabla_Sucursal AS

	INSERT INTO [GD1C2021].[SELECT_ASTERISCO].Sucursal (sucursal_direccion, sucursal_mail,sucursal_tel, sucursal_ciudad)
	SELECT		SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TEL,Ciudad.ciudad_id
	FROM		[GD1C2021].[gd_esquema].Maestra AS MAESTRA
	join		[SELECT_ASTERISCO].Ciudad on [SELECT_ASTERISCO].[Ciudad].ciudad_descripcion = MAESTRA.CIUDAD
	GROUP BY	SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TEL,Ciudad.ciudad_id

GO

CREATE PROCEDURE Insersion_Tabla_Factura AS 

	INSERT INTO [GD1C2021].[SELECT_ASTERISCO].Factura(factura_numero,factura_fecha)                                                                                                                                                                                                                       
	SELECT		FACTURA_NUMERO,FACTURA_FECHA
	FROM		[GD1C2021].[gd_esquema].Maestra 
	GROUP BY	FACTURA_NUMERO,FACTURA_FECHA

GO

CREATE PROCEDURE Insersion_Tabla_Accesorio AS

	INSERT INTO [GD1C2021].[SELECT_ASTERISCO].Accesorio(accesorio_codigo,accesorio_descripcion)
	SELECT		ACCESORIO_CODIGO,AC_DESCRIPCION
	FROM		[GD1C2021].[gd_esquema].Maestra 
	GROUP BY	ACCESORIO_CODIGO,AC_DESCRIPCION 

GO

CREATE PROCEDURE Insersion_Tabla_Microprocesadores AS

	INSERT INTO		[GD1C2021].[SELECT_ASTERISCO].Microprocesadores(microprocesador_codigo,microprocesador_cache,microprocesador_cant_hilos,microprocesador_velocidad,microprocesador_fabricante)
	SELECT			MICROPROCESADOR_CODIGO,MICROPROCESADOR_CACHE,MICROPROCESADOR_CANT_HILOS,MICROPROCESADOR_VELOCIDAD,MICROPROCESADOR_FABRICANTE
	FROM			[GD1C2021].[gd_esquema].Maestra
	GROUP BY		MICROPROCESADOR_CODIGO,MICROPROCESADOR_CACHE,MICROPROCESADOR_CANT_HILOS,MICROPROCESADOR_VELOCIDAD,MICROPROCESADOR_FABRICANTE 

GO

CREATE PROCEDURE Insersion_Tabla_Placa_Video AS

	INSERT INTO		[GD1C2021].[SELECT_ASTERISCO].PlacaVideo(placa_video_chipset,placa_video_modelo,placa_video_velocidad,placa_video_capacidad,placa_video_fabricante)
	SELECT			PLACA_VIDEO_CHIPSET,PLACA_VIDEO_MODELO,PLACA_VIDEO_VELOCIDAD,PLACA_VIDEO_CAPACIDAD,PLACA_VIDEO_FABRICANTE
	FROM			[GD1C2021].[gd_esquema].Maestra
	GROUP BY		PLACA_VIDEO_CHIPSET,PLACA_VIDEO_MODELO,PLACA_VIDEO_VELOCIDAD,PLACA_VIDEO_CAPACIDAD,PLACA_VIDEO_FABRICANTE 

GO

CREATE PROCEDURE Insersion_Tabla_Disco_Rigido AS

	INSERT INTO		[GD1C2021].[SELECT_ASTERISCO].DiscoRigido(disco_rigido_codigo,disco_rigido_tipo,disco_rigido_capacidad,disco_rigido_velocidad,disco_rigido_fabricante)
	SELECT			DISCO_RIGIDO_CODIGO,DISCO_RIGIDO_TIPO,DISCO_RIGIDO_CAPACIDAD,DISCO_RIGIDO_VELOCIDAD,DISCO_RIGIDO_FABRICANTE
	FROM			[GD1C2021].[gd_esquema].Maestra
	GROUP BY		DISCO_RIGIDO_CODIGO,DISCO_RIGIDO_TIPO,DISCO_RIGIDO_CAPACIDAD,DISCO_RIGIDO_VELOCIDAD,DISCO_RIGIDO_FABRICANTE

GO

CREATE PROCEDURE Insersion_Tabla_Memoria AS

	INSERT INTO		[GD1C2021].[SELECT_ASTERISCO].Memoria(memoria_ram_codigo,memoria_ram_tipo,memoria_ram_capacidad,memoria_ram_velocidad,memoria_ram_fabricante)(
	SELECT			MEMORIA_RAM_CODIGO,MEMORIA_RAM_TIPO,MEMORIA_RAM_CAPACIDAD,MEMORIA_RAM_VELOCIDAD,MEMORIA_RAM_FABRICANTE
	FROM			[GD1C2021].[gd_esquema].Maestra
	GROUP BY		MEMORIA_RAM_CODIGO,MEMORIA_RAM_TIPO,MEMORIA_RAM_CAPACIDAD,MEMORIA_RAM_VELOCIDAD,MEMORIA_RAM_FABRICANTE); 

GO

CREATE PROCEDURE Insersion_Tabla_Cliente AS

	INSERT INTO		[GD1C2021].[SELECT_ASTERISCO].Cliente(cliente_apellido,cliente_nombre,cliente_direccion,cliente_dni,cliente_fecha_nacimiento,cliente_mail,cliente_telefono)
	SELECT			CLIENTE_APELLIDO,CLIENTE_NOMBRE,CLIENTE_DIRECCION,CLIENTE_DNI,CLIENTE_FECHA_NACIMIENTO,CLIENTE_MAIL,CLIENTE_TELEFONO
	FROM			[GD1C2021].[gd_esquema].Maestra
	GROUP BY		CLIENTE_APELLIDO,CLIENTE_NOMBRE,CLIENTE_DIRECCION,CLIENTE_DNI,CLIENTE_FECHA_NACIMIENTO,CLIENTE_MAIL,CLIENTE_TELEFONO

GO

-------------------------------- procedure migracion ---------------------------------------------------------------- 
CREATE PROCEDURE Migracion AS 
	
	EXEC Insercion_Tabla_Ciudad
	EXEC Insercion_Tabla_Sucursal
	EXEC Insersion_Tabla_Accesorio
	EXEC Insersion_Tabla_Factura
	EXEC Insersion_Tabla_Microprocesadores
	EXEC Insersion_Tabla_Placa_Video
	EXEC Insersion_Tabla_Disco_Rigido
	EXEC Insersion_Tabla_Memoria
	EXEC Insersion_Tabla_Cliente

GO
-------------------------------- procedures para reseteos de tablas -------------------------------------------------
CREATE PROCEDURE Reseteo_Tablas AS 
	
	IF (OBJECT_ID('GD1C2021.SELECT_ASTERISCO.PC')IS NOT NULL)					DROP TABLE GD1C2021.SELECT_ASTERISCO.PC
	IF (OBJECT_ID('GD1C2021.SELECT_ASTERISCO.Sucursal')IS NOT NULL)				DROP TABLE GD1C2021.SELECT_ASTERISCO.Sucursal
	IF (OBJECT_ID('GD1C2021.SELECT_ASTERISCO.Ciudad')IS NOT NULL)				DROP TABLE GD1C2021.SELECT_ASTERISCO.Ciudad
	IF (OBJECT_ID('GD1C2021.SELECT_ASTERISCO.Factura')IS NOT NULL)				DROP TABLE GD1C2021.SELECT_ASTERISCO.Factura
	IF (OBJECT_ID('GD1C2021.SELECT_ASTERISCO.Accesorio')IS NOT NULL)			DROP TABLE GD1C2021.SELECT_ASTERISCO.Accesorio
	IF (OBJECT_ID('GD1C2021.SELECT_ASTERISCO.Microprocesadores')IS NOT NULL)	DROP TABLE GD1C2021.SELECT_ASTERISCO.Microprocesadores
	IF (OBJECT_ID('GD1C2021.SELECT_ASTERISCO.Motherboard')IS NOT NULL)			DROP TABLE GD1C2021.SELECT_ASTERISCO.Motherboard
	IF (OBJECT_ID('GD1C2021.SELECT_ASTERISCO.Gabinete')IS NOT NULL)				DROP TABLE GD1C2021.SELECT_ASTERISCO.Gabinete
	IF (OBJECT_ID('GD1C2021.SELECT_ASTERISCO.PlacaVideo')IS NOT NULL)			DROP TABLE GD1C2021.SELECT_ASTERISCO.PlacaVideo
	IF (OBJECT_ID('GD1C2021.SELECT_ASTERISCO.DiscoRigido')IS NOT NULL)			DROP TABLE GD1C2021.SELECT_ASTERISCO.DiscoRigido
	IF (OBJECT_ID('GD1C2021.SELECT_ASTERISCO.Memoria')IS NOT NULL)				DROP TABLE GD1C2021.SELECT_ASTERISCO.Memoria
	IF (OBJECT_ID('GD1C2021.SELECT_ASTERISCO.Cliente')IS NOT NULL)				DROP TABLE GD1C2021.SELECT_ASTERISCO.Cliente

GO

CREATE PROCEDURE Reseteo_Procedures AS
	
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Creacion_de_Tablas' AND type = 'p')					DROP PROCEDURE dbo.Creacion_de_Tablas
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'PK_Y_FK' AND type = 'p')							DROP PROCEDURE dbo.PK_Y_FK
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Insercion_Tabla_Ciudad' AND type = 'p')				DROP PROCEDURE dbo.Insercion_Tabla_Ciudad
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Insercion_Tabla_Sucursal' AND type = 'p')			DROP PROCEDURE dbo.Insercion_Tabla_Sucursal
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Insersion_Tabla_Accesorio' AND type = 'p')			DROP PROCEDURE dbo.Insersion_Tabla_Accesorio
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Insersion_Tabla_Factura' AND type = 'p')			DROP PROCEDURE dbo.Insersion_Tabla_Factura
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Insersion_Tabla_Microprocesadores' AND type = 'p')	DROP PROCEDURE dbo.Insersion_Tabla_Microprocesadores
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Insersion_Tabla_Placa_Video' AND type = 'p')		DROP PROCEDURE dbo.Insersion_Tabla_Placa_Video
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Insersion_Tabla_Disco_Rigido' AND type = 'p')		DROP PROCEDURE dbo.Insersion_Tabla_Disco_Rigido
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Insersion_Tabla_Memoria' AND type = 'p')			DROP PROCEDURE dbo.Insersion_Tabla_Memoria
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Insersion_Tabla_Cliente' AND type = 'p')			DROP PROCEDURE dbo.Insersion_Tabla_Cliente
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Migracion' AND type = 'p')							DROP PROCEDURE dbo.Migracion
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Reseteo_Tablas' AND type = 'p')						DROP PROCEDURE dbo.Reseteo_Tablas
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Reseteo_Procedures' AND type = 'p')					DROP PROCEDURE dbo.Reseteo_Procedures
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Reseteo' AND type = 'p')							DROP PROCEDURE dbo.Reseteo
	IF EXISTS (SELECT * FROM  sys.procedures WHERE  NAME = 'Play' AND type = 'p')								DROP PROCEDURE dbo.Play

GO

CREATE PROCEDURE Reseteo AS
	
	EXEC Reseteo_Tablas
	EXEC Reseteo_Procedures

GO
-------------------------------- procedure principal ----------------------------------------------------------------
/* si se toca f5 para iniciar y ya habia algo creado hay que tocar f5 2 veces porque tira un error que no supe sacar 
( consulta a los ayudantes) pero funciona de 10 sin contar esa falopeada */
CREATE PROCEDURE Play AS 
	IF EXISTS (SELECT * FROM   sys.schemas WHERE  NAME = 'SELECT_ASTERISCO')
	BEGIN 
		EXEC Reseteo
		DROP SCHEMA SELECT_ASTERISCO
	END
	ELSE
	BEGIN
		EXEC ('create schema SELECT_ASTERISCO')
		EXEC Creacion_de_Tablas
		EXEC PK_Y_FK
		EXEC Migracion
	END
	
GO


-------------------------------- TOCA PLAY PAPAAAA ----------------------------------------------------------------
EXEC Play