--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: company; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE company (
    companyid integer NOT NULL,
    name character varying(100)
);


ALTER TABLE company OWNER TO chris;

--
-- Name: company_companyid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE company_companyid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company_companyid_seq OWNER TO chris;

--
-- Name: company_companyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE company_companyid_seq OWNED BY company.companyid;


--
-- Name: companyrole; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE companyrole (
    companyroleid integer NOT NULL,
    role character varying(20) NOT NULL
);


ALTER TABLE companyrole OWNER TO chris;

--
-- Name: companyrole_companyroleid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE companyrole_companyroleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE companyrole_companyroleid_seq OWNER TO chris;

--
-- Name: companyrole_companyroleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE companyrole_companyroleid_seq OWNED BY companyrole.companyroleid;


--
-- Name: genre; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE genre (
    genreid integer NOT NULL,
    genrename character varying(20)
);


ALTER TABLE genre OWNER TO chris;

--
-- Name: genre_genreid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE genre_genreid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genre_genreid_seq OWNER TO chris;

--
-- Name: genre_genreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE genre_genreid_seq OWNED BY genre.genreid;


--
-- Name: movie; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE movie (
    movieid integer NOT NULL,
    name character varying(255) NOT NULL,
    releasedate date NOT NULL,
    storyline text,
    runtime integer,
    aspectratio character varying(10)
);


ALTER TABLE movie OWNER TO chris;

--
-- Name: moviecompany; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE moviecompany (
    moviecompanyid integer NOT NULL,
    movieid integer NOT NULL,
    companyid integer NOT NULL,
    companyroleid integer NOT NULL
);


ALTER TABLE moviecompany OWNER TO chris;

--
-- Name: moviecompany_moviecompanyid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE moviecompany_moviecompanyid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moviecompany_moviecompanyid_seq OWNER TO chris;

--
-- Name: moviecompany_moviecompanyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE moviecompany_moviecompanyid_seq OWNED BY moviecompany.moviecompanyid;


--
-- Name: moviegenre; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE moviegenre (
    moviegenreid integer NOT NULL,
    movieid integer,
    genreid integer
);


ALTER TABLE moviegenre OWNER TO chris;

--
-- Name: moviegenre_moviegenreid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE moviegenre_moviegenreid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moviegenre_moviegenreid_seq OWNER TO chris;

--
-- Name: moviegenre_moviegenreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE moviegenre_moviegenreid_seq OWNED BY moviegenre.moviegenreid;


--
-- Name: movieperson; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE movieperson (
    personid integer NOT NULL,
    movieid integer NOT NULL,
    moviepersonid integer NOT NULL,
    roleid integer NOT NULL
);


ALTER TABLE movieperson OWNER TO chris;

--
-- Name: movieperson_moviepersonid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE movieperson_moviepersonid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movieperson_moviepersonid_seq OWNER TO chris;

--
-- Name: movieperson_moviepersonid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE movieperson_moviepersonid_seq OWNED BY movieperson.moviepersonid;


--
-- Name: moviereview; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE moviereview (
    moviereviewid integer NOT NULL,
    movieid integer NOT NULL,
    reviewid integer NOT NULL
);


ALTER TABLE moviereview OWNER TO chris;

--
-- Name: moviereview_moviereviewid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE moviereview_moviereviewid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moviereview_moviereviewid_seq OWNER TO chris;

--
-- Name: moviereview_moviereviewid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE moviereview_moviereviewid_seq OWNED BY moviereview.moviereviewid;


--
-- Name: movies_movieid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE movies_movieid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movies_movieid_seq OWNER TO chris;

--
-- Name: movies_movieid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE movies_movieid_seq OWNED BY movie.movieid;


--
-- Name: person; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE person (
    personid integer NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(100) NOT NULL,
    altfirstname character varying(100),
    altlastname character varying(100)
);


ALTER TABLE person OWNER TO chris;

--
-- Name: person_personid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE person_personid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_personid_seq OWNER TO chris;

