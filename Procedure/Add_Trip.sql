DELIMITER $$
CREATE PROCEDURE Add_Trip(IN trip_id INT, IN driver_car_id INT, IN place_from_id INT, IN place_to_id INT, 
  IN start_time DATETIME, IN end_time DATETIME, IN num_seats INT, IN actual VARCHAR(3))
BEGIN
  INSERT INTO Trip(trip_id, driver_car_id, place_from_id, place_to_id, start_time, end_time, num_seats, actual)
    VALUES(trip_id, driver_car_id, place_from_id, place_to_id, start_time, end_time, num_seats, actual);
END $$
DELIMITER ;