-- Inserción de usuarios
INSERT INTO usuario (nombre_usuario, apellido, email, contraseña, telefono, direccion) 
VALUES 
('Juan', 'Perez', 'juan@puntoLAN.com', 'contraseña123', '555-1234', 'Calle Ficticia 123'),
('Ana', 'García', 'ana@puntoLAN.com', 'contraseña456', '555-5678', 'Avenida Real 456'),
('Carlos', 'Martínez', 'carlos@puntoLAN.com', 'contraseña789', '555-9876', 'Calle Ejemplo 789');

-- Inserción de vendedores
INSERT INTO vendedor (nombre_vendedor, apellido, email, telefono, direccion, id_usuario) 
VALUES 
('Carlos', 'Ruiz', 'carlosvendedor@puntoLAN.com', '555-1122', 'Calle Venta 111', 1),
('Maria', 'López', 'maria@puntoLAN.com', '555-3344', 'Avenida Vendedores 500', 2);

-- Inserción de dueños
INSERT INTO dueño (nombre_dueño, id_usuario) 
VALUES 
('Laura Gómez', 1),
('Fernando Díaz', 3);

-- Inserción de categorías
INSERT INTO categoria (nombre_categoria, descripcion) 
VALUES 
('Electrónica', 'Productos electrónicos de última tecnología'),
('Accesorios', 'Accesorios para computadoras y dispositivos móviles');

-- Inserción de proveedores
INSERT INTO proveedor (nombre_proveedor, contacto, telefono, email, direccion) 
VALUES 
('Proveedor A', 'Juan Pérez', '555-4455', 'proveedorA@puntoLAN.com', 'Calle Proveedor 123'),
('Proveedor B', 'Ana García', '555-1123', 'proveedorB@puntoLAN.com', 'Avenida Proveedor 456');

-- Inserción de productos
INSERT INTO producto (nombre_producto, descripcion, precio, stock, id_categoria, id_proveedor) 
VALUES 
('Laptop HP', 'Laptop HP de 15 pulgadas, procesador i7', 450.00, 10, 1, 1),
('Mouse Logitech', 'Mouse inalámbrico Logitech', 25.00, 50, 2, 2),
('Teclado Razer', 'Teclado mecánico Razer', 75.00, 30, 1, 2);

-- Inserción de métodos de pago
INSERT INTO metodo_pago (metodo) 
VALUES 
('Tarjeta de Crédito'),
('PayPal'),
('Transferencia Bancaria');

-- Inserción de plataformas de venta
INSERT INTO plataforma_venta (nombre_plataforma, descripcion) 
VALUES 
('Instagram', 'Plataforma de ventas en Instagram'),
('Facebook', 'Plataforma de ventas en Facebook');

-- Inserción de ventas
INSERT INTO venta (id_usuario, id_vendedor, id_plataforma, id_metodo_pago, metodo_pago, total) 
VALUES 
(1, 1, 1, 1, 'Tarjeta de Crédito', 475.00),
(2, 2, 2, 2, 'PayPal', 75.00),
(3, 1, 1, 3, 'Transferencia Bancaria', 525.00);

-- Inserción de detalles de venta
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario, subtotal) 
VALUES 
(1, 1, 1, 450.00, 450.00),
(1, 2, 1, 25.00, 25.00),
(2, 2, 3, 25.00, 75.00),
(3, 1, 1, 450.00, 450.00),
(3, 3, 1, 75.00, 75.00);

-- Inserción de garantías
INSERT INTO garantia (id_producto, periodo_garantia, descripcion) 
VALUES 
(1, 24, 'Garantía de 2 años contra defectos de fabricación'),
(2, 12, 'Garantía de 1 año para problemas de fabricación');

-- Inserción de clientes
INSERT INTO cliente (id_usuario, direccion, telefono) 
VALUES 
(1, 'Calle Ficticia 123', '555-1234'),
(2, 'Avenida Real 456', '555-5678'),
(3, 'Calle Ejemplo 789', '555-9876');
