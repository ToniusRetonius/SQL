/* Crear base de datos 
create database (nombre);
*/
create database comercio; 

/* Seleccionar que base de datos usar
use (nombre de base de datos);
 */
use comercio;

/* Crear una tabla 
create table (nombre) 
( agrego campos con el tipo de dato y otras propiedades);
*/
create table productos (
    idProducto int(11) not null auto_increment, 
    nombre varchar (50) not null,
    precio double(7,2) null,
    marca varchar(30) not null, 
    categoria varchar(30) not null,
    stock int(11) not null,
    primary key (idProducto)   -- PRIMARY KEY tiene la funcion de restringir el uso repetido de un registro en la base de datos 
);

/* insertar datos en una tabla 
cuando utilizo un auto_increment no es necesario agregar el campo de ese dato
insert into (nombre de la tabla) (campo1, campo2,...) 
values
(dato1 campo1, dato1 campo2,...), 
(dato2 campo1, dato2 campo2);
*/
insert into productos
(nombre,precio,marca,categoria,stock)
values
('Tv Samsung 42p', 24892.32, 'Samsung', 'Televisores' , 50),
('Tv Samsung 45p', 27892.32, 'Samsung', 'Televisores' , 50),
('Tv Samsung 47p', 29022.32,'Samsung' ,'Televisores', 50),
('Tv Samsung 49p', 31001.32,'Samsung' ,'Televisores' , 50),
('Tv Samsung 50p', 35892.32, 'Samsung', 'Televisores' , 50);

/* Para ejecutar un comando que muestre informacion
show databases; // muestra las bases de datos de mi servidor //
show tables; // muestra las tablas //
describe (nombre de la tabla); // muestra los campos de la tabla // 
drop (table (nombre de la tabla)); // elimina una entidad //
*/
show databases;
show tables;
describe productos;

/* Seleccionar campos de una tabla 
select * from (nombre de la tabla);
el asterisco reemplaza a TODOS los campos (columnas) a seleccionar
*/
select * from facturas;
select * from clientes;
select * from marcas;

/* para realizar consultas multiples (ejemplo, campos con el mismo nombre en tablas diferentes)
SELECT tabla1.nombre, tabla2.nombre
FROM tabla1, tabla2; 
*/

/* busco obtener los n registros ordenados por x condicion 
order by (campo) (forma: asc o desc);
y me limito a obtener n registros 
limit (numero de registros que quiero obtener);
*/
select * from  productos 
order by precio desc
limit 5; 
/* es igual a decir lo siguiente : */
select idProducto, nombre, precio
from productos
order by precio desc
limit 5;

/* Campo calculado: un campo nuevo a partir de una operacion entre campos 
select campo1, campo2, campo1*campo2 AS (nombre del campo calculado)
*/
select nombre, precio, stock, precio*stock as valorizado
from productos
order by stock desc, precio desc;

/* Para filtrar datos en una base de datos 
select * from (base de datos)
WHERE (operacion de comparacion);
*/
select * from productos
where categoria = 'Smartphone';

select * from productos
where categoria != 'Smartphone'; /* 'distinto de' o  <> */

select * from productos
where precio > 1500
order by precio;

select * from productos
where precio < 1500
order by precio;

select * from productos
where precio >= 1500
order by precio;

select * from productos
where precio <= 1500
order by precio;

/* Para evaluar una condicion dentro de un rango
select * from (base de datos)
BETWEEN ( a AND b);
 */
select * from productos
where precio between 1500 and 2000   
order by precio;

/* Podemos negar el BETWEEN */
select * from productos
where precio NOT between 1500 and 2000   
order by precio;

/* Operadores logicos 
AND  'conjuncion' (se deben cumplir todas las condiciones impuestas)
OR   'disyuncion' (se debe cumplir por lo menos una de las condiciones)

select * from (nombre de la tabla);
where condicion A and condicion B;  

select * from (nombre de la tabla);
where condicion A or condicion B;
*/
select * from productos
where Categoria = 'Televisores' and precio between 1500 and 2000   
order by precio;

select * from productos
where Categoria = 'Televisores' or precio between 1500 and 2000   
order by precio;

/* Para buscar registros a partir de una similitud 
select * from (nombre de la tabla)
WHERE (campo) LIKE '%(similitud)%';
   -- % caracter comodin -- 
   -- _ caracter comodin --
   % al inicio indica que el texto finaliza con mi similitud 
   % al final indica que el texto comienza con mi similitud
 */
select * from productos
where nombre like '%tv'
order by precio
limit 4;

select * from productos
where nombre like 'tv%'
order by precio
limit 4;

/* Desafio de la clase traer productos samsung x marca */
select * from productos
where marca in ( select idmarca from marcas
                 where nombre = 'samsung');
/* En este desafio planteo un IN() que ejecuta una sub-consulta
para luego ejecutar la consulta principal
select * from (table)
where CAMPO in ( select campo1 from table1
                 where condicion);
puedo tambien ejecutar un consulta con un NOT IN 
select * from (table)
where CAMPO NOT in ( select campo1 from table1
                 where condicion);
 */
select * from productos
where marca NOT in 
( select idmarca from marcas
where nombre = 'samsung' or nombre = 'noblex')
order by precio desc
limit 5;

/* Clase 3 */
/* 	Actualizamos registros de una table con UPDATE
	Para especificar que registro deseo actualizar con WHERE
UPDATE (nombre de la table) SET (campo) = ...
WHERE (campo1 = ) AND (campo2 = ) ...;
*/
select * from clientes;

