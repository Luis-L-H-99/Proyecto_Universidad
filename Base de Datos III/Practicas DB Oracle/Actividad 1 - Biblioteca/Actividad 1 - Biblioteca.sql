/* Actividad 1.- Libreria
 Creación de la tabla LIBROS.
 */
CREATE TABLE LIBRO(
	ID_LIBRO INTEGER PRIMARY KEY,
	TITULO VARCHAR2(100) NOT NULL,
	AUTOR VARCHAR2(50) NULL,
	FECHA_PUBLICACION DATE,
	DISPONIBLE NUMBER(1) DEFAULT 1
);

--Insertar al menos 5 registros en la tabla--

SELECT * FROM LIBRO;

INSERT INTO LIBRO (ID_LIBRO, TITULO, AUTOR, FECHA_PUBLICACION, DISPONIBLE)
VALUES (1, 'CIEN AÑOS DE SOLEDAD', 'GABRIEL GARCÍA MÁRQUEZ', TO_DATE('30-05-1967', 'DD/MM/YYYY'));

INSERT INTO LIBRO (ID_LIBRO, TITULO, AUTOR, FECHA_PUBLICACION)
VALUES (2, '1984', 'GEORGE ORWELL', TO_DATE('08-06-1949', 'DD/MM/YYYY'));

INSERT INTO LIBRO (ID_LIBRO, TITULO, AUTOR, FECHA_PUBLICACION, DISPONIBLE)
VALUES (3, 'DON QUIJOTE DE LA MANCHA (PRIMERA PARTE)', 'MIGUEL DE CERVANTES', TO_DATE('16-01-1605', 'DD/MM/YYYY'), 0);

INSERT INTO LIBRO (ID_LIBRO, TITULO, AUTOR, FECHA_PUBLICACION, DISPONIBLE)
VALUES (4, 'EL PRINCIPITO', 'ANTOINE DE SAINT-EXUPÉRY', TO_DATE('06-04-1943', 'DD/MM/YYYY'), 0);

INSERT INTO LIBRO (ID_LIBRO, TITULO, AUTOR, FECHA_PUBLICACION)
VALUES (5, 'HARRY POTTER Y LA PIEDRA FILOSOFAL', 'J.K. ROLLING', TO_DATE('26-06-1997', 'DD/MM/YYYY'));


SELECT * FROM LIBRO; -- Muestra todo el contenido de la tabla, en este caso, todos los libros--

SELECT * FROM LIBRO WHERE DISPONIBLE = 1; -- Mostrará todos los libros disponibles --

SELECT TITULO, AUTOR FROM LIBRO ORDER BY TITULO ASC, AUTOR ASC;
-- Al poner ORDER BY hace que la tabla se muestre con un orden y con ASC, decimos que nos muestre los titulos y autores de forma ascendente alfabéticamente --


UPDATE LIBRO SET DISPONIBLE = 0 WHERE ID_LIBRO = 1; -- Con esto el libro con ID 1 que estaba disponible, ahora pasara a 0 (No disponible), habiendo 3 libro no disponibles --

DELETE FROM LIBRO WHERE ID_LIBRO = 5; -- Con esta línea, decimos que queremos eliminar de la tabla LIBRO, el libro que tenga el ID_LIBRO 5 --

SELECT * FROM LIBRO; -- Mostrara el resultado final de nuestra tabla, teniendo 4 libros en el registro de la tabla LIBRO --


