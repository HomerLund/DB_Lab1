--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-19 23:49:58

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
-- Name: buy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.buy (
    component_id integer NOT NULL,
    factory_id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    price double precision NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 16414)
-- Name: components; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.components (
    component_id integer NOT NULL,
    name character varying(20) NOT NULL,
    weight double precision NOT NULL,
    category character varying(30) NOT NULL,
    device_id integer
);


--
-- TOC entry 216 (class 1259 OID 16404)
-- Name: device; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.device (
    device_id integer NOT NULL,
    name character varying(20) NOT NULL,
    task character varying(200) NOT NULL,
    "operating system" character varying(20) NOT NULL,
    factory_id integer NOT NULL,
    date timestamp with time zone
);


--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: factory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory (
    factory_id integer NOT NULL,
    name character varying(30) NOT NULL,
    specialization character varying(60) NOT NULL,
    address character varying(70) NOT NULL
);


--
-- TOC entry 4706 (class 2606 OID 16474)
-- Name: buy buy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buy
    ADD CONSTRAINT buy_pkey PRIMARY KEY (component_id);


--
-- TOC entry 4704 (class 2606 OID 16418)
-- Name: components components_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT components_pkey PRIMARY KEY (component_id);


--
-- TOC entry 4702 (class 2606 OID 16408)
-- Name: device device_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (device_id);


--
-- TOC entry 4700 (class 2606 OID 16403)
-- Name: factory factory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory
    ADD CONSTRAINT factory_pkey PRIMARY KEY (factory_id);


--
-- TOC entry 4709 (class 2606 OID 16477)
-- Name: buy component_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buy
    ADD CONSTRAINT component_id FOREIGN KEY (component_id) REFERENCES public.components(component_id) NOT VALID;


--
-- TOC entry 4708 (class 2606 OID 16419)
-- Name: components device_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT device_id FOREIGN KEY (device_id) REFERENCES public.device(device_id);


--
-- TOC entry 4707 (class 2606 OID 16409)
-- Name: device factory_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT factory_id FOREIGN KEY (factory_id) REFERENCES public.factory(factory_id);


--
-- TOC entry 4710 (class 2606 OID 16466)
-- Name: buy factory_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.buy
    ADD CONSTRAINT factory_id FOREIGN KEY (factory_id) REFERENCES public.factory(factory_id) NOT VALID;


-- Completed on 2024-09-19 23:49:59

--
-- PostgreSQL database dump complete
--

