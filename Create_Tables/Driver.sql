CREATE TABLE Driver(
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    license_number VARCHAR(12) CHECK(license_number REGEXP '[0-9]{2} [0-9]{2} [0-9]{6}') NOT NULL, 
    rating SMALLINT CHECK(rating >= 0 AND rating <= 10),
    preferences VARCHAR(100),
    person_id INT UNIQUE NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Person(person_id) ON DELETE CASCADE
);