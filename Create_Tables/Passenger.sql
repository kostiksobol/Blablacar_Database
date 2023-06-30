CREATE TABLE Passenger(
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    rating SMALLINT CHECK(rating >= 0 AND rating <= 10),
    preferences VARCHAR(100),
    person_id INT UNIQUE NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Person(person_id) ON DELETE CASCADE
);