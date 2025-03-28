USE Puntolan;

CREATE VIEW vista_ventas AS
SELECT 
    v.id_venta,
    u.nombre_usuario,
    u.email,
    ven.nombre_vendedor,
    mp.metodo,
    v.total,
    v.fecha_venta
FROM 
    venta v
JOIN 
    usuario u ON v.id_usuario = u.id_usuario
JOIN 
    vendedor ven ON v.id_vendedor = ven.id_vendedor
JOIN 
    metodo_pago mp ON v.id_metodo_pago = mp.id_metodo_pago;