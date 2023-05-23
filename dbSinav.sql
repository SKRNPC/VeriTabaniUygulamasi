--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-08-28 22:48:37

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
-- TOC entry 4 (class 2615 OID 16604)
-- Name: insan; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA insan;


ALTER SCHEMA insan OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 16710)
-- Name: dersgetir(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dersgetir(prmt character varying) RETURNS TABLE(idders integer, dersad character varying)
    LANGUAGE plpgsql
    AS $$
	BEGIN
		return query
		select
		ders_id,
		ders_adi
		
		from
		ders
		where
		ders_adi like prmt;
	end;
	$$;


ALTER FUNCTION public.dersgetir(prmt character varying) OWNER TO postgres;

--
-- TOC entry 231 (class 1255 OID 16702)
-- Name: dersidyeni(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dersidyeni() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
 	IF NEW."ders_id" <> OLD."ders_id" THEN
 	INSERT INTO "ders_id_yeni"("soru_id", "eski_ders_id", "yeni_ders_id")
 	VALUES(OLD."soru_id", OLD."ders_id", NEW."ders_id");
 	END IF;
	return new;
	end;
 	$$;


ALTER FUNCTION public.dersidyeni() OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 16714)
-- Name: derssayisi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.derssayisi() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
total INTEGER;
BEGIN
SELECT COUNT(*) INTO total FROM "ders";
RETURN total;
end;
$$;


ALTER FUNCTION public.derssayisi() OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 16715)
-- Name: okulsayisi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.okulsayisi() RETURNS integer
    LANGUAGE plpgsql
    AS $$
 DECLARE
 total INTEGER;
 BEGIN
 SELECT COUNT(*) INTO total FROM "okul";
 RETURN total;
 end;
 $$;


ALTER FUNCTION public.okulsayisi() OWNER TO postgres;

--
-- TOC entry 232 (class 1255 OID 16707)
-- Name: sorubul(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sorubul(soruid integer) RETURNS TABLE(sorumetin text, zorlukderece character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	return query
	SELECT
	sorumetni,
	zorluk
from 
	soru
where
	"soru_id"=soruid;
end;
$$;


ALTER FUNCTION public.sorubul(soruid integer) OWNER TO postgres;

--
-- TOC entry 230 (class 1255 OID 16686)
-- Name: sorusilinen(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sorusilinen() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
insert into silinensoru(soru_silinen_id,soru_dogrucevap)
values(old.soru_id,old.dogrucevap);
return new;
end;
$$;


ALTER FUNCTION public.sorusilinen() OWNER TO postgres;

--
-- TOC entry 228 (class 1255 OID 16677)
-- Name: toplam(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplam() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
update toplamsoru set sayi=sayi+1;
return new;
end;
$$;


ALTER FUNCTION public.toplam() OWNER TO postgres;

--
-- TOC entry 229 (class 1255 OID 16679)
-- Name: toplam2(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplam2() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
	update toplamsoru set sayi=sayi-1;
	return new;
	end;
	$$;


ALTER FUNCTION public.toplam2() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16605)
-- Name: insan; Type: TABLE; Schema: insan; Owner: postgres
--

CREATE TABLE insan.insan (
    insan_id integer NOT NULL,
    insan_adi character varying(40) NOT NULL,
    insan_soyadi character varying(40) NOT NULL,
    insan_tur character varying NOT NULL
);


ALTER TABLE insan.insan OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16612)
-- Name: ogrenci; Type: TABLE; Schema: insan; Owner: postgres
--

CREATE TABLE insan.ogrenci (
    insan_id integer NOT NULL,
    okul_id integer,
    sinif_id integer
);


ALTER TABLE insan.ogrenci OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16617)
-- Name: ogretmen; Type: TABLE; Schema: insan; Owner: postgres
--

CREATE TABLE insan.ogretmen (
    insan_id integer NOT NULL,
    okul_id integer,
    ders_id integer
);


ALTER TABLE insan.ogretmen OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16500)
-- Name: ders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ders (
    ders_id integer NOT NULL,
    ogretmen_id integer,
    ders_adi character varying(15) NOT NULL,
    ders_saati character varying(10)
);


ALTER TABLE public.ders OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16688)
-- Name: ders_id_yeni; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ders_id_yeni (
    soru_id integer,
    eski_ders_id integer,
    yeni_ders_id integer
);


