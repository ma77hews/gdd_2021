/*begin table ciudad*/
CREATE TABLE GD1C2021.gd_esquema.Ciudad (
	ciudad_id			INT		NOT NULL IDENTITY PRIMARY KEY, 
	ciudad_descripcion	VARCHAR(255)
	);

INSERT INTO GD1C2021.gd_esquema.Ciudad
SELECT		gd_esquema.Maestra.CIUDAD 
FROM		gd_esquema.Maestra
GROUP BY	gd_esquema.Maestra.CIUDAD
/*end tabla ciudad*/

/*begin tabla sucursal*/
CREATE TABLE GD1C2021.gd_esquema.Sucursal (
	sucursal_numero		INT	NOT NULL IDENTITY PRIMARY KEY, 
	sucursal_ciudad		INT,
	sucursal_direccion	VARCHAR(255),
	sucursal_mail		VARCHAR(255),
	sucursal_tel		VARCHAR(255),

	FOREIGN KEY (sucursal_ciudad) REFERENCES GD1C2021.gd_esquema.Ciudad(ciudad_id)
	);

INSERT INTO GD1C2021.gd_esquema.Sucursal (sucursal_direccion, sucursal_mail,sucursal_tel, sucursal_ciudad)(
SELECT		SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TEL,Ciudad.ciudad_id
FROM		gd_esquema.Maestra
join		gd_esquema.Ciudad on gd_esquema.Ciudad.ciudad_descripcion = gd_esquema.Maestra.CIUDAD
GROUP BY	SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TEL,Ciudad.ciudad_id
);
/*end table sucursal*/


/*begin table Factura*/
CREATE TABLE GD1C2021.gd_esquema.Factura (
	factura_id			INT NOT NULL IDENTITY PRIMARY KEY,
	factura_numero		DECIMAL(18,0), 
	factura_fecha		DATETIME2(3) );

INSERT INTO GD1C2021.gd_esquema.Factura(factura_numero,factura_fecha)(                                                                                                                                                                                                                        
SELECT		FACTURA_NUMERO,FACTURA_FECHA
FROM		gd_esquema.Maestra 
GROUP BY	FACTURA_NUMERO,FACTURA_FECHA );
/*end table ciudad*/

/*begin table accesorio*/
CREATE TABLE GD1C2021.gd_esquema.Accesorio (
	accesorio_id				INT NOT NULL IDENTITY PRIMARY KEY,
	accesorio_codigo			DECIMAL(18,0),
	accesorio_descripcion		NVARCHAR(255), 
	accesorio_fabricante		NVARCHAR(255),
	accesorio_cantidad			DECIMAL(18,0) );

INSERT INTO GD1C2021.gd_esquema.Accesorio(accesorio_codigo,accesorio_descripcion)(
SELECT		ACCESORIO_CODIGO,AC_DESCRIPCION
FROM		gd_esquema.Maestra 
GROUP BY	ACCESORIO_CODIGO,AC_DESCRIPCION );
/*end table accesorio*/

/*begin table microprocesadores*/
CREATE TABLE GD1C2021.gd_esquema.Microprocesadores (
	microprocesador_id				INT NOT NULL IDENTITY PRIMARY KEY,
	microprocesador_codigo			NVARCHAR(50),
	microprocesador_cache			NVARCHAR(50),
	microprocesador_cant_hilos		DECIMAL(18,0),
	microprocesador_velocidad		NVARCHAR(50),
	microprocesador_fabricante		NVARCHAR(255) );

INSERT INTO		GD1C2021.gd_esquema.Microprocesadores(microprocesador_codigo,microprocesador_cache,microprocesador_cant_hilos,microprocesador_velocidad,microprocesador_fabricante)(
SELECT			MICROPROCESADOR_CODIGO,MICROPROCESADOR_CACHE,MICROPROCESADOR_CANT_HILOS,MICROPROCESADOR_VELOCIDAD,MICROPROCESADOR_FABRICANTE
FROM			gd_esquema.Maestra
GROUP BY		MICROPROCESADOR_CODIGO,MICROPROCESADOR_CACHE,MICROPROCESADOR_CANT_HILOS,MICROPROCESADOR_VELOCIDAD,MICROPROCESADOR_FABRICANTE ); 
/*end table microprocesadores*/

