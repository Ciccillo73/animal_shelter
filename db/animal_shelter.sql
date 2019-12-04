DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE owners;


CREATE TABLE animals
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  breed VARCHAR(255),
  type VARCHAR(255),
  adoption_date VARCHAR(255),
  adoptable BOOLEAN
);

CREATE TABLE owners(
  id SERIAL8 primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255)  not null
);

CREATE TABLE adoptions(
  id SERIAL8 primary key,
  animal_id INT8 REFERENCES animals(id) ON DELETE CASCADE,
  owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE
);
