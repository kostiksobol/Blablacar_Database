CREATE TABLE Trip(
    trip_id INT AUTO_INCREMENT PRIMARY KEY,
    driver_car_id INT NOT NULL, 
    place_from_id INT NOT NULL, 
    place_to_id INT NOT NULL, 
    start_time DATETIME NOT NULL, 
    end_time DATETIME NOT NULL, 
    num_seats INT NOT NULL CHECK(num_seats >= 1),
    actual VARCHAR(3) CHECK(actual IN('On', 'Off')) NOT NULL,
    CHECK(end_time > start_time),
    FOREIGN KEY (place_from_id) REFERENCES Place(place_id) ON DELETE CASCADE,
    FOREIGN KEY (place_to_id) REFERENCES Place(place_id) ON DELETE CASCADE,
    FOREIGN KEY (driver_car_id) REFERENCES Driver_Car(driver_car_id) ON DELETE CASCADE
);