/*begin table gabinete*/
CREATE TABLE GD1C2021.gd_esquema.Gabinete (
	gabinete_id				INT NOT NULL IDENTITY PRIMARY KEY,
	gabinete_codigo			NVARCHAR(50),
	gabinete_modulo			NVARCHAR(255) );
/* end table microprocesadores*/

/*begin table Motherboard*/
CREATE TABLE GD1C2021.gd_esquema.Motherboard (
	mother_id				INT NOT NULL IDENTITY PRIMARY KEY,
	mother_codigo			NVARCHAR(50));
/* end table Motherboard*/

/*begin table placa de video*/
CREATE TABLE GD1C2021.gd_esquema.PlacaVideo (
	placa_video_id				INT NOT NULL IDENTITY PRIMARY KEY,
	placa_video_chipset			NVARCHAR(50),
	placa_video_modelo			NVARCHAR(50),
	placa_video_velocidad		NVARCHAR(50),
	placa_video_capacidad		NVARCHAR(255),
	placa_video_fabricante		NVARCHAR(255) );

INSERT INTO		GD1C2021.gd_esquema.PlacaVideo(placa_video_chipset,placa_video_modelo,placa_video_velocidad,placa_video_capacidad,placa_video_fabricante)(
SELECT			PLACA_VIDEO_CHIPSET,PLACA_VIDEO_MODELO,PLACA_VIDEO_VELOCIDAD,PLACA_VIDEO_CAPACIDAD,PLACA_VIDEO_FABRICANTE
FROM			gd_esquema.Maestra
GROUP BY		PLACA_VIDEO_CHIPSET,PLACA_VIDEO_MODELO,PLACA_VIDEO_VELOCIDAD,PLACA_VIDEO_CAPACIDAD,PLACA_VIDEO_FABRICANTE ); 
/* end table placa de video*/

/*begin table disco rigido*/
CREATE TABLE GD1C2021.gd_esquema.DiscoRigido (
	disco_rigido_id				INT NOT NULL IDENTITY PRIMARY KEY,
	disco_rigido_codigo			NVARCHAR(255),
	disco_rigido_tipo			NVARCHAR(255),
	disco_rigido_capacidad		NVARCHAR(255),
	disco_rigido_velocidad		NVARCHAR(255),
	disco_rigido_fabricante		NVARCHAR(255));

INSERT INTO		GD1C2021.gd_esquema.DiscoRigido(disco_rigido_codigo,disco_rigido_tipo,disco_rigido_capacidad,disco_rigido_velocidad,disco_rigido_fabricante)(
SELECT			DISCO_RIGIDO_CODIGO,DISCO_RIGIDO_TIPO,DISCO_RIGIDO_CAPACIDAD,DISCO_RIGIDO_VELOCIDAD,DISCO_RIGIDO_FABRICANTE
FROM			gd_esquema.Maestra
GROUP BY		DISCO_RIGIDO_CODIGO,DISCO_RIGIDO_TIPO,DISCO_RIGIDO_CAPACIDAD,DISCO_RIGIDO_VELOCIDAD,DISCO_RIGIDO_FABRICANTE); 
/* end table disco rigido*/

/*begin table memoria*/
CREATE TABLE GD1C2021.gd_esquema.Memoria (
	memoria_ram_id				INT NOT NULL IDENTITY PRIMARY KEY,
	memoria_ram_codigo			NVARCHAR(255),
	memoria_ram_tipo			NVARCHAR(255),
	memoria_ram_capacidad		NVARCHAR(255),
	memoria_ram_velocidad		NVARCHAR(255),
	memoria_ram_fabricante		NVARCHAR(255));

INSERT INTO		GD1C2021.gd_esquema.Memoria(memoria_ram_codigo,memoria_ram_tipo,memoria_ram_capacidad,memoria_ram_velocidad,memoria_ram_fabricante)(
SELECT			MEMORIA_RAM_CODIGO,MEMORIA_RAM_TIPO,MEMORIA_RAM_CAPACIDAD,MEMORIA_RAM_VELOCIDAD,MEMORIA_RAM_FABRICANTE
FROM			gd_esquema.Maestra
GROUP BY		MEMORIA_RAM_CODIGO,MEMORIA_RAM_TIPO,MEMORIA_RAM_CAPACIDAD,MEMORIA_RAM_VELOCIDAD,MEMORIA_RAM_FABRICANTE); 
/* end table memoria*/

