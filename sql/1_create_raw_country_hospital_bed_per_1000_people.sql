-- DROP TABLE IF EXISTS public.raw_hospital_bed_per_1000_people;

CREATE TABLE public.raw_hospital_bed_per_1000_people
(
    "alpha_3_code" character varying(3),
    "indicator" character varying(63),
	"subject" character varying(63),
	"measure" character varying(63),
	"frequency" character varying(3),
	"time" int,
	"value" float
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.raw_hospital_bed_per_1000_people
    OWNER to postgres;
	
-- ADD country hospital_bed_per_1000_people column	
ALTER TABLE public.country ADD hospital_bed_per_1000_people float;

-- UPDATE country hospital_bed_per_1000_people
UPDATE country c SET hospital_bed_per_1000_people = 
	(SELECT SUM(rh.value)
		FROM public.raw_hospital_bed_per_1000_people rh
			WHERE alpha_3_code = c.alpha_3_code AND time = (SELECT MAX(time) FROM public.raw_hospital_bed_per_1000_people rhi WHERE rh.alpha_3_code=rhi.alpha_3_code));