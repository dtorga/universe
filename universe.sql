--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    galaxy_age integer,
    size integer NOT NULL,
    mass numeric(3,1),
    description text,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: material; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.material (
    material_id integer NOT NULL,
    name character varying(40),
    atomic_value integer NOT NULL
);


ALTER TABLE public.material OWNER TO freecodecamp;

--
-- Name: material_material_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.material_material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.material_material_id_seq OWNER TO freecodecamp;

--
-- Name: material_material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.material_material_id_seq OWNED BY public.material.material_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    moon_age integer,
    distance_to_planet integer,
    mass numeric(3,1),
    description text,
    has_water boolean,
    planet_id integer NOT NULL,
    aux character varying(10)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    planet_age integer,
    mmkm_to_first_star integer,
    mass numeric(3,1),
    description text,
    has_moon boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    star_age integer,
    size integer,
    mass numeric(3,1),
    description text,
    still_active boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: material material_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.material ALTER COLUMN material_id SET DEFAULT nextval('public.material_material_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Pandora', 32, 150, 23.1, 'The smallest galaxy known bu humans', true);
INSERT INTO public.galaxy VALUES (2, 'Zeta', 2, 340, 65.2, 'Found only 3 years ago', true);
INSERT INTO public.galaxy VALUES (3, 'Gorton', 53, 670, 93.3, 'Not mucho information, only assuptions', false);
INSERT INTO public.galaxy VALUES (4, 'Sordon', 9, 432, 54.6, 'Biggest of all known', false);
INSERT INTO public.galaxy VALUES (5, 'Ricky', 62, 4, 23.1, 'Many movies made refering this galaxy', true);
INSERT INTO public.galaxy VALUES (6, 'Jota', 6, 1, 3.6, 'Like the letter', false);


--
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.material VALUES (1, 'Iron', 56);
INSERT INTO public.material VALUES (2, 'Nitrogen', 14);
INSERT INTO public.material VALUES (3, 'Oxigen', 16);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Luna', 2, 43, 21.0, 'White and beautiful', false, 2, NULL);
INSERT INTO public.moon VALUES (3, 'Saturx', 5, 3, 13.0, 'Red and big', false, 3, NULL);
INSERT INTO public.moon VALUES (4, 'Colin', 6, 2, 6.0, 'Smaller than Luna', true, 4, NULL);
INSERT INTO public.moon VALUES (5, 'Titux', 5, 4, 36.0, 'Red', false, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Colin', 6, 2, 6.0, 'Smaller than Luna', true, 4, NULL);
INSERT INTO public.moon VALUES (14, 'Titux', 5, 4, 36.0, 'Red', false, 5, NULL);
INSERT INTO public.moon VALUES (15, 'Colin', 6, 2, 6.0, 'Smaller than Luna', true, 4, NULL);
INSERT INTO public.moon VALUES (16, 'Richot', 7, 3, 7.0, 'Where Phillips lives', true, 5, NULL);
INSERT INTO public.moon VALUES (17, 'Hinnie', 8, 23, 7.0, 'Really espheric', false, 3, NULL);
INSERT INTO public.moon VALUES (18, 'tronos', 8, 3, 7.0, 'Blue like water', true, 2, NULL);
INSERT INTO public.moon VALUES (19, 'Bronxs', 84, 1, 56.0, 'Black', false, 2, NULL);
INSERT INTO public.moon VALUES (20, 'Filter', 5, 76, 23.0, 'Too far to see form the earth', false, 4, NULL);
INSERT INTO public.moon VALUES (21, 'Titux', 5, 4, 36.0, 'Red', false, 5, NULL);
INSERT INTO public.moon VALUES (22, 'Colin', 6, 2, 6.0, 'Smaller than Luna', true, 4, NULL);
INSERT INTO public.moon VALUES (23, 'Rirhty', 7, 4, 7.0, 'Where Tom lives', true, 2, NULL);
INSERT INTO public.moon VALUES (24, 'Humo', 45, 2, 72.0, 'Flat like a stone', false, 5, NULL);
INSERT INTO public.moon VALUES (25, 'Chotte', 84, 2, 12.0, 'Made of silice', true, 3, NULL);
INSERT INTO public.moon VALUES (26, 'Bronxash', 84, 13, 26.0, 'Brigth', true, 2, NULL);
INSERT INTO public.moon VALUES (27, 'Morale', 15, 7, 39.0, 'Tiny like a ball', true, 5, NULL);
INSERT INTO public.moon VALUES (28, 'Troter', 52, 62, 12.0, 'Nice fer a vacation', true, 4, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Tierra', 23, 2, 43.0, 'where humans live', true, 1);
INSERT INTO public.planet VALUES (3, 'Marte', 2, 22, 12.0, 'red and small', false, 1);
INSERT INTO public.planet VALUES (4, 'Rinox', 34, 78, 4.0, 'black and made of store', true, 2);
INSERT INTO public.planet VALUES (5, 'Jotal', 5, 12, 78.0, 'twise as big as earth', false, 3);
INSERT INTO public.planet VALUES (6, 'Poopy', 2, 12, 77.3, 'big as saturn', false, 2);
INSERT INTO public.planet VALUES (7, 'Nomad', 1, 51, 23.5, 'not pretty at all', false, 3);
INSERT INTO public.planet VALUES (8, 'Greta', 3, 41, 1.2, 'LIke the name of a woman', true, 2);
INSERT INTO public.planet VALUES (9, 'Porter', 42, 12, 1.3, 'With aliens in it', false, 3);
INSERT INTO public.planet VALUES (10, 'Magnus', 3, 58, 4.9, 'No chances of life here', true, 1);
INSERT INTO public.planet VALUES (11, 'Bonus', 24, 51, 2.4, 'Cute planet', false, 3);
INSERT INTO public.planet VALUES (12, 'Porter', 1, 54, 2.7, 'Like Mel Gibson', false, 2);
INSERT INTO public.planet VALUES (13, 'Pennut', 9, 11, 7.3, 'bigger than earth', false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 32, 13, 35.0, 'pure fire', true, 1);
INSERT INTO public.star VALUES (2, 'Lor', 9, 1, 75.0, 'nitrogen', true, 1);
INSERT INTO public.star VALUES (3, 'Foxy', 79, 16, 5.0, 'methane', true, 3);
INSERT INTO public.star VALUES (4, 'Gothon', 54, 9, 12.0, 'not much info', false, 2);
INSERT INTO public.star VALUES (5, 'Mital', 27, 15, 5.0, 'farest from earth', true, 2);
INSERT INTO public.star VALUES (6, 'Fire', 2, 1, 2.0, 'looks red', true, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: material_material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.material_material_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: material material_atomic_value_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_atomic_value_key UNIQUE (atomic_value);


--
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (material_id);


--
-- Name: moon moon_aux_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_aux_key UNIQUE (aux);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_mass_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_mass_key UNIQUE (mass);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_age_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_age_key UNIQUE (star_age);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

