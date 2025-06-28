/*Actividad 1.- Creacion de la tabla PRODUCTOS*/
/* 
La  tabla se creo ya que en ella se guardaran todos los productos que tengamos.
- ID_PRODUCTO. Se eligio NUMBER ya que cada producto tendra un identificador numerico. Es un identificador unico para cada uno de nuestros productos.
- NOMBRE. Se eligio VARCHAR2 ya que sera una cadena de texto. Es el nombre que tiene cada producto.
- DESCRIPCION. Es para dar una pequeña descripcion del producto como gramaje o cantidad de piezas.
- CATEGORIA. Se eligio VARCHAR2 porque sera una cadena de texto. Es para identificar a que categoria pertenece el producto (panaderia, dulceria, etc.).
- FECHA_INGRESO. 
- CANTIDAD.
- PRECIO_UNITARIO. Se eligio NUMBER (10,2) para que acepte numeros con 2 decimales despues del punto. S
*/
CREATE TABLE PRODUCTO(
ID_PRODUCTO NUMBER PRIMARY KEY,
NOMBRE VARCHAR2(50), 
DESCRIPCION VARCHAR2(50),
CATEGORIA VARCHAR2(20),
FECHA_INGRESO DATE,
CANTIDAD INTEGER,
PRECIO_UNITARIO NUMBER(10,2)
);

/* Comentario a nivel tabla */
COMMENT ON TABLE PRODUCTO IS 'El nombre se eligio ya que en esta tabla estara toda la información sobre los productos entrantes';

/* SELECT para consultar los comentarios de la tabla PRODUCTO */
SELECT * FROM USER_TAB_COMMENTS WHERE TABLE_NAME ='PRODUCTO';



/* Comentarios a nivel columna */
/* Columna ID_PRODUCTO */
COMMENT ON COLUMN PRODUCTO.ID_PRODUCTO IS 'Es el identificador unico de cada producto. Con el tipo de dato NUMBER haremos que cada producto que ingrese se identifique con un numero';

/* Columna NOMBRE */
COMMENT ON COLUMN PRODUCTO.NOMBRE IS 'Aqui se introducira el nombre de cada producto. Se eligio VARCHAR2 ya que el contenido sera de tipo texto';

/* Columna DESCRIPCION */
COMMENT ON COLUMN PRODUCTO.DESCRIPCION IS 'Aqui se dara una breve descripcion del producto. De igual manera se uso VARCHAR2 porque el contenido sera de tipo texto';

/*Columna CATEGORIA */
COMMENT ON COLUMN PRODUCTO.CATEGORIA IS 'En esta columna se pondra la categoria del producto (panaderia, abarrrotes, etc). De igual manera, VARCHAR2 porque sera llenado con texto';

/* Columna FECHA_INGRESO */
COMMENT ON COLUMN PRODUCTO.FECHA_INGRESO IS 'Aqui se pondra la fecha en que el producto ingreso al inventario. Se usa DATE porque se guardara una fecha';

/* Columna CANTIDAD */
COMMENT ON COLUMN PRODUCTO.CANTIDAD IS 'En esta columna se guardaran las piezas que entran de cada producto. Se usa INTEGER ya que ningun producto entra por mitad solo enteros';

/* Columna PRECIO_UNITARIO */
COMMENT ON COLUMN PRODUCTO.PRECIO_UNITARIO IS 'En esta columna estara el precio del producto por unidad. Se uso NUMBER(10,2) para guardar la cantidad con 2 decimales despues del punto';

/* SELECT para consultar los comentarios de las columnas de PRODUCTO */
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME = 'PRODUCTO';


/*
1.- Con el tipo de dato NUMBER haremos que cada producto que ingrese se identifique con un numero.
2.- Para el caso de las columnas NOMBRE, DESCRIPCION y CATEGORIA se uso VARCHAR2 ya que seran llenadas con texto.
3.- Para la columna FECHA_INGRESO se uso DATE para saber la fecha en que ingreso dicho producto.
4.- Para la columna de CANTIDAD se uso INTEGER ya que no habrá cantidades por mitad en producto.
5.- Para la columna PRECIO_UNITARIO se uso NUMBER ya que los precios pueden ser enteros o con decimales.
*/



/* El SELECT * FROM PRODUCTO lo que hara es regresarnos la tabla creada anteriormente y como aun no tiene datos, estaran vacios todos los campos */
SELECT * FROM PRODUCTO;



/* Actividad 2.- Insertar informacion en la tabla*/
/*Creacion del primer INSERT */
INSERT INTO PRODUCTO (ID_PRODUCTO, NOMBRE, DESCRIPCION, CATEGORIA, FECHA_INGRESO, CANTIDAD, PRECIO_UNITARIO)
VALUES (1, 'FRIJOLES NEGROS', 'FRIJOLES NEGROS EN BOLSA', 'ALIMENTOS', TO_DATE('2025-06-23', 'YYYY-MM-DD'), 25, 25.50);

