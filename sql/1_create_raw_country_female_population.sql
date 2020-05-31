DROP TABLE public.raw_country_female_population_percent;

CREATE TABLE public.raw_country_female_population_percent
(
    country_name character varying(63),
    alpha_3_code character varying(3),
    "1960" float,
	"1961" float,
	"1962" float,
	"1963" float,
	"1964" float,
	"1965" float,
	"1966" float,
	"1967" float,
	"1968" float,
	"1969" float,
	"1970" float,
	"1971" float,
	"1972" float,
	"1973" float,
	"1974" float,
	"1975" float,
	"1976" float,
	"1977" float,
	"1978" float,
	"1979" float,
	"1980" float,
	"1981" float,
	"1982" float,
	"1983" float,
	"1984" float,
	"1985" float,
	"1986" float,
	"1987" float,
	"1988" float,
	"1989" float,
	"1990" float,
	"1991" float,
	"1992" float,
	"1993" float,
	"1994" float,
	"1995" float,
	"1996" float,
	"1997" float,
	"1998" float,
	"1999" float,
	"2001" float,
	"2002" float,
	"2003" float,
	"2004" float,
	"2005" float,
	"2006" float,
	"2007" float,
	"2008" float,
	"2009" float,
	"2010" float,
	"2011" float,
	"2012" float,
	"2013" float,
	"2014" float,
	"2015" float,
	"2016" float,
	"2017" float,
	"2018" float,
	"2019" float
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.raw_country_female_population_percent
    OWNER to postgres;
	
	
-- ADD country female population column	
ALTER TABLE public.country ADD female_population_percent float;


-- UPDATE country population
UPDATE country c SET female_population_percent = (SELECT cp."2018" FROM raw_country_female_population_percent cp WHERE (cp.alpha_3_code = c.alpha_3_code));