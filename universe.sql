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
-- Name: alien; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.alien (
    alien_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    species text NOT NULL,
    is_force_sensitive boolean NOT NULL,
    spoken_language text,
    lifespan_years integer
);


ALTER TABLE public.alien OWNER TO freecodecamp;

--
-- Name: alien_alien_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.alien_alien_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alien_alien_id_seq OWNER TO freecodecamp;

--
-- Name: alien_alien_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.alien_alien_id_seq OWNED BY public.alien.alien_id;


--
-- Name: creature; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.creature (
    creature_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    type character varying(40) NOT NULL,
    is_domesticated boolean,
    ave_size_m numeric(3,1)
);


ALTER TABLE public.creature OWNER TO freecodecamp;

--
-- Name: creature_creature_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.creature_creature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creature_creature_id_seq OWNER TO freecodecamp;

--
-- Name: creature_creature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.creature_creature_id_seq OWNED BY public.creature.creature_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    num_of_systems integer,
    discovered_year_bby integer,
    has_empire_presence boolean NOT NULL
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    has_base boolean NOT NULL,
    surface_type text
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    diameter_km integer,
    population integer,
    atmosphere_type character varying(30),
    is_inhabited boolean NOT NULL
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
    name character varying(30) NOT NULL,
    size_km_millions numeric(3,1),
    temperature_c integer,
    is_binary boolean NOT NULL,
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
-- Name: alien alien_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alien ALTER COLUMN alien_id SET DEFAULT nextval('public.alien_alien_id_seq'::regclass);


