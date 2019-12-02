DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;


CREATE TABLE animals
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  breed VARCHAR(255),
  type VARCHAR(255)
);

CREATE TABLE owners(
  ID SERIAL8 primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255)
);

CREATE TABLE adoptions(
  ID SERIAL8 primary key,
  animal_id INT8 REFERENCES animals(id) ON DELETE CASCADE,
  owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE
);
