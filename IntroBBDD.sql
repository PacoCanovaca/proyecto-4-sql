-- 1. Escribe una consulta que recupere los Vuelos (flights) y su identificador que figuren con status On Time.

SELECT flight_id, flight_no 
FROM flights 
WHERE status = 'On Time';

-- 2. Escribe una consulta que extraiga todas las columnas de la tabla bookings y refleje todas las reservas que han supuesto una cantidad total mayor a 1.000.000 (Unidades monetarias).

SELECT * 
FROM bookings 
WHERE total_amount > 1000000;

-- 3. Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data). Puede que os aparezca en alguna actualización como "aircrafts_data", revisad las tablas y elegid la que corresponda.

SELECT * 
FROM aircrafts_data;

-- 4. Con el resultado anterior visualizado previamente, escribe una consulta que extraiga los identificadores de vuelo que han volado con un Boeing 737. (Código Modelo Avión = 733).

SELECT flight_id 
FROM flights 
WHERE aircraft_code = '733';

-- 5. Escribe una consulta que te muestre la información detallada de los tickets que han comprado las personas que se llaman Irina.

SELECT * 
FROM tickets 
WHERE passenger_name LIKE '%IRINA%';

-- 6. Mostrar las ciudades con más de un aeropuerto.

SELECT city, COUNT(*)
FROM airports_data
GROUP BY city HAVING COUNT(*) > 1;

-- 7. Mostrar el número de vuelos por modelo de avión.

SELECT aircrafts_data.model, COUNT(*) AS flights_amount
FROM flights
JOIN aircrafts_data ON flights.aircraft_code = aircrafts_data.aircraft_code
GROUP BY aircrafts_data.model;

-- 8. Reservas con más de un billete (varios pasajeros).

SELECT book_ref, COUNT(*)
FROM tickets
GROUP BY book_ref HAVING COUNT(*) > 1; 

-- 9. Vuelos con retraso de salida superior a una hora.

SELECT flight_no, departure_airport, arrival_airport, (actual_departure - scheduled_departure) AS delay
FROM flights
WHERE actual_departure IS NOT NULL AND (actual_departure - scheduled_departure) > '01:00:00';