/* Creacion del segundo INSERT */
INSERT INTO PRODUCTO (ID_PRODUCTO, NOMBRE, DESCRIPCION, CATEGORIA, FECHA_INGRESO, CANTIDAD, PRECIO_UNITARIO)
VALUES (2, 'SOBRE WHISKAS', 'SOBRE WHISKAS 50 GRAMOS', 'MASCOTAS', TO_DATE('2025-06-22', 'YYYY-MM-DD'), 50, 8.50);

/* Creacion del tercer INSERT */
INSERT INTO PRODUCTO (ID_PRODUCTO, NOMBRE, DESCRIPCION, CATEGORIA, FECHA_INGRESO, CANTIDAD, PRECIO_UNITARIO)
VALUES (3, 'PAN BIMBO BLANCO CH', 'BARRA DE PAN BLANCO 200GR', 'PANADERIA', TO_DATE('2025-06-22', 'YYYY-MM-DD'), 10, 35);

/* Creacion del cuarto INSERT */
INSERT INTO PRODUCTO (ID_PRODUCTO, NOMBRE, DESCRIPCION, CATEGORIA, FECHA_INGRESO, CANTIDAD, PRECIO_UNITARIO)
VALUES (4, 'AZUCAR MORENA', 'BOLSA DE AZUCAR MORENA 900GR', 'ALIMENTOS', TO_DATE('2025-06-19', 'YYYY-MM-DD'), 30, 18);

/* Creacion del quinto INSERT */
INSERT INTO PRODUCTO (ID_PRODUCTO, NOMBRE, DESCRIPCION, CATEGORIA, FECHA_INGRESO, CANTIDAD, PRECIO_UNITARIO)
VALUES (5, 'PAN INTEGRAL BIMBO MD', 'BARRA DE PAN INTEGRAL 400GR', 'PANADERIA', TO_DATE('2025-06-15', 'YYYY-MM-DD'), 15, 45);

/* De nuevo se hace la consulta con un SELECT * FROM PRODUCTO para consultar la informacion insertada en la tabla*/
SELECT * FROM PRODUCTO;



/* Actividad 3.- Consultas con condiciones */
/*Este SELECT lo que hará es regresarnos todos los elementos de la tabla que cumplan con la condicion que es 
 tener más de 10 piezas*/
SELECT NOMBRE, CANTIDAD FROM PRODUCTO WHERE CANTIDAD >=10;

/*Este SELECT nos dará todos los productos que sean de la categoria panaderia */
SELECT * FROM PRODUCTO WHERE CATEGORIA LIKE '%PANADERIA%';

/*Este SELECT nos regresará todos lo productos que sean de la categoria PANADERIA y que tenga una CANTIDAD 
mayor o igual a 5 piezas*/
SELECT * FROM PRODUCTO WHERE CATEGORIA = 'PANADERIA' AND CANTIDAD >=5;



/* Actividad 4.- Creacion de tabla secundaria de PROVEEDOR */
/* Se eligio el nombre PROVEEDOR ya que en esta tabla se guardara toda la informacion sobre nuestros proveedores. Esto facilitara encontrar la informacion sobre ellos y saber
cuales siguen activos y que productos no proveen 
- ID_PROVEEDOR. Se eligio NUMBER ya que cada proveedor tendra un identificador numerico. Este identificador sera unico para cada uno de ellos.
- NOMBRE. Se eligio VARCHAR2 ya que el nombre es una cadena de texto. Tiene una logitud lo suficiente para que pueda entrar el nombre de los proveedores.
- DIRECCION. De igual manera se eligio VARCHAR2 porque la direccion es una cadena de texto. Tiene una longitud suficiente para que no haya problemas al meter la direccion del proveedor.
- EMAIL. Se usa VARCHAR2 porque es una cadena de texto. Con una longitud de 100 cabe a la perfeccion el email del proveedor.
*/
CREATE TABLE PROVEEDOR(
ID_PROVEEDOR NUMBER PRIMARY KEY,
NOMBRE VARCHAR2(100),
DIRECCION VARCHAR(200),
EMAIL VARCHAR2(100)
);

/*Comentario a nivel tabla para PROVEEDOR */
COMMENT ON TABLE PROVEEDOR IS 'El nombre se eligio ya que en esta tabla estara el nombre de todos los proveedores que surten nuestros productos';

/* SELECT para hacer que nos muestre los comentarios de la tabla */
SELECT * FROM USER_TAB_COMMENTS WHERE TABLE_NAME ='PROVEEDOR';


/* Comentarios a nivel columna para PROVEEDOR */
/* Columna ID_PROVEEDOR */
COMMENT ON COLUMN PROVEEDOR.ID_PROVEEDOR IS 'En esta columna se guardara el identificador de cada proveedor. Se uso NUMBER porque se identificaran por un numero';

/* Columna NOMBRE */
COMMENT ON COLUMN PROVEEDOR.NOMBRE IS 'En esta columna se guardaran los nombres de nuestros proveedores. Se uso VARCHAR2 porque sera contenido de tipo texto';

/* Columna DIRECCION */
COMMENT ON COLUMN PROVEEDOR.DIRECCION IS 'Aqui se guardaran las direcciones de nuestros proveedores. De igual manera, se uso VARCHAR2 porque sera de tipo texto';

