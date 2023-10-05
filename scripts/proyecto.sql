-- DIMENSION PRODUCTOS -- TABLA
CREATE TABLE IF NOT EXISTS dim_producto(
    producto_key  INT(8) NOT NULL AUTO_INCREMENT,
    id_producto INT(8) NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    numero_producto VARCHAR(25) NOT NULL,
    id_subcategoria INT(20) NOT NULL,
    nombre_subcategoria VARCHAR(100) NOT NULL,
    id_categoria INT(20) NOT NULL,
    nombre_categoria VARCHAR(100) NOT NULL,

    PRIMARY KEY (producto_key),
    UNIQUE KEY (id_producto)
);

-- DIMENSION TIEMPO -- TABLA 
CREATE TABLE IF NOT EXISTS dim_fecha(
    fecha_key  INT(8) NOT NULL AUTO_INCREMENT,
    orderdate DATE NOT NULL,
    anno_orden INT(8) NOT NULL,
    mes_orden INT(8) NOT NULL,
    dia_orden INT(8) NOT NULL,
    hora_orden INT(8) NOT NULL,
    minutos_orden INT(8) NOT NULL,

    PRIMARY KEY (fecha_key),
    UNIQUE KEY (orderdate)
);

-- DIMENSION CLIENTE -- TABLA 
CREATE TABLE IF NOT EXISTS dim_cliente(
    cliente_key  INT(8) NOT NULL AUTO_INCREMENT,
    customer_id  INT(8) NOT NULL,
    nombre_cliente VARCHAR(100) NOT NULL,
    territory_id INT(8) NOT NULL,
    nombre_territorio VARCHAR(100) NOT NULL,
    cod_region VARCHAR(8) NOT NULL,
    grupo_region VARCHAR(50) NOT NULL,

    PRIMARY KEY (cliente_key),
    UNIQUE KEY (customer_id)
);

-- DIMENSION VENDEDOR -- TABLA 
CREATE TABLE IF NOT EXISTS dim_vendedor(
    vendedor_key  INT(8) NOT NULL AUTO_INCREMENT,
    id_empleado  INT(8) NOT NULL,
    identificacion BIGINT NOT NULL,
    nombre_empleado VARCHAR(100) NOT NULL,
    fecha_nac DATE NOT NULL,
    genero VARCHAR(2) NOT NULL,
    fec_contratacion DATE NOT NULL,
    territory_id INT(8) NOT NULL,
    nombre_territorio VARCHAR(100) NOT NULL,
    cod_region VARCHAR(8) NOT NULL,
    grupo_region VARCHAR(50) NOT NULL,

    PRIMARY KEY (vendedor_key),
    UNIQUE KEY (id_empleado)
);



-- DIMENSION HECHOS_DETALLES -- TABLA 

CREATE TABLE IF NOT EXISTS orden_detalle(
    orden_dtll_key INT(8) NOT NULL AUTO_INCREMENT,
    id_dtll_venta  INT(8) NOT NULL,
    cantidad INT NOT NULL,
    precio_unit INT NOT NULL,
    descuento_unit INT NOT NULL,
    dias_entrega INT NOT NULL,
    dias_envio INT NOT NULL,
    id_producto INT(8) NOT NULL,
    orderdate DATE NOT NULL,
    customer_id  INT(8) NOT NULL,
    id_empleado  INT(8) NOT NULL,

    PRIMARY KEY (orden_dtll_key),
    UNIQUE KEY (id_empleado)
);