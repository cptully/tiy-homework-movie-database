SELECT m.name, m.releasedate, m.runtime, g.genrename
FROM movie AS m
  JOIN moviegenre as mg
  ON m.movieid = mg.movieid
  JOIN genre AS g
  ON mg.genreid = g.genreid
WHERE name NOT LIKE '%Shawshank%';