--
-- Name: person_personid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE person_personid_seq OWNED BY person.personid;


--
-- Name: personreview; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE personreview (
    personreviewid integer NOT NULL,
    personid integer NOT NULL,
    reviewid integer NOT NULL
);


ALTER TABLE personreview OWNER TO chris;

--
-- Name: personreview_personreviewid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE personreview_personreviewid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personreview_personreviewid_seq OWNER TO chris;

--
-- Name: personreview_personreviewid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE personreview_personreviewid_seq OWNED BY personreview.personreviewid;


--
-- Name: personrole_personroleid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE personrole_personroleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personrole_personroleid_seq OWNER TO chris;

--
-- Name: publisher; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE publisher (
    publisherid integer NOT NULL,
    name character varying(100),
    url character varying(100)
);


ALTER TABLE publisher OWNER TO chris;

--
-- Name: publisher_publisherid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE publisher_publisherid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE publisher_publisherid_seq OWNER TO chris;

--
-- Name: publisher_publisherid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE publisher_publisherid_seq OWNED BY publisher.publisherid;


--
-- Name: review; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE review (
    reviewid integer NOT NULL,
    title character varying(255) NOT NULL,
    url character varying(512)
);


ALTER TABLE review OWNER TO chris;

--
-- Name: review_reviewid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE review_reviewid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE review_reviewid_seq OWNER TO chris;

--
-- Name: review_reviewid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE review_reviewid_seq OWNED BY review.reviewid;


--
-- Name: reviewpublisher; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE reviewpublisher (
    reviewpublisherid integer NOT NULL,
    reviewid integer NOT NULL,
    publisherid integer NOT NULL
);


ALTER TABLE reviewpublisher OWNER TO chris;

--
-- Name: reviewpublisher_reviewpublisherid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE reviewpublisher_reviewpublisherid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviewpublisher_reviewpublisherid_seq OWNER TO chris;

--
-- Name: reviewpublisher_reviewpublisherid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE reviewpublisher_reviewpublisherid_seq OWNED BY reviewpublisher.reviewpublisherid;


--
-- Name: role; Type: TABLE; Schema: public; Owner: chris
--

CREATE TABLE role (
    roleid integer NOT NULL,
    rolename character varying(50) NOT NULL
);


ALTER TABLE role OWNER TO chris;

--
-- Name: role_roleid_seq; Type: SEQUENCE; Schema: public; Owner: chris
--

CREATE SEQUENCE role_roleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_roleid_seq OWNER TO chris;

--
-- Name: role_roleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chris
--

ALTER SEQUENCE role_roleid_seq OWNED BY role.roleid;


--
-- Name: companyid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY company ALTER COLUMN companyid SET DEFAULT nextval('company_companyid_seq'::regclass);


--
-- Name: companyroleid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY companyrole ALTER COLUMN companyroleid SET DEFAULT nextval('companyrole_companyroleid_seq'::regclass);


--
-- Name: genreid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY genre ALTER COLUMN genreid SET DEFAULT nextval('genre_genreid_seq'::regclass);


--
-- Name: movieid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY movie ALTER COLUMN movieid SET DEFAULT nextval('movies_movieid_seq'::regclass);


--
-- Name: moviecompanyid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviecompany ALTER COLUMN moviecompanyid SET DEFAULT nextval('moviecompany_moviecompanyid_seq'::regclass);


--
-- Name: moviegenreid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviegenre ALTER COLUMN moviegenreid SET DEFAULT nextval('moviegenre_moviegenreid_seq'::regclass);


--
-- Name: moviepersonid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY movieperson ALTER COLUMN moviepersonid SET DEFAULT nextval('movieperson_moviepersonid_seq'::regclass);


--
-- Name: moviereviewid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviereview ALTER COLUMN moviereviewid SET DEFAULT nextval('moviereview_moviereviewid_seq'::regclass);


