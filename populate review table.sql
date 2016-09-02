-- populate the review table
INSERT INTO review
(title, url) VALUES
  ('LORD OF THE RINGS: THE RETURN OF THE KING', 'http://www.rogerebert.com/reviews/lord-of-the-rings-the-return-of-the-king-2003'),
  ('The Lord of the Rings: The Return of the King is the best movie of the year, and I have the numb butt to prove it.', 'http://www.imdb.com/reviews/0167260'),
  ('THE EMPIRE STRIKES BACK', 'http://www.rogerebert.com/reviews/the-empire-strikes-back-1997'),
  ('The Empire Strikes Back','http://www.washingtonpost.com/wp-srv/style/longterm/movies/review97/empirestrikesbackmartin.htm'),
  ('THE SHAWSHANK REDEMPTION', 'http://www.rogerebert.com/reviews/the-shawshank-redemption-1994'),
  ('The Shawshank Redemption', 'http://www.rollingstone.com/movies/reviews/the-shawshank-redemption-19940101');

INSERT INTO publisher
(name, url) VALUES
  ('Roger Ebert', 'http://www.rogerebert.com'),
  ('Washington Post', 'http://www.washingtonpost.com'),
  ('Internet Movie Database', 'http://www.imdb.com'),
  ('Rolling Stone', 'http://www.rollingstone.com');

INSERT INTO person
(firstname, lastname) VALUES
  ('Peter', 'Travers');

INSERT INTO personreview
(personid, reviewid) VALUES
  (105, 7),
  (106, 2),
  (106, 4),
  (106, 6),
  (108, 3),
  (107, 5);

INSERT INTO person
(firstname, lastname) VALUES
  ('Roger', 'Ebert'),
  ('Judith', 'Martin'),
  ('Keith', 'Simanton');