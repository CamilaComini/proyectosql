USE Puntolan;

DELIMITER //

CREATE TRIGGER verificar_stock_before_venta
BEFORE INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    DECLARE stock_actual INT;
    SELECT stock INTO stock_actual FROM producto WHERE id_producto = NEW.id_producto;
    IF stock_actual < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para el producto';
    END IF;
END //

DELIMITER ;