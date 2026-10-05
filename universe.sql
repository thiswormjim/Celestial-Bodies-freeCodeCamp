--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    type text,
    is_dwarf boolean,
    contains_black_hole boolean
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
-- Name: inhabitants; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.inhabitants (
    inhabitants_id integer NOT NULL,
    name character varying(60) NOT NULL,
    type text,
    space_faring boolean,
    number_of_individuals integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.inhabitants OWNER TO freecodecamp;

--
-- Name: inhabitants_inhabitants_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.inhabitants_inhabitants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inhabitants_inhabitants_id_seq OWNER TO freecodecamp;

--
-- Name: inhabitants_inhabitants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.inhabitants_inhabitants_id_seq OWNED BY public.inhabitants.inhabitants_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    number_days_orbit numeric(5,1),
    moon_could_sustain_life boolean,
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
    type text,
    diameter_in_1000s_km numeric(10,1),
    planet_could_sustain_life boolean,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    lightyears_from_earth numeric(10,1),
    year_discovered integer,
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
-- Name: inhabitants inhabitants_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants ALTER COLUMN inhabitants_id SET DEFAULT nextval('public.inhabitants_inhabitants_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred Spiral', false, true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Spiral', true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 'Lenticular', false, true);
INSERT INTO public.galaxy VALUES (5, 'Perseus A', 'Seyfert', false, true);
INSERT INTO public.galaxy VALUES (6, 'Cigar', 'Starburst', false, true);


--
-- Data for Name: inhabitants; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.inhabitants VALUES (1, 'Clanger', 'Mouse', true, 6, 9, NULL);
INSERT INTO public.inhabitants VALUES (2, 'Sky Moo', 'Blue cow with wings', false, 3, NULL, 1);
INSERT INTO public.inhabitants VALUES (3, 'Wallace', 'Human', true, 1, 7, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 27.3, true, 7);
INSERT INTO public.moon VALUES (2, 'Deimos', 1.3, false, 9);
INSERT INTO public.moon VALUES (3, 'Adrastea', 0.3, false, 1);
INSERT INTO public.moon VALUES (4, 'Callisto', 16.7, true, 1);
INSERT INTO public.moon VALUES (5, 'Io', 1.8, false, 1);
INSERT INTO public.moon VALUES (6, 'Epithemius', 0.7, false, 10);
INSERT INTO public.moon VALUES (7, 'Ijiraq', 451.5, false, 10);
INSERT INTO public.moon VALUES (8, 'Mundilfari', 951.4, false, 10);
INSERT INTO public.moon VALUES (9, 'Oberon', 13.5, false, 11);
INSERT INTO public.moon VALUES (10, 'Sycorax', 1283.4, true, 11);
INSERT INTO public.moon VALUES (11, 'Despina', 0.4, false, 2);
INSERT INTO public.moon VALUES (12, 'Sao', 2925.6, false, 2);
INSERT INTO public.moon VALUES (13, 'Ganymede', 7.2, true, 1);
INSERT INTO public.moon VALUES (14, 'Cordelia', 0.3, false, 11);
INSERT INTO public.moon VALUES (15, 'Tethys', 1.9, false, 10);
INSERT INTO public.moon VALUES (16, 'Orthosie', 617.0, false, 1);
INSERT INTO public.moon VALUES (17, 'Phobos', 0.3, false, 9);
INSERT INTO public.moon VALUES (18, 'Nix', 24.9, false, 4);
INSERT INTO public.moon VALUES (19, 'Charon', 6.4, false, 4);
INSERT INTO public.moon VALUES (20, 'Hydra', 38.2, false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupiter', 'Gas Giant', 140.0, false, 1);
INSERT INTO public.planet VALUES (2, 'Neptune', 'Ice Giant', 49.5, false, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', 'Rocky', 4.9, false, 1);
INSERT INTO public.planet VALUES (4, 'Pluto', 'Dwarf', 2.4, false, 1);
INSERT INTO public.planet VALUES (5, 'Dimidium', 'Gas Giant', 281.0, false, 2);
INSERT INTO public.planet VALUES (6, 'PA-99-N2-b', 'Hot Jupiter', NULL, false, 4);
INSERT INTO public.planet VALUES (7, 'Earth', 'Ocean', 12.8, true, 1);
INSERT INTO public.planet VALUES (8, 'Venus', 'Rocky', 12.1, false, 1);
INSERT INTO public.planet VALUES (9, 'Mars', 'Rocky', 6.8, true, 1);
INSERT INTO public.planet VALUES (10, 'Saturn', 'Gas Giant', 116.0, false, 1);
INSERT INTO public.planet VALUES (11, 'Uranus', 'Ice Giant', 51.0, false, 1);
INSERT INTO public.planet VALUES (12, 'SWEEPS-11', 'Hot Jupiter', NULL, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.0, NULL, 1);
INSERT INTO public.star VALUES (2, '51 Pegasi', 50.6, 1989, 1);
INSERT INTO public.star VALUES (3, 'Sirius B', 8.6, 1844, 1);
INSERT INTO public.star VALUES (4, 'PA-99-N2', 2200000.0, 1999, 2);
INSERT INTO public.star VALUES (5, 'M31-RV', 2560000.0, 1988, 2);
INSERT INTO public.star VALUES (6, 'RMC 136a1', 163000.0, 1960, 3);
INSERT INTO public.star VALUES (7, 'SWEEPS J175902.67-291153.5', 27700.0, 2006, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: inhabitants_inhabitants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.inhabitants_inhabitants_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: inhabitants inhabitants_inhabitants_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_inhabitants_id_key UNIQUE (inhabitants_id);


--
-- Name: inhabitants inhabitants_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_name_key UNIQUE (name);


--
-- Name: inhabitants inhabitants_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_pkey PRIMARY KEY (inhabitants_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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
-- Name: inhabitants inhabitants_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: inhabitants inhabitants_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitants
    ADD CONSTRAINT inhabitants_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