--
-- Name: personid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY person ALTER COLUMN personid SET DEFAULT nextval('person_personid_seq'::regclass);


--
-- Name: personreviewid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY personreview ALTER COLUMN personreviewid SET DEFAULT nextval('personreview_personreviewid_seq'::regclass);


--
-- Name: publisherid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY publisher ALTER COLUMN publisherid SET DEFAULT nextval('publisher_publisherid_seq'::regclass);


--
-- Name: reviewid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY review ALTER COLUMN reviewid SET DEFAULT nextval('review_reviewid_seq'::regclass);


--
-- Name: reviewpublisherid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY reviewpublisher ALTER COLUMN reviewpublisherid SET DEFAULT nextval('reviewpublisher_reviewpublisherid_seq'::regclass);


--
-- Name: roleid; Type: DEFAULT; Schema: public; Owner: chris
--

ALTER TABLE ONLY role ALTER COLUMN roleid SET DEFAULT nextval('role_roleid_seq'::regclass);


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY company (companyid, name) FROM stdin;
1	Castle Rock Entertainment
4	Warner Bros. Pictures
3	Special Effects Unlimited
2	Motion Pixel Corporation
5	Village Roadshow Pictures
\.


--
-- Name: company_companyid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('company_companyid_seq', 5, true);


--
-- Data for Name: companyrole; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY companyrole (companyroleid, role) FROM stdin;
1	Production
2	Special Effects
\.


--
-- Name: companyrole_companyroleid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('companyrole_companyroleid_seq', 2, true);


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY genre (genreid, genrename) FROM stdin;
1	Crime\n
2	Drama
3	Comedy\n\n
4	Action
5	Thriller
6	Romance
7	War
8	Spy
9	Fantasy
10	Cartoon
11	Family
12	Western
13	SciFi
14	Adventure
\.


--
-- Name: genre_genreid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('genre_genreid_seq', 14, true);


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY movie (movieid, name, releasedate, storyline, runtime, aspectratio) FROM stdin;
1	The Shawshank Redemption	2016-10-14	Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.	142	1.85 : 1
2	Mad Max: Fury Road	2015-05-15	A woman rebels against a tyrannical ruler in postapocalyptic Australia in search for her homeland with the help of a group of female prisoners, a psychotic worshipper, and a drifter named Max.	120	2.35 : 1
3	The Good, the Bad and the Ugly	1967-12-29	A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.	161	2.35 : 1
4	Star Wars: Episode V - The Empire Strikes Back	1980-06-20	After the rebels have been brutally overpowered by the Empire on their newly established base, Luke Skywalker takes advanced Jedi training with Master Yoda, while his friends are pursued by Darth Vader as part of his plan to capture Luke.	124	2.35 : 1
5	The Lord of the Rings: The Return of the King	2003-12-17	While Frodo & Sam continue to approach Mount Doom to destroy the One Ring, unaware of the path Gollum is leading them, the former Fellowship aid Rohan & Gondor in a great battle in the Pelennor Fields, Minas Tirith and the Black Gates as Sauron wages his last war against Middle-earth.	201	2.35 : 1
\.


--
-- Data for Name: moviecompany; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY moviecompany (moviecompanyid, movieid, companyid, companyroleid) FROM stdin;
1	1	1	1
2	1	2	2
3	1	3	2
4	2	4	1
5	2	5	1
\.


--
-- Name: moviecompany_moviecompanyid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('moviecompany_moviecompanyid_seq', 5, true);


--
-- Data for Name: moviegenre; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY moviegenre (moviegenreid, movieid, genreid) FROM stdin;
1	1	1
2	1	2
3	2	4
4	2	5
5	3	12
6	3	1
7	3	2
8	4	13
9	4	1
10	5	9
11	5	14
12	5	7
\.


--
-- Name: moviegenre_moviegenreid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('moviegenre_moviegenreid_seq', 24, true);


