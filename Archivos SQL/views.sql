CREATE view ventas_hoy AS
SELECT * from eben_ezer.venta v
where day(V.fecha) = day(current_timestamp());
--  -------------------------------------------------
create view ventas_por_local AS
select distinct id_local, count(id_venta)
from eben_ezer.venta v;
-- ---------------------------------------------------
CREATE VIEW vw_ventas_por_producto AS
SELECT 
    p.id_producto,
    p.nombre,
    SUM(pv.cantidad) AS cantidad_vendida
FROM producto p
JOIN producto_venta pv ON p.id_producto = pv.id_producto
GROUP BY p.id_producto;
    
-- -------------------------------------------------------
CREATE VIEW vw_ventas_por_vendedor AS
SELECT 
    p.id_personal,
    p.nombre,
    p.apellido,
    COUNT(v.id_venta) AS cantidad_ventas
FROM personal p
JOIN venta v ON p.id_personal = v.id_personal
GROUP BY p.id_personal;