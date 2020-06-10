DROP TABLE public.country_lockdown;

CREATE TABLE public.country_lockdown
(
    country_name character varying(64) NOT NULL,
    start_date date,
    end_date date,
    PRIMARY KEY (country_name)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.country_lockdown
    OWNER to postgres;

-- add columns lockdown_start and lockdown_end
ALTER TABLE public.country ADD lockdown_start date;
ALTER TABLE public.country ADD lockdown_end date;

-- update columns lockdown_start and lockdown_end
update country cn
set lockdown_start = cl.start_date, lockdown_end = cl.end_date
from country_lockdown cl
where cn.country_name = cl.country_name;