--
-- Data for Name: movieperson; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY movieperson (personid, movieid, moviepersonid, roleid) FROM stdin;
4	1	12	1
5	1	13	1
6	1	14	1
8	1	15	1
9	1	16	1
10	1	17	1
11	1	18	1
12	1	19	1
13	1	20	1
14	1	21	1
15	1	22	1
16	1	23	1
17	1	24	1
18	1	25	1
19	1	26	1
20	1	27	1
21	1	28	1
22	1	29	1
23	1	30	1
24	1	31	1
25	1	32	1
26	1	33	1
27	1	34	1
28	1	35	1
29	1	36	1
30	1	37	1
31	1	38	1
32	1	39	1
33	1	40	1
34	1	41	1
35	1	42	1
36	1	43	1
37	1	44	1
38	1	45	1
39	1	46	1
40	1	47	1
41	1	48	1
42	1	49	1
43	1	50	1
44	1	51	1
45	1	52	1
46	1	53	1
47	1	54	1
48	1	55	1
49	1	56	1
50	1	57	1
51	1	58	1
52	1	59	1
53	1	60	1
54	1	61	1
55	1	62	1
57	1	63	1
58	1	64	1
60	1	65	1
61	1	66	1
62	1	67	1
63	1	68	1
64	1	69	1
65	1	70	1
66	1	71	1
67	1	72	1
68	1	73	1
69	1	74	1
70	1	75	1
71	1	76	1
72	1	77	1
73	1	78	1
74	1	79	1
75	1	80	1
76	1	81	1
77	1	82	1
78	1	83	1
79	1	84	1
80	1	85	1
81	1	86	1
82	1	87	1
83	1	88	1
84	1	89	1
85	1	90	1
88	2	91	1
89	2	92	1
90	3	93	1
91	3	94	1
92	3	95	1
92	4	96	2
93	4	97	3
94	4	98	3
99	5	106	3
100	5	107	3
101	5	108	3
99	5	109	2
102	5	110	1
103	5	111	1
104	5	112	1
\.


--
-- Name: movieperson_moviepersonid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('movieperson_moviepersonid_seq', 112, true);


--
-- Data for Name: moviereview; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY moviereview (moviereviewid, movieid, reviewid) FROM stdin;
\.


--
-- Name: moviereview_moviereviewid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('moviereview_moviereviewid_seq', 1, false);


