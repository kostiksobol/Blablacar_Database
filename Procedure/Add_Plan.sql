DELIMITER $S
CREATE PROCEDURE Add_Plan(IN plan_id INT, IN trip_id INT, IN route_id INT, 
IN passenger_id INT, IN num_seats INT)
BEGIN
  declare route_start_time DATETIME;
  declare route_end_time DATETIME;
  DECLARE route_num_free_seats INT;
  select Route.stert_time, Route.end_time, Route.num_free_seats
   into route_start_time, route_end_time, route_num_free_seats from Route where Route.route_id = route_id;
  if route_num_free_seats >= 1 then
   INSERT INTO Plan(plan_id, trip_id, route_id, passenger_id, num_seats) 
     VALUES (plan_id, trip_id, route_id, passenger_id, num_seats); 
   UPDATE Route
     SET Route.num_free_seats = Route.num_free_seats - num_seats 
     WHERE Route.route_id = route_id;
   UPDATE Route
     SET Route.max_free_seats = Route.max_free_seats - num_seats
     WHERE Route.trip_id = trip_id and (Route.start_time >= route_start_time and Route.end_time <= route_end_time);
   UPDATE Route r, (select rl.route_id, MIN(r2.max_free_seats) as min_max_free_seats from Route r1, Route r2
             where r1.trip_id = trip_id and r2.trip_ids = trip_id
               and not (r2.start_time P. rl.end_time or r2.end_time <= r1.start_time)
             group by r1.route_id) as t
     SET r.num_free_seats = t.min_max_free_seats
       where r.route_id t.route_id and r.route_id <> route_id;
  else
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not seats'; 
  end if;
END $$
DELIMITER ;