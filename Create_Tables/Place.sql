CREATE TABLE Place(
    place_id INT AUTO_INCREMENT PRIMARY KEY, 
    specification VARCHAR(300),
    address_id INT NOT NULL,
    FOREIGN KEY (address_id) REFERENCES Address(address_id) ON DELETE CASCADE
);