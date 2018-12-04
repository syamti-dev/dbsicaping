-- Catalogos de sistemas
INSERT INTO menu_systems (id, name, description, order_view, fdl, cbu, cat, luu, uat)
VALUES(1, 'Inventarios', 'Sistema de inventarios', 1, 0, 0, now(), 0, now());

INSERT INTO menu_systems (id, name, description, order_view, fdl, cbu, cat, luu, uat)
VALUES(2, 'Ingresos', 'Sistema de ingresos', 2, 0, 0, now(), 0, now());

INSERT INTO menu_systems (id, name, description, order_view, fdl, cbu, cat, luu, uat)
VALUES(3, 'Atención ciudadana', 'Sistema de atención ciudadana', 3, 0, 0, now(), 0, now());

INSERT INTO menu_systems (id, name, description, order_view, fdl, cbu, cat, luu, uat)
VALUES(90, 'Catalogos', 'Administración de catalogos', 90, 0, 0, now(), 0, now());

INSERT INTO menu_systems (id, name, description, order_view, fdl, cbu, cat, luu, uat)
VALUES(99, 'Seguridad', 'Seguridad de la app', 99, 0, 0, now(), 0, now());

-- Menu Inicial
-- Inventarios
INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(1, 1, 'Bienes', 'Bienes', '/', 1, 'exclamation', null, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(2, 1, 'Altas', 'Altas', '/goods/add', 1, null, 1, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(3, 1, 'Consulta y modificación', 'Consulta y modificación', '/goods/modify', 2, null, 1, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(4, 1, 'Bajas', 'Bajas', '/goods/delete', 3, null, 1, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(5, 1, 'Vehiculos', 'Vehiculos', '/', 2, 'car', null, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(6, 1, 'Altas', 'Altas', '/vehicles/add', 1, null, 5, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(7, 1, 'Consulta y modificación', 'Consulta y modificación', '/vehicles/modify', 2, null, 5, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(8, 1, 'Bajas', 'Bajas', '/vehicles/delete', 3, null, 5, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(9, 1, 'Reportes', 'Reportes', '/goods/reports', 3, 'file-contract ', null, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(10, 1, 'Etiquetas', 'Etiquetas', '/goods/barcodes', 4, 'barcode ', null, 0, 0, now(), 0, now());


-- Catalogos
INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(91, 90, 'Resguardantes', 'Resguardantes', '/catalogs/guarders', 1, 'user-shield', null, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(92, 90, 'Áreas', 'Áreas', '/', 2, 'sitemap', null, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(93, 90, 'Direcciones', 'Direcciones', '/catalogs/addresses', 1, null, 92, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(94, 90, 'Departamentos', 'Departamentos', '/catalogs/departaments', 2, null, 92, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(95, 90, 'Clasificaciones', 'Clasificaciones', '/catalogs/classifications', 3, 'check-double ', null, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(96, 90, 'Marcas', 'Marcas', '/catalogs/brands', 4, 'registered', null, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(97, 90, 'Materiales', 'Materiales', '/catalogs/equipment', 5, 'exclamation', null, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(98, 90, 'Colores', 'Colores', '/catalogs/colors', 6, 'palette', null, 0, 0, now(), 0, now());

INSERT INTO menu_items
(id, id_system, name, description, url, order_view, fa_icon, id_item_parent, fdl, cbu, cat, luu, uat)
VALUES(99, 90, 'Proveedores', 'Proveedores', '/catalogs/providers', 7, 'shopping-cart', null, 0, 0, now(), 0, now());

 

-- Seguridad
