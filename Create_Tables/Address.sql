CREATE TABLE Address(
    address_id INT AUTO_INCREMENT PRIMARY KEY, 
    region VARCHAR(40),
    city VARCHAR(30) NOT NULL,
    street VARCHAR(60) NOT NULL,
    house VARCHAR(6) NOT NULL
);