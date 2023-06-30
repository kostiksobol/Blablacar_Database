CREATE TABLE Route(
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    start_time DATETIME NOT NULL, 
    end_time DATETIME NOT NULL, 
    price INT,
    trip_id INT NOT NULL,
    startplace_id INT NOT NULL, 
    end_place_id INT NOT NULL, 
    num_free_seats INT CHECK(num_free_seats >= 0) NOT NULL,
    max_free_seats INT NOT NULL,
    FOREIGN KEY (trip_id) REFERENCES Trip(trip_id) ON DELETE CASCADE,
    FOREIGN KEY (start_place_id) REFERENCES Place(place_id) ON DELETE CASCADE, 
    FOREIGN KEY (end_place_id) REFERENCES Place(place_id) ON DELETE CASCADE, 
    CHECK(end_time > start_time)
);