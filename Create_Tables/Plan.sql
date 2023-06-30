CREATE TABLE Plan(
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    trip_id INT NOT NULL,
    passenger_id INT NOT NULL,
    route_id INT NOT NULL,
    num_seats SMALLINT CHECK(num_seats >= 1) NOT NULL,
    FOREIGN KEY (trip_id) REFERENCES Trip(trip_id) ON DELETE CASCADE,
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id) ON DELETE CASCADE, 
    FOREIGN KEY (route_id) REFERENCES Route(route_id) ON DELETE CASCADE
);