update clientes set cuit = '20-34567654-2'
where nombre= 'Juan' and apellido= 'veron';

update clientes set direccion = 'chile 112'
where nombre= 'Juan' and apellido= 'veron';

/*	Para eliminar un registro especifico con DELETE
DELETE FROM (table)
WHERE (campo) condicion;
*/
DELETE FROM clientes
where codigo between 6 and 8;

insert into clientes (codigo,nombre,apellido,cuit,direccion) 
values (6,'Lautaro','Martinez',null,'Pepe 123');

/* FUNCIONES */

	/* Fecha */
	-- buscar la fecha de hoy -- 
	select current_date() as hoy; 
    
	-- calcular el tiempo transcurrido en dias entre dos fechas 
	-- DATEDIFF((fecha1),(fecha2))
	select fecha, datediff(current_date(),fecha) as dias 
	from facturas; 
    
    -- mostrar el trimestre del año :
    -- QUARTER(FECHA);
    select quarter(current_date());
    
    -- mostrar el año 
    -- YEAR(FECHA);
    select year(current_date());
    
     -- mostrar fecha-hora-minuto-segundo
     -- TIMESTAMP(); -- 
    select timestamp(now());
    
	/* Redondeo */
	-- redondear valores numericos con 
    -- ROUND(operacion, (numero de decimales))
    select round(precio*1.21, 1) as precio_con_IVA, precio
    from productos;
    
	/* Concatenacion */
	-- concatenar datos  --
    select concat('Hola ', nombre, ' bienvenido') from clientes;

/* FUNCIONES DE AGREGADO : son funciones que devuelven un valor */
 
	/* Contar */
    -- para contar cantidad de registros utilizo :
	--  COUNT(*); puedo reemplazar el * por un campo especifico --
    
    select count(*) from productos;
    -- para mostrar la cantidad de las diferentes categorias : 
    select count(distinct categoria) from productos; 
    -- para contar datos que contengan un dato tipo LIKE
    select count(*) from clientes
    where apellido like '%nez%';
    
    /* Maximo - Minimo */
    -- MAX(campo)
    -- MIN(campo)
    select max(precio) from productos;
    select min(precio) from productos;
    select max(fecha) from facturas;
    select min(fecha) from facturas;
    
    /* Sumatoria */
    -- SUM(campo)
    select sum(monto) from facturas;
    
    /* Promedio */
    -- AVG(campo)
    select avg(monto) as promedio from facturas;

/* FUNCIONES DE AGRUPAMIENTO : agrupa datos en funcion de un campo, esto nos permite procesar datos de un mismo campo */

	-- GROUP BY (campo) --
    select categoria, sum(stock)
    from productos 
    group by Categoria;
    
    -- HAVING : condicion para campos agrupados. El WHERE no -- 
    select categoria, sum(stock)
    from productos 
    group by Categoria
    having sum(stock) > 300
    order by sum(stock);
    
/* ALTERACIONES - MODIFICACIONES */

-- para realizar modificaciones en los campos de una tabla :

	-- ALTER TABLE (table) CHANGE COLUMN (nombre actual) (nombre nuevo) (tipo de dato);
	alter table clientes change column codigo idCliente int(11);
    alter table productos change column marca idMarca int(11);
    
    -- ALTER TABLE (table) ADD (campo) (tipo de dato) (en que lugar: FIRST , AFTER (campo));
    alter table facturas add idProducto int(11) not null first;
    alter table clientes add cp varchar(8) after direccion;
    
    -- ALTER TABLE (table) DROP COLUMN (nombre de la columna); // drop = eliminar
    alter table clientes drop column cp;
    
	######   CLASE 4  #####

/* Las claves foraneas (Foreign Key) son herramientas relacionales para no conservar toda la informacion dentro de la misma tabla
 Es decir,  una tabla Productos por ejemplo contiene los nombres, precios,... y dentro de esta tabla existe un que id de la marca de los productos 
 y este es el id que enumera los registros de nombres de la tabla Marcas. 
 Tabla Productos = nombres de productos y dentro un idMarca 
 Tabla Marcas = idMarca y nombres de las marcas
 el idMarca de la tabla Marcas es la PrimaryKey y el idMarca dentro de Productos es la ForeignKey

ALTER TABLE (tabla)
ADD CONSTRAINT (id_ForeignKey)
FOREIGN KEY (nombre de la foreign key)
REFERENCES (nombre de la tabla de la que viene) (cual es el nombre de la primary key)
ON UPDATE CASCADE		--      
ON DELETE CASCADE;		-- al momento de eliminar un registro con PK, se eliminaran todos los registros con claves foraneas relacionadas
*/

alter table facturas
add constraint idcliente_fk
foreign key (idcliente) 
references  clientes (idcliente)   
on update cascade
on delete cascade;

/* UNION DE TABLAS */
	/* el INNER JOIN tableA A ON  A.key = B.key : 
	busca intersecar los campos identicos en tablas diferentes
	*/
SELECT productos.nombre, precio, marcas.nombre, categoria, presentacion, stock
FROM productos p INNER JOIN marcas m ON m.idmarca = p.idmarca
Inner join facturas f ON f.idProducto = p.idProducto;

-- extra -- 
/* Cuando es recurrente realizar una pregunta, puedo crear una view y
 mantenerla en el panel de la izquierda, en VIEWS: 
 
CREATE VIEW (nombre de la view) AS 
y aca escribo la consulta recurrente

*/







