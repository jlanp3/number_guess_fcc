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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: stats; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stats (
    best_game integer,
    u_id integer NOT NULL
);


ALTER TABLE public.stats OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    u_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_u_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_u_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_u_id_seq OWNER TO freecodecamp;

--
-- Name: users_u_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_u_id_seq OWNED BY public.users.u_id;


--
-- Name: users u_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN u_id SET DEFAULT nextval('public.users_u_id_seq'::regclass);


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stats VALUES (7, 24);
INSERT INTO public.stats VALUES (469, 25);
INSERT INTO public.stats VALUES (265, 25);
INSERT INTO public.stats VALUES (443, 26);
INSERT INTO public.stats VALUES (61, 26);
INSERT INTO public.stats VALUES (836, 25);
INSERT INTO public.stats VALUES (241, 25);
INSERT INTO public.stats VALUES (273, 25);
INSERT INTO public.stats VALUES (693, 27);
INSERT INTO public.stats VALUES (180, 27);
INSERT INTO public.stats VALUES (551, 28);
INSERT INTO public.stats VALUES (781, 28);
INSERT INTO public.stats VALUES (502, 27);
INSERT INTO public.stats VALUES (981, 27);
INSERT INTO public.stats VALUES (292, 27);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (24, 'jose');
INSERT INTO public.users VALUES (25, 'user_1727646561152');
INSERT INTO public.users VALUES (26, 'user_1727646561151');
INSERT INTO public.users VALUES (27, 'user_1727646913202');
INSERT INTO public.users VALUES (28, 'user_1727646913201');


--
-- Name: users_u_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_u_id_seq', 28, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (u_id);


--
-- Name: stats stats_u_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_u_id_fkey FOREIGN KEY (u_id) REFERENCES public.users(u_id);


--
-- PostgreSQL database dump complete
--

