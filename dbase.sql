CREATE TABLE users(
  id SERIAL4 PRIMARY KEY,
  name TEXT,
  email VARCHAR(400),
  password_digest VARCHAR(400)
);


CREATE TABLE stocks(
  id SERIAL4 PRIMARY KEY,
  stock_code TEXT
);