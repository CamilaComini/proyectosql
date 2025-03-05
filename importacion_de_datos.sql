USE PuntoLAN;
DELIMITER //

-- Eliminar el procedimiento si ya existe
DROP PROCEDURE IF EXISTS RegistrarPedido;

-- Procedimiento para registrar un nuevo pedido
CREATE PROCEDURE RegistrarPedido(
    IN p_id_cliente INT,
    IN p_id_vendedor INT,
    IN p_plataforma_venta VARCHAR(20),
    IN p_total DECIMAL(10,2),
    IN p_estado VARCHAR(20)
)
BEGIN
    -- Validar plataforma de venta
    IF p_plataforma_venta NOT IN ('Instagram', 'Facebook', 'Web') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Plataforma de venta no válida';
    END IF;
    
    -- Validar estado del pedido
    IF p_estado NOT IN ('Pendiente', 'Pagado', 'Cancelado') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estado del pedido no válido';
    END IF;
    
    -- Insertar el pedido
    INSERT INTO pedido (id_cliente, id_vendedor, plataforma_venta, total, estado)
    VALUES (p_id_cliente, p_id_vendedor, p_plataforma_venta, p_total, p_estado);
END //

DELIMITER ;

-- Consultas de prueba
SET FOREIGN_KEY_CHECKS = 0;

SELECT * FROM Cliente;
SELECT id_cliente, nombre FROM Cliente;
SELECT * FROM Pedido;
CALL RegistrarPedido(1, 2, 'Instagram', 1200.00, 'Pendiente');

SET FOREIGN_KEY_CHECKS = 1;



