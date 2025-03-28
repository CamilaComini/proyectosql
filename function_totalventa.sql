USE Puntolan;

DELIMITER //

CREATE FUNCTION calcular_total_venta(p_id_venta INT) 
RETURNS DECIMAL(10,2) 
DETERMINISTIC 
BEGIN
    DECLARE total DECIMAL(10,2);
    
    -- Calcular el total sumando los subtotales de cada producto
    SELECT SUM(subtotal) 
    INTO total
    FROM detalle_venta
    WHERE id_venta = p_id_venta;
    
    -- Devolver el total calculado
    RETURN total;
END //

DELIMITER ;