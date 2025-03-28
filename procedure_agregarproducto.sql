USE Puntolan;

DELIMITER //

CREATE PROCEDURE agregar_producto(
    IN nombre_producto VARCHAR(100),
    IN descripcion TEXT,
    IN precio DECIMAL(10,2),
    IN stock INT,
    IN id_categoria INT,
    IN id_proveedor INT
)
BEGIN
    INSERT INTO producto (nombre_producto, descripcion, precio, stock, id_categoria, id_proveedor)
    VALUES (nombre_producto, descripcion, precio, stock, id_categoria, id_proveedor);
END //

DELIMITER ;