ALTER TABLE public.ders_id_yeni OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16539)
-- Name: ders_turu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ders_turu (
    ders_tur_id integer NOT NULL,
    ders_id integer,
    ders_tur_adi character varying(20) NOT NULL
);


ALTER TABLE public.ders_turu OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16594)
-- Name: dogru_secenek; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dogru_secenek (
    dogru_id integer NOT NULL,
    dogru_cevap character varying(1)
);


ALTER TABLE public.dogru_secenek OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16556)
-- Name: not; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."not" (
    not_id integer NOT NULL,
    ogrenci_id integer NOT NULL,
    sinav_id integer NOT NULL,
    sinav_notu character varying(10) NOT NULL
);


ALTER TABLE public."not" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16436)
-- Name: okul; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.okul (
    okul_id integer NOT NULL,
    okul_adi character varying(30) NOT NULL,
    okul_tel character varying(11),
    okul_adres text
);


ALTER TABLE public.okul OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16516)
-- Name: secenek; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.secenek (
    secenek_id integer NOT NULL,
    secenek_a text NOT NULL,
    secenek_b text NOT NULL,
    secenek_c text NOT NULL,
    secenek_d text NOT NULL
);


ALTER TABLE public.secenek OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16683)
-- Name: silinensoru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.silinensoru (
    soru_silinen_id integer,
    soru_dogrucevap "char"
);


ALTER TABLE public.silinensoru OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16534)
-- Name: sinav; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sinav (
    toplam_soru integer,
    sinav_id integer NOT NULL,
    sinav_suresi character varying(10) NOT NULL
);


ALTER TABLE public.sinav OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16529)
-- Name: sinavHazirlama; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."sinavHazirlama" (
    "sinavHazirlama_id" integer NOT NULL,
    soru_id integer NOT NULL,
    ders_id integer NOT NULL,
    ders_tur_id integer NOT NULL
);


ALTER TABLE public."sinavHazirlama" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16454)
-- Name: sinif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sinif (
    sinif_id integer NOT NULL,
    ogretmen_id integer NOT NULL,
    sinifmevcudu integer,
    sinif_no character varying(10)
);


ALTER TABLE public.sinif OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16573)
-- Name: sonucbelgesi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sonucbelgesi (
    sonuc_id integer NOT NULL,
    not_id integer NOT NULL,
    sonuc_tarihi date,
    "sonuc_sıralama" integer
);


ALTER TABLE public.sonucbelgesi OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16493)
-- Name: soru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.soru (
    soru_id integer NOT NULL,
    sorumetni text NOT NULL,
    zorluk character varying(10),
    dogrucevap "char",
    secenek_id integer,
    ders_id integer
);


ALTER TABLE public.soru OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16672)
-- Name: toplamsoru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.toplamsoru (
    sayi integer
);


ALTER TABLE public.toplamsoru OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16584)
-- Name: zorluk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zorluk (
    zorluk_id integer NOT NULL,
    zorluk_derece character varying(10)
);


ALTER TABLE public.zorluk OWNER TO postgres;

--
-- TOC entry 3451 (class 0 OID 16605)
-- Dependencies: 222
-- Data for Name: insan; Type: TABLE DATA; Schema: insan; Owner: postgres
--

