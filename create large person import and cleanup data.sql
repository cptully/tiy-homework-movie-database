SELECT m.name, m.releasedate, m.runtime, g.genrename
FROM movie AS m
  JOIN moviegenre as mg
  ON m.movieid = mg.movieid
  JOIN genre AS g
  ON mg.genreid = g.genreid
WHERE name NOT LIKE '%Shawshank%';

SELECT m.name, m.releasedate, m.runtime, p.firstname, p.lastname
FROM movie AS m
  JOIN movieperson AS mp
    ON m.movieid = mp.movieid
  JOIN person AS p
    ON mp.personid = p.personid
WHERE name NOT LIKE '%Shawshank%';

-- sample code for reference
-- SELECT p.personid, count(pa.addressid) as addresscount
-- FROM person as p JOIN personaddress as pa
--     ON p.personid = pa.personid
-- GROUP BY p.personid
-- HAVING count(pa.addressid) > 1

-- create first of two cleanup tables
CREATE TABLE public.cleanup
(
  id SERIAL PRIMARY KEY NOT NULL,
  role VARCHAR(255) NOT NULL
);
CREATE UNIQUE INDEX cleanup_id_uindex ON public.cleanup (id);

-- test condensing the list with count
SELECT role, count(role)
FROM cleanup
GROUP BY role;

-- create send cleanup table
CREATE TABLE public.cleanup2
(
  id SERIAL PRIMARY KEY NOT NULL,
  role VARCHAR(255) NOT NULL
);
CREATE UNIQUE INDEX cleanup2_id_uindex ON public.cleanup2 (id);

-- add a forgotten column to the second cleanup table
ALTER TABLE public.cleanup2 ADD number INT;

-- insert the deduplicated list to cleanup2
INSERT INTO cleanup2
  (role, number)
SELECT role, count(role)
FROM cleanup
GROUP BY role;

-- add deduplicated names to role table
INSERT INTO role
(rolename)
  SELECT role
  FROM cleanup2; -- fails because rolename in role table is too small

-- increase the size of rolename
ALTER TABLE public.role ALTER COLUMN rolename TYPE VARCHAR(100) USING rolename::VARCHAR(100);

-- try again
INSERT INTO role
(rolename)
  SELECT role
  FROM cleanup2;

-- role table updated with new roles

-- create temporary person2 table
CREATE TABLE public.person2
(
  id SERIAL PRIMARY KEY NOT NULL,
  firstname VARCHAR(100) NOT NULL,
  lastname VARCHAR(100) NOT NULL,
  role VARCHAR(255) NOT NULL
);