/*begin table cliente*/
CREATE TABLE GD1C2021.gd_esquema.Cliente (
	cliente_id					INT NOT NULL IDENTITY PRIMARY KEY,
	cliente_apellido			NVARCHAR(255),
	cliente_nombre				NVARCHAR(255),
	cliente_direccion			NVARCHAR(255),
	cliente_dni					DECIMAL(18,0),
	cliente_fecha_nacimiento	DATETIME2(3),
	cliente_mail				NVARCHAR(255),
	cliente_telefono			INT);

INSERT INTO		GD1C2021.gd_esquema.Cliente(cliente_apellido,cliente_nombre,cliente_direccion,cliente_dni,cliente_fecha_nacimiento,cliente_mail,cliente_telefono)(
SELECT			CLIENTE_APELLIDO,CLIENTE_NOMBRE,CLIENTE_DIRECCION,CLIENTE_DNI,CLIENTE_FECHA_NACIMIENTO,CLIENTE_MAIL,CLIENTE_TELEFONO
FROM			gd_esquema.Maestra
GROUP BY		CLIENTE_APELLIDO,CLIENTE_NOMBRE,CLIENTE_DIRECCION,CLIENTE_DNI,CLIENTE_FECHA_NACIMIENTO,CLIENTE_MAIL,CLIENTE_TELEFONO); 
/* end table cliente*/

/*begin table PC*/
CREATE TABLE GD1C2021.gd_esquema.PC (
	pc_id						INT NOT NULL IDENTITY PRIMARY KEY,
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
	pc_motherboard				INT,

	FOREIGN KEY (pc_memoria_ram) REFERENCES GD1C2021.gd_esquema.Memoria(memoria_ram_id) ,
	FOREIGN KEY (pc_disco_rigido) REFERENCES GD1C2021.gd_esquema.DiscoRigido(disco_rigido_id) ,
	FOREIGN KEY (pc_microprocesador) REFERENCES GD1C2021.gd_esquema.Microprocesadores(microprocesador_id) ,
	FOREIGN KEY (pc_placa_video) REFERENCES GD1C2021.gd_esquema.PlacaVideo(placa_video_id) ,
	FOREIGN KEY (pc_gabinete) REFERENCES GD1C2021.gd_esquema.Gabinete(gabinete_id) ,
	FOREIGN KEY (pc_motherboard) REFERENCES GD1C2021.gd_esquema.Motherboard(mother_id) );

INSERT INTO		GD1C2021.gd_esquema.Cliente(cliente_apellido,cliente_nombre,cliente_direccion,cliente_dni,cliente_fecha_nacimiento,cliente_mail,cliente_telefono)(
SELECT			CLIENTE_APELLIDO,CLIENTE_NOMBRE,CLIENTE_DIRECCION,CLIENTE_DNI,CLIENTE_FECHA_NACIMIENTO,CLIENTE_MAIL,CLIENTE_TELEFONO
FROM			gd_esquema.Maestra
GROUP BY		CLIENTE_APELLIDO,CLIENTE_NOMBRE,CLIENTE_DIRECCION,CLIENTE_DNI,CLIENTE_FECHA_NACIMIENTO,CLIENTE_MAIL,CLIENTE_TELEFONO); 
/* end table PC*/



/*
drop table GD1C2021.gd_esquema.Sucursal
drop table GD1C2021.gd_esquema.Ciudad
drop table GD1C2021.gd_esquema.Factura
drop table GD1C2021.gd_esquema.Accesorio
drop table GD1C2021.gd_esquema.Microprocesadores
drop table GD1C2021.gd_esquema.Motherboard
drop table GD1C2021.gd_esquema.Gabinete
drop table GD1C2021.gd_esquema.PlacaVideo
drop table GD1C2021.gd_esquema.DiscoRigido
drop table GD1C2021.gd_esquema.Memoria
drop table GD1C2021.gd_esquema.Cliente
*/

 