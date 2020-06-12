DROP TABLE IF EXISTS public.raw_country_population;

CREATE TABLE public.raw_country_population
(
    country_name character varying(63),
    alpha_3_code character varying(3),
    "1960" bigint,
	"1961" bigint,
	"1962" bigint,
	"1963" bigint,
	"1964" bigint,
	"1965" bigint,
	"1966" bigint,
	"1967" bigint,
	"1968" bigint,
	"1969" bigint,
	"1970" bigint,
	"1971" bigint,
	"1972" bigint,
	"1973" bigint,
	"1974" bigint,
	"1975" bigint,
	"1976" bigint,
	"1977" bigint,
	"1978" bigint,
	"1979" bigint,
	"1980" bigint,
	"1981" bigint,
	"1982" bigint,
	"1983" bigint,
	"1984" bigint,
	"1985" bigint,
	"1986" bigint,
	"1987" bigint,
	"1988" bigint,
	"1989" bigint,
	"1990" bigint,
	"1991" bigint,
	"1992" bigint,
	"1993" bigint,
	"1994" bigint,
	"1995" bigint,
	"1996" bigint,
	"1997" bigint,
	"1998" bigint,
	"1999" bigint,
	"2001" bigint,
	"2002" bigint,
	"2003" bigint,
	"2004" bigint,
	"2005" bigint,
	"2006" bigint,
	"2007" bigint,
	"2008" bigint,
	"2009" bigint,
	"2010" bigint,
	"2011" bigint,
	"2012" bigint,
	"2013" bigint,
	"2014" bigint,
	"2015" bigint,
	"2016" bigint,
	"2017" bigint,
	"2018" bigint,
	"2019" bigint
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.raw_country_population
    OWNER to postgres;
	
-- ADD country population column	
ALTER TABLE public.country ADD population bigint;

-- UPDATE country population
UPDATE country c SET population = (SELECT cp."2018" FROM raw_country_population cp WHERE (cp.alpha_3_code = c.alpha_3_code));