DROP TABLE raw_country_ethnicity;

CREATE TABLE public.raw_country_ethnicity
(
    country_name character varying(64) COLLATE pg_catalog."default",
	ethnicity character varying(2000) COLLATE pg_catalog."default",
	years character varying(15) COLLATE pg_catalog."default",
	notes character varying(1000) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.raw_country_ethnicity
    OWNER to postgres;


DROP TABLE raw_country_ethnicity_prenormalized;

CREATE TABLE raw_country_ethnicity_prenormalized
AS
SELECT country_name, TRIM(UNNEST(string_to_array(ethnicity, ','))) AS ethnicity_percent
FROM raw_country_ethnicity

DROP TABLE raw_country_ethnicity_normalized;

CREATE TABLE raw_country_ethnicity_normalized
AS
SELECT country_name, ethnicity_percent,
	TRIM(SUBSTRING(ethnicity_percent FROM '[^\d]+')) AS ethnicity,
		TRIM(SUBSTRING(ethnicity_percent FROM '[\d].+')) AS percent
FROM raw_country_ethnicity_prenormalized

ALTER TABLE raw_country_ethnicity_normalized ADD alpha_3_code character varying(3) COLLATE pg_catalog."default";
ALTER TABLE raw_country_ethnicity_normalized ADD country_name_std character varying(64) COLLATE pg_catalog."default";


UPDATE raw_country_ethnicity_normalized a
SET alpha_3_code = (SELECT c.alpha_3_code FROM (SELECT DISTINCT country_name, alpha_3_code
		FROM country) c WHERE a.country_name = c.country_name),
	country_name_std = (SELECT c.country_name FROM (SELECT DISTINCT country_name, alpha_3_code
		FROM country) c WHERE a.country_name = c.country_name);

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'BHS',
	country_name_std = 'The Bahamas'
WHERE country_name = 'Bahamas';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'COD',
	country_name_std = 'Democratic Republic of the Congo'
WHERE country_name = 'Congo, Democratic Republic of the';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'PRK',
	country_name_std = 'North Korea'
WHERE country_name = 'Korea, North';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'CZE',
	country_name_std = 'Czechia'
WHERE country_name = 'Czech Republic';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'LCA',
	country_name_std = 'Saint Lucia'
WHERE country_name = 'St. Lucia';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'STP',
	country_name_std = 'Sao Tome and Principe'
WHERE country_name = 'São Tomé and Príncipe';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'MKD',
	country_name_std = 'North Macedonia'
WHERE country_name = 'Macedonia';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'LAO',
	country_name_std = 'Lao People''s Democratic Republic'
WHERE country_name = 'Laos';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'COG',
	country_name_std = 'Congo'
WHERE country_name = 'Congo, Republic of';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'TLS',
	country_name_std = 'Timor-Leste'
WHERE country_name = 'East Timor';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'SWZ',
	country_name_std = 'Eswatini'
WHERE country_name = 'Swaziland';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'FSM',
	country_name_std = 'Micronesia (Federated States of)'
WHERE country_name = 'Micronesia';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'CPV',
	country_name_std = 'Cabo Verde'
WHERE country_name = 'Cape Verde';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'ESH',
	country_name_std = 'Western Sahara'
WHERE country_name = 'Western Sahara (proposed state)';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'VCT',
	country_name_std = 'Saint Vincent and the Grenadines'
WHERE country_name = 'St. Vincent and the Grenadines';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'PSE',
	country_name_std = 'State of Palestine'
WHERE country_name = 'Palestinian State (proposed)';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'KNA',
	country_name_std = 'Saint Kitts and Nevis'
WHERE country_name = 'St. Kitts and Nevis';

UPDATE raw_country_ethnicity_normalized ma
SET alpha_3_code = 'KOR',
	country_name_std = 'South Korea'
WHERE country_name = 'Korea, South';

DROP TABLE country_ethnicity;

CREATE TABLE public.country_ethnicity
(
    country_name character varying(64) COLLATE pg_catalog."default",
	alpha_3_code character varying(3) COLLATE pg_catalog."default",
	ethnicity character varying(1000) COLLATE pg_catalog."default",
	percent character varying(15) COLLATE pg_catalog."default"	
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.country_ethnicity
    OWNER to postgres;

INSERT INTO country_ethnicity
SELECT country_name_std, alpha_3_code, ethnicity, percent
FROM raw_country_ethnicity_normalized
WHERE length(percent) <= 5 --filter out some broken records
ORDER BY country_name;

