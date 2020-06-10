DROP TABLE public.raw_country_cardiovascular_diseases

CREATE TABLE public.raw_country_cardiovascular_diseases
(
    country_name character varying(64) COLLATE pg_catalog."default",
	population integer,
	hearth_disease_disability integer,
	hearth_disease_mortability integer,
	stroke_disability integer,
	stroke_mortability integer,
	rheumatic_heart_disease_mortability integer,
	percentage_men_smokers double precision,
	percentage_women_smokers double precision,
	percentage_people_with_diabetes double precision,
	number_of_cardiovascular_diseases_publications integer,
	smoking_legal_status character varying(24) COLLATE pg_catalog."default",
	country_name_std character varying(64) COLLATE pg_catalog."default",
	alpha_3_code character varying(3) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.raw_country_cardiovascular_diseases
    OWNER to postgres;
	
comment on column public.raw_country_cardiovascular_diseases.population is 'millions';
comment on column public.raw_country_cardiovascular_diseases.hearth_disease_disability is 'DALYS lost per 1000 population';
comment on column public.raw_country_cardiovascular_diseases.hearth_disease_mortability is 'number of deaths';
comment on column public.raw_country_cardiovascular_diseases.stroke_disability is 'DALYS lost per 1000 population';
comment on column public.raw_country_cardiovascular_diseases.stroke_mortability is 'number of deaths';
comment on column public.raw_country_cardiovascular_diseases.rheumatic_heart_disease_mortability is 'number of deaths';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = (SELECT c.alpha_3_code FROM (SELECT DISTINCT country_name, alpha_3_code
		FROM country) c WHERE cd.country_name = c.country_name);
		
UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'BHS',
	country_name_std = 'The Bahamas'
WHERE country_name = 'Bahamas';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'BRN',
	country_name_std = 'Brunei'
WHERE country_name = 'Brunei Darussalam';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'CPV',
	country_name_std = 'Cabo Verde'
WHERE country_name = 'Cape Verde';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'CAF',
	country_name_std = 'Central African Republic'
WHERE country_name = 'Central African Rep.';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'CAF',
	country_name_std = 'Central African Republic'
WHERE country_name = 'Central African Rep.';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'CIV',
	country_name_std = 'Côte d''Ivoire'
WHERE country_name = 'Côte d’Ivoire';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'CZE',
	country_name_std = 'Czechia'
WHERE country_name = 'Czech Republic';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'IRN',
	country_name_std = 'Iran'
WHERE country_name = 'Iran, Isl. Rep.';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'PRK',
	country_name_std = 'North Korea'
WHERE country_name = 'Korea, Dem. People’s Rep. of';
		
UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'KOR',
	country_name_std = 'South Korea'
WHERE country_name = 'Korea, Republic of';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'LAO',
	country_name_std = 'Lao People''s Democratic Republic'
WHERE country_name = 'Lao People’s Dem. Rep.';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'LBY',
	country_name_std = 'Libya'
WHERE country_name = 'Libyan Arab Jamahiriya';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'MKD',
	country_name_std = 'North Macedonia'
WHERE country_name = 'Macedonia, Former Yugos. Rep. of';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'FSM',
	country_name_std = 'Micronesia (Federated States of)'
WHERE country_name = 'Micronesia, Federated States of';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'MDA',
	country_name_std = 'Moldova'
WHERE country_name = 'Moldova, Republic of';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'RUS',
	country_name_std = 'Russia'
WHERE country_name = 'Russian Federation';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'VCT',
	country_name_std = 'Saint Vincent and the Grenadines'
WHERE country_name = 'Saint Vincent and Grenadines';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'SWZ',
	country_name_std = 'Eswatini'
WHERE country_name = 'Swaziland';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'SYR',
	country_name_std = 'Syria'
WHERE country_name = 'Syrian Arab Republic';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'TZA',
	country_name_std = 'Tanzania'
WHERE country_name = 'Tanzania, United Republic of';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'USA',
	country_name_std = 'United States'
WHERE country_name = 'United States of America';

UPDATE raw_country_cardiovascular_diseases cd
SET alpha_3_code = 'VNM',
	country_name_std = 'Vietnam'
WHERE country_name = 'Viet Nam';

alter table country add hearth_disease_disability integer;
comment on column public.country.hearth_disease_disability is 'DALYS lost per 1000 population';
alter table country add stroke_disease_disability integer;
comment on column public.country.stroke_disease_disability is 'DALYS lost per 1000 population';
alter table country add percentage_men_smokers double precision;
alter table country add percentage_women_smokers double precision;
alter table country add percentage_people_with_diabetes double precision;

UPDATE country c
SET hearth_disease_disability = (SELECT hearth_disease_disability 
								 FROM raw_country_cardiovascular_diseases cd
								WHERE c.alpha_3_code = cd.alpha_3_code),
	stroke_disease_disability = (SELECT stroke_disease_disability 
								 FROM raw_country_cardiovascular_diseases cd
								WHERE c.alpha_3_code = cd.alpha_3_code),
	percentage_men_smokers = (SELECT percentage_men_smokers 
								 FROM raw_country_cardiovascular_diseases cd
								WHERE c.alpha_3_code = cd.alpha_3_code),
	percentage_women_smokers = (SELECT percentage_women_smokers 
								 FROM raw_country_cardiovascular_diseases cd
								WHERE c.alpha_3_code = cd.alpha_3_code),
	percentage_people_with_diabetes = (SELECT percentage_people_with_diabetes 
								 FROM raw_country_cardiovascular_diseases cd
								WHERE c.alpha_3_code = cd.alpha_3_code);
								

/*
MERGE INTO raw_country_cardiovascular_diseases cd
USING (SELECT DISTINCT country_name, alpha_3_code
		FROM country) c
	ON (cd.country_name = c.country_name)
	WHEN MATCHED THEN UPDATE SET
		cd.alpha_3_code = c.alpha_3_code;
		*/