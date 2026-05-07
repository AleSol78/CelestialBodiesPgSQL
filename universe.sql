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
    galaxy_types_id integer NOT NULL,
    number_of_stars numeric(12,2),
    light_year_diameter integer,
    galaxy_description text
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(25) NOT NULL,
    galaxy_type_description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    moon_description text,
    has_subsurface_ocean boolean DEFAULT false
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
    star_id integer NOT NULL,
    num_of_moons integer,
    planet_description text,
    has_moon boolean DEFAULT true
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
    galaxy_id integer NOT NULL,
    num_of_planets integer,
    star_description text
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 1000000000.00, 100000, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 100000000.00, 61000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 1, 1000000000.00, 70000, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cigar', 1, NULL, 40800, NULL);
INSERT INTO public.galaxy VALUES (5, 'Eye of Sauron', 2, 2.50, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Medusa Merger', 3, NULL, NULL, NULL);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'These galaxies resemble giant rotating pinwheels with a pancake-like disk of stars and a central bulge or tight concentration of stars.
 
 The spiral arms can be wound tightly or loosely, and some cannot be seen from Earth because we view the galaxy from the side, edge on.
 
 Spiral galaxies are surrounded by halos, mixtures of old stars, star clusters, and dark matter – invisible material that does not emit or reflect light but still has a gravitational pull on other matter. The youngest stars form in gas-rich arms, while older stars can be found throughout the disk and within the bulge and halo.');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'Elliptical galaxies have shapes that range from completely round to oval. They are less common than spiral galaxies.
 Unlike spirals, elliptical galaxies usually contain little gas and dust and show very little organization or structure. The stars orbit around the core in random directions and are generally older than those in spiral galaxies since little of the gas needed to form new stars remains. Scientists think elliptical galaxies originate from collisions and mergers with spirals.');
INSERT INTO public.galaxy_types VALUES (3, 'Lenticular', 'Lenticular galaxies are a kind of cross between spirals and ellipticals. They have the central bulge and disk common to spiral galaxies but no arms. But like ellipticals, lenticular galaxies have older stellar populations and little ongoing star formation.
 Scientists have a few theories about how lenticular galaxies evolved. One idea suggests these galaxies are older spirals whose arms have faded. Another proposes that lenticulars formed from mergers of spiral galaxies.');
INSERT INTO public.galaxy_types VALUES (4, 'Irregular', 'Irregular galaxies have unusual shapes, like toothpicks, rings, or even little groupings of stars. They range from dwarf irregular galaxies with 100 million times the Sun’s mass to large ones weighing 10 billion solar masses.
 Astronomers think these galaxies’ odd shapes are sometimes the result of interactions with others. For example, one spiral galaxy passing another with a stronger gravitational pull could lose some of its material, become distorted, and morph into a new shape. Some, like gas-rich dwarf galaxies, may be new, formed by material pulled from such encounters. Or perhaps when galaxies collide, they create a larger, oddly shaped mashup. Some scientists theorize that some large irregular galaxies could represent an intermediate step between spiral and elliptical galaxies.
 Irregular galaxies born from galaxy interactions or collisions typically host a mix of older and younger stars, depending on the characteristics and composition of the original galaxies. Irregular galaxies may also hold significant amounts of gas and dust – essential ingredients for making new stars.');
INSERT INTO public.galaxy_types VALUES (5, 'Active', 'Around 10% of known galaxies are active, which means their centers appear more than 100 times brighter than the combined light of their stars. They can be spiral, elliptical, or irregular. The Milky Way is not currently an active galaxy, although it likely experienced a burst of activity in the past few million years.
 Astronomers think this excess energy comes from areas near the galaxies’ central supermassive black holes, which range from hundreds of thousands to billions of times the mass of our Sun.
 Gas and dust collect around the black hole to form an accretion disk. The black hole’s gravity compresses and heats the disk, which causes the material to glow across multiple wavelengths, from infrared to X-rays.
 Infrared observations show that the black hole and its accretion disk are embedded within a clumpy ring of cooler dust, called a torus, that may be a few light-years across. Close to the black hole, a small fraction of the infalling gas can be driven outward, perpendicular to the disk, as jets of particles that move near the speed of light.
 During the early 20th century, astronomers began classifying active galaxies based on the distinctive characteristics and behaviors they observed. Scientists now think viewing the centers of these galaxies at different angles – for example, seeing directly into the torus versus seeing it from the side – produce many of the signature traits.
 Active galaxies can also be categorized by their brightness in radio wavelengths. Radio-loud galaxies typically emit from both the accretion disk and the jets. Radio-quiet galaxies tend to have little-to-no emission from jets. The observed luminosity is also thought to be another aspect of our viewing angle. Jets directed more toward our line of sight, viewed “down the barrel,” appear brighter and more variable than those viewed at wider angles.');
INSERT INTO public.galaxy_types VALUES (6, 'Seyfert', 'Seyfert galaxies, first identified in 1943 by American astronomer Carl Seyfert, are the most common active galaxies and also exhibit the lowest energies. All Seyferts look like normal galaxies in visible light, but they emit considerable infrared radiation. When observed in the infrared, some reveal bright emission from the donut-shaped torus. Some also emit X-rays. Seyfert galaxies tend to have lower radio luminosities, although some produce radio jets.
 Scientists divide Seyferts into two classes. Type I Seyfert galaxies display unusual features in their visible light that imply rapid motion near the accretion disk. Type II Seyferts show features that imply much slower motion. However, this distinction may result from different viewing angles into the centers of these galaxies.');
INSERT INTO public.galaxy_types VALUES (7, 'Quasars', 'Quasars are the most luminous type of active galaxy. They emit light across the electromagnetic spectrum, produce powerful particle jets, and can radiate thousands of times the energy emitted by a galaxy like the Milky Way. The nearest quasar, called Markarian 231, is located some 600 million light-years away, but we see many more quasars the farther we look.
 Scientists have identified over 1 million quasars, with the farthest one currently known lying about 13 billion light-years away. Since light takes time to travel, scientists can use light from these galaxies as a way to peer back in time to study black hole growth and galaxy evolution. Merging galaxies in the young universe may provide the fuel to power the enormous energy output of quasars, but when the feeding frenzy ends, the black hole cannot maintain it. It’s thought that quasar activity may be episodic and that this entire phase may last only about 10 million years.');
INSERT INTO public.galaxy_types VALUES (8, 'Blazars', 'Blazars produce light across the electromagnetic spectrum. Their powerful jets point almost directly at Earth, so they appear brighter than other active galaxies. Observatories on Earth can sometimes detect high-energy particles – like neutrinos – produced within the jets and trace them back to their home galaxy. This information gives scientists a glimpse into the environment around the blazar’s supermassive black hole.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Io', 3, 'The most volcanically active body in the Solar System, with hundreds of active volcanoes and a surface covered in sulfur compounds.', false);
INSERT INTO public.moon VALUES (5, 'Amalthea', 3, 'A small, irregularly shaped moon that orbits close to Jupiter, contributing to the planet`s faint ring system.', false);
INSERT INTO public.moon VALUES (8, 'Rhea', 4, 'A heavily cratered, icy moon with a low density, suggesting it is composed mostly of water ice.', false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 'Known for its two-toned surface (one hemisphere is dark, the other bright) and a prominent equatorial ridge.', false);
INSERT INTO public.moon VALUES (11, 'Mimas', 4, 'A small moon with a heavily cratered surface, including the large Herschel Crater, which gives it a resemblance to the "Death Star" from Star Wars.', false);
INSERT INTO public.moon VALUES (12, 'Titania', 5, 'The largest moon of Uranus, with a surface marked by canyons, faults, and possible cryovolcanic activity.', false);
INSERT INTO public.moon VALUES (13, 'Oberon', 5, 'The outermost of Uranus`s major moons, with a heavily cratered surface and tall mountain peaks.', false);
INSERT INTO public.moon VALUES (14, 'Umbriel', 5, 'A dark moon with a surface covered in ancient, dark material, possibly organic compounds.', false);
INSERT INTO public.moon VALUES (15, 'Ariel', 5, 'A moon with a relatively young surface, featuring canyons and ridges, suggesting past geological activity.', false);
INSERT INTO public.moon VALUES (16, 'Miranda', 5, 'A small, icy moon with a chaotic surface of cliffs, canyons, and terraces, likely shaped by past tectonic activity.', false);
INSERT INTO public.moon VALUES (18, 'Neptune', 6, 'A large, irregularly shaped moon with a heavily cratered surface, just below the size threshold for hydrostatic equilibrium.', false);
INSERT INTO public.moon VALUES (19, 'Nereid', 6, 'A small, irregular moon with a highly eccentric orbit, possibly a captured asteroid or Kuiper Belt object.', false);
INSERT INTO public.moon VALUES (20, 'Luna - The Moon', 1, 'Earth`s only natural satellite, with a heavily cratered surface, vast basaltic plains (maria), and no atmosphere. It is tidally locked, always showing the same face to Earth.', false);
INSERT INTO public.moon VALUES (2, 'Europa', 3, 'An ice-covered moon with a subsurface ocean, considered one of the best candidates for extraterrestrial life.', true);
INSERT INTO public.moon VALUES (3, 'Ganymede', 3, 'The largest moon in the Solar System, even larger than Mercury. It has its own magnetic field and a mix of icy and rocky terrain.', true);
INSERT INTO public.moon VALUES (4, 'Callisto', 3, 'A heavily cratered moon with a surface rich in water ice and possibly a subsurface ocean.', true);
INSERT INTO public.moon VALUES (6, 'Titan', 4, 'The second-largest moon in the Solar System, with a thick nitrogen-rich atmosphere and liquid methane lakes on its surface.', true);
INSERT INTO public.moon VALUES (7, 'Enceladus', 4, 'A small, icy moon with active geysers spewing water vapor and ice from its subsurface ocean.', true);
INSERT INTO public.moon VALUES (9, 'Dione', 4, 'A moon with a mix of icy cliffs, craters, and smooth plains, possibly hosting a subsurface ocean.', true);
INSERT INTO public.moon VALUES (17, 'Triton', 6, 'The largest moon of Neptune, orbiting in a retrograde direction (opposite to Neptune`s rotation). It has active geysers and a thin nitrogen atmosphere.', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, 'The only known planet to support life, Earth has a diverse surface with liquid water, a nitrogen-oxygen atmosphere, and a single natural satellite, the Moon.', true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2, 'Known as the "Red Planet," Mars has a thin atmosphere, surface features like canyons and volcanoes, and two small, irregularly shaped moons.', true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 95, 'The largest planet in the Solar System, Jupiter is a gas giant with a Great Red Spot (a massive storm) and a system of rings. Its four largest moons (Io, Europa, Ganymede, Callisto) are known as the Galilean moons.', true);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 146, 'Famous for its prominent ring system, Saturn is a gas giant. Its largest moon, Titan, has a thick atmosphere and liquid methane lakes.', true);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 28, 'An ice giant with a blue-green hue due to methane in its atmosphere. It rotates on its side (axial tilt of ~98°) and has five major moons: Miranda, Ariel, Umbriel, Titania, and Oberon.', true);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 16, 'The windiest planet in the Solar System, Neptune is a blue ice giant. Its largest moon, Triton, orbits in the opposite direction of the planet`s rotation (retrograde orbit).', true);
INSERT INTO public.planet VALUES (7, 'TRAPPIST-1b', 2, 0, 'An Earth-sized exoplanet orbiting the red dwarf star TRAPPIST-1. It is likely tidally locked, with one side always facing the star.', true);
INSERT INTO public.planet VALUES (8, 'TRAPPIST-1e', 2, 0, 'Located in the habitable zone of TRAPPIST-1, this planet may have conditions suitable for liquid water.', true);
INSERT INTO public.planet VALUES (9, '55 Cancri f', 5, 0, 'A gas giant in the 55 Cancri system, orbiting its star in the habitable zone. It has a mass similar to Neptune.', true);
INSERT INTO public.planet VALUES (10, '55 Cancri e', 5, 0, 'A super-Earth with a rocky composition, but its extreme proximity to its star makes it inhospitable due to high temperatures.', true);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 4, 0, 'The first Earth-sized exoplanet discovered in the habitable zone of its star, Kepler-186. It orbits a red dwarf star.', true);
INSERT INTO public.planet VALUES (12, 'HR8832b (TOI-178 b)', 6, 0, 'A super-Earth in a resonant chain system, where its orbit is synchronized with other planets in the system.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 8, 'Sol is the star at the center of the Solar System. It is a G-type main-sequence star (G2V), composed primarily of hydrogen (~73%) and helium (~25%), with trace amounts of heavier elements like oxygen, carbon, neon, and iron. Sol has a surface temperature of approximately 5,500°C (9,932°F) and a core temperature of about 15 million°C (27 million°F), where nuclear fusion occurs, converting hydrogen into helium and releasing vast amounts of energy.');
INSERT INTO public.star VALUES (2, 'TRAPPIST-1', 1, 7, 'TRAPPIST-1 is an ultra-cool red dwarf star located approximately 40 light-years from Earth. All seven of its planets are Earth-sized, and three of them orbit within the star`s habitable zone, where liquid water could potentially exist');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 3, 'Proxima Centauri is a red dwarf star and the closest known star to the Sun, located approximately 4.24 light-years away in the Alpha Centauri star system. It is much smaller and dimmer than the Sun, with a mass of about 0.12 solar masses. Its planets include Proxima Centauri b, which orbits within the habitable zone.');
INSERT INTO public.star VALUES (4, 'Kepler-186', 1, 5, 'Kepler-186 is a red dwarf star located about 500 light-years from Earth. It is known for hosting Kepler-186f, the first Earth-sized exoplanet discovered in the habitable zone of its star. The star has a mass of approximately 0.48 solar masses.');
INSERT INTO public.star VALUES (5, '55 Cancri Copernicus', 1, 5, '55 Cancri is a binary star system located about 41 light-years from Earth. The primary star, 55 Cancri A, is a G-type main-sequence star similar to the Sun. The system includes a diverse range of exoplanets, from gas giants to super-Earths.');
INSERT INTO public.star VALUES (6, 'HR 8832 TOI-178', 1, 6, 'HR 8832 is a K-type main-sequence star located approximately 200 light-years away. Its planetary system is notable for its resonant chain of exoplanets, where the orbits of the planets are synchronized in a precise gravitational dance.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: galaxy galaxy_galaxy_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


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

