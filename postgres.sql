--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-12-16 23:07:36

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

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16416)
-- Name: meals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meals (
    id integer NOT NULL,
    meal text,
    category text,
    price integer,
    size integer,
    detail text
);


ALTER TABLE public.meals OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16436)
-- Name: Meals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.meals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Meals_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16437)
-- Name: btntop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.btntop (
    id integer NOT NULL,
    usertg text,
    datetime timestamp without time zone,
    meal text,
    category text,
    userid text
);


ALTER TABLE public.btntop OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16464)
-- Name: btntop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.btntop ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.btntop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16466)
-- Name: msghandler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.msghandler (
    id integer NOT NULL,
    usertg text,
    msg text,
    datetime timestamp without time zone,
    userid text
);


ALTER TABLE public.msghandler OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16465)
-- Name: msghandler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.msghandler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.msghandler_id_seq OWNER TO postgres;

--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 221
-- Name: msghandler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.msghandler_id_seq OWNED BY public.msghandler.id;


--
-- TOC entry 216 (class 1259 OID 16410)
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    id integer NOT NULL,
    name "char",
    sdv "char"
);


ALTER TABLE public.test OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16409)
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_id_seq OWNER TO postgres;

--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 215
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;


--
-- TOC entry 3190 (class 2604 OID 16469)
-- Name: msghandler id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.msghandler ALTER COLUMN id SET DEFAULT nextval('public.msghandler_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 16413)
-- Name: test id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
-- TOC entry 3345 (class 0 OID 16437)
-- Dependencies: 219
-- Data for Name: btntop; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (55, 'wingsoflibertyy', '2022-12-12 20:20:54.351871', 'Солянка', '🍜 Первые блюда', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (56, 'wingsoflibertyy', '2022-12-12 20:20:58.527172', 'Крем-суп с грибами', '🍜 Первые блюда', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (57, 'wingsoflibertyy', '2022-12-12 20:27:30.748163', 'Эклер', '🍰 Десерты', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (58, 'wingsoflibertyy', '2022-12-12 20:27:33.27803', 'Чизкейк с кокосом', '🍰 Десерты', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (59, 'wingsoflibertyy', '2022-12-12 20:27:41.012405', 'Милкшейк', '🥤 Напитки', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (60, 'wingsoflibertyy', '2022-12-12 20:27:46.903213', 'Милкшейк', '🥤 Напитки', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (61, 'wingsoflibertyy', '2022-12-12 20:27:50.493998', 'Глинтвейн', '🥤 Напитки', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (62, 'wingsoflibertyy', '2022-12-12 20:27:52.463047', 'Ледяной лимонад', '🥤 Напитки', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (63, 'wingsoflibertyy', '2022-12-12 20:27:54.329788', 'Милкшейк', '🥤 Напитки', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (64, 'wingsoflibertyy', '2022-12-12 20:28:03.611042', 'Глинтвейн', '🥤 Напитки', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (65, 'wingsoflibertyy', '2022-12-12 20:28:10.59765', 'Цезарь', '🥗 Салаты', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (66, 'wingsoflibertyy', '2022-12-12 20:28:12.366063', 'Пивной салат с фасолью', '🥗 Салаты', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (67, 'wingsoflibertyy', '2022-12-12 20:28:16.220246', 'Пивной салат с фасолью', '🥗 Салаты', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (68, 'wingsoflibertyy', '2022-12-12 20:31:32.638415', 'Тар-тар из говядины', '🍲 Горячие блюда', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (69, 'wingsoflibertyy', '2022-12-12 20:31:37.221528', 'Пицца', '🍲 Горячие блюда', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (70, 'wingsoflibertyy', '2022-12-12 20:31:39.285091', 'Тар-тар из говядины', '🍲 Горячие блюда', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (71, 'wingsoflibertyy', '2022-12-12 20:32:38.101513', 'Пивной салат с фасолью', '🥗 Салаты', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (72, 'wingsoflibertyy', '2022-12-12 20:32:42.79954', 'Пивной салат с фасолью', '🥗 Салаты', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (52, 'wingsoflibertyy', '2022-12-10 14:15:02.24323', 'Ледяной лимонад', '🥤 Напитки', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (53, 'wingsoflibertyy', '2022-12-12 18:38:35.387108', 'Чизкейк с кокосом', '🍰 Десерты', '759343451');
INSERT INTO public.btntop (id, usertg, datetime, meal, category, userid) OVERRIDING SYSTEM VALUE VALUES (54, 'wingsoflibertyy', '2022-12-12 18:50:39.819538', 'Макарун', '🍰 Десерты', '759343451');


--
-- TOC entry 3343 (class 0 OID 16416)
-- Dependencies: 217
-- Data for Name: meals; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (10, 'Эклер', '🍰 Десерты', 6, 90, 'Описание эклера');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (11, 'Макарун', '🍰 Десерты', 3, 15, 'Описание макаруна');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (12, 'Чизкейк с кокосом', '🍰 Десерты', 10, 100, 'Описание чизкейка');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (2, 'Тар-тар из говядины', '🍲 Горячие блюда', 18, 200, 'Описание тар-тара');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (4, 'Солянка', '🍜 Первые блюда', 12, 180, 'Описание солянки');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (5, 'Том-ям с морепродуктами', '🍜 Первые блюда', 22, 200, 'Описание том-яма');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (6, 'Крем-суп с грибами', '🍜 Первые блюда', 17, 180, 'Описание крем-супа');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (7, 'Цезарь', '🥗 Салаты', 14, 200, 'Описание цезаря');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (8, 'Греческий салат', '🥗 Салаты', 12, 190, 'Описание греческого салата');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (9, 'Пивной салат с фасолью', '🥗 Салаты', 10, 180, 'Описание пивного салата с фасолью');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (13, 'Глинтвейн', '🥤 Напитки', 12, 150, 'Описание глинтвейна');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (14, 'Ледяной лимонад', '🥤 Напитки', 6, 250, 'Описание лимонада');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (15, 'Милкшейк', '🥤 Напитки', 8, 200, 'Описание милкшейка');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (1, 'Пицца', '🍲 Горячие блюда', 25, 650, 'Описание пиццы');
INSERT INTO public.meals (id, meal, category, price, size, detail) OVERRIDING SYSTEM VALUE VALUES (3, 'Шаурма', '🍲 Горячие блюда', 10, 550, 'Описание шаурмы');


--
-- TOC entry 3348 (class 0 OID 16466)
-- Dependencies: 222
-- Data for Name: msghandler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (2, 'qwdqwd', NULL, NULL, NULL);
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (3, '651', 'asvad', NULL, NULL);
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (4, 'Roman', 'Hello world!!!', '2022-12-09 20:19:10.840353', NULL);
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (6, 'wingsoflibertyy', 'Отличный бот', '2022-12-09 20:28:14.024901', NULL);
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (7, 'wingsoflibertyy', 'Super menu!!!', '2022-12-09 20:36:48.870326', NULL);
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (8, 'wingsoflibertyy', 'aue', '2022-12-09 20:36:54.684347', NULL);
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (9, 'wingsoflibertyy', '😱😱😱', '2022-12-09 20:36:59.343576', NULL);
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (10, 'wingsoflibertyy', 'Привет', '2022-12-09 23:05:35.242548', NULL);
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (25, 'wingsoflibertyy', '325', '2022-12-10 14:02:46.856785', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (26, 'wingsoflibertyy', 'gfn', '2022-12-10 14:02:47.828204', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (27, 'wingsoflibertyy', 'dv', '2022-12-10 14:02:49.527815', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (28, 'wingsoflibertyy', 'good', '2022-12-10 14:03:19.226028', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (29, NULL, 'Привет', '2022-12-10 14:06:08.767476', '824613967');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (30, 'mariskr14', 'Пока', '2022-12-10 14:06:41.643223', '824613967');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (31, 'mariskr14', 'Отличный бот', '2022-12-10 14:06:45.562332', '824613967');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (32, 'mariskr14', 'Супер', '2022-12-10 14:06:47.588552', '824613967');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (33, 'mariskr14', 'Класс', '2022-12-10 14:06:49.319129', '824613967');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (34, 'mariskr14', '😁😁😁', '2022-12-10 14:06:56.68894', '824613967');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (35, 'wingsoflibertyy', ')))))', '2022-12-12 20:28:23.740418', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (36, 'wingsoflibertyy', '(((((', '2022-12-12 20:28:25.580422', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (37, 'wingsoflibertyy', 'Отлично!!!', '2022-12-12 20:28:35.40841', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (38, 'wingsoflibertyy', 'Очень хорошая кухня', '2022-12-12 20:28:42.802727', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (39, 'wingsoflibertyy', 'Информативный бот', '2022-12-12 20:28:54.560668', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (40, 'wingsoflibertyy', '11 из 10!!!', '2022-12-12 20:29:01.625245', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (41, 'wingsoflibertyy', '🏆🏆🏆🏆🏆', '2022-12-12 20:29:11.763872', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (42, 'wingsoflibertyy', '🤣🤣🤣🤣', '2022-12-12 20:29:18.963392', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (43, 'wingsoflibertyy', '🥳🥳🥳', '2022-12-12 20:29:25.463781', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (44, 'wingsoflibertyy', '🫡', '2022-12-12 20:29:31.861248', '759343451');
INSERT INTO public.msghandler (id, usertg, msg, datetime, userid) VALUES (45, 'wingsoflibertyy', '😱😱😱', '2022-12-12 20:30:38.770815', '759343451');


--
-- TOC entry 3342 (class 0 OID 16410)
-- Dependencies: 216
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.test (id, name, sdv) VALUES (1, '3', NULL);
INSERT INTO public.test (id, name, sdv) VALUES (2, 's', NULL);
INSERT INTO public.test (id, name, sdv) VALUES (3, 'e', NULL);
INSERT INTO public.test (id, name, sdv) VALUES (4, 'q', NULL);
INSERT INTO public.test (id, name, sdv) VALUES (5, '5', NULL);
INSERT INTO public.test (id, name, sdv) VALUES (6, '\321', NULL);


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 218
-- Name: Meals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Meals_id_seq"', 15, true);


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 220
-- Name: btntop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.btntop_id_seq', 72, true);


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 221
-- Name: msghandler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.msghandler_id_seq', 45, true);


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 215
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_id_seq', 6, true);


--
-- TOC entry 3194 (class 2606 OID 16420)
-- Name: meals Meals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meals
    ADD CONSTRAINT "Meals_pkey" PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 16443)
-- Name: btntop btntop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.btntop
    ADD CONSTRAINT btntop_pkey PRIMARY KEY (id);


--
-- TOC entry 3198 (class 2606 OID 16473)
-- Name: msghandler msghandler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.msghandler
    ADD CONSTRAINT msghandler_pkey PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 16415)
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


-- Completed on 2022-12-16 23:07:37

--
-- PostgreSQL database dump complete
--

