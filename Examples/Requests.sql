-- Вывести водителей и информацию о них, имеющих на своем счету больше 1-й поездки и
-- рейтинг ниже 3, а также список всех поездок для каждого водителя со всей информацией о них:
SELECT pd.first_name, pd.last_name, pd.license_number, pd.rating, tdc.trip_id, tdc.start_time, tdc.end_time
  FROM (SELECT p.first_name, p.last_name, d.driver_id, d.license_number, d.rating
    FROM Person p JOIN Driver d ON p.person_id = d.person_id
    WHERE d.rating < 3) pd
    JOIN (SELECT t.trip_id, t.start_time, t.end_time, dc.driver_id
      FROM Trip t JOIN Driver_car dc ON t.driver_car_id = dc.driver_car_id
          WHERE dc.driver_car_id IN (SELECT driver_car_id
            FROM Trip GROUP BY driver_car_id HAVING COUNT(driver_car_id) > 1)) tdc 
      ON pd.driver_id = tdc.driver_id;


-- Вывести пассажиров и информацию о них, поучаствовавших в более чем двух поездках, а
-- также информацию об их маршрутах:
SELECT ppa.first_name, ppa.last_name, ppa.preferences, pr.route_id, pr.start_time, pr.end_time
  FROM (SELECT p.first_name, p.last_name, pa.passenger_id, pa.preferences 
    FROM Person p JOIN Passenger pa ON p.person_id = pa.person_id) ppa 
    JOIN (SELECT p.passenger_id, r.route_id, r.start_time, r.end_time
      FROM Plan p JOIN Route r ON p.route_id = r.route_id
          WHERE p.passenger_id IN (SELECT passenger_id
            FROM Plan GROUP BY passenger_id HAVING COUNT(passenger_id) > 2)) pr
      ON ppa.passenger_id = pr.passenger_id ORDER BY ppa.first_name;

-- Найти водителей (водителя) и их поездки, имеющих на своем счету поездки наибольшей
-- длительности:
SELECT pd.first_name, pd.last_name, pd.license_number, tdc.trip_id, tdc.start_time, tdc.end_time,
  TIMEDIFF(tdc.end_time, tdc.start_time) AS time
FROM (SELECT p.first_name, p.last_name, d.driver_id, d.license_number
  FROM Person p JOIN Driver d ON p.person_id = d.person_id) pd
  JOIN (SELECT dc.driver_id, t.trip_id, t.start_time, t.end_time
    FROM Trip t JOIN Driver_Car dc ON t.driver_car_id = dc.driver_car_id
        WHERE (t.end_time - t.start_time) = (SELECT MAX(end_time - start_time) 
          FROM Trip)) tdc
    ON tdc.driver_id = pd.driver_id;

-- Найти водителей, которые еще и являются пассажирами и которые совершили как минимум
-- по одной поездке как в роли пассажира, так и в роли водителя:
SELECT * FROM Person
 WHERE person_id IN (SELECT pap.person_id
                        FROM (SELECT pa.person_id
                            FROM Passenger pa JOIN Plan p ON p.passenger_id = pa.passenger_id 
                                GROUP BY p.passenger_id HAVING COUNT(p.passenger_id) >= 1) pap
                                    WHERE pap.person_id IN
   (SELECT dc.driver_id
        FROM Driver_Car dc JOIN Trip t ON t.driver_car_id = dc.driver_car_id
            GROUP BY dc.driver_id HAVING COUNT(dc.driver_id) >= 1));