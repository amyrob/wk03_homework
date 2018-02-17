DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE customers;
DROP TABLE films;


CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds SMALLINT
);

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255)
);

CREATE TABLE screenings (
  id SERIAL4 PRIMARY KEY,
  film_id SMALLINT REFERENCES films(id),
  film_time VARCHAR(255),
  price SMALLINT
);

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  customer_id SMALLINT REFERENCES customers(id) ON DELETE CASCADE,
  screening_id SMALLINT REFERENCES screenings(id) ON DELETE CASCADE
);