INSERT INTO insan.insan (insan_id, insan_adi, insan_soyadi, insan_tur) VALUES (1, 'ahmet', 'sezer', 'ogretmen');
INSERT INTO insan.insan (insan_id, insan_adi, insan_soyadi, insan_tur) VALUES (2, 'ali', 'ataman', 'ogrenci');
INSERT INTO insan.insan (insan_id, insan_adi, insan_soyadi, insan_tur) VALUES (3, 'melek', 'erkan', 'ogrenci');
INSERT INTO insan.insan (insan_id, insan_adi, insan_soyadi, insan_tur) VALUES (4, 'sabri', 'yılmaz', 'ogretmen');
INSERT INTO insan.insan (insan_id, insan_adi, insan_soyadi, insan_tur) VALUES (5, 'zeynep', 'ışık', 'ogrenci');
INSERT INTO insan.insan (insan_id, insan_adi, insan_soyadi, insan_tur) VALUES (6, 'erhan', 'kır', 'ogrenci');
INSERT INTO insan.insan (insan_id, insan_adi, insan_soyadi, insan_tur) VALUES (7, 'veli', 'tutkun', 'ogretmen');
INSERT INTO insan.insan (insan_id, insan_adi, insan_soyadi, insan_tur) VALUES (8, 'rasim', 'eker', 'ogretmen');
INSERT INTO insan.insan (insan_id, insan_adi, insan_soyadi, insan_tur) VALUES (9, 'sezen', 'kara', 'ogretmen');
INSERT INTO insan.insan (insan_id, insan_adi, insan_soyadi, insan_tur) VALUES (10, 'ayla', 'kutlu', 'ogretmen');
INSERT INTO insan.insan (insan_id, insan_adi, insan_soyadi, insan_tur) VALUES (11, 'sezai', 'camcı', 'ogrenci');
INSERT INTO insan.insan (insan_id, insan_adi, insan_soyadi, insan_tur) VALUES (12, 'koray', 'avcı', 'ogrenci');


--
-- TOC entry 3452 (class 0 OID 16612)
-- Dependencies: 223
-- Data for Name: ogrenci; Type: TABLE DATA; Schema: insan; Owner: postgres
--

INSERT INTO insan.ogrenci (insan_id, okul_id, sinif_id) VALUES (2, 1, 2);
INSERT INTO insan.ogrenci (insan_id, okul_id, sinif_id) VALUES (3, 1, 3);
INSERT INTO insan.ogrenci (insan_id, okul_id, sinif_id) VALUES (5, 1, 4);
INSERT INTO insan.ogrenci (insan_id, okul_id, sinif_id) VALUES (6, 1, 5);
INSERT INTO insan.ogrenci (insan_id, okul_id, sinif_id) VALUES (11, 1, 2);
INSERT INTO insan.ogrenci (insan_id, okul_id, sinif_id) VALUES (12, 1, 1);


--
-- TOC entry 3453 (class 0 OID 16617)
-- Dependencies: 224
-- Data for Name: ogretmen; Type: TABLE DATA; Schema: insan; Owner: postgres
--

INSERT INTO insan.ogretmen (insan_id, okul_id, ders_id) VALUES (1, 1, 1);
INSERT INTO insan.ogretmen (insan_id, okul_id, ders_id) VALUES (4, 1, 2);
INSERT INTO insan.ogretmen (insan_id, okul_id, ders_id) VALUES (10, 1, 3);
INSERT INTO insan.ogretmen (insan_id, okul_id, ders_id) VALUES (9, 1, 6);
INSERT INTO insan.ogretmen (insan_id, okul_id, ders_id) VALUES (8, 1, 5);
INSERT INTO insan.ogretmen (insan_id, okul_id, ders_id) VALUES (7, 1, 4);


--
-- TOC entry 3442 (class 0 OID 16500)
-- Dependencies: 213
-- Data for Name: ders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ders (ders_id, ogretmen_id, ders_adi, ders_saati) VALUES (1, 1, 'türkçe', '6');
INSERT INTO public.ders (ders_id, ogretmen_id, ders_adi, ders_saati) VALUES (2, 4, 'matematik', '12');
INSERT INTO public.ders (ders_id, ogretmen_id, ders_adi, ders_saati) VALUES (3, 10, 'tarih', '3');
INSERT INTO public.ders (ders_id, ogretmen_id, ders_adi, ders_saati) VALUES (4, 7, 'fizik', '8');
INSERT INTO public.ders (ders_id, ogretmen_id, ders_adi, ders_saati) VALUES (5, 8, 'coğrafya', '4');
INSERT INTO public.ders (ders_id, ogretmen_id, ders_adi, ders_saati) VALUES (6, 9, 'kimya', '4');


