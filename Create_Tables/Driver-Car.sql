CREATE TABLE Driver_Car(
    driver_car_id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT NOT NULL,
    car_id INT NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES Driver(driver_id) ON DELETE CASCADE, FOREIGN KEY (car_id) REFERENCES Car(car_id) ON DELETE CASCADE,
    FOREIGN KEY (car_id) REFERENCES Car(car_id) ON DELETE CASCADE,
    UNIQUE (driver_id, car_id)
);