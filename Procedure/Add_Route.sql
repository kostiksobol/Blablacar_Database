DELIMITER $$
CREATE PROCEDURE Add_Route(IN route_id INT, IN start_place_id INT, IN end_place_id INT, IN start_time DATETIME, IN end_time DATETIME, IN price INT, IN trip_id INT)
IN end_time DATETIME, IN price INT, IN trip_id INT)
BEGIN
  declare trip_start_time DATETIME;
  declare trip_end_time DATETIME;
  declare num_free_seats INT;
  select Trip.start_time, Trip.end_time, Trip.num_seats into trip_start_time, trip_end_time, num_free_seats 
    from Trip where Trip.trip_id = trip_id;
  if start_time >= trip_start_time and end_time <= trip_end_time then
      INSERT INTO Route(route_id, start_place_id, end_place_id, start_time,
        end_time, price, trip_id, num_free_seats, max_free_seats)
      VALUES (route_id, start_place_id, end_place_id, start_time, end_time, price,
        trip_id, num_free_seats, num_free_seats);
  else
    SIGNAL SQLSTATE '45E100' SET MESSAGE_TEXT = 'Time error';
  end if; 
END $$
DELIMITER ;