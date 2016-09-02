INSERT INTO movie
(
  name,
  releasedate,
  storyline,
  runtime,
  aspectratio)
VALUES
  ('The Good, the Bad and the Ugly',
   '1967-12-29',
  'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.',
  161,
  '2.35 : 1');

INSERT INTO person
(firstname, lastname) VALUES
  ('Eli','Wallach'),
  ('Cllint','Eastwood'),
  ('Lee','Van Cleef');

INSERT INTO movieperson
(personid, movieid, roleid) VALUES
  (90, 3, 1), (91, 3, 1), (92, 3, 1);

INSERT INTO movieperson
(personid, movieid, roleid) VALUES
  (88, 2, 1), (89, 2, 1);

SELECT * FROM person WHERE personid < 88;

SELECT * FROM person;

INSERT INTO movieperson (personid, movieid, roleid)
    SELECT personid, '1', '1'
FROM person WHERE personid < 88;