CREATE TABLE Person(
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(1) CHECK(sex IN ('M', 'F')) NOT NULL,
    birth_date DATE NOT NULL,
    phone VARCHAR(20) CHECK(phone LIKE '+%') NOT NULL,
    email_address VARCHAR(60) CHECK(email_address LIKE '%@%.%') NOT NULL
);