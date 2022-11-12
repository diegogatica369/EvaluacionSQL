#``
#CREACION DE ESQUEMA

CREATE SCHEMA IF NOT EXISTS minimarket_schema;


#CREACION DE TABLAS

CREATE TABLE `minimarket_schema`.`producto`(
`producto_id` INT NOT NULL AUTO_INCREMENT,
`nombreProducto` VARCHAR (30) NOT NULL,
`precioProducto` INT NOT NULL,
`cantidadProducto` INT NOT NULL,
`tipoProducto` varchar (30) NOT NULL,
PRIMARY KEY(`producto_id`));

CREATE TABLE `minimarket_schema`.`proveedor`(
`proveedor_id` INT NOT NULL AUTO_INCREMENT,
`nombreProveedor` VARCHAR (30) NOT NULL,
`telefonoProveedor` INT NOT NULL,
`nombreProductoProveedor` VARCHAR (30) NOT NULL,
`precioProductoProveedor` INT NOT NULL,
PRIMARY KEY (`proveedor_id`));


CREATE TABLE `minimarket_schema`.`detalleBoleta`(
`detalleBoleta_id` INT NOT NULL AUTO_INCREMENT,
`nombreDetalleBoleta` VARCHAR (30) NOT NULL,
`cantidadProductoBoleta` INT NOT NULL,
PRIMARY KEY (`detalleBoleta_id`));

CREATE TABLE `minimarket_schema`.`boleta`(
`boleta_id` INT NOT NULL AUTO_INCREMENT,
`fechaBoleta` DATE NOT NULL,
PRIMARY KEY (`boleta_id`));

CREATE TABLE `minimarket_schema`.`cliente`(
`cliente_id` INT NOT NULL AUTO_INCREMENT,
`nombreCLiente` VARCHAR (30) NOT NULL,
`rut` VARCHAR (15),
PRIMARY KEY (`cliente_id`));


#CREACION DE FOREING KEYS

ALTER TABLE minimarket_schema.producto ADD proveedor_id INT NOT NULL;
ALTER TABLE minimarket_schema.producto ADD CONSTRAINT proveedorProducto FOREIGN KEY(proveedor_id) REFERENCES minimarket_schema.proveedor(proveedor_id);

ALTER TABLE minimarket_schema.detalleboleta ADD producto_id INT NOT NULL;
ALTER TABLE minimarket_schema.detalleboleta ADD CONSTRAINT productoBoleta FOREIGN KEY(producto_id) REFERENCES minimarket_schema.producto(producto_id);

ALTER TABLE minimarket_schema.detalleboleta ADD boleta_id INT NOT NULL;
ALTER TABLE minimarket_schema.detalleboleta ADD CONSTRAINT boletaDetalleBoleta FOREIGN KEY(producto_id) REFERENCES minimarket_schema.producto(producto_id);

ALTER TABLE minimarket_schema.boleta ADD cliente_id INT NOT NULL;
ALTER TABLE minimarket_schema.boleta ADD CONSTRAINT clienteBoleta FOREIGN KEY(cliente_id) REFERENCES minimarket_schema.cliente(cliente_id);


#POBLAR PRODUCTOS Y TIPOS DE PRODUCTOS

INSERT INTO minimarket_schema.proveedor(proveedor_id, nombreProveedor, telefonoProveedor, nombreProductoProveedor, precioProductoProveedor)
values (1,'proveedor1',912345678,'carneSoja','1500');
INSERT INTO minimarket_schema.producto(producto_id, nombreProducto, precioProducto, cantidadProducto, proveedor_id, tipoProducto)
values (1,'carneSoja', 2000, 10,1,'Vegan');

INSERT INTO minimarket_schema.proveedor(proveedor_id, nombreProveedor, telefonoProveedor, nombreProductoProveedor, precioProductoProveedor)
values (2,'donpepe',987654321,'aguamineral',500);
INSERT INTO minimarket_schema.producto(producto_id, nombreProducto, precioProducto, cantidadProducto, proveedor_id, tipoProducto)
 values (2,'aguamineral', 1000, 5,2, 'bebidas');

INSERT INTO minimarket_schema.proveedor(proveedor_id, nombreProveedor, telefonoProveedor, nombreProductoProveedor, precioProductoProveedor)
values (3,'donjose',987222431,'chocolateVegan',3000);
INSERT INTO minimarket_schema.producto(producto_id, nombreProducto, precioProducto, cantidadProducto, proveedor_id, tipoProducto) 
values (3,'chocolateVegan', 4000, 15,3,'Vegan');

INSERT INTO minimarket_schema.proveedor(proveedor_id, nombreProveedor, telefonoProveedor, nombreProductoProveedor, precioProductoProveedor)
values (4,'eljordan23',999333666,'azucar',3200);
INSERT INTO minimarket_schema.producto(producto_id, nombreProducto, precioProducto, cantidadProducto, proveedor_id, tipoProducto) 
values (4,'azucar', 4500, 30,4,'Basico');

INSERT INTO minimarket_schema.proveedor(proveedor_id, nombreProveedor, telefonoProveedor, nombreProductoProveedor, precioProductoProveedor)
values (5,'eltiojulio',953258322,'pastadental',1350);
INSERT INTO minimarket_schema.producto(producto_id, nombreProducto, precioProducto, cantidadProducto, proveedor_id, tipoProducto) 
values (5,'pastadental', 2500, 20,5,'CuidadoBucal');


INSERT INTO minimarket_schema.proveedor(proveedor_id, nombreProveedor, telefonoProveedor, nombreProductoProveedor, precioProductoProveedor)
values (6,'proveedor1',912345678,'seitan',3500);
INSERT INTO minimarket_schema.producto(producto_id, nombreProducto, precioProducto, cantidadProducto, proveedor_id, tipoProducto) 
values (6,'seitan', 4900, 12,1,'Vegan');


#JOIN

SELECT producto.nombreProducto, producto.precioProducto, proveedor.precioProductoProveedor
FROM minimarket_schema.producto
LEFT JOIN minimarket_schema.proveedor ON minimarket_schema.producto.proveedor_id = minimarket_schema.proveedor.proveedor_id;


#VER
SELECT * FROM minimarket_schema.producto;
SELECT * FROM minimarket_schema.proveedor;