

-->**************** covid_19_test ******************************

insert into country_covid_19_test (
    country_name,
	alpha_3_code,
	entity,
    date_reported,
    source_url,
    source_label,
    notes,
    cumulative_total,
    daily_change_in_cumulative_total,
    cumulative_total_per_thousand,
    daily_change_in_cumulative_total_per_thousand,
    three_day_rolling_mean_daily_change,
    three_day_rolling_mean_daily_change_per_thousand)
select 
    '' country_name,
	'' alpha_3_code,
	entity,
    date_reported,
    source_url,
    source_label,
    notes,
    cumulative_total,
    daily_change_in_cumulative_total,
    cumulative_total_per_thousand,
    daily_change_in_cumulative_total_per_thousand,
    three_day_rolling_mean_daily_change,
    three_day_rolling_mean_daily_change_per_thousand
from 
	raw_country_covid_19_test;
	
	
	
-------------------------- set country_name

update country_covid_19_test 
set country_name = trim(substring(entity from 0 for (position('- tests performed' in entity))))
where position('- tests performed' in entity)>0;

---
update country_covid_19_test 
set country_name = trim(substring(entity from 0 for (position(' - samples tested' in entity))))
where position('- samples tested' in entity)>0;
	
---
update country_covid_19_test 
set country_name = trim(substring(entity from 0 for (position(' - people tested' in entity))))
where position('- people tested' in entity)>0;
	
---
update country_covid_19_test 
set country_name = trim(substring(entity from 0 for (position(' - swabs tested' in entity))))
where position('- swabs tested' in entity)>0;

---
update country_covid_19_test 
set country_name = trim(substring(entity from 0 for (position(' - inconsistent units' in entity))))
where position('- inconsistent units' in entity)>0;

---
update country_covid_19_test 
set country_name = trim(substring(entity from 0 for (position(' - samples' in entity))))
where position('- samples' in entity)>0;

---
update country_covid_19_test 
set country_name = trim(substring(entity from 0 for (position(' - units unclear' in entity))))
where position('- units unclear' in entity)>0;

---
update country_covid_19_test 
set country_name = trim(substring(entity from 0 for (position(' - cases unclear' in entity))))
where position('- cases unclear' in entity)>0;

---
update country_covid_19_test 
set country_name = trim(substring(entity from 0 for (position(' - cases tested' in entity))))
where position('- cases tested' in entity)>0;

---
update country_covid_19_test 
set country_name = trim(substring(entity from 0 for (position(' - specimens tested' in entity))))
where position('- specimens tested' in entity)>0;

---
update country_covid_19_test 
set country_name = trim(substring(entity from 0 for (position(' - People tested' in entity))))
where position('- People tested' in entity)>0;

-------------------------- set test_unit

update country_covid_19_test 
set test_unit = trim(substring(entity from (position('- tests performed' in entity)+2)))
where position('- tests performed' in entity)>0;

---
update country_covid_19_test 
set test_unit = trim(substring(entity from (position('- samples tested' in entity)+2)))
where position('- samples tested' in entity)>0;	
	
---
update country_covid_19_test 
set test_unit = trim(substring(entity from (position('- people tested' in entity)+2)))
where position('- people tested' in entity)>0;
	
---
update country_covid_19_test 
set test_unit = trim(substring(entity from (position('- swabs tested' in entity)+2)))
where position('- swabs tested' in entity)>0;

---
update country_covid_19_test 
set test_unit = trim(substring(entity from (position('- inconsistent units' in entity)+2)))
where position('- inconsistent units' in entity)>0;

---
update country_covid_19_test 
set test_unit = trim(substring(entity from (position('- samples' in entity)+2)))
where position('- samples' in entity)>0;

---
update country_covid_19_test 
set test_unit = trim(substring(entity from (position('- units unclear' in entity)+2)))
where position('- units unclear' in entity)>0;

---
update country_covid_19_test 
set test_unit = trim(substring(entity from (position('- cases unclear' in entity)+2)))
where position('- cases unclear' in entity)>0;

---
update country_covid_19_test 
set test_unit = trim(substring(entity from (position('- cases tested' in entity)+2)))
where position('- cases tested' in entity)>0;

---
update country_covid_19_test 
set test_unit = trim(substring(entity from (position('- specimens tested' in entity)+2)))
where position('- specimens tested' in entity)>0;

---
update country_covid_19_test 
set test_unit = trim(substring(entity from (position('- People tested' in entity)+2)))
where position('- People tested' in entity)>0;

--------------------- update country name

update country_covid_19_test set country_name='Czechia' where country_name='Czech Republic'

--------------------- update alpha 3 code
update country_covid_19_test t1 set alpha_3_code = 
	(select t2.alpha_3_code from country t2 where t2.country_name = t1.country_name limit 1)

--------------------- country.covid_19_test_total_per_thousand
update country t1
set covid_19_test_total_per_thousand = 
	(
		select max(cumulative_total_per_thousand) cumulative_total_per_thousand	
		from country_covid_19_test t2
		where t2.alpha_3_code = t1.alpha_3_code
	);
	
--------------------- country.covid_19_test_cumulative_total	
update country t1
set covid_19_test_cumulative_total = 
	(
		select max(cumulative_total) 	
		from country_covid_19_test t2
		where t2.alpha_3_code = t1.alpha_3_code
	);	
	
--------------------- country.covid_19_test_date_reported	
update country t1
set covid_19_test_date_reported = 
	(
		select max(date_reported) 	
		from country_covid_19_test t2
		where t2.alpha_3_code = t1.alpha_3_code
	);	

--<**************** covid_19_test_unit ******************************
update country t1
set covid_19_test_unit = 
	(
		select max(test_unit) 	
		from country_covid_19_test t2
		where t2.alpha_3_code = t1.alpha_3_code
	);

update country set covid_19_test_unit = 'samples tested' where covid_19_test_unit in ('samples processed', 'cases tested', 'samples', 'samples tested', 'tests performed', 'swabs tested', 'specimens tested (CDC)');
update country set covid_19_test_unit = 'units unclear' where covid_19_test_unit in ('inconsistent units (COVID Tracking Project)', 'units unclear');
update country set covid_19_test_unit = 'people tested' where covid_19_test_unit in ('People tested', 'people tested');


--------------------- select test per thousand
-- select top 60+ countries
select * from country
where 
	income_group_type in ('High-income group', 'Upper-middle-income group')
	and covid_19_test_total_per_thousand is not null
	--and bcg_search_non_english_language is not null
order by country_name