--
-- Name: creature creature_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature ALTER COLUMN creature_id SET DEFAULT nextval('public.creature_creature_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: alien; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.alien VALUES (17, 'Yoda', 12, 'Yoda''s Species', true, 'Galactic Basic', 900);
INSERT INTO public.alien VALUES (18, 'Chewbacca', 12, 'Wookiee', false, 'Shyriiwook', 400);
INSERT INTO public.alien VALUES (19, 'Jabba', 1, 'Hutt', false, 'Huttese', 600);
INSERT INTO public.alien VALUES (20, 'Greedo', 1, 'Rodian', false, 'Rodese', 70);
INSERT INTO public.alien VALUES (21, 'Watto', 1, 'Toydarian', false, 'Galactic Basic', 100);
INSERT INTO public.alien VALUES (22, 'Bossk', 13, 'Trandoshan', false, 'Dosh', 60);
INSERT INTO public.alien VALUES (23, 'Kit Fisto', 4, 'Nautolan', true, 'Nautila', 200);
INSERT INTO public.alien VALUES (24, 'Aayla Secura', 3, 'Twi''lek', true, 'Ryl', 80);
INSERT INTO public.alien VALUES (25, 'Admiral Ackbar', 5, 'Mon Calamari', false, 'Galactic Basic', 90);
INSERT INTO public.alien VALUES (26, 'Plo Koon', 11, 'Kel Dor', true, 'Galactic Basic', 80);


--
-- Data for Name: creature; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.creature VALUES (15, 'Bantha', 1, 'Mammal', true, 2.5);
INSERT INTO public.creature VALUES (16, 'Rancor', 11, 'Reptilian', false, 5.0);
INSERT INTO public.creature VALUES (17, 'Wampa', 7, 'Mammal', false, 3.0);
INSERT INTO public.creature VALUES (18, 'Tauntaun', 7, 'Mammal', true, 1.8);
INSERT INTO public.creature VALUES (19, 'Sarlacc', 1, 'Invertebrate', false, 10.0);
INSERT INTO public.creature VALUES (20, 'Acklay', 2, 'Insectoid', false, 4.5);
INSERT INTO public.creature VALUES (21, 'Blurrg', 9, 'Reptilian', true, 2.0);
INSERT INTO public.creature VALUES (22, 'Nexu', 8, 'Mammal', false, 2.0);
INSERT INTO public.creature VALUES (23, 'Porg', 12, 'Avian', true, 0.3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Outer Rim', 'Spiral', 700, 32, true);
INSERT INTO public.galaxy VALUES (2, 'Mid Rim', 'Elliptical', 300, 22, false);
INSERT INTO public.galaxy VALUES (3, 'Core Worlds', 'Spiral', 450, 25, true);
INSERT INTO public.galaxy VALUES (4, 'Unknown Regions', 'Irregular', 50, 12, false);
INSERT INTO public.galaxy VALUES (5, 'Deep Core', 'Lenticular', 200, 40, true);
INSERT INTO public.galaxy VALUES (6, 'Wild Space', 'Irregular', 120, 15, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Obi-wan', 1, 3400, false, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Crait', 2, 2700, false, 'Salt Flat');
INSERT INTO public.moon VALUES (3, 'Umbara', 2, 2800, true, 'Shadowy');
INSERT INTO public.moon VALUES (4, 'Concordia', 4, 4900, true, 'Forested');
INSERT INTO public.moon VALUES (5, 'Ohma-D''un', 3, 4500, false, 'Swamp');
INSERT INTO public.moon VALUES (6, 'Garel', 5, 2200, false, 'Plains');
INSERT INTO public.moon VALUES (7, 'Pantora', 8, 3200, true, 'Icy');
INSERT INTO public.moon VALUES (8, 'Concord Dawn', 4, 3800, true, 'Rocky');
INSERT INTO public.moon VALUES (9, 'Polis Massa', 3, 3500, false, 'Asteroid');
INSERT INTO public.moon VALUES (10, 'Nar Shaddaa', 6, 4000, true, 'Urban');
INSERT INTO public.moon VALUES (11, 'Eadu', 6, 2800, true, 'Mountainous');
INSERT INTO public.moon VALUES (12, 'Endor Moon', 10, 4800, false, 'Forested');
INSERT INTO public.moon VALUES (13, 'Trandosha', 12, 2900, false, 'Jungle');
INSERT INTO public.moon VALUES (14, 'Cholganna', 12, 3600, false, 'Jungle');
INSERT INTO public.moon VALUES (15, 'Yavin IV', 6, 4800, true, 'Tropical');
INSERT INTO public.moon VALUES (16, 'Mandalore', 4, 5100, true, 'Desert');
INSERT INTO public.moon VALUES (17, 'Artorias', 8, 4200, true, 'Urban');
INSERT INTO public.moon VALUES (18, 'Haruun Kal', 2, 3000, false, 'Jungle');
INSERT INTO public.moon VALUES (19, 'Lothal', 7, 2500, true, 'Grassland');
INSERT INTO public.moon VALUES (20, 'Onderon', 5, 4700, true, 'Forested');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tatooine', 1, 10465, 200000, 'Arid', true);
INSERT INTO public.planet VALUES (2, 'Geonosis', 1, 11370, 100000, 'Thin', true);
INSERT INTO public.planet VALUES (3, 'Ryloth', 1, 10130, 1500000, 'Thin', true);
INSERT INTO public.planet VALUES (4, 'Alderaan', 3, 12500, 2000000, 'Breathable', true);
INSERT INTO public.planet VALUES (5, 'Dantooine', 3, 11850, 30000, 'Breathable', true);
INSERT INTO public.planet VALUES (6, 'Corellia', 4, 11900, 3000000, 'Breathable', true);
INSERT INTO public.planet VALUES (7, 'Hoth', 5, 7200, 0, 'Frozen', false);
INSERT INTO public.planet VALUES (8, 'Bespin', 2, 118000, 6000, 'Gas Giant', true);
INSERT INTO public.planet VALUES (9, 'Jakku', 6, 10020, 80000, 'Arid', true);
INSERT INTO public.planet VALUES (10, 'Endor', 6, 4900, 300000, 'Forested', true);
INSERT INTO public.planet VALUES (11, 'Mustafar', 4, 4200, 500, 'Volcanic', true);
INSERT INTO public.planet VALUES (12, 'Kashyyyk', 3, 12540, 450000, 'Forested', true);
INSERT INTO public.planet VALUES (13, 'Trandosha', 5, 12000, 8000000, 'Breathable', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Tatoo I', 1.3, 6000, true, 1);
INSERT INTO public.star VALUES (2, 'Tatoo II', 1.2, 5500, true, 1);
INSERT INTO public.star VALUES (3, 'Alderaan Sun', 1.6, 5800, false, 3);
INSERT INTO public.star VALUES (4, 'Corellian Star', 1.5, 5900, false, 3);
INSERT INTO public.star VALUES (5, 'Hoth''s Sun', 1.1, 4700, false, 2);
INSERT INTO public.star VALUES (6, 'Jakku Prime', 1.4, 5600, false, 6);


--
-- Name: alien_alien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.alien_alien_id_seq', 26, true);


--
-- Name: creature_creature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.creature_creature_id_seq', 23, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: alien alien_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alien
    ADD CONSTRAINT alien_name_key UNIQUE (name);


--
-- Name: alien alien_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alien
    ADD CONSTRAINT alien_pkey PRIMARY KEY (alien_id);


--
-- Name: creature creature_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT creature_name_key UNIQUE (name);


--
-- Name: creature creature_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT creature_pkey PRIMARY KEY (creature_id);


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
-- Name: alien alien_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alien
    ADD CONSTRAINT alien_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: creature creature_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creature
    ADD CONSTRAINT creature_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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