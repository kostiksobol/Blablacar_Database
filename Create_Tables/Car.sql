CREATE TABLE Car(
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    car_number VARCHAR(20) NOT NULL,
    model VARCHAR(20) NOT NULL,
    capacity SMALLINT NOT NULL CHECK(capacity >= 0),
    technical_condition VARCHAR(20)
CHECK(technical_condition IN ('New', 'Excellent', 'Good', 'Satisfactory', 'Applicable', 'Unsatisfactory'))
);