--
-- TOC entry 3456 (class 0 OID 16688)
-- Dependencies: 227
-- Data for Name: ders_id_yeni; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ders_id_yeni (soru_id, eski_ders_id, yeni_ders_id) VALUES (4, 2, 1);
INSERT INTO public.ders_id_yeni (soru_id, eski_ders_id, yeni_ders_id) VALUES (4, 1, 2);
INSERT INTO public.ders_id_yeni (soru_id, eski_ders_id, yeni_ders_id) VALUES (3, 2, 4);
INSERT INTO public.ders_id_yeni (soru_id, eski_ders_id, yeni_ders_id) VALUES (3, 2, 1);


--
-- TOC entry 3446 (class 0 OID 16539)
-- Dependencies: 217
-- Data for Name: ders_turu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ders_turu (ders_tur_id, ders_id, ders_tur_adi) VALUES (1, 1, 'sözel');
INSERT INTO public.ders_turu (ders_tur_id, ders_id, ders_tur_adi) VALUES (2, 2, 'sayısal');


--
-- TOC entry 3450 (class 0 OID 16594)
-- Dependencies: 221
-- Data for Name: dogru_secenek; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dogru_secenek (dogru_id, dogru_cevap) VALUES (1, 'A');
INSERT INTO public.dogru_secenek (dogru_id, dogru_cevap) VALUES (2, 'B');
INSERT INTO public.dogru_secenek (dogru_id, dogru_cevap) VALUES (3, 'C');
INSERT INTO public.dogru_secenek (dogru_id, dogru_cevap) VALUES (4, 'D');


--
-- TOC entry 3447 (class 0 OID 16556)
-- Dependencies: 218
-- Data for Name: not; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."not" (not_id, ogrenci_id, sinav_id, sinav_notu) VALUES (1, 3, 2, '90');
INSERT INTO public."not" (not_id, ogrenci_id, sinav_id, sinav_notu) VALUES (2, 5, 1, '60');
INSERT INTO public."not" (not_id, ogrenci_id, sinav_id, sinav_notu) VALUES (3, 6, 2, '42');
INSERT INTO public."not" (not_id, ogrenci_id, sinav_id, sinav_notu) VALUES (6, 11, 3, '45');
INSERT INTO public."not" (not_id, ogrenci_id, sinav_id, sinav_notu) VALUES (5, 12, 1, '55');
INSERT INTO public."not" (not_id, ogrenci_id, sinav_id, sinav_notu) VALUES (4, 2, 2, '63');


--
-- TOC entry 3439 (class 0 OID 16436)
-- Dependencies: 210
-- Data for Name: okul; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.okul (okul_id, okul_adi, okul_tel, okul_adres) VALUES (1, 'Anadolu Lisesi', '05345468412', 'sazlık mah. gül sok.');
INSERT INTO public.okul (okul_id, okul_adi, okul_tel, okul_adres) VALUES (2, 'fen Lisesi', '05345478412', 'asker mah. gül sok.');
INSERT INTO public.okul (okul_id, okul_adi, okul_tel, okul_adres) VALUES (3, 'meslek Lisesi', '05345278412', 'asker mah. köşe sok.');
INSERT INTO public.okul (okul_id, okul_adi, okul_tel, okul_adres) VALUES (4, 'kız Lisesi', '05345273412', 'yayla mah. fener sok.');


--
-- TOC entry 3443 (class 0 OID 16516)
-- Dependencies: 214
-- Data for Name: secenek; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.secenek (secenek_id, secenek_a, secenek_b, secenek_c, secenek_d) VALUES (1, 'a şıkkı', 'b şıkkı', 'c şıkkı', 'd şıkkı');
INSERT INTO public.secenek (secenek_id, secenek_a, secenek_b, secenek_c, secenek_d) VALUES (2, 'a şıkkı', 'b şıkkı', 'c şıkkı', 'd şıkkı');


