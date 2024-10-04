--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-10-04 19:18:15

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
-- TOC entry 218 (class 1259 OID 16424)
-- Name: buy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buy (
    component_id integer NOT NULL,
    factory_id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.buy OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16490)
-- Name: component_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component_category (
    name character varying(20) NOT NULL,
    category character varying(30) NOT NULL
);


ALTER TABLE public.component_category OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16414)
-- Name: components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components (
    component_id integer NOT NULL,
    name character varying(20) NOT NULL,
    weight double precision NOT NULL,
    device_id integer
);


ALTER TABLE public.components OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16404)
-- Name: device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device (
    device_id integer NOT NULL,
    name character varying(20) NOT NULL,
    task character varying(200) NOT NULL,
    "operating system" character varying(20) NOT NULL,
    factory_id integer NOT NULL,
    date timestamp with time zone
);


ALTER TABLE public.device OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: factory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factory (
    factory_id integer NOT NULL,
    name character varying(30) NOT NULL,
    specialization character varying(60) NOT NULL,
    address character varying(70) NOT NULL
);


ALTER TABLE public.factory OWNER TO postgres;

--
-- TOC entry 4866 (class 0 OID 16424)
-- Dependencies: 218
-- Data for Name: buy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buy (component_id, factory_id, date, price) FROM stdin;
3	3	2019-06-01 00:00:00+03	5.5
1	1	2010-03-01 00:00:00+02	8.3
2	2	2013-03-20 00:00:00+02	7.8
\.


--
-- TOC entry 4867 (class 0 OID 16490)
-- Dependencies: 219
-- Data for Name: component_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_category (name, category) FROM stdin;
LiDAR sensors	Sensors
Servo motors	Drives and motors
Gearboxes	Mechanical transmissions
\.


--
-- TOC entry 4865 (class 0 OID 16414)
-- Dependencies: 217
-- Data for Name: components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components (component_id, name, weight, device_id) FROM stdin;
2	Servo motors	25.3	2
3	LiDAR sensors	1.5	3
1	Gearboxes	53.21	1
\.


--
-- TOC entry 4864 (class 0 OID 16404)
-- Dependencies: 216
-- Data for Name: device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device (device_id, name, task, "operating system", factory_id, date) FROM stdin;
3	robot Spot	inspection of hard-to-reach or dangerous places, data collection, and assistance in rescue operations	Spot SDK	3	2019-09-09 00:00:00+03
2	robot IRB 6700	heavy lifting operations, welding, material handling, automation of assembly processes	RobotWare	2	2013-04-01 00:00:00+03
1	robot KR QUANTEC	universal production processes such as welding, packaging, component handling, and precision material processing.	KUKA System Software	1	2010-03-15 00:00:00+02
\.


--
-- TOC entry 4863 (class 0 OID 16399)
-- Dependencies: 215
-- Data for Name: factory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factory (factory_id, name, specialization, address) FROM stdin;
1	KUKA Robotics	industrial robots for assembly and processing	1500 KUKA Way, Shelby Township, MI 48315, USA
3	Boston Dynamics	mobile robots with advanced maneuvering capabilities	78 4th Avenue, Waltham, MA 02451, USA
2	ABB Robotics	industrial robots for automation of production processes	1250 Westec Drive, Auburn Hills, MI 48326, USA
\.


--
-- TOC entry 4704 (class 2606 OID 16515)
-- Name: factory address; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factory
    ADD CONSTRAINT address UNIQUE (address);


--
-- TOC entry 4712 (class 2606 OID 16474)
-- Name: buy buy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buy
    ADD CONSTRAINT buy_pkey PRIMARY KEY (component_id);


--
-- TOC entry 4714 (class 2606 OID 16498)
-- Name: component_category component_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_category
    ADD CONSTRAINT component_category_pkey PRIMARY KEY (name);


--
-- TOC entry 4710 (class 2606 OID 16418)
-- Name: components components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT components_pkey PRIMARY KEY (component_id);


--
-- TOC entry 4708 (class 2606 OID 16408)
-- Name: device device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (device_id);


--
-- TOC entry 4706 (class 2606 OID 16403)
-- Name: factory factory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factory
    ADD CONSTRAINT factory_pkey PRIMARY KEY (factory_id);


--
-- TOC entry 4718 (class 2606 OID 16477)
-- Name: buy component_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buy
    ADD CONSTRAINT component_id FOREIGN KEY (component_id) REFERENCES public.components(component_id) NOT VALID;


--
-- TOC entry 4716 (class 2606 OID 16419)
-- Name: components device_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT device_id FOREIGN KEY (device_id) REFERENCES public.device(device_id);


--
-- TOC entry 4715 (class 2606 OID 16409)
-- Name: device factory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT factory_id FOREIGN KEY (factory_id) REFERENCES public.factory(factory_id);


--
-- TOC entry 4719 (class 2606 OID 16466)
-- Name: buy factory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buy
    ADD CONSTRAINT factory_id FOREIGN KEY (factory_id) REFERENCES public.factory(factory_id) NOT VALID;


--
-- TOC entry 4717 (class 2606 OID 16509)
-- Name: components name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT name FOREIGN KEY (name) REFERENCES public.component_category(name) NOT VALID;


-- Completed on 2024-10-04 19:18:15

--
-- PostgreSQL database dump complete
--