-- populate person2 with names from web
INSERT INTO person2
(firstname, lastname, role) VALUES
  ('Elizabeth','McBride','Makeup Department'),
  ('Roy','Bryson','hair stylist'),
  ('Jeni Lee','Dinkel','makeup artist'),
  ('Kevin','Haney','key makeup artist'),
  ('Philip','Ivey','key hair stylist'),
  ('Pamela','Priest','hair stylist'),
  ('Monty','Westmore','makeup artist Production Management'),
  ('Kokayi','Ampah','production supervisor'),
  ('David V.','Lester','unit production manager'),
  ('Sue Bea','Montgomery','production supervisor Second Unit Director or Assistant Director'),
  ('Michael','Greenwood','second second assistant director'),
  ('Thomas','Schellenberg','key second assistant director'),
  ('John R.','Woodward','first assistant director'),
  ('Jesse V.','Johnson','third assistant director Art Department'),
  ('Peter','Allen','paint foreman'),
  ('Lee Lee','Baird','on-set dresser'),
  ('Bob','Baker','decorating consultant'),
  ('John','Barbera','labor gang boss'),
  ('Earl F.','Betts','propmaker foreman'),
  ('Glen','Blanton','plasterer'),
  ('Jack','Evans','assistant art director'),
  ('Barrett','Fleetwood','labor foreman'),
  ('Susan','Fraley','set estimator'),
  ('Blair','Gibeau','painter'),
  ('Chad','Goodrich','propmaker gang boss'),
  ('Antoinette J.','Gordon','senior set designer'),
  ('Kelley A.','Hankins','painter'),
  ('Carey','Harris Jr.','propman'),
  ('Todd','Hatfield','stand-by painter'),
  ('James','Hawthorne','paint gang boss'),
  ('Robert','Hawthorne','paint gang boss'),
  ('Jim','Henry','propshop foreman'),
  ('Jack','Hering','set dresser'),
  ('John M.','Heuberger','set dresser'),
  ('Joseph A.','Hodges','set designer'),
  ('Alba','Leone','lead person'),
  ('Sebastian','Milito','construction coordinator'),
  ('Scott','Mizgaites','propmaker gang boss'),
  ('Christopher','Neely','set dresser'),
  ('Isidoro','Raponi','propshop foreman'),
  ('Tom','Shaw Jr.','property master'),
  ('Dixwell','Stillman','construction foreman'),
  ('Pete','von Sholly','storyboard consultant'),
  ('Paul','Wells','key carpenter'),
  ('Rhonda','Yeater','art department assistant'),
  ('John','Alvin','poster artist'),
  ('Jim','Heastings','carpenter'),
  ('Brent','Peelor','carpenter Sound Department'),
  ('Petra','Bach','adr supervisor'),
  ('Kevin','Bartnof','foley artist'),
  ('David','Behle','mixing recordist'),
  ('Bruce','Bell','sound editor'),
  ('Mike','Boudry','additional adr recordist'),
  ('Kevin','Boyd','cable person'),
  ('Willie D.','Burton','production sound mixer'),
  ('Rick','Canelli','adr recordist'),
  ('Michael J.','Cerone','additional adr recordist'),
  ('Jeff','Clark','sound editor'),
  ('Zack','Davis','sound editor'),
  ('Marilyn','Graf','foley mixer'),
  ('Ron','Grafton','foley recordist'),
  ('Michael','Herbick','re-recording mixer'),
  ('Ellen','Heuer','foley artist'),
  ('Shelley Rae','Hinton','adr editor'),
  ('Dale','Johnston','sound editor'),
  ('Doc','Kane','additional adr mixer'),
  ('Jack','Keller','mixing recordist'),
  ('Larry','Lester','sound editor'),
  ('Marvin E.','Lewis','boom operator'),
  ('Robert J.','Litt','re-recording mixer'),
  ('William L.','Manger','sound editor'),
  ('Lori','Martino','assistant sound editor'),
  ('Thomas J.','O''Connell','adr mixer'),
  ('Richard','Oswald','sound editor'),
  ('Janelle','Showalter','assistant sound editor'),
  ('John','Stacy','supervising sound editor'),
  ('Elliot','Tyson','re-recording mixer'),
  ('Robert','Ulrich','adr editor'),
  ('Bill','Weinman','assistant sound editor'),
  ('Paul J.','Zydel','additional adr mixer'),
  ('Vanessa','Theme Ament','foley artist'),
  ('Jim','Emswiller','temp boom operator'),
  ('Mary Jo','Lang','foley mixer'),
  ('John','Roesch','foley artist'),
  ('Donald C.','Rogers','technical director of sound'),
  ('John','Soukup','recordist'),
  ('Carolyn','Tapp','foley recordist Special Effects by'),
  ('Bob','Williams','special effects Visual Effects by'),
  ('Melissa','Taylor','visual effects producer Stunts'),
  ('Daniel W.','Barringer','stunts'),
  ('Fred','Culbertson','stunts'),
  ('Jerry','Gatlin','stunt coordinator'),
  ('Mickey','Guinn','stunts'),
  ('Dick','Hancock','stunts'),
  ('A. Michael','Lerner','stunts'),
  ('Tom','Morga','stunts'),
  ('Ben','Scott','stunts'),
  ('Tom','Morga','stunt double: Tim Robbins Camera and Electrical Department'),
  ('Tim L.','Amstutz','lighting stand-in'),
  ('John','Archibald','second rigging grip'),
  ('Robin','Brown','first assistant camera'),
  ('Rex','Buckingham','rigging grip'),
  ('Keith','Bunting','best boy grip'),
  ('James J.','Burke','lighting stand-in'),
  ('Brian ''Buzz''','Buzzelli','grip'),
  ('Don','Cerrone','key grip'),
  ('Jorgen','Christenen','rigging grip'),
  ('Tony','Corapi','rigging best boy'),
  ('Gerrit','Dangremond','Steadicam operator'),
  ('Eugene C.','DePasquale','grip'),
  ('Richie','Ford','rigging gaffer'),
  ('Max','Gerber','lighting stand-in'),
  ('David','Gilby','lighting stand-in'),
  ('James P.','Gribbins','electric rigger'),
  ('Thomas','Guidugli','grip'),
  ('Bruce','Hamme','dolly grip'),
  ('Dexter','Hammett','lighting stand-in'),
  ('Jim','Harrington','grip'),
  ('Andy','Harris','second assistant camera'),
  ('William','Kingsley','lamp operator'),
  ('Jeremy','Knaster','best boy electric'),
  ('John ''Quincy''','Koenig','lamp operator'),
  ('Bobby','Mancuso','second assistant camera'),
  ('Bill','Martin','lighting stand-in'),
  ('Ken','McCahan','grip'),
  ('Russ','Milner','grip'),
  ('William','Moore','lamp operator'),
  ('William R.','Nielsen Jr.','second assistant camera'),
  ('Hope A.','Nielsen','film loader'),
  ('Bill','O''Leary','gaffer'),
  ('Charles','Quinlivan','rigging grip'),
  ('Judy','Scarboro','video assistant'),
  ('Van','Scarboro','video assist operator'),
  ('Joseph','Short','electric rigger'),
  ('Jon','Stinehour','lighting stand-in'),
  ('Eric','Swanek','first assistant camera'),
  ('Ruben','Turner','lamp operator'),
  ('Michael P.','Weinstein','still photographer'),
  ('Robert','Bender','rigging electrician'),
  ('Pat','Dames','grip'),
  ('Kurt Dale','Hartman','electrician'),
  ('David','Moenkhaus','additional second assistant camera'),
  ('Jon D.','Morrison','rigging electrician'),
  ('Brian','Powers','rigging electrician'),
  ('Eric','Swanek','steadicam assistant Casting Department'),
  ('Barbara','Harris','adr voice casting'),
  ('D. Lynn','Meyers','casting: Ohio'),
  ('Adam','Moyer','background casting intern'),
  ('Brent','Scarpo','background casting assistant'),
  ('Ivy','Weiss','background casting'),
  ('Julie','Weiss','casting assistant'),
  ('Linda','Weaver','extras casting assistant Costume and Wardrobe Department'),
  ('Cookie','Beard','wardrobe assistant'),
  ('Carol','Buckler','seamstress'),
  ('Kris','Kearney','key costumer'),
  ('Taneia','Lednicky','wardrobe supervisor'),
  ('Donnie','McFinely','costumer'),
  ('Eva','Prappas','costumer'),
  ('Mira','Zavidowsky','key costumer Editorial Department'),
  ('Jeff','Canavan','apprentice editor'),
  ('Patricia A.','Galvin','first assistant editor'),
  ('David Leslie','Johnson','production assistant'),
  ('Robert C.','Lusted','second assistant editor'),
  ('David','Orr','color timer'),
  ('Keith','Shaw','colorist: mastering Location Management'),
  ('Kokayi','Ampah','location manager'),
  ('Chris','Cozzi','location assistant'),
  ('Scott','Stahler','location assistant Music Department'),
  ('Bill','Bernstein','music editor'),
  ('Julian','Bratolyubov','music preparation'),
  ('Jim','Makiej','assistant music editor'),
  ('Leslie','Morris','music contractor'),
  ('Thomas','Pasatieri','orchestrator'),
  ('Dennis S.','Sands','music scoring mixer'),
  ('Bob','Bornstein','music copyist'),
  ('Tom','Boyd','musician: oboe soloist'),
  ('Bruce','Dukov','concertmaster'),
  ('Arlene','Fishbach','music consultant'),
  ('Dan','Goldwasser','executive music producer'),
  ('Mark','Graham','music copyist'),
  ('Frank','Macchia','music preparation'),
  ('Tommy','Morgan','musician: harmonica'),
  ('Kathy','Nelson','executive music producer'),
  ('Thomas','Newman','conductor'),
  ('Chas','Smith','exotic instruments'),
  ('Steven L.','Smith','music preparation'),
  ('James','Thatcher','musician: French horn Transportation Department'),
  ('Robert','Conrad','driver'),
  ('Fred','Culbertson','transportation captain'),
  ('William','Culbertson','driver'),
  ('William P.','Davis','driver'),
  ('Chick','Elwell','driver'),
  ('Dick','Furr','driver'),
  ('Harold','Garnsey','driver'),
  ('Sally','Givens','driver'),
  ('James','Graham','driver'),
  ('Ray','Greene','driver'),
  ('Mickey','Guinn','driver'),
  ('Ronald','Hogle','driver'),
  ('Neil','Knoff','driver'),
  ('David','Marder','transportation coordinator'),
  ('Roland','Maurer','driver'),
  ('Douglas','Miller','driver'),
  ('Gary','Mishey','driver'),
  ('Glen','Murphy','driver'),
  ('Ken','Nevin','driver'),
  ('Tom','Park','driver'),
  ('Chuck','Ramsey','driver'),
  ('Judith','Reed','driver'),
  ('Scott','Ruetenik','driver'),
  ('David','Smith','driver'),
  ('Donald','Snyder','driver'),
  ('J.D.','Thomas','driver'),
  ('David','Turner','driver'),
  ('Chip','Vincent','driver'),
  ('Mario','Simon','picture car coordinator Other crew'),
  ('Therese','Amadio','additional animal wrangler'),
  ('Kelley','Baker','accounting assistant'),
  ('Robert C.','Barnett','assistant: Frank Darabont'),
  ('Brian','Boggs','craft service'),
  ('Richard Brooks','Burton','gyrosphere assistant'),
  ('Tom','Cotter','assistant: Tim Robbins'),
  ('James','Ellis','script supervisor'),
  ('Jane','Estocin','assistant production accountant'),
  ('Alfonso','Freeman','assistant: Morgan Freeman'),
  ('Carlos','Garcia','caterer'),
  ('Edward A.','Gutentag','gyrosphere assistant'),
  ('Scott E.','Hart','animal trainer'),
  ('Beth','Hickman','production office coordinator'),
  ('Anne','Hilbert','office assistant'),
  ('Jesse E.','Johnson','set production assistant'),
  ('Michael','Kelem','gyrosphere operator'),
  ('Jose','Lopez','caterer'),
  ('Ernie','Malik','unit publicist'),
  ('Frank','McKeon','first aid'),
  ('David','McQuade','set production assistant'),
  ('Karin','Mercurio','accounting assistant'),
  ('Mark','Moelter','craft service'),
  ('Margaret J.','Orlando','assistant office coordinator'),
  ('Sioux','Richards','script supervisor'),
  ('Joe','Schultz','caterer'),
  ('Don','Speakman','craft service'),
  ('Ramona','Sánchez-Waggoner','production accountant'),
  ('Amie','Tschappat','office intern'),
  ('Michael','Vasquez','accounting assistant'),
  ('Sophia','Xixis','assistant: Niki Marvin'),
  ('Robert ''Bobby Z''','Zajonc','helicopter pilot'),
  ('Michel','Burstein','press attache: France'),
  ('Saxon','Eldridge','production assistant'),
  ('Alan','Jacques','projectionist'),
  ('Tom','Lent','adr voice'),
  ('Robert ''Bobby Z''','Zajonc','aerial coordinator Thanks'),
  ('Dennis','Baker','thanks: Warden of The Mansfield Correctional Institution'),
  ('Manny','Centeno','thanks: Director of the U.S. Virgin Islands Film Commission'),
  ('Allen','Greene','in memory of'),
  ('Richard','Hall','thanks: assistant to the Warden of The Mansfield Correctional Institution'),
  ('Stephen','King','special thanks'),
  ('Eve','Lapolla','thanks: Ohio Film Commission'),
  ('Lee','Tasseff','thanks: Mansfield Convention & Visitors Bureau');