--
-- TOC entry 3455 (class 0 OID 16683)
-- Dependencies: 226
-- Data for Name: silinensoru; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.silinensoru (soru_silinen_id, soru_dogrucevap) VALUES (45, 'C');
INSERT INTO public.silinensoru (soru_silinen_id, soru_dogrucevap) VALUES (4, 'A');
INSERT INTO public.silinensoru (soru_silinen_id, soru_dogrucevap) VALUES (3, 'A');
INSERT INTO public.silinensoru (soru_silinen_id, soru_dogrucevap) VALUES (3, 'D');


--
-- TOC entry 3445 (class 0 OID 16534)
-- Dependencies: 216
-- Data for Name: sinav; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sinav (toplam_soru, sinav_id, sinav_suresi) VALUES (30, 1, '60 dakika');
INSERT INTO public.sinav (toplam_soru, sinav_id, sinav_suresi) VALUES (15, 2, '35 dakika');
INSERT INTO public.sinav (toplam_soru, sinav_id, sinav_suresi) VALUES (20, 3, '45 dakika');


--
-- TOC entry 3444 (class 0 OID 16529)
-- Dependencies: 215
-- Data for Name: sinavHazirlama; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."sinavHazirlama" ("sinavHazirlama_id", soru_id, ders_id, ders_tur_id) VALUES (2, 2, 2, 2);
INSERT INTO public."sinavHazirlama" ("sinavHazirlama_id", soru_id, ders_id, ders_tur_id) VALUES (1, 1, 3, 1);
INSERT INTO public."sinavHazirlama" ("sinavHazirlama_id", soru_id, ders_id, ders_tur_id) VALUES (3, 3, 1, 1);


--
-- TOC entry 3440 (class 0 OID 16454)
-- Dependencies: 211
-- Data for Name: sinif; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sinif (sinif_id, ogretmen_id, sinifmevcudu, sinif_no) VALUES (1, 1, 30, '9-E');
INSERT INTO public.sinif (sinif_id, ogretmen_id, sinifmevcudu, sinif_no) VALUES (2, 4, 28, '9-F');
INSERT INTO public.sinif (sinif_id, ogretmen_id, sinifmevcudu, sinif_no) VALUES (3, 10, 29, '9-D');
INSERT INTO public.sinif (sinif_id, ogretmen_id, sinifmevcudu, sinif_no) VALUES (4, 8, 31, '9-C');
INSERT INTO public.sinif (sinif_id, ogretmen_id, sinifmevcudu, sinif_no) VALUES (5, 9, 30, '9-B');
INSERT INTO public.sinif (sinif_id, ogretmen_id, sinifmevcudu, sinif_no) VALUES (6, 7, 33, '9-B');


--
-- TOC entry 3448 (class 0 OID 16573)
-- Dependencies: 219
-- Data for Name: sonucbelgesi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sonucbelgesi (sonuc_id, not_id, sonuc_tarihi, "sonuc_sıralama") VALUES (1, 1, NULL, 1);
INSERT INTO public.sonucbelgesi (sonuc_id, not_id, sonuc_tarihi, "sonuc_sıralama") VALUES (2, 2, NULL, 2);
INSERT INTO public.sonucbelgesi (sonuc_id, not_id, sonuc_tarihi, "sonuc_sıralama") VALUES (3, 3, NULL, 3);


--
-- TOC entry 3441 (class 0 OID 16493)
-- Dependencies: 212
-- Data for Name: soru; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.soru (soru_id, sorumetni, zorluk, dogrucevap, secenek_id, ders_id) VALUES (1, '1. soru', '3', 'A', 1, 2);
INSERT INTO public.soru (soru_id, sorumetni, zorluk, dogrucevap, secenek_id, ders_id) VALUES (2, '2. soru', '3', 'A', 2, 2);