/* Columna EMAIL */
COMMENT ON COLUMN PROVEEDOR.EMAIL IS 'En esta columna se guardara el email o correo del proveedor. Se uso VARCHAR2 porque sera de tipo texto';

/*SELECT para consultar todos los comentarios de la columnas*/
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME = 'PROVEEDOR';



/*De acuerdo con informacion investigada e informacion que viene en la presentación compartida con el grupo, se deberá actualizar la tabla de PRODUCTO con un ALTER TABLE
para añadir la llave foranea y después relacionarlas. Para relacionarla se usa un:
ALTER TABLE PRODUCTO
ADD CONSTRAINT FK_PRODUCTO_PROVEEDOR
FOREIGN KEY (ID_PROVEEDOR)
REFERENCES PROVEEDOR (ID_PROVEEDOR);
*/



/* Se hace un SELECT para verificar que la tabla se haya creado correctamente */
SELECT * FROM PROVEEDOR; 



/* Con un ALTER TABLE lo que hacemos en añadir una nueva columna a la tabla de PRODUCTO */
ALTER TABLE PRODUCTO ADD ID_PROVEEDOR NUMBER;



/* Creacion de los INSERTS para la tabla de PROVEEDOR */
/* Creacion del primer INSERT */
INSERT INTO PROVEEDOR (ID_PROVEEDOR, NOMBRE, DIRECCION, EMAIL)
VALUES (1, 'ABARROTES DE XALAPA', 'CALLE REVOLUCION 55, COLONIA CENTRO, 91110, XALAPA, VERACRUZ', 'ABARROTESXALAPA@GMAIL.COM');

/*Creacion del segundo INSERT */
INSERT INTO PROVEEDOR (ID_PROVEEDOR, NOMBRE, DIRECCION, EMAIL)
VALUES (2, 'ALIMENTOS PARA MASCOTAS ALIMAS', 'AVENIDA XALAPA 1016, PROGRESO MACUILTEPETL, 91130, XALAPA, VERACRUZ', 'ALIMENTOS_ALIMAS@HOTMAIL.COM');

/* Creacion del tercer INSERT */
INSERT INTO PROVEEDOR (ID_PROVEEDOR, NOMBRE, DIRECCION, EMAIL)
VALUES (3, 'GRUPO BIMBO', 'CALLE MOCTEZUMA, 91637, XALAPA, VERACRUZ', 'GRUPOBIMBO@GMAIL.COM');

/* Cracion del cuarto INSERT */
INSERT INTO PROVEEDOR (ID_PROVEEDOR, NOMBRE, DIRECCION, EMAIL)
VALUES (4, 'DISTRIBUIDORA DEL CENTRO', 'AVENIDA ATENAS VERACRUZANA 109, COLONIA REVOLUCION, 91110, XALAPA, VERACRUZ', 'DIS_CENTRO@GMAIL.COM');



/*Se agrega información a la tabla de PROVEEDOR y ahora se debe actualizar la tabla de PRODUCTO para que cada producto tenga un proveedor*/
/* Actualizacion de la tabla PRODUCTO para añadirle proveedor al primer producto */
UPDATE PRODUCTO SET ID_PROVEEDOR = 1 WHERE ID_PRODUCTO = 1;

/* Actualizacion de la tabla PRODUCTO para añadirle proveedor al segundo producto */
UPDATE PRODUCTO SET ID_PROVEEDOR = 2 WHERE ID_PRODUCTO = 2;

/* Actualizacion de la tabla PRODUCTO para añadirle proveedor al tercer producto */
UPDATE PRODUCTO SET ID_PROVEEDOR = 3 WHERE ID_PRODUCTO = 3;

/* Actualizacion de la tabla PRODUCTO para añadirle proveedor al cuarto producto */
UPDATE PRODUCTO SET ID_PROVEEDOR = 4 WHERE ID_PRODUCTO = 4;

/* Actualizacion de la tabla PRODUCTO para añadirle proveedor al quinto producto */
UPDATE PRODUCTO SET ID_PROVEEDOR = 3 WHERE ID_PRODUCTO = 5;


/* Se hace un SELECT * FROM PRODUCTO. Ahora, todos los productos tienen un proveedor*/
SELECT * FROM PRODUCTO;



/*Se hace la relacion entre las tablas por medio la llave foránea*/
ALTER TABLE PRODUCTO
ADD CONSTRAINT FK_PRODUCTO_PROVEEDOR
FOREIGN KEY (ID_PROVEEDOR)
REFERENCES PROVEEDOR (ID_PROVEEDOR);


/*Se hace un JOIN para unir la 2 tablas y que muestre los productos que tienen un proveedor, teniendo como resultado que todo los productos ya tienen un proveedor */
SELECT P.ID_PRODUCTO, P.NOMBRE, PR.NOMBRE AS NOMBRE_PROVEEDOR FROM PRODUCTO P JOIN PROVEEDOR PR ON P.ID_PROVEEDOR = PR.ID_PROVEEDOR;

