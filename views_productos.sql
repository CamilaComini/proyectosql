USE Puntolan;

CREATE VIEW vista_productos AS
SELECT 
    p.id_producto,
    p.nombre_producto,
    p.descripcion,
    p.precio,
    p.stock,
    c.nombre_categoria,
    pr.nombre_proveedor
FROM 
    producto p
JOIN 
    categoria c ON p.id_categoria = c.id_categoria
JOIN 
    proveedor pr ON p.id_proveedor = pr.id_proveedor;