--
-- TOC entry 3454 (class 0 OID 16672)
-- Dependencies: 225
-- Data for Name: toplamsoru; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.toplamsoru (sayi) VALUES (2);


--
-- TOC entry 3449 (class 0 OID 16584)
-- Dependencies: 220
-- Data for Name: zorluk; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.zorluk (zorluk_id, zorluk_derece) VALUES (3, 'Zor');
INSERT INTO public.zorluk (zorluk_id, zorluk_derece) VALUES (2, 'Orta');
INSERT INTO public.zorluk (zorluk_id, zorluk_derece) VALUES (1, 'Kolay');


--
-- TOC entry 3273 (class 2606 OID 16611)
-- Name: insan insan_id_pk; Type: CONSTRAINT; Schema: insan; Owner: postgres
--

ALTER TABLE ONLY insan.insan
    ADD CONSTRAINT insan_id_pk PRIMARY KEY (insan_id);


--
-- TOC entry 3277 (class 2606 OID 16616)
-- Name: ogrenci ogrenciPK; Type: CONSTRAINT; Schema: insan; Owner: postgres
--

ALTER TABLE ONLY insan.ogrenci
    ADD CONSTRAINT "ogrenciPK" PRIMARY KEY (insan_id);


--
-- TOC entry 3281 (class 2606 OID 16621)
-- Name: ogretmen ogretmenPK; Type: CONSTRAINT; Schema: insan; Owner: postgres
--

ALTER TABLE ONLY insan.ogretmen
    ADD CONSTRAINT "ogretmenPK" PRIMARY KEY (insan_id);


--
-- TOC entry 3250 (class 2606 OID 16504)
-- Name: ders ders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ders
    ADD CONSTRAINT ders_pkey PRIMARY KEY (ders_id);


--
-- TOC entry 3259 (class 2606 OID 16543)
-- Name: ders_turu ders_turu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ders_turu
    ADD CONSTRAINT ders_turu_pkey PRIMARY KEY (ders_tur_id);


--
-- TOC entry 3271 (class 2606 OID 16598)
-- Name: dogru_secenek dogru_secenek_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dogru_secenek
    ADD CONSTRAINT dogru_secenek_pkey PRIMARY KEY (dogru_id);


--
-- TOC entry 3264 (class 2606 OID 16560)
-- Name: not not_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."not"
    ADD CONSTRAINT not_pkey PRIMARY KEY (not_id);


--
-- TOC entry 3241 (class 2606 OID 16442)
-- Name: okul okul_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.okul
    ADD CONSTRAINT okul_pkey PRIMARY KEY (okul_id);


--
-- TOC entry 3252 (class 2606 OID 16522)
-- Name: secenek secenek_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secenek
    ADD CONSTRAINT secenek_pkey PRIMARY KEY (secenek_id);


--
-- TOC entry 3255 (class 2606 OID 16533)
-- Name: sinavHazirlama sinavHazirlama_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."sinavHazirlama"
    ADD CONSTRAINT "sinavHazirlama_pkey" PRIMARY KEY ("sinavHazirlama_id");


--
-- TOC entry 3257 (class 2606 OID 16538)
-- Name: sinav sinav_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinav
    ADD CONSTRAINT sinav_pkey PRIMARY KEY (sinav_id);


--
-- TOC entry 3244 (class 2606 OID 16458)
-- Name: sinif sinif_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinif
    ADD CONSTRAINT sinif_pkey PRIMARY KEY (sinif_id);


--
-- TOC entry 3267 (class 2606 OID 16577)
-- Name: sonucbelgesi sonucbelgesi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sonucbelgesi
    ADD CONSTRAINT sonucbelgesi_pkey PRIMARY KEY (sonuc_id);


--
-- TOC entry 3248 (class 2606 OID 16499)
-- Name: soru soru_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soru
    ADD CONSTRAINT soru_pkey PRIMARY KEY (soru_id);


--
-- TOC entry 3269 (class 2606 OID 16588)
-- Name: zorluk zorluk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zorluk
    ADD CONSTRAINT zorluk_pkey PRIMARY KEY (zorluk_id);