--
-- Name: movies_movieid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('movies_movieid_seq', 5, true);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY person (personid, firstname, lastname, altfirstname, altlastname) FROM stdin;
4	Tim	Robins	\N	\N
5	Morgan	Freeman	\N	\N
6	Bob	Gunton	\N	\N
8	William	Sadler	\N	\N
9	Clancy	Brown	\N	\N
10	Gil	Bellows	\N	\N
11	Mark	Rolston	\N	\N
12	James	Whitmore	\N	\N
13	Jeffery	DeMunn	\N	\N
14	Larry	Brandeburg	\N	\N
15	Niel	Giuntoli	\N	\N
16	Brian	Libby	\N	\N
17	David	Proval	\N	\N
18	Joseph	Ragno	\N	\N
19	Jude	Ciccolella	\N	\N
20	Paul	McCrane	\N	\N
21	Renee	Blaine	\N	\N
22	Scott	Mann	\N	\N
23	John	Horton	\N	\N
24	Gordon	Greene	\N	\N
25	Alfonso	Freeman	\N	\N
26	V.J.	Foster	\N	\N
27	John E.	Summers	\N	\N
28	Frank	Medrano	\N	\N
29	Mack	Miles	\N	\N
30	Alan R.	Kessler	\N	\N
31	Morgan	Lund	\N	\N
32	Cornell	Wallace	\N	\N
33	Gary Lee	Davis	\N	\N
34	Neil	Summers	\N	\N
35	Ned	Bellamy	\N	\N
36	Joe	Pecoraro	\N	\N
37	Harold E.	Cope Jr.	\N	\N
38	Brian	Delate	\N	\N
39	Don	McManus	\N	\N
40	Donald	Zinn	\N	\N
41	Dorothy	Silver	\N	\N
42	Robert	Haley	\N	\N
43	Dana	Snyder	\N	\N
44	John D.	Craig	\N	\N
45	Ken	Magee	\N	\N
46	Eugene C.	DePasquale	\N	\N
47	Bill	Bolender	\N	\N
48	Ron	Newell	\N	\N
49	John R. 	Woodard	\N	\N
50	Chuck	Brauchler	\N	\N
51	Dion	Anderson	\N	\N
52	Claire	Slemmer	\N	\N
53	James	Kisicki	\N	\N
54	Rohn	Thomas	\N	\N
55	Claire	Kearnes	\N	\N
57	Rob	Reider	\N	\N
58	Brian	Brophy	\N	\N
60	Paul	Kennedy	\N	\N
61	James	Babson	\N	\N
62	Dennis	Baker	\N	\N
63	Fred	Culbertson	\N	\N
64	Richard	Donne	\N	\N
65	Rita	Hayworth	\N	\N
66	David	Hecht	\N	\N
67	Alonzo F.	Jones	\N	\N
68	Gary	Jones	\N	\N
69	Sergio	Kato	\N	\N
70	Michael	Lightsey	\N	\N
71	Chris	Page	\N	\N
72	Brad	Pyner	\N	\N
73	Neil	Riddaway	\N	\N
74	Brad	Spencer	\N	\N
75	Jodiviah	Stepp	\N	\N
76	Liz	Glotzer	\N	\N
77	David V.	Lester	\N	\N
78	Niki	Marvin	\N	\N
79	Thomas	Newman	\N	\N
80	Roger	Deakins	\N	\N
81	Richard	Francis-Bruce	\N	\N
82	Deborah	Aquila	\N	\N
83	Terance	Marsh	\N	\N
84	Peter	Landsdown Smith	Peter	Smith
85	Michael	Seirton	Michael	Sierton
88	Tom	Hardy	\N	\N
89	Charlize	Theron	\N	\N
90	Eli	Wallach	\N	\N
91	Cllint	Eastwood	\N	\N
92	Lee	Van Cleef	\N	\N
93	Irvin	Kershner	\N	\N
94	Leigh	Brackett	\N	\N
95	Lawrence	Kasdan	\N	\N
96	Mark	Hamill	\N	\N
97	Harrison	Ford	\N	\N
98	Carrie	Fisher	\N	\N
99	Peter	Jackson	\N	\N
100	J.R.R.	Tolkien	\N	\N
101	Fran	Walsh	\N	\N
102	Elijah	Wood	\N	\N
103	Viggo	Mortensen	\N	\N
104	Ian	McKellen	\N	\N
105	Peter	Travers	\N	\N
106	Roger	Ebert	\N	\N
107	Judith	Martin	\N	\N
108	Keith	Simanton	\N	\N
\.


--
-- Name: person_personid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('person_personid_seq', 108, true);


--
-- Data for Name: personreview; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY personreview (personreviewid, personid, reviewid) FROM stdin;
1	105	7
2	106	2
3	106	4
4	106	6
5	108	3
6	107	5
\.


--
-- Name: personreview_personreviewid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('personreview_personreviewid_seq', 6, true);


--
-- Name: personrole_personroleid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('personrole_personroleid_seq', 1, false);


--
-- Data for Name: publisher; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY publisher (publisherid, name, url) FROM stdin;
1	Roger Ebert	http://www.rogerebert.com
2	Washington Post	http://www.washingtonpost.com
3	Internet Movie Database	http://www.imdb.com
4	Rolling Stone	http://www.rollingstone.com
\.


