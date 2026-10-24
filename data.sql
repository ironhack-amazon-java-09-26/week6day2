CREATE DATABASE advanced_sql0926;

USE advanced_sql0926;


CREATE TABLE rice
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(64) NOT NULL,
    origin       VARCHAR(64),
    quality      VARCHAR(32),
    price_per_kg DECIMAL(5, 2),
    stock_kg     INT
);

CREATE TABLE rice_dishes
(
    id               INT PRIMARY KEY AUTO_INCREMENT,
    name             VARCHAR(64) NOT NULL,
    rice_recommended INT,
    cuisine          VARCHAR(32),
    prep_minutes     INT,
    FOREIGN KEY (rice_recommended) REFERENCES rice (id)
);

CREATE TABLE rice_sale
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    rice_id     INT,
    quantity_kg INT,
    sale_date   DATE,
    store       VARCHAR(32),
    FOREIGN KEY (rice_id) REFERENCES rice (id)
);

INSERT INTO rice(name, origin, quality, price_per_kg, stock_kg)
VALUES ('Basmati', 'India', 'Premium', 4.50, 120),
       ('Jasmine', 'Thailand', 'High', 3.80, 200),
       ('Arborio', 'Italy', 'Medium', 3.20, 150),
       ('Sushi Rice', 'Japan', 'High', 4.10, 90),
       ('Brown Rice', 'USA', 'Standard', 2.50, 300),
       ('Carnaroli', 'Italy', 'Premium', 5.20, 60),
       ('Bomba', 'Spain', 'Premium', 6.00, 40);

INSERT INTO rice_dishes(name, rice_recommended, cuisine, prep_minutes)
VALUES ('sushi vegan', 4, 'Japanese', 30),
       ('risotto alla milanese', 3, 'Italian', 40),
       ('red sushi', 4, 'Japanese', 35),
       ('indian curry', 1, 'Indian', 45),
       ('paella valenciana', 7, 'Spanish', 60),
       ('mushroom risotto', 3, 'Italian', 35),
       ('biryani', 1, 'Indian', 75),
       ('plain boiled rice', NULL, 'Generic', 15);   -- no rice recommended!

INSERT INTO rice_sale(rice_id, quantity_kg, sale_date, store)
VALUES (1, 10, '2026-03-10', 'Madrid'),
       (1, 25, '2026-04-02', 'Barcelona'),
       (2, 40, '2026-03-15', 'Madrid'),
       (2, 28, '2026-04-18', 'Barcelona'),
       (3, 30, '2026-03-20', 'Madrid'),
       (3, 18, '2026-04-05', 'Valencia'),
       (4, 22, '2026-03-22', 'Barcelona'),
       (4, 15, '2026-04-15', 'Madrid'),
       (5, 60, '2026-04-01', 'Madrid'),
       (5, 35, '2026-04-10', 'Valencia'),
       (7, 12, '2026-03-28', 'Valencia'),
       (7, 20, '2026-04-12', 'Madrid');


SELECT * FROM rice;
SELECT * FROM rice_dishes;
SELECT * FROM rice_sale;


SELECT COUNT(*) as total_rice_types FROM rice;

SELECT SUM(quantity_kg) as total_rice_sold FROM rice_sale;

SELECT AVG(price_per_kg) as average_price FROM rice;

SELECT MIN(price_per_kg) as cheapest, MAX(price_per_kg) as most_expensive FROM rice;


SELECT COUNT(*) as number_of_rice_types, MIN(price_per_kg) as cheapest,  MAX(price_per_kg) as most_expensive,  AVG(price_per_kg) as average_price FROM rice WHERE origin = 'Italy';








SELECT  * FROM rice;

SELECT * FROM rice_sale;

SELECT rice_id, COUNT(*) as total_sales FROM rice_sale GROUP BY rice_id;


SELECT rice_id, SUM(quantity_kg) as total_kgs FROM rice_sale GROUP BY rice_id;



SELECT rice_id, SUM(quantity_kg) as total_kgs FROM rice_sale GROUP BY rice_id HAVING SUM(quantity_kg) >40;


SELECT * FROM rice WHERE name = 'Sushi';
SELECT * FROM rice WHERE name LIKE 'Sushi%';
SELECT * FROM rice WHERE name LIKE '%Rice';
SELECT * FROM rice WHERE name LIKE '%Rice%';


SELECT * FROM rice_dishes WHERE name LIKE '%c_rry%';


SELECT * FROM rice_sale WHERE sale_date BETWEEN '2026-03-01' AND '2026-03-31';



SELECT * FROM rice ORDER BY price_per_kg DESC;


SELECT * FROM rice_dishes JOIN rice ON rice_recommended = rice.id;

SELECT name, rice_recommended, cuisine FROM rice_dishes;

SELECT rice_dishes.name, rice.name as recommended_rice, rice_dishes.cuisine as cuisine FROM rice_dishes JOIN rice ON rice_recommended = rice.id;