--
-- TOC entry 3278 (class 1259 OID 16644)
-- Name: fki_ders_adi_foreign; Type: INDEX; Schema: insan; Owner: postgres
--

CREATE INDEX fki_ders_adi_foreign ON insan.ogretmen USING btree (ders_id);


--
-- TOC entry 3279 (class 1259 OID 16650)
-- Name: fki_insan_id_foreign; Type: INDEX; Schema: insan; Owner: postgres
--

CREATE INDEX fki_insan_id_foreign ON insan.ogretmen USING btree (insan_id);


--
-- TOC entry 3274 (class 1259 OID 16627)
-- Name: fki_okul_id_foreign; Type: INDEX; Schema: insan; Owner: postgres
--

CREATE INDEX fki_okul_id_foreign ON insan.ogrenci USING btree (okul_id);


--
-- TOC entry 3275 (class 1259 OID 16633)
-- Name: fki_sinif_id_foreign; Type: INDEX; Schema: insan; Owner: postgres
--

CREATE INDEX fki_sinif_id_foreign ON insan.ogrenci USING btree (sinif_id);


--
-- TOC entry 3245 (class 1259 OID 16510)
-- Name: fki_ders_adi_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ders_adi_foreign ON public.soru USING btree (ders_id);


--
-- TOC entry 3260 (class 1259 OID 16555)
-- Name: fki_ders_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ders_id_foreign ON public.ders_turu USING btree (ders_id);


--
-- TOC entry 3253 (class 1259 OID 16549)
-- Name: fki_ders_tur_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ders_tur_id_foreign ON public."sinavHazirlama" USING btree (ders_tur_id);


--
-- TOC entry 3265 (class 1259 OID 16583)
-- Name: fki_not_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_not_id ON public.sonucbelgesi USING btree (not_id);


--
-- TOC entry 3261 (class 1259 OID 16566)
-- Name: fki_ogrenci_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ogrenci_id_foreign ON public."not" USING btree (ogrenci_id);


--
-- TOC entry 3242 (class 1259 OID 16492)
-- Name: fki_ogretmen_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ogretmen_id_foreign ON public.sinif USING btree (ogretmen_id);


--
-- TOC entry 3246 (class 1259 OID 16528)
-- Name: fki_secenek_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_secenek_id_foreign ON public.soru USING btree (secenek_id);


--
-- TOC entry 3262 (class 1259 OID 16572)
-- Name: fki_sinav_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sinav_id ON public."not" USING btree (sinav_id);


--
-- TOC entry 3296 (class 2620 OID 16703)
-- Name: soru dersidtrig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER dersidtrig BEFORE UPDATE ON public.soru FOR EACH ROW EXECUTE FUNCTION public.dersidyeni();


--
-- TOC entry 3299 (class 2620 OID 16687)
-- Name: soru silinentrig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER silinentrig AFTER DELETE ON public.soru FOR EACH ROW EXECUTE FUNCTION public.sorusilinen();


--
-- TOC entry 3297 (class 2620 OID 16678)
-- Name: soru toplamtrig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER toplamtrig AFTER INSERT ON public.soru FOR EACH ROW EXECUTE FUNCTION public.toplam();


--
-- TOC entry 3298 (class 2620 OID 16682)
-- Name: soru toplamtrig2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER toplamtrig2 AFTER DELETE ON public.soru FOR EACH ROW EXECUTE FUNCTION public.toplam2();


--
-- TOC entry 3295 (class 2606 OID 16645)
-- Name: ogretmen insan_id_foreign; Type: FK CONSTRAINT; Schema: insan; Owner: postgres
--

ALTER TABLE ONLY insan.ogretmen
    ADD CONSTRAINT insan_id_foreign FOREIGN KEY (insan_id) REFERENCES insan.insan(insan_id) NOT VALID;


--
-- TOC entry 3293 (class 2606 OID 16651)
-- Name: ogrenci insan_id_foreign; Type: FK CONSTRAINT; Schema: insan; Owner: postgres
--

