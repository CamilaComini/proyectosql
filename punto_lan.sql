-- Crear la base de datos
CREATE DATABASE PuntoLAN;
USE PuntoLAN;

-- Tabla Categoria
CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla Mayorista
CREATE TABLE Mayorista (
    id_mayorista INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Tabla Producto
CREATE TABLE Producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    garantia VARCHAR(50),
    id_categoria INT,
    id_mayorista INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_mayorista) REFERENCES Mayorista(id_mayorista)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);

-- Tabla Vendedor
CREATE TABLE Vendedor (
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL
);

-- Tabla Pedido
CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_vendedor INT NOT NULL,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    plataforma_venta ENUM('Instagram', 'Facebook', 'Web') NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    estado ENUM('Pendiente', 'Pagado', 'Cancelado') DEFAULT 'Pendiente',
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor) ON DELETE RESTRICT
);

-- Tabla Detalle_Pedido
CREATE TABLE Detalle_Pedido (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- Tabla Pago
CREATE TABLE Pago (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    metodo_pago ENUM('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

-- Insertar datos en las tablas
INSERT INTO Categoria (nombre) VALUES ('Laptops'), ('Auriculares'), ('Teclados');
INSERT INTO Mayorista (nombre, contacto, email) VALUES ('TechSuppliers', '123456789', 'contact@techsuppliers.com');
INSERT INTO Producto (nombre, descripcion, precio, stock, garantia, id_categoria, id_mayorista) 
VALUES ('Laptop Gamer', 'Potente laptop para gaming', 1200.00, 10, '1 año', 1, 1),
       ('Auriculares Inalámbricos', 'Auriculares con cancelación de ruido', 150.00, 25, '6 meses', 2, 1),
       ('Teclado Mecánico', 'Teclado RGB para gaming', 80.00, 15, '1 año', 3, 1);

INSERT INTO Cliente (nombre, apellido, email, telefono) 
VALUES ('Juan', 'Pérez', 'juan.perez@example.com', '987654321'),
       ('María', 'González', 'maria.gonzalez@example.com', '123456789');

INSERT INTO Vendedor (nombre, apellido) 
VALUES ('Carlos', 'Gómez'),
       ('Ana', 'Ramírez');

INSERT INTO Pedido (id_cliente, id_vendedor, plataforma_venta, total, estado) 
VALUES (1, 1, 'Instagram', 1200.00, 'Pendiente'),
       (2, 2, 'Facebook', 150.00, 'Pagado');

INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unitario) 
VALUES (1, 1, 1, 1200.00),
       (2, 2, 1, 150.00);

INSERT INTO Pago (id_pedido, metodo_pago, monto) 
VALUES (2, 'Tarjeta', 150.00);