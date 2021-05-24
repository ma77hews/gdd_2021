-- creacion de tablas --
CREATE TABLE [GD1C2021].[gd_esquema].Ciudad 
(
	ciudad_id			INT IDENTITY, 
	ciudad_descripcion	VARCHAR(255)
);

CREATE TABLE [GD1C2021].[gd_esquema].Sucursal 
(
	sucursal_numero		INT IDENTITY, 
	sucursal_ciudad		INT,
	sucursal_direccion	VARCHAR(255),
	sucursal_mail		VARCHAR(255),
	sucursal_tel		VARCHAR(255),
);

CREATE TABLE [GD1C2021].[gd_esquema].Factura 
(
	factura_id			INT IDENTITY,
	factura_numero		DECIMAL(18,0), 
	factura_fecha		DATETIME2(3) 
);

CREATE TABLE [GD1C2021].[gd_esquema].Accesorio 
(
	accesorio_id				INT IDENTITY,
	accesorio_codigo			DECIMAL(18,0),
	accesorio_descripcion		NVARCHAR(255), 
	accesorio_fabricante		NVARCHAR(255),
	accesorio_cantidad			DECIMAL(18,0) 
);

CREATE TABLE [GD1C2021].[gd_esquema].Microprocesadores 
(
	microprocesador_id				INT IDENTITY,
	microprocesador_codigo			NVARCHAR(50),
	microprocesador_cache			NVARCHAR(50),
	microprocesador_cant_hilos		DECIMAL(18,0),
	microprocesador_velocidad		NVARCHAR(50),
	microprocesador_fabricante		NVARCHAR(255) 
);

CREATE TABLE [GD1C2021].[gd_esquema].Gabinete 
(
	gabinete_id				INT IDENTITY,
	gabinete_codigo			NVARCHAR(50),
	gabinete_modulo			NVARCHAR(255) 
);

CREATE TABLE [GD1C2021].[gd_esquema].Motherboard 
(
	mother_id				INT IDENTITY,
	mother_codigo			NVARCHAR(50)
);

CREATE TABLE [GD1C2021].[gd_esquema].PlacaVideo 
(
	placa_video_id				INT IDENTITY,
	placa_video_chipset			NVARCHAR(50),
	placa_video_modelo			NVARCHAR(50),
	placa_video_velocidad		NVARCHAR(50),
	placa_video_capacidad		NVARCHAR(255),
	placa_video_fabricante		NVARCHAR(255) 
);

CREATE TABLE [GD1C2021].[gd_esquema].DiscoRigido 
(
	disco_rigido_id				INT IDENTITY,
	disco_rigido_codigo			NVARCHAR(255),
	disco_rigido_tipo			NVARCHAR(255),
	disco_rigido_capacidad		NVARCHAR(255),
	disco_rigido_velocidad		NVARCHAR(255),
	disco_rigido_fabricante		NVARCHAR(255)
);

CREATE TABLE [GD1C2021].[gd_esquema].Memoria 
(
	memoria_ram_id				INT IDENTITY,
	memoria_ram_codigo			NVARCHAR(255),
	memoria_ram_tipo			NVARCHAR(255),
	memoria_ram_capacidad		NVARCHAR(255),
	memoria_ram_velocidad		NVARCHAR(255),
	memoria_ram_fabricante		NVARCHAR(255)
);

CREATE TABLE [GD1C2021].[gd_esquema].Cliente 
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

CREATE TABLE [GD1C2021].[gd_esquema].PC 
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
-- PK y FK a cada tabla --
ALTER TABLE [GD1C2021].[gd_esquema].Ciudad				ADD PRIMARY KEY (ciudad_id)

ALTER TABLE [GD1C2021].[gd_esquema].Sucursal			ADD PRIMARY KEY (sucursal_numero)
ALTER TABLE [GD1C2021].[gd_esquema].Sucursal			ADD FOREIGN KEY (sucursal_ciudad)		REFERENCES [GD1C2021].[gd_esquema].Ciudad(ciudad_id)

ALTER TABLE [GD1C2021].[gd_esquema].Factura				ADD PRIMARY KEY (factura_id)

ALTER TABLE [GD1C2021].[gd_esquema].Accesorio			ADD PRIMARY KEY (accesorio_id)

ALTER TABLE [GD1C2021].[gd_esquema].Microprocesadores	ADD PRIMARY KEY (microprocesador_id)

ALTER TABLE [GD1C2021].[gd_esquema].Gabinete			ADD PRIMARY KEY (gabinete_id)

ALTER TABLE [GD1C2021].[gd_esquema].Motherboard			ADD PRIMARY KEY (mother_id)

ALTER TABLE [GD1C2021].[gd_esquema].PlacaVideo			ADD PRIMARY KEY (placa_video_id)

ALTER TABLE [GD1C2021].[gd_esquema].DiscoRigido			ADD PRIMARY KEY (disco_rigido_id)

ALTER TABLE [GD1C2021].[gd_esquema].Memoria				ADD PRIMARY KEY (memoria_ram_id)

ALTER TABLE [GD1C2021].[gd_esquema].Cliente				ADD PRIMARY KEY (cliente_id)

ALTER TABLE [GD1C2021].[gd_esquema].PC					ADD PRIMARY KEY (pc_id)					
ALTER TABLE [GD1C2021].[gd_esquema].PC					ADD FOREIGN KEY (pc_memoria_ram)		REFERENCES [GD1C2021].[gd_esquema].Memoria(memoria_ram_id)
ALTER TABLE [GD1C2021].[gd_esquema].PC					ADD FOREIGN KEY (pc_disco_rigido)		REFERENCES [GD1C2021].[gd_esquema].DiscoRigido(disco_rigido_id)
ALTER TABLE [GD1C2021].[gd_esquema].PC					ADD FOREIGN KEY (pc_microprocesador)	REFERENCES [GD1C2021].[gd_esquema].Microprocesadores(microprocesador_id)
ALTER TABLE [GD1C2021].[gd_esquema].PC					ADD FOREIGN KEY (pc_placa_video)		REFERENCES [GD1C2021].[gd_esquema].PlacaVideo(placa_video_id)
ALTER TABLE [GD1C2021].[gd_esquema].PC					ADD FOREIGN KEY (pc_gabinete)			REFERENCES [GD1C2021].[gd_esquema].Gabinete(gabinete_id) 
ALTER TABLE [GD1C2021].[gd_esquema].PC					ADD FOREIGN KEY (pc_motherboard)		REFERENCES [GD1C2021].[gd_esquema].Motherboard(mother_id)