ALTER TABLE ONLY insan.ogrenci
    ADD CONSTRAINT insan_id_foreign FOREIGN KEY (insan_id) REFERENCES insan.insan(insan_id) NOT VALID;


--
-- TOC entry 3291 (class 2606 OID 16622)
-- Name: ogrenci okul_id_foreign; Type: FK CONSTRAINT; Schema: insan; Owner: postgres
--

ALTER TABLE ONLY insan.ogrenci
    ADD CONSTRAINT okul_id_foreign FOREIGN KEY (okul_id) REFERENCES public.okul(okul_id) NOT VALID;


--
-- TOC entry 3294 (class 2606 OID 16634)
-- Name: ogretmen okul_id_foreign; Type: FK CONSTRAINT; Schema: insan; Owner: postgres
--

ALTER TABLE ONLY insan.ogretmen
    ADD CONSTRAINT okul_id_foreign FOREIGN KEY (okul_id) REFERENCES public.okul(okul_id) NOT VALID;


--
-- TOC entry 3292 (class 2606 OID 16628)
-- Name: ogrenci sinif_id_foreign; Type: FK CONSTRAINT; Schema: insan; Owner: postgres
--

ALTER TABLE ONLY insan.ogrenci
    ADD CONSTRAINT sinif_id_foreign FOREIGN KEY (sinif_id) REFERENCES public.sinif(sinif_id) NOT VALID;


--
-- TOC entry 3283 (class 2606 OID 16505)
-- Name: soru ders_adi_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soru
    ADD CONSTRAINT ders_adi_foreign FOREIGN KEY (ders_id) REFERENCES public.ders(ders_id) NOT VALID;


--
-- TOC entry 3287 (class 2606 OID 16550)
-- Name: ders_turu ders_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ders_turu
    ADD CONSTRAINT ders_id_foreign FOREIGN KEY (ders_id) REFERENCES public.ders(ders_id) NOT VALID;


--
-- TOC entry 3286 (class 2606 OID 16544)
-- Name: sinavHazirlama ders_tur_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."sinavHazirlama"
    ADD CONSTRAINT ders_tur_id_foreign FOREIGN KEY (ders_tur_id) REFERENCES public.ders_turu(ders_tur_id) NOT VALID;


--
-- TOC entry 3290 (class 2606 OID 16578)
-- Name: sonucbelgesi not_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sonucbelgesi
    ADD CONSTRAINT not_id FOREIGN KEY (not_id) REFERENCES public."not"(not_id) NOT VALID;


--
-- TOC entry 3289 (class 2606 OID 16667)
-- Name: not ogrenci_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."not"
    ADD CONSTRAINT ogrenci_id_foreign FOREIGN KEY (ogrenci_id) REFERENCES insan.ogrenci(insan_id) NOT VALID;


--
-- TOC entry 3282 (class 2606 OID 16657)
-- Name: sinif ogretmen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinif
    ADD CONSTRAINT ogretmen_id_foreign FOREIGN KEY (ogretmen_id) REFERENCES insan.ogretmen(insan_id) NOT VALID;


--
-- TOC entry 3285 (class 2606 OID 16662)
-- Name: ders ogretmen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ders
    ADD CONSTRAINT ogretmen_id_foreign FOREIGN KEY (ogretmen_id) REFERENCES insan.ogretmen(insan_id) NOT VALID;


--
-- TOC entry 3284 (class 2606 OID 16523)
-- Name: soru secenek_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soru
    ADD CONSTRAINT secenek_id_foreign FOREIGN KEY (secenek_id) REFERENCES public.secenek(secenek_id) NOT VALID;


--
-- TOC entry 3288 (class 2606 OID 16567)
-- Name: not sinav_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."not"
    ADD CONSTRAINT sinav_id FOREIGN KEY (sinav_id) REFERENCES public.sinav(sinav_id) NOT VALID;


-- Completed on 2022-08-28 22:48:37

--
-- PostgreSQL database dump complete
--