--
-- Name: publisher_publisherid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('publisher_publisherid_seq', 4, true);


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY review (reviewid, title, url) FROM stdin;
2	LORD OF THE RINGS: THE RETURN OF THE KING	http://www.rogerebert.com/reviews/lord-of-the-rings-the-return-of-the-king-2003
3	The Lord of the Rings: The Return of the King is the best movie of the year, and I have the numb butt to prove it.	http://www.imdb.com/reviews/0167260
4	THE EMPIRE STRIKES BACK	http://www.rogerebert.com/reviews/the-empire-strikes-back-1997
5	The Empire Strikes Back	http://www.washingtonpost.com/wp-srv/style/longterm/movies/review97/empirestrikesbackmartin.htm
6	THE SHAWSHANK REDEMPTION	http://www.rogerebert.com/reviews/the-shawshank-redemption-1994
7	The Shawshank Redemption	http://www.rollingstone.com/movies/reviews/the-shawshank-redemption-19940101
\.


--
-- Name: review_reviewid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('review_reviewid_seq', 7, true);


--
-- Data for Name: reviewpublisher; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY reviewpublisher (reviewpublisherid, reviewid, publisherid) FROM stdin;
\.


--
-- Name: reviewpublisher_reviewpublisherid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('reviewpublisher_reviewpublisherid_seq', 1, false);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: chris
--

COPY role (roleid, rolename) FROM stdin;
1	Actor
2	Director
3	Writer
4	Producer
5	Costumes
6	Makeup
7	Cinematographer
8	Audio Engineer
9	Driver
10	Key Grip
\.


--
-- Name: role_roleid_seq; Type: SEQUENCE SET; Schema: public; Owner: chris
--

SELECT pg_catalog.setval('role_roleid_seq', 10, true);


--
-- Name: company_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY company
    ADD CONSTRAINT company_pkey PRIMARY KEY (companyid);


--
-- Name: companyrole_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY companyrole
    ADD CONSTRAINT companyrole_pkey PRIMARY KEY (companyroleid);


--
-- Name: genre_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genreid);


--
-- Name: moviecompany_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviecompany
    ADD CONSTRAINT moviecompany_pkey PRIMARY KEY (moviecompanyid);


--
-- Name: moviegenre_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviegenre
    ADD CONSTRAINT moviegenre_pkey PRIMARY KEY (moviegenreid);


--
-- Name: movieperson_moviepersonid_pk; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY movieperson
    ADD CONSTRAINT movieperson_moviepersonid_pk PRIMARY KEY (moviepersonid);


--
-- Name: moviereview_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviereview
    ADD CONSTRAINT moviereview_pkey PRIMARY KEY (moviereviewid);


--
-- Name: movies_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movieid);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (personid);


--
-- Name: personreview_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY personreview
    ADD CONSTRAINT personreview_pkey PRIMARY KEY (personreviewid);


--
-- Name: publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (publisherid);


--
-- Name: review_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY review
    ADD CONSTRAINT review_pkey PRIMARY KEY (reviewid);


--
-- Name: reviewpublisher_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY reviewpublisher
    ADD CONSTRAINT reviewpublisher_pkey PRIMARY KEY (reviewpublisherid);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (roleid);


--
-- Name: company_companyid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX company_companyid_uindex ON company USING btree (companyid);


--
-- Name: companyrole_companyroleid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX companyrole_companyroleid_uindex ON companyrole USING btree (companyroleid);


--
-- Name: genre_genreid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX genre_genreid_uindex ON genre USING btree (genreid);


--
-- Name: genre_genrename_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX genre_genrename_uindex ON genre USING btree (genrename);


--
-- Name: moviecompany_moviecompanyid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX moviecompany_moviecompanyid_uindex ON moviecompany USING btree (moviecompanyid);


--
-- Name: moviegenre_moviegenreid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX moviegenre_moviegenreid_uindex ON moviegenre USING btree (moviegenreid);


--
-- Name: movieperson_moviepersonid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX movieperson_moviepersonid_uindex ON movieperson USING btree (moviepersonid);


--
-- Name: moviereview_moviereviewid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX moviereview_moviereviewid_uindex ON moviereview USING btree (moviereviewid);


