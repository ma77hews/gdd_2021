-- creacion de tablas --
CREATE TABLE GD1C2021.gd_esquema.Ciudad 
(
	ciudad_id			INT	, 
	ciudad_descripcion	VARCHAR(255)
);

CREATE TABLE GD1C2021.gd_esquema.Sucursal 
(
	sucursal_numero		INT, 
	sucursal_ciudad		DECIMAL(18,0),
	sucursal_direccion	VARCHAR(255),
	sucursal_mail		VARCHAR(255),
	sucursal_tel		VARCHAR(255),
);

CREATE TABLE GD1C2021.gd_esquema.Factura 
(
	factura_id			INT ,
	factura_numero		DECIMAL(18,0), 
	factura_fecha		DATETIME2(3) 
);

CREATE TABLE GD1C2021.gd_esquema.Accesorio 
(
	accesorio_id				INT,
	accesorio_codigo			DECIMAL(18,0),
	accesorio_descripcion		NVARCHAR(255), 
	accesorio_fabricante		NVARCHAR(255),
	accesorio_cantidad			DECIMAL(18,0) 
);

CREATE TABLE GD1C2021.gd_esquema.Microprocesadores 
(
	microprocesador_id				INT,
	microprocesador_codigo			NVARCHAR(50),
	microprocesador_cache			NVARCHAR(50),
	microprocesador_cant_hilos		DECIMAL(18,0),
	microprocesador_velocidad		NVARCHAR(50),
	microprocesador_fabricante		NVARCHAR(255) 
);

CREATE TABLE GD1C2021.gd_esquema.Gabinete 
(
	gabinete_id				INT,
	gabinete_codigo			NVARCHAR(50),
	gabinete_modulo			NVARCHAR(255) 
);

CREATE TABLE GD1C2021.gd_esquema.Motherboard 
(
	mother_id				INT,
	mother_codigo			NVARCHAR(50)
);

CREATE TABLE GD1C2021.gd_esquema.PlacaVideo 
(
	placa_video_id				INT,
	placa_video_chipset			NVARCHAR(50),
	placa_video_modelo			NVARCHAR(50),
	placa_video_velocidad		NVARCHAR(50),
	placa_video_capacidad		NVARCHAR(255),
	placa_video_fabricante		NVARCHAR(255) 
);

CREATE TABLE GD1C2021.gd_esquema.DiscoRigido 
(
	disco_rigido_id				INT,
	disco_rigido_codigo			NVARCHAR(255),
	disco_rigido_tipo			NVARCHAR(255),
	disco_rigido_capacidad		NVARCHAR(255),
	disco_rigido_velocidad		NVARCHAR(255),
	disco_rigido_fabricante		NVARCHAR(255)
);

CREATE TABLE GD1C2021.gd_esquema.Memoria 
(
	memoria_ram_id				INT,
	memoria_ram_codigo			NVARCHAR(255),
	memoria_ram_tipo			NVARCHAR(255),
	memoria_ram_capacidad		NVARCHAR(255),
	memoria_ram_velocidad		NVARCHAR(255),
	memoria_ram_fabricante		NVARCHAR(255)
);

CREATE TABLE GD1C2021.gd_esquema.Cliente 
(
	cliente_id					INT,
	cliente_apellido			NVARCHAR(255),
	cliente_nombre				NVARCHAR(255),
	cliente_direccion			NVARCHAR(255),
	cliente_dni					DECIMAL(18,0),
	cliente_fecha_nacimiento	DATETIME2(3),
	cliente_mail				NVARCHAR(255),
	cliente_telefono			INT
);

CREATE TABLE GD1C2021.gd_esquema.PC 
(
	pc_id						INT ,
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