-- insert Lord of the rings movie
INSERT INTO movie
  (name,
  releasedate,
  storyline,
  runtime,
  aspectratio)
VALUES
  ('The Lord of the Rings: The Return of the King',
   '2003-12-17',
   'While Frodo & Sam continue to approach Mount Doom to destroy the One Ring, unaware of the path Gollum is leading them, the former Fellowship aid Rohan & Gondor in a great battle in the Pelennor Fields, Minas Tirith and the Black Gates as Sauron wages his last war against Middle-earth.',
   201,
   '2.35 : 1');

-- people from lord of the rings
INSERT INTO person
  (firstname, lastname)
VALUES
  ('Peter', 'Jackson'),
  ('J.R.R.', 'Tolkien'),
  ('Fran', 'Walsh'),
  ('Elijah', 'Wood'),
  ('Viggo', 'Mortensen'),
  ('Ian', 'McKellen');

INSERT INTO movieperson
(personid, movieid, roleid)
VALUES
  (99, 5, 2);

INSERT INTO movieperson
  (personid, movieid, roleid)
SELECT personid, 5, 3
FROM person
WHERE personid > 98 AND personid < 102;

INSERT INTO movieperson
  (personid, movieid, roleid)
SELECT personid, 5, 1
FROM person
WHERE personid > 101;
