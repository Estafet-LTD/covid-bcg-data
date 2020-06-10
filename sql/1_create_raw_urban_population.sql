
DROP TABLE IF EXISTS public.raw_urban_population;

CREATE TABLE public.raw_urban_population
(
    country_name character varying(64),
    alpha_3_code character varying(3),
    km2 double precision,
    mi2 double precision,
    population bigint,
    population_km2 double precision,
    population_mi2 double precision,
    date character varying(20)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.raw_urban_population
    OWNER to postgres;
	
-- ADD country population_per_km2 column	
ALTER TABLE public.country ADD population_per_km2 double precision;

-- ADD country population_per_mi2 (mile) column	
ALTER TABLE public.country ADD population_per_mi2 double precision;

-- Execute these after importing the CSV raw_urban_population.csv
-- UPDATE country population
UPDATE country c SET population_per_km2 = (SELECT up.population_km2 FROM public.raw_urban_population up WHERE (up.alpha_3_code = c.alpha_3_code));
UPDATE country c SET population_per_mi2 = (SELECT up.population_mi2 FROM public.raw_urban_population up WHERE (up.alpha_3_code = c.alpha_3_code));