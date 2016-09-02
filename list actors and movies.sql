SELECT m.name, m.releasedate, m.runtime, p.firstname, p.lastname
FROM movie AS m
  JOIN movieperson AS mp
    ON m.movieid = mp.movieid
  JOIN person AS p
    ON mp.personid = p.personid
WHERE name NOT LIKE '%Shawshank%';