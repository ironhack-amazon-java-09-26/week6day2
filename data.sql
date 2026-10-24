CREATE DATABASE advanced_sql0926;

USE advanced_sql0926;


CREATE TABLE rice
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(64) NOT NULL,
    origin  VARCHAR(64),
    quality VARCHAR(32)
);

INSERT INTO rice(name, origin, quality)
VALUES ('Basmati', 'India', 'Premium'),
       ('Jasmine', 'Thailand', 'High'),
       ('Arborio', 'Italy', 'Medium'),
       ('Sushi Rice', 'Japan', 'High'),
       ('Brown Rice', 'USA', 'Standard');

SELECT *
FROM rice;

SELECT *
FROM rice
WHERE origin = 'Thailand';

SELECT *
FROM rice
WHERE id = 1;

SELECT *
FROM rice
WHERE id < 3;

DELETE
FROM rice
WHERE id = 5;

UPDATE rice
SET quality = 'High'
WHERE id = 3;

DROP TABLE rice;

DELETE
FROM rice;

CREATE TABLE rice_dishes
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    rice_recommended INT,
    FOREIGN KEY (rice_recommended)  REFERENCES rice(id)
);

INSERT INTO rice_dishes(name, rice_recommended) VALUES
                                                    ('sushi vegan', 4),
                                                    ('risotto alla milanese', 3),
                                                    ('red sushi', 4),
                                                    ('indian curry', 1);


SELECT * FROM rice_dishes;