-- add forgotten column to person2
ALTER TABLE public.person2 ADD roleid INT NULL;

-- create temporary movieperson2 for testing
CREATE TABLE public.movieperson2
(
  movieperson2id SERIAL PRIMARY KEY NOT NULL,
  movieid INT NOT NULL,
  personid INT NOT NULL,
  roleid INT NOT NULL
);
CREATE UNIQUE INDEX movieperson2_movieperson2id_uindex ON public.movieperson2 (movieperson2id);

-- create temporary person3 table
CREATE TABLE public.person3
(
  id SERIAL PRIMARY KEY NOT NULL,
  firstname VARCHAR(100),
  lastname VARCHAR(100),
  role VARCHAR(255),
  roleid int
);
CREATE UNIQUE INDEX person3_id_uindex ON public.person3 (id);

-- build person3 will all data because I could
-- not figure out how to add roleid data to my person2 table
INSERT INTO person3
(firstname, lastname, role, roleid)
SELECT p.firstname, p.lastname, p.role, r.roleid
FROM role as r
JOIN person2 as p
  ON p.role = r.rolename;

-- drop person2 since it is no longer relevant
DROP TABLE person2;

-- locate duplicate people in person3
SELECT  *
FROM    (
  SELECT  person3.*, ROW_NUMBER() OVER (PARTITION BY firstname, lastname ORDER BY id) AS rn
  FROM    person3
) AS test
WHERE   rn > 1;

