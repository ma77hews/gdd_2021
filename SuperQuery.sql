/*tabla ciudad*/
CREATE TABLE GD1C2021.gd_esquema.Ciudad (
	ciudad_id			SMALLINT		NOT NULL IDENTITY PRIMARY KEY, 
	ciudad_descripcion	varchar(255)
	);

INSERT INTO GD1C2021.gd_esquema.Ciudad
SELECT		gd_esquema.Maestra.CIUDAD 
FROM		gd_esquema.Maestra
GROUP BY	gd_esquema.Maestra.CIUDAD

/*tabla sucursal*/
CREATE TABLE GD1C2021.gd_esquema.Sucursal (
	sucursal_numero		SMALLINT		NOT NULL IDENTITY PRIMARY KEY, 
	sucursal_ciudad		SMALLINT,
	sucursal_direccion	VARCHAR(255),
	sucursal_mail		VARCHAR(255),
	sucursal_tel		VARCHAR(255)

	FOREIGN KEY (sucursal_ciudad) REFERENCES GD1C2021.gd_esquema.Ciudad(ciudad_id)
	);

INSERT INTO GD1C2021.gd_esquema.Sucursal (sucursal_direccion, sucursal_mail,sucursal_tel, sucursal_ciudad)(
SELECT		SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TEL,Ciudad.ciudad_id
FROM		gd_esquema.Maestra
join		gd_esquema.Ciudad on gd_esquema.Ciudad.ciudad_descripcion = gd_esquema.Maestra.CIUDAD
group by	SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TEL,Ciudad.ciudad_id
);

