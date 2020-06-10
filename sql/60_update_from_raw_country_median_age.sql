DROP TABLE raw_country_median_age;

CREATE TABLE public.raw_country_median_age
(
    country_name character varying(64) COLLATE pg_catalog."default",
	median_age double precision,
	median_age_male double precision,
	median_age_female double precision,
	alpha_3_code character varying(3) COLLATE pg_catalog."default",
	country_name_std character varying(64) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.raw_country_median_age
    OWNER to postgres;
	
SELECT COUNT(*) FROM raw_country_median_age --214

UPDATE raw_country_median_age ma
SET alpha_3_code = (SELECT c.alpha_3_code FROM (SELECT DISTINCT country_name, alpha_3_code
		FROM country) c WHERE ma.country_name = c.country_name);
		
UPDATE raw_country_median_age ma
SET alpha_3_code = 'CZE',
	country_name_std = 'Czechia'
WHERE country_name = 'Czech Republic';

UPDATE raw_country_median_age ma
SET alpha_3_code = 'MAC',
	country_name_std = 'Macao'
WHERE country_name = 'Macau';

UPDATE raw_country_median_age ma
SET alpha_3_code = 'MKD',
	country_name_std = 'North Macedonia'
WHERE country_name = 'Macedonia';

UPDATE raw_country_median_age ma
SET alpha_3_code = 'VGB',
	country_name_std = 'Virgin Islands (British)'
WHERE country_name = 'British Virgin Islands';

UPDATE raw_country_median_age ma
SET alpha_3_code = 'LAO',
	country_name_std = 'Lao People''s Democratic Republic'
WHERE country_name = 'Laos';

UPDATE raw_country_median_age ma
SET alpha_3_code = 'SWZ',
	country_name_std = 'Eswatini'
WHERE country_name = 'Swaziland';

UPDATE raw_country_median_age ma
SET alpha_3_code = 'COG',
	country_name_std = 'Congo'
WHERE country_name = 'Republic of the Congo';

UPDATE raw_country_median_age ma
SET alpha_3_code = 'SXM',
	country_name_std = 'Sint Maarten (Dutch part)'
WHERE country_name = 'Sint Maarten';

UPDATE raw_country_median_age ma
SET alpha_3_code = 'MAF',
	country_name_std = 'Saint Martin (French part)'
WHERE country_name = 'Saint Martin';

alter table country add median_age double precision;
alter table country add median_age_male double precision;
alter table country add median_age_female double precision;

UPDATE country c
SET median_age = (SELECT median_age 
								 FROM raw_country_median_age ma
								WHERE c.alpha_3_code = ma.alpha_3_code),
	median_age_male = (SELECT median_age_male 
								 FROM raw_country_median_age ma
								WHERE c.alpha_3_code = ma.alpha_3_code),
	median_age_female = (SELECT median_age_female 
								 FROM raw_country_median_age ma
								WHERE c.alpha_3_code = ma.alpha_3_code);
		