--
-- Name: movies_movieid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX movies_movieid_uindex ON movie USING btree (movieid);


--
-- Name: person_personid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX person_personid_uindex ON person USING btree (personid);


--
-- Name: personreview_personreviewid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX personreview_personreviewid_uindex ON personreview USING btree (personreviewid);


--
-- Name: publisher_publisherid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX publisher_publisherid_uindex ON publisher USING btree (publisherid);


--
-- Name: review_reviewid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX review_reviewid_uindex ON review USING btree (reviewid);


--
-- Name: reviewpublisher_reviewpublisherid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX reviewpublisher_reviewpublisherid_uindex ON reviewpublisher USING btree (reviewpublisherid);


--
-- Name: role_roleid_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX role_roleid_uindex ON role USING btree (roleid);


--
-- Name: role_rolename_uindex; Type: INDEX; Schema: public; Owner: chris
--

CREATE UNIQUE INDEX role_rolename_uindex ON role USING btree (rolename);


--
-- Name: moviecompany_company_companyid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviecompany
    ADD CONSTRAINT moviecompany_company_companyid_fk FOREIGN KEY (companyid) REFERENCES company(companyid);


--
-- Name: moviecompany_companyrole_companyroleid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviecompany
    ADD CONSTRAINT moviecompany_companyrole_companyroleid_fk FOREIGN KEY (companyroleid) REFERENCES companyrole(companyroleid);


--
-- Name: moviecompany_movie_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviecompany
    ADD CONSTRAINT moviecompany_movie_movieid_fk FOREIGN KEY (movieid) REFERENCES movie(movieid);


--
-- Name: moviegenre_genre_genreid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviegenre
    ADD CONSTRAINT moviegenre_genre_genreid_fk FOREIGN KEY (genreid) REFERENCES genre(genreid);


--
-- Name: moviegenre_movie_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviegenre
    ADD CONSTRAINT moviegenre_movie_movieid_fk FOREIGN KEY (movieid) REFERENCES movie(movieid);


--
-- Name: movieperson_movies_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY movieperson
    ADD CONSTRAINT movieperson_movies_movieid_fk FOREIGN KEY (movieid) REFERENCES movie(movieid);


--
-- Name: movieperson_person_personid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY movieperson
    ADD CONSTRAINT movieperson_person_personid_fk FOREIGN KEY (personid) REFERENCES person(personid);


--
-- Name: movieperson_role_roleid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY movieperson
    ADD CONSTRAINT movieperson_role_roleid_fk FOREIGN KEY (roleid) REFERENCES role(roleid);


--
-- Name: moviereview_movie_movieid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviereview
    ADD CONSTRAINT moviereview_movie_movieid_fk FOREIGN KEY (movieid) REFERENCES movie(movieid);


--
-- Name: moviereview_review_reviewid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY moviereview
    ADD CONSTRAINT moviereview_review_reviewid_fk FOREIGN KEY (reviewid) REFERENCES review(reviewid);


--
-- Name: personreview_person_personid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY personreview
    ADD CONSTRAINT personreview_person_personid_fk FOREIGN KEY (personid) REFERENCES person(personid);


--
-- Name: personreview_review_reviewid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY personreview
    ADD CONSTRAINT personreview_review_reviewid_fk FOREIGN KEY (reviewid) REFERENCES review(reviewid);


--
-- Name: reviewpublisher_publisher_publisherid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY reviewpublisher
    ADD CONSTRAINT reviewpublisher_publisher_publisherid_fk FOREIGN KEY (publisherid) REFERENCES publisher(publisherid);


--
-- Name: reviewpublisher_review_reviewid_fk; Type: FK CONSTRAINT; Schema: public; Owner: chris
--

ALTER TABLE ONLY reviewpublisher
    ADD CONSTRAINT reviewpublisher_review_reviewid_fk FOREIGN KEY (reviewid) REFERENCES review(reviewid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

