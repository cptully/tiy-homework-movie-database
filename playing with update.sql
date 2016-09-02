-- add altname column to movie table
ALTER TABLE public.movie ADD altname VARCHAR(255) NULL;

-- add an altname for one movie
UPDATE movie
SET altname = 'Star Wars: Episode VII - The Force Awakens'
WHERE name = 'Star Wars: The Force Awakens';

-- set altname for all other movies to name
UPDATE movie
SET altname = name
WHERE altname IS NULL;

-- list movies ordered by altname
SELECT *
FROM movie
ORDER BY altname;

-- reset altname to null if it is not different from name
UPDATE movie
SET altname = NULL
WHERE altname = name;