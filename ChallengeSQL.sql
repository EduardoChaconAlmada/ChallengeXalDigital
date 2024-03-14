CREATE TABLE aerolineas (
    ID_AEROLINEA INT,
    NOMBRE_AEROLINEA VARCHAR
);

CREATE TABLE aeropuertos (
    ID_AEROPUERTO INT,
    NOMBRE_AEROLINEA VARCHAR
);

CREATE TABLE movimientos (
    ID_MOVIMIENTO INT,
    DESCRIPCION VARCHAR
);

CREATE TABLE vuelos (
    ID_AEROLINEA INT,
    ID_AEROPUERTO INT,
	ID_MOVIMIENTO INT,
	DIA DATE
);

--¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?
SELECT nombre_aerolinea, COUNT(nombre_aerolinea) AS aeropuertos_con_mas_movimientos
FROM aeropuertos
JOIN vuelos
ON aeropuertos.id_aeropuerto = vuelos.id_aeropuerto
GROUP BY nombre_aerolinea
ORDER BY aeropuertos_con_mas_movimientos DESC;

--¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante el año?
SELECT nombre_aerolinea, COUNT(nombre_aerolinea) AS aerolinea_con_mas_vuelos
FROM aerolineas
JOIN vuelos
ON aerolineas.id_aerolinea = vuelos.id_aerolinea
GROUP BY nombre_aerolinea
ORDER BY aerolinea_con_mas_vuelos DESC
LIMIT 2;

-- ¿En qué día se han tenido mayor número de vuelos?
SELECT dia, COUNT(*) AS mayor_vuelos_por_dia
FROM vuelos
GROUP BY dia
ORDER BY mayor_vuelos_por_dia DESC
LIMIT 1;

-- ¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?
SELECT nombre_aerolinea, dia AS aerolineas_con_mas_de_2_vuelos_x_dia
FROM aerolineas
JOIN vuelos
ON aerolineas.id_aerolinea = vuelos.id_aerolinea
GROUP BY nombre_aerolinea, dia
HAVING COUNT(*) > 2;
