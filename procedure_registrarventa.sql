USE Puntolan;

DELIMITER //

CREATE PROCEDURE registrar_venta(
    IN id_usuario INT,
    IN id_vendedor INT,
    IN id_metodo_pago INT,
    IN total DECIMAL(10,2)
)
BEGIN
    INSERT INTO venta (id_usuario, id_vendedor, id_metodo_pago, total)
    VALUES (id_usuario, id_vendedor, id_metodo_pago, total);
END //

DELIMITER ;