DROP TABLE car_driver;
DROP TABLE driver;
DROP TABLE car;


CREATE TABLE driver (
  id serial PRIMARY KEY NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  driving_experience int NOT NULL,
  birth_date date NOT NULL
);

CREATE TABLE car (
  id serial PRIMARY KEY NOT NULL,
  brand TEXT,
  manufacturing_year int NOT NULL,
  mileage int NOT NULL
  );

 CREATE TABLE car_driver(
   id serial PRIMARY KEY NOT NULL,
   car_id int NOT NULL REFERENCES car(id),
   driver_id int NOT NULL REFERENCES driver(id)
   );

INSERT INTO driver (first_name, last_name, driving_experience, birth_date) VALUES ('fn1', 'ln1', 10, '1980-03-03');
INSERT INTO driver (first_name, last_name, driving_experience, birth_date) VALUES ('fn2', 'ln2', 12, '1980-03-02');
INSERT INTO driver (first_name, last_name, driving_experience, birth_date) VALUES ('fn3', 'ln3', 13, '1980-03-03');
INSERT INTO driver (first_name, last_name, driving_experience, birth_date) VALUES ('fn4', 'ln4', 14, '1980-03-04');
INSERT INTO driver (first_name, last_name, driving_experience, birth_date) VALUES ('fn5', 'ln5', 15, '1980-03-05');

INSERT INTO car (brand, manufacturing_year, mileage) VALUES ('bvw', 1980, 100);
INSERT INTO car (brand, manufacturing_year, mileage) VALUES ('bvw2', 1980, 100);
INSERT INTO car (brand, manufacturing_year, mileage) VALUES ('bvw3', 1980, 100);
INSERT INTO car (brand, manufacturing_year, mileage) VALUES ('bvw4', 1980, 100);
INSERT INTO car (brand, manufacturing_year, mileage) VALUES ('toyota', 1980, 100);
INSERT INTO car (brand, manufacturing_year, mileage) VALUES ('toyota', 1980, 100);
INSERT INTO car (brand, manufacturing_year, mileage) VALUES ('toyota', 1980, 101);
INSERT INTO car (brand, manufacturing_year, mileage) VALUES ('toyota', 1980, 102);

SELECT * FROM driver;
SELECT * FROM car;

INSERT INTO car_driver (car_id, driver_id) VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 4), (6, 4), (7, 5);
INSERT INTO car_driver (car_id, driver_id) VALUES (8, 1), (7, 1), (6, 1), (5, 1);

SELECT * FROM car_driver;

SELECT * FROM car LEFT JOIN car_driver ON car.id = car_driver.car_id;

SELECT
	driver_id,
	count(*) cnt
FROM car
LEFT JOIN car_driver ON car.id = car_driver.car_id
WHERE brand='toyota'
GROUP BY driver_id
HAVING count(*)>=2;

SELECT d.last_name
FROM car c
JOIN car_driver cd ON c.id = cd.car_id
JOIN driver d ON d.id=cd.driver_id
WHERE brand='toyota'
GROUP BY driver_id, last_name
HAVING count(d.id)>=2;