-- non-duplicated names from person3
SELECT  *
FROM    (
          SELECT  person3.*, ROW_NUMBER() OVER (PARTITION BY firstname, lastname ORDER BY id) AS rn
          FROM    person3
        ) AS test
WHERE   rn = 1;

-- add non-duplicate names to person
INSERT INTO person
(firstname, lastname)
SELECT test.firstname, test.lastname
FROM    (SELECT  person3.*, ROW_NUMBER() OVER (PARTITION BY firstname, lastname ORDER BY id) AS rn
          FROM    person3
        ) AS test
WHERE   rn = 1;

--check person for duplicates
SELECT  *
FROM    (
          SELECT  person.*, ROW_NUMBER() OVER (PARTITION BY firstname, lastname ORDER BY personid) AS rn
          FROM    person
        ) AS test
WHERE   rn > 1;

--populate movieperson table
INSERT INTO movieperson (movieid, personid, roleid)
SELECT 1, p.personid, p3.roleid
FROM person as p
JOIN person3 as p3
  ON p.firstname = p3.firstname AND p.lastname = p3.lastname;


--check person for duplicates
SELECT  *
FROM    (
          SELECT  person.*, ROW_NUMBER() OVER (PARTITION BY firstname, lastname ORDER BY personid) AS rn
          FROM    person
        ) AS test
