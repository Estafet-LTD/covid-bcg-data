DROP TABLE public.country_covid_19_death;

CREATE TABLE public.country_covid_19_death
(
    country_name character varying(64) COLLATE pg_catalog."default",
    alpha_3_code character varying(3) COLLATE pg_catalog."default",
    date_first_death date,
    date_fifth_death date,
    deaths_per_million_10_days_after_first_death double precision,
    deaths_per_million_10_days_after_fifth_death double precision,
    deaths_per_million_15_days_after_first_death double precision,
    deaths_per_million_15_days_after_fifth_death double precision,
    deaths_per_million_20_days_after_first_death double precision,
    deaths_per_million_20_days_after_fifth_death double precision,
    deaths_per_million_25_days_after_first_death double precision,
    deaths_per_million_25_days_after_fifth_death double precision,
    deaths_per_million_30_days_after_first_death double precision,
	deaths_per_million_30_days_after_fifth_death double precision,
	deaths_per_million_35_days_after_first_death double precision,
    deaths_per_million_35_days_after_fifth_death double precision,
    deaths_per_million_40_days_after_first_death double precision,
	deaths_per_million_40_days_after_fifth_death double precision,
    deaths_per_million_45_days_after_first_death double precision,
	deaths_per_million_45_days_after_fifth_death double precision,
    total_tests_per_thousand_10_days_after_first_death double precision,
    total_tests_per_thousand_10_days_after_fifth_death double precision,
    total_tests_per_thousand_15_days_after_first_death double precision,
    total_tests_per_thousand_15_days_after_fifth_death double precision,
    total_tests_per_thousand_20_days_after_first_death double precision,
    total_tests_per_thousand_20_days_after_fifth_death double precision,
    total_tests_per_thousand_25_days_after_first_death double precision,
    total_tests_per_thousand_25_days_after_fifth_death double precision,
    total_tests_per_thousand_30_days_after_first_death double precision,
	total_tests_per_thousand_30_days_after_fifth_death double precision,
	total_tests_per_thousand_35_days_after_first_death double precision,
    total_tests_per_thousand_35_days_after_fifth_death double precision,
    total_tests_per_thousand_40_days_after_first_death double precision,
	total_tests_per_thousand_40_days_after_fifth_death double precision,
    total_tests_per_thousand_45_days_after_first_death double precision,
	total_tests_per_thousand_45_days_after_fifth_death double precision
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.country_covid_19_death
    OWNER to postgres;

delete from country_covid_19_death;

insert into country_covid_19_death(alpha_3_code, country_name)
select distinct t1.iso_code, t1.location from raw_owid_covid_data t1;

-- set date_first_death
update country_covid_19_death t1 
set date_first_death = (
	select min(report_date) from raw_owid_covid_data t2 
	where t2.total_deaths > 0 and t2.iso_code = alpha_3_code);	

-- set date_fifth_death
update country_covid_19_death t1 
set date_fifth_death = (
	select min(report_date) from raw_owid_covid_data t2 
	where t2.total_deaths > 4 and t2.iso_code = alpha_3_code);
	
-- deaths_per_million_10_days_after_first_death	
update country_covid_19_death t1 
set deaths_per_million_10_days_after_first_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_first_death) = 10 and t2.iso_code = alpha_3_code);
	
-- deaths_per_million_10_days_after_first_death		
update country_covid_19_death t1 
set deaths_per_million_10_days_after_fifth_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_fifth_death) = 10 and t2.iso_code = alpha_3_code);

-- deaths_per_million_15_days_after_first_death	
update country_covid_19_death t1 
set deaths_per_million_15_days_after_first_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_first_death) = 15 and t2.iso_code = alpha_3_code);

-- deaths_per_million_15_days_after_fifth_death		
update country_covid_19_death t1 
set deaths_per_million_15_days_after_fifth_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_fifth_death) = 15 and t2.iso_code = alpha_3_code);	

-- deaths_per_million_20_days_after_first_death
update country_covid_19_death t1 
set deaths_per_million_20_days_after_first_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_first_death) = 20 and t2.iso_code = alpha_3_code);

-- deaths_per_million_20_days_after_fifth_death	
update country_covid_19_death t1 
set deaths_per_million_20_days_after_fifth_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_fifth_death) = 20 and t2.iso_code = alpha_3_code);	

-- deaths_per_million_25_days_after_first_death	
update country_covid_19_death t1 
set deaths_per_million_25_days_after_first_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_first_death) = 25 and t2.iso_code = alpha_3_code);
	
-- deaths_per_million_25_days_after_fifth_death		
update country_covid_19_death t1 
set deaths_per_million_25_days_after_fifth_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_fifth_death) = 25 and t2.iso_code = alpha_3_code);

update country_covid_19_death t1 
set deaths_per_million_30_days_after_first_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_first_death) = 30 and t2.iso_code = alpha_3_code);
	
update country_covid_19_death t1 
set deaths_per_million_30_days_after_fifth_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_fifth_death) = 30 and t2.iso_code = alpha_3_code);

update country_covid_19_death t1 
set deaths_per_million_35_days_after_first_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_first_death) = 35 and t2.iso_code = alpha_3_code);
	
update country_covid_19_death t1 
set deaths_per_million_35_days_after_fifth_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_fifth_death) = 35 and t2.iso_code = alpha_3_code);	
	
update country_covid_19_death t1 
set deaths_per_million_40_days_after_first_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_first_death) = 40 and t2.iso_code = alpha_3_code);
	
update country_covid_19_death t1 
set deaths_per_million_40_days_after_fifth_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_fifth_death) = 40 and t2.iso_code = alpha_3_code);	

update country_covid_19_death t1 
set deaths_per_million_45_days_after_first_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_first_death) = 45 and t2.iso_code = alpha_3_code);
	
update country_covid_19_death t1 
set deaths_per_million_45_days_after_fifth_death = (
	select total_deaths_per_million from raw_owid_covid_data t2 
	where (t2.report_date - t1.date_fifth_death) = 45 and t2.iso_code = alpha_3_code);	