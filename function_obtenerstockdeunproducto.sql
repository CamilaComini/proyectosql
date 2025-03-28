USE Puntolan;

DELIMITER //

CREATE FUNCTION obtener_stock_producto(p_id_producto INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock INT;
    SELECT stock INTO stock
    FROM producto
    WHERE id_producto = p_id_producto; 
    RETURN stock;
END //

DELIMITER ;
