DELIMITER $$
CREATE PROCEDURE Remove_Plan(IN plan_id INT)
BEGIN
    declare route_id INT;
    declare num_seats INT;
    declare route_start_time DATETIME;
    declare route_end_time DATETIME;
    select Plan.route_id, Plan.num_seats into route_id, num_seats
        from Plan where Plan.plan_id = plan_id;
    select Route.start_time, Route.end_time, Route.num_free_seats 
        into route_start_time, route_end_time from Route where Route.route_id = route_id;
    DELETE FROM Plan WHERE Plan.plan_id = plan_id;
    UPDATE Route 
        SET Route.num_free_seats = Route.num_free_seats + num_seats
        WHERE Route.route_id = route_id;
    UPDATE Route
        SET Route.max_free_seats = Route.max_free_seats + num_seats
        WHERE Route.trip_id = trip_id and (Route.start_time >= route_start_time and Route.end_time <= route_end_time);
    UPDATE Route r, (select r1.route_id, MIN(r2.max_free_seats) as min_max_free_seats from Route r1, Route r2
                        where r1.trip_id = trip_id and r2.trip_id = trip_id
                            and not (r2.start_time >= r1.end_time or r2.end_time <= r1.start_time)
                        group by r1.route_id) as t
        SET r.num_free_seats = t.min_max_free_seats 
            where r.route_id = t.route_id and r.route_id <> route_id;
END $$
DELIMITER ;