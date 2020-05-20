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