SELECT *
FROM person
WHERE firstname='Philippa';

INSERT INTO movieperson
  (personid, movieid, roleid)
VALUES
  (99, 6, 3),
  (99, 6, 2),
  (99, 7, 3),
  (99, 7, 2),
  (101, 6, 3),
  (101, 7, 3);

INSERT INTO person
  (firstname, lastname)
VALUES
  ('Philippa', 'Boyens'),
  ('Stephen', 'Sinclair');

INSERT INTO movieperson
(personid, movieid, roleid)
VALUES
  (621, 6, 3),
  (621, 7, 3),
  (622, 7, 3);