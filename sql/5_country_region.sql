DROP TABLE public.country_region;

CREATE TABLE public.country_region
(
    country_name character varying(64) NOT NULL,
    region character varying(50),
    south_north character varying(20),
    PRIMARY KEY (country_name)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.country_region
    OWNER to postgres;

-- add column region	
ALTER TABLE public.country ADD region character varying(50);

-- update column region
update public.country c
set region = cr.region
from country_region cr
where c.country_name = cr.country_name;