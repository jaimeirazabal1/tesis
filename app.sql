--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-02-18 13:52:32 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 176 (class 3079 OID 11829)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 176
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 175 (class 1259 OID 16855)
-- Name: prioridad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE prioridad (
    id integer NOT NULL,
    descripcion character varying(20)
);


ALTER TABLE public.prioridad OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16853)
-- Name: prioridad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prioridad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prioridad_id_seq OWNER TO postgres;

--
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 174
-- Name: prioridad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prioridad_id_seq OWNED BY prioridad.id;


--
-- TOC entry 173 (class 1259 OID 16844)
-- Name: solicitud; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE solicitud (
    id integer NOT NULL,
    prioridad_id integer,
    descripcion text,
    fecha timestamp without time zone,
    user_id integer,
    activo boolean,
    solicitante character varying(50),
    telefono_solicitante character varying(50),
    ubicacion text
);


ALTER TABLE public.solicitud OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16842)
-- Name: solicitud_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE solicitud_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitud_id_seq OWNER TO postgres;

--
-- TOC entry 2046 (class 0 OID 0)
-- Dependencies: 172
-- Name: solicitud_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE solicitud_id_seq OWNED BY solicitud.id;


--
-- TOC entry 171 (class 1259 OID 16396)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    correo character varying(100),
    password character varying(100),
    created timestamp without time zone DEFAULT now()
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 16394)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 170
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- TOC entry 1917 (class 2604 OID 16858)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prioridad ALTER COLUMN id SET DEFAULT nextval('prioridad_id_seq'::regclass);


--
-- TOC entry 1916 (class 2604 OID 16847)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solicitud ALTER COLUMN id SET DEFAULT nextval('solicitud_id_seq'::regclass);


--
-- TOC entry 1914 (class 2604 OID 16399)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 2036 (class 0 OID 16855)
-- Dependencies: 175
-- Data for Name: prioridad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO prioridad (id, descripcion) VALUES (1, 'URGENTE');
INSERT INTO prioridad (id, descripcion) VALUES (2, 'NORMAL');
INSERT INTO prioridad (id, descripcion) VALUES (3, 'RECURRENTE');
INSERT INTO prioridad (id, descripcion) VALUES (4, 'EMERGENCIA');


--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 174
-- Name: prioridad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('prioridad_id_seq', 4, true);


--
-- TOC entry 2034 (class 0 OID 16844)
-- Dependencies: 173
-- Data for Name: solicitud; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 172
-- Name: solicitud_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solicitud_id_seq', 1, false);


--
-- TOC entry 2032 (class 0 OID 16396)
-- Dependencies: 171
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "user" (id, correo, password, created) VALUES (25, 'jaimeirazabal1@gmail.com', '7d3ff5e583a1727c07bd911d427b514b', '2015-01-28 09:19:35.074043');
INSERT INTO "user" (id, correo, password, created) VALUES (27, 'kevin@kevin.com', '81dc9bdb52d04dc20036dbd8313ed055', '2015-01-28 14:13:44.408923');
INSERT INTO "user" (id, correo, password, created) VALUES (28, 'nuevo@nuevo.com', 'e26c062fedf6b32834e4de93f9c8b644', '2015-01-28 14:25:00.193642');
INSERT INTO "user" (id, correo, password, created) VALUES (29, 'hola@hola.com', '4d186321c1a7f0f354b297e8914ab240', '2015-01-28 14:28:10.850713');
INSERT INTO "user" (id, correo, password, created) VALUES (30, 'a@a.com', '0cc175b9c0f1b6a831c399e269772661', '2015-01-28 14:29:21.791712');


--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 170
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 31, true);


--
-- TOC entry 1923 (class 2606 OID 16860)
-- Name: prioridad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY prioridad
    ADD CONSTRAINT prioridad_pkey PRIMARY KEY (id);


--
-- TOC entry 1921 (class 2606 OID 16852)
-- Name: solicitud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY solicitud
    ADD CONSTRAINT solicitud_pkey PRIMARY KEY (id);


--
-- TOC entry 1919 (class 2606 OID 16402)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-02-18 13:52:32 VET

--
-- PostgreSQL database dump complete
--

