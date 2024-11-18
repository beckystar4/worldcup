--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(60) NOT NULL,
    has_habitable_planets boolean,
    is_active_star_former boolean,
    distance_light_years numeric(15,1),
    galaxy_type text,
    galaxy_age integer,
    num_stars integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    is_habitable boolean,
    has_atmosphere boolean,
    moon_size_km numeric(15,1),
    planet_id integer
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
    name character varying(60) NOT NULL,
    is_terrestrial boolean,
    has_rings boolean,
    radius_km numeric(15,1),
    star_id integer
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
-- Name: space_explorers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_explorers (
    space_explorers_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.space_explorers OWNER TO freecodecamp;

--
-- Name: space_explorers_space_explorers_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_explorers_space_explorers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_explorers_space_explorers_id_seq OWNER TO freecodecamp;

--
-- Name: space_explorers_space_explorers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_explorers_space_explorers_id_seq OWNED BY public.space_explorers.space_explorers_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_mass numeric(4,1),
    is_supernova boolean,
    is_in_main_sequence boolean,
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_explorers space_explorers_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_explorers ALTER COLUMN space_explorers_id SET DEFAULT nextval('public.space_explorers_space_explorers_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, true, 2537000.0, 'Sprial', 10, 100000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, false, 3000000.0, 'Sprial', 13, 30000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', true, true, 23100000.0, 'Sprial', 11, 80000000);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', false, false, 5300000.0, 'Elliptical', 14, 50000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', true, true, 28000000.0, 'Lenticular', 13, 60000000);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, true, 0.0, 'Sprial', 14, 100000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, true, 1737.0, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, false, 11.1, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', false, false, 6.2, 1);
INSERT INTO public.moon VALUES (4, 'Europa', true, true, 3121.0, 1);
INSERT INTO public.moon VALUES (5, 'Ganymede', true, true, 5262.0, 1);
INSERT INTO public.moon VALUES (6, 'Io', false, false, 3643.0, 1);
INSERT INTO public.moon VALUES (7, 'Callisto', true, true, 4821.0, 1);
INSERT INTO public.moon VALUES (8, 'Titan', false, true, 5150.0, 1);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, false, 2526.0, 1);
INSERT INTO public.moon VALUES (10, 'Mimas', false, false, 396.0, 1);
INSERT INTO public.moon VALUES (11, 'Miranda', false, false, 471.0, 1);
INSERT INTO public.moon VALUES (12, 'Ariel', false, false, 1157.0, 1);
INSERT INTO public.moon VALUES (13, 'Oberon', false, false, 1523.0, 1);
INSERT INTO public.moon VALUES (14, 'Triton', false, true, 1353.0, 1);
INSERT INTO public.moon VALUES (15, 'Charon', true, false, 1212.0, 1);
INSERT INTO public.moon VALUES (16, 'Titania', false, false, 789.0, 1);
INSERT INTO public.moon VALUES (17, 'Hyperion', false, false, 360.0, 1);
INSERT INTO public.moon VALUES (18, 'Rhea', true, false, 764.0, 1);
INSERT INTO public.moon VALUES (19, 'Iapetus', false, false, 735.0, 1);
INSERT INTO public.moon VALUES (20, 'Tethys', false, false, 533.0, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, false, 6371.0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', true, false, 3389.0, 1);
INSERT INTO public.planet VALUES (3, 'Venus', true, false, 6052.0, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, true, 69911.0, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', false, true, 58232.0, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', false, true, 25362.0, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', false, true, 24622.0, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', true, false, 2439.0, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', true, false, 21950.0, 2);
INSERT INTO public.planet VALUES (10, 'Gliese-581g', true, false, 18000.0, 3);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', false, false, 13700.0, 3);
INSERT INTO public.planet VALUES (12, 'Kepler 186f', true, false, 8600.0, 3);


--
-- Data for Name: space_explorers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_explorers VALUES (1, 'NASA', 2, 1);
INSERT INTO public.space_explorers VALUES (2, 'SpaceX', 2, 3);
INSERT INTO public.space_explorers VALUES (3, 'ESA', 3, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.0, false, true, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1.1, false, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 18.0, true, false, 1);
INSERT INTO public.star VALUES (4, 'Sirius A', 2.0, false, true, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 0.1, false, true, 1);
INSERT INTO public.star VALUES (6, 'Vega', 2.1, false, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_explorers_space_explorers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_explorers_space_explorers_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: space_explorers space_explorers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_explorers
    ADD CONSTRAINT space_explorers_pkey PRIMARY KEY (space_explorers_id);


--
-- Name: space_explorers space_explorers_space_explorers_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_explorers
    ADD CONSTRAINT space_explorers_space_explorers_id_key UNIQUE (space_explorers_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: space_explorers space_explorers_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_explorers
    ADD CONSTRAINT space_explorers_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: space_explorers space_explorers_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_explorers
    ADD CONSTRAINT space_explorers_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

