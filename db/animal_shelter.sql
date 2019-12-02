DROP TABLE animals;
DROP TABLE owners;
DROP TABLE adoptions;

CREATE TABLE animals
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  breed VARCHAR(255),
  type VARCHAR(255)
);

CREATE TABLE owners(
  ID SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE adoptions(
  ID SERIAL8 primary key,
  animal_id INT8 REFERENCES animal(id),
  owner_id INT8 REFERENCES owner(id)
);
