--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: mwang
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: public; Owner: mwang; Tablespace:
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    author character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.books OWNER TO mwang;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: mwang
--

CREATE SEQUENCE books_id_seq
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO mwang;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mwang
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mwang
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: mwang
--

COPY books (id, title, author, description) FROM stdin;
1   JerBear goes to the City    Garnee Smashington  A young hipster bear seeks his fortune in the wild city of Irvine.
2   Swarley's Big Day   Barney Stinson  Putting his Playbook aside, one man seeks a lifetime of happiness.
3   All Around the Roundabound  Anakin Groundsitter The riveting tale of a young lad taking pod-racing lessons from an instructor with a dark secret.
4   Mastering Crossfire: You'll get caught up in it Freddie Wong    It's sometime in the future, the ultimate challenge...  Crossfire!
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mwang
--

SELECT pg_catalog.setval('books_id_seq', 4, false);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: mwang; Tablespace:
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: mwang
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM mwang;
GRANT ALL ON SCHEMA public TO mwang;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


-- ----------------------------
--  Sequence structure for books_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."books_id_seq";
CREATE SEQUENCE "public"."books_id_seq" INCREMENT 1 START 5 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;

-- ----------------------------
--  Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS "public"."books";
CREATE TABLE "public"."books" (
    "id" int4 NOT NULL DEFAULT nextval('books_id_seq'::regclass),
    "title" varchar(255) NOT NULL COLLATE "default",
    "author" varchar(40) NOT NULL COLLATE "default",
    "description" text COLLATE "default"
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of books
-- ----------------------------
BEGIN;
INSERT INTO "public"."books" VALUES ('1', 'JerBear goes to the City', 'Garnee Smashington', 'A young hipster bear seeks his fortune in the wild city of Irvine.');
INSERT INTO "public"."books" VALUES ('2', 'Swarley''s Big Day', 'Barney Stinson', 'Putting his Playbook aside, one man seeks a lifetime of happiness.');
INSERT INTO "public"."books" VALUES ('3', 'All Around the Roundabound', 'Anakin Groundsitter', 'The riveting tale of a young lad taking pod-racing lessons from an instructor with a dark secret.');
INSERT INTO "public"."books" VALUES ('4', 'Mastering Crossfire: You''ll get caught up in it', 'Freddie Wong', 'It''s sometime in the future, the ultimate challenge...  Crossfire!');
COMMIT;


-- ----------------------------
--  Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."books_id_seq" RESTART 4 OWNED BY "books"."id";

-- ----------------------------
--  Primary key structure for table books
-- ----------------------------
ALTER TABLE "public"."books" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;
➜  lesson4 git:(master) ✗ owd
zsh: command not found: owd
➜  lesson4 git:(master) ✗ ls
backup.sql data.sql   goes       main.go
➜  lesson4 git:(master) ✗ pwd
/Users/mwang/mygo/src/ming_/Lessons/lesson4
➜  lesson4 git:(master) ✗ ls
backup.sql data.sql   goes       main.go
➜  lesson4 git:(master) ✗ cat *sql
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: mwang
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: public; Owner: mwang; Tablespace:
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    author character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.books OWNER TO mwang;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: mwang
--

CREATE SEQUENCE books_id_seq
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO mwang;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mwang
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mwang
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: mwang
--

COPY books (id, title, author, description) FROM stdin;
1   JerBear goes to the City    Garnee Smashington  A young hipster bear seeks his fortune in the wild city of Irvine.
2   Swarley's Big Day   Barney Stinson  Putting his Playbook aside, one man seeks a lifetime of happiness.
3   All Around the Roundabound  Anakin Groundsitter The riveting tale of a young lad taking pod-racing lessons from an instructor with a dark secret.
4   Mastering Crossfire: You'll get caught up in it Freddie Wong    It's sometime in the future, the ultimate challenge...  Crossfire!
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mwang
--

SELECT pg_catalog.setval('books_id_seq', 4, false);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: mwang; Tablespace:
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: mwang
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM mwang;
GRANT ALL ON SCHEMA public TO mwang;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


-- ----------------------------
--  Sequence structure for books_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."books_id_seq";
CREATE SEQUENCE "public"."books_id_seq" INCREMENT 1 START 5 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;

-- ----------------------------
--  Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS "public"."books";
CREATE TABLE "public"."books" (
    "id" int4 NOT NULL DEFAULT nextval('books_id_seq'::regclass),
    "title" varchar(255) NOT NULL COLLATE "default",
    "author" varchar(40) NOT NULL COLLATE "default",
    "description" text COLLATE "default"
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of books
-- ----------------------------
BEGIN;
INSERT INTO "public"."books" VALUES ('1', 'JerBear goes to the City', 'Garnee Smashington', 'A young hipster bear seeks his fortune in the wild city of Irvine.');
INSERT INTO "public"."books" VALUES ('2', 'Swarley''s Big Day', 'Barney Stinson', 'Putting his Playbook aside, one man seeks a lifetime of happiness.');
INSERT INTO "public"."books" VALUES ('3', 'All Around the Roundabound', 'Anakin Groundsitter', 'The riveting tale of a young lad taking pod-racing lessons from an instructor with a dark secret.');
INSERT INTO "public"."books" VALUES ('4', 'Mastering Crossfire: You''ll get caught up in it', 'Freddie Wong', 'It''s sometime in the future, the ultimate challenge...  Crossfire!');
COMMIT;


-- ----------------------------
--  Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."books_id_seq" RESTART 4 OWNED BY "books"."id";

-- ----------------------------
--  Primary key structure for table books
-- ----------------------------
ALTER TABLE "public"."books" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;