WHERE   rn > 1;

-- cleanup person table
SELECT *
FROM person
WHERE firstname = 'Alfonso' AND lastname = 'Freeman';

-- fixing duplicates in person table
SELECT *
FROM movieperson
WHERE personid in (25, 372);

DELETE FROM person
WHERE personid = 372;

--check person for duplicates
SELECT  *
FROM    (
          SELECT  person.*, ROW_NUMBER() OVER (PARTITION BY firstname, lastname ORDER BY personid) AS rn
          FROM    person
        ) AS test
WHERE   rn > 1;

-- cleanup person table
SELECT *
FROM person
WHERE firstname = 'David V.' AND lastname = 'Lester';

-- fixing duplicates in person table
DELETE FROM movieperson
WHERE personid = 426 AND moviepersonid = 178;

DELETE FROM person
WHERE personid = 426;

--check person for duplicates
SELECT  *
FROM    (
          SELECT  person.*, ROW_NUMBER() OVER (PARTITION BY firstname, lastname ORDER BY personid) AS rn
          FROM    person
        ) AS test
WHERE   rn > 1;

-- cleanup person table
SELECT *
FROM person
WHERE firstname = 'Dennis' AND lastname = 'Baker';

SELECT *
FROM movieperson
WHERE personid = 62 OR moviepersonid = 62 OR personid = 427 or moviepersonid = 427;

-- fixing duplicates in person table
DELETE FROM movieperson
WHERE personid = 427 AND moviepersonid = 179;

DELETE FROM person
WHERE personid = 427;

--check person for duplicates
SELECT  *
FROM    (
          SELECT  person.*, ROW_NUMBER() OVER (PARTITION BY firstname, lastname ORDER BY personid) AS rn
          FROM    person
        ) AS test
WHERE   rn > 1;

-- cleanup person table
SELECT *
FROM person
WHERE firstname = 'Eugene C.' AND lastname = 'DePasquale';

SELECT *
FROM movieperson
WHERE personid = 46 OR personid = 447;

DELETE FROM movieperson
WHERE personid = 447;

DELETE FROM person
WHERE personid = 447;

--check person for duplicates
SELECT  *
FROM    (
          SELECT  person.*, ROW_NUMBER() OVER (PARTITION BY firstname, lastname ORDER BY personid) AS rn
          FROM    person
        ) AS test
WHERE   rn > 1;

-- cleanup person table
SELECT *
FROM person
WHERE firstname = 'Fred' AND lastname = 'Culbertson';

SELECT *
FROM movieperson
WHERE personid = 63 OR personid = 452;

DELETE FROM movieperson
WHERE personid = 452;

DELETE FROM person
WHERE personid = 452;

--check person for duplicates
SELECT  *
FROM    (
          SELECT  person.*, ROW_NUMBER() OVER (PARTITION BY firstname, lastname ORDER BY personid) AS rn
          FROM    person
        ) AS test
WHERE   rn > 1;

-- cleanup person table
SELECT *
FROM person
WHERE firstname = 'Thomas' AND lastname = 'Newman';

SELECT *
FROM movieperson
WHERE personid = 79 OR personid = 597;

DELETE FROM movieperson
WHERE personid = 597;

DELETE FROM person
WHERE personid = 597;

--check person for duplicates
SELECT  *
FROM    (
          SELECT  person.*, ROW_NUMBER() OVER (PARTITION BY firstname, lastname ORDER BY personid) AS rn
          FROM    person
        ) AS test
WHERE   rn = 1;

-- clean up scratch tables
DROP TABLE cleanup, cleanup2;
DROP TABLE movieperson2, person3;