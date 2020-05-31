truncate table raw_country_population_distribution;

CREATE TABLE public.raw_country_population_distribution
(
    country_name character varying(64) COLLATE pg_catalog."default",
	alpha_3_code character varying(3) COLLATE pg_catalog."default",
	indicator_name character varying(254) COLLATE pg_catalog."default",
	indicator_code character varying(64) COLLATE pg_catalog."default",
	year_1960 double precision,
	year_1961 double precision,
	year_1962 double precision,
	year_1963 double precision,
	year_1964 double precision,
	year_1965 double precision,
	year_1966 double precision,
	year_1967 double precision,
	year_1968 double precision,
	year_1969 double precision,
	year_1970 double precision,
	year_1971 double precision,
	year_1972 double precision,
	year_1973 double precision,
	year_1974 double precision,
	year_1975 double precision,
	year_1976 double precision,
	year_1977 double precision,
	year_1978 double precision,
	year_1979 double precision,
	year_1980 double precision,
	year_1981 double precision,
	year_1982 double precision,
	year_1983 double precision,
	year_1984 double precision,
	year_1985 double precision,
	year_1986 double precision,
	year_1987 double precision,
	year_1988 double precision,
	year_1989 double precision,
	year_1990 double precision,
	year_1991 double precision,
	year_1992 double precision,
	year_1993 double precision,
	year_1994 double precision,
	year_1995 double precision,
	year_1996 double precision,
	year_1997 double precision,
	year_1998 double precision,
	year_1999 double precision,
	year_2000 double precision,
	year_2001 double precision,
	year_2002 double precision,
	year_2003 double precision,
	year_2004 double precision,
	year_2005 double precision,
	year_2006 double precision,
	year_2007 double precision,
	year_2008 double precision,
	year_2009 double precision,
	year_2010 double precision,
	year_2011 double precision,
	year_2012 double precision,
	year_2013 double precision,
	year_2014 double precision,
	year_2015 double precision,
	year_2016 double precision,
	year_2017 double precision,
	year_2018 double precision,
	year_2019 double precision
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;



ALTER TABLE public.raw_country_population_distribution
    OWNER to postgres;
	
select indicator_name, count(*) 
from raw_country_population_distribution
group by indicator_name

alter table country add population integer;
alter table country add percentage_population_female double precision;
alter table country add percentage_population_over_65 double precision;

UPDATE country c
SET population = (SELECT year_2018 
								 FROM raw_country_population_distribution cp
								WHERE cp.indicator_name = 'Population, total'
				  					AND c.alpha_3_code = cp.alpha_3_code),
	percentage_population_female = (SELECT year_2018 
								 FROM raw_country_population_distribution cp
								WHERE cp.indicator_name = 'Population, female (% of total population)' 
									AND c.alpha_3_code = cp.alpha_3_code),
	percentage_population_over_65 = (SELECT year_2018 
								 FROM raw_country_population_distribution cp
								WHERE cp.indicator_name = 'Population ages 65 and above (% of total population)' 
									 AND c.alpha_3_code = cp.alpha_3_code);