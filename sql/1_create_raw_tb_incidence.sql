
DROP TABLE IF EXISTS public.raw_tb_incidence;

CREATE TABLE public.raw_tb_incidence
(
    country_name character varying(64),
    alpha_2_code character varying(2),
	alpha_3_code character varying(3),
	alpha_code_numeric character varying(20),
	year character varying(20),
	measure character varying(20),
	unit character varying(20),
	age_group character varying(20),
	sex character varying(5),
	risk_factor character varying(10),
	best integer,
	lo integer,
	hi integer
	
   
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.tb_incidence
    OWNER to postgres;
	
-- ADD country population_per_km2 column	
ALTER TABLE public.country ADD population_per_km2 double precision;

-- ADD country population_per_mi2 (mile) column	
ALTER TABLE public.country ADD population_per_mi2 double precision;

-- Execute these after importing the CSV raw_urban_population.csv
-- UPDATE country population
UPDATE country c SET population_per_km2 = (SELECT up.population_km2 FROM public.raw_urban_population up WHERE (up.alpha_3_code = c.alpha_3_code));
UPDATE country c SET population_per_mi2 = (SELECT up.population_mi2 FROM public.raw_urban_population up WHERE (up.alpha_3_code = c.alpha_3_code));