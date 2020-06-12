-- Table: public.country

-- DROP TABLE public.country;

CREATE TABLE public.country
(
    country_name character varying(64) COLLATE pg_catalog."default",
    official_state_name character varying(256) COLLATE pg_catalog."default",
    sovereignty character varying(256) COLLATE pg_catalog."default",
    alpha_2_code character varying(2) COLLATE pg_catalog."default",
    alpha_3_code character varying(3) COLLATE pg_catalog."default",
    internet_cctld character varying(16) COLLATE pg_catalog."default",
    gni_per_capita_usd integer,
    year_of_gni_report integer,
    income_group_type character varying(32) COLLATE pg_catalog."default",
    bcg_search_non_english_language character varying(64) COLLATE pg_catalog."default",
    covid_19_test_total_per_thousand double precision,
    covid_19_test_cumulative_total integer,
    covid_19_test_unit character varying(24) COLLATE pg_catalog."default",
    covid_19_test_date_reported date
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.country
    OWNER to postgres;
	
----------------

-- Table: public.country_covid_19_death

-- DROP TABLE public.country_covid_19_death;

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

--------------

-- Table: public.country_covid_19_test

-- DROP TABLE public.country_covid_19_test;

CREATE TABLE public.country_covid_19_test
(
    country_name character varying(64) COLLATE pg_catalog."default",
    alpha_3_code character varying(3) COLLATE pg_catalog."default",
    entity character varying(64) COLLATE pg_catalog."default",
    date_reported date,
    source_url character varying(256) COLLATE pg_catalog."default",
    source_label character varying(256) COLLATE pg_catalog."default",
    notes character varying(1024) COLLATE pg_catalog."default",
    cumulative_total integer,
    daily_change_in_cumulative_total integer,
    cumulative_total_per_thousand double precision,
    daily_change_in_cumulative_total_per_thousand double precision,
    three_day_rolling_mean_daily_change double precision,
    three_day_rolling_mean_daily_change_per_thousand double precision,
    test_unit character varying(128) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.country_covid_19_test
    OWNER to postgres;

---------------

-- Table: public.country_income

-- DROP TABLE public.country_income;

CREATE TABLE public.country_income
(
    country_name character varying(32) COLLATE pg_catalog."default",
    gni_per_capita_usd integer,
    income_group_type character varying(32) COLLATE pg_catalog."default",
    year_of_gni_report integer,
    alpha_3_code character varying(3) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.country_income
    OWNER to postgres;

----------------

-- Table: public.raw_bcg_word_atlas

-- DROP TABLE public.raw_bcg_word_atlas;

CREATE TABLE public.raw_bcg_word_atlas
(
    country_name character varying(64) COLLATE pg_catalog."default",
    alpha_2_code character varying(2) COLLATE pg_catalog."default",
    region character varying(256) COLLATE pg_catalog."default",
    tb_incidence_per_100k__per_year character varying(256) COLLATE pg_catalog."default",
    tb_incidence_count character varying(256) COLLATE pg_catalog."default",
    income_group_world_bank character varying(256) COLLATE pg_catalog."default",
    current_bcg_vaccination character varying(256) COLLATE pg_catalog."default",
    bcg_recommendation_type character varying(256) COLLATE pg_catalog."default",
    which_year_was_vaccination_introduced character varying(256) COLLATE pg_catalog."default",
    year_bcg_stopped character varying(256) COLLATE pg_catalog."default",
    timing_of_1st_bcg character varying(256) COLLATE pg_catalog."default",
    multiple_bcg character varying(256) COLLATE pg_catalog."default",
    timing_of_bcg_2 character varying(256) COLLATE pg_catalog."default",
    timing_of_bcg_3 character varying(256) COLLATE pg_catalog."default",
    multiple_bcg_in_the_past character varying(256) COLLATE pg_catalog."default",
    timing_of_old_bcg_2 character varying(256) COLLATE pg_catalog."default",
    timing_of_old_bcg_3 character varying(256) COLLATE pg_catalog."default",
    year_booster_bcg_stopped character varying(256) COLLATE pg_catalog."default",
    bcg_strain character varying(256) COLLATE pg_catalog."default",
    how_long_has_this_bcg_vaccine_strain_been_used character varying(256) COLLATE pg_catalog."default",
    is_tst_done_post_bcg character varying(256) COLLATE pg_catalog."default",
    year_of_bcg_coverage_estimate character varying(256) COLLATE pg_catalog."default",
    bcg_coverage_percentage character varying(256) COLLATE pg_catalog."default",
    year_of_changes_to_bcg_schedule character varying(256) COLLATE pg_catalog."default",
    details_of_changes character varying(1024) COLLATE pg_catalog."default",
    are_there_special_groups_that_receive_bcg character varying(256) COLLATE pg_catalog."default",
    is_tst_administered_pre_bcg_vaccination character varying(256) COLLATE pg_catalog."default",
    details_on_special_high_risk_groups character varying(1024) COLLATE pg_catalog."default",
    why_was_the_policy_discontinued character varying(256) COLLATE pg_catalog."default",
    what_was_the_process_of_discontinuation character varying(1024) COLLATE pg_catalog."default",
    location_of_administration_of_bcg_vaccine character varying(256) COLLATE pg_catalog."default",
    bcg_manufacturer character varying(256) COLLATE pg_catalog."default",
    bcg_supply_company character varying(256) COLLATE pg_catalog."default",
    were_there_shortages_stockouts_of_the_vaccine character varying(256) COLLATE pg_catalog."default",
    details_of_shortages_stockouts character varying(1024) COLLATE pg_catalog."default",
    additional_comments character varying(1024) COLLATE pg_catalog."default",
    is_the_bcg_vaccination_policy_regularly_assessed character varying(256) COLLATE pg_catalog."default",
    how_often_is_the_policy_assessed character varying(256) COLLATE pg_catalog."default",
    process_of_assessment_if_not_regular character varying(256) COLLATE pg_catalog."default",
    bcg_policy_link character varying(256) COLLATE pg_catalog."default",
    is_bcg_vaccination_recommended_for_hiv_positive_babies character varying(256) COLLATE pg_catalog."default",
    datasource character varying(256) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.raw_bcg_word_atlas
    OWNER to postgres;

------------

-- Table: public.raw_country_covid_19_test

-- DROP TABLE public.raw_country_covid_19_test;

CREATE TABLE public.raw_country_covid_19_test
(
    entity character varying(64) COLLATE pg_catalog."default",
    date_reported date,
    source_url character varying(256) COLLATE pg_catalog."default",
    source_label character varying(256) COLLATE pg_catalog."default",
    notes character varying(1024) COLLATE pg_catalog."default",
    cumulative_total integer,
    daily_change_in_cumulative_total integer,
    cumulative_total_per_thousand double precision,
    daily_change_in_cumulative_total_per_thousand double precision,
    three_day_rolling_mean_daily_change double precision,
    three_day_rolling_mean_daily_change_per_thousand double precision
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.raw_country_covid_19_test
    OWNER to postgres;

----------

-- Table: public.raw_owid_covid_data

-- DROP TABLE public.raw_owid_covid_data;

CREATE TABLE public.raw_owid_covid_data
(
    iso_code character varying(3) COLLATE pg_catalog."default",
    location character varying(64) COLLATE pg_catalog."default",
    report_date date,
    total_cases integer,
    new_cases integer,
    total_deaths integer,
    new_deaths integer,
    total_cases_per_million double precision,
    new_cases_per_million double precision,
    total_deaths_per_million double precision,
    new_deaths_per_million double precision,
    total_tests double precision,
    new_tests double precision,
    total_tests_per_thousand double precision,
    new_tests_per_thousand double precision,
    tests_units character varying(64) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.raw_owid_covid_data
    OWNER to postgres;	
	

--------
-- Table: public.raw_country_population

-- DROP TABLE public.raw_country_population;

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
	
	
---------------
-- Table: public.raw_country_population

-- DROP TABLE public.raw_country_population;
 
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
	
----------
-- Table: public.raw_hospital_bed_per_1000_people

-- DROP TABLE public.raw_hospital_bed_per_1000_people;

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

-----------
-- Table: public.raw_tb_incidence

-- DROP TABLE IF EXISTS public.raw_tb_incidence;

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

ALTER TABLE public.raw_tb_incidence
    OWNER to postgres;	

----------
-- Table: public.raw_urban_population

-- DROP TABLE IF EXISTS public.raw_urban_population;

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

---------
-- Table: public.country_lockdown

-- DROP TABLE public.country_lockdown;

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
	
--------
-- Table: public.country_region

-- DROP TABLE public.country_region;

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

-----------
-- Table: public.raw_country_female_population_percent

-- DROP TABLE IF EXISTS public.raw_country_female_population_percent;

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
