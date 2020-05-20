# covid-bcg-data
SQL to load COVID and BCG related data.
All required fields are listed in the following spreadsheet - https://docs.google.com/spreadsheets/d/1RTfkwp9ZDRxEya4efGCED_3ci6BJPpalv6N5GAtNyRM/edit#gid=0

## Initial setup
1. Create all tables by running in posgresql DB ./sql/10_create_all_tales.sql
2. Import the csv data with pgAdmin or another SQL client (UTF-8, comma as separator, header) from ./csv folder (the name of the file is the same as the name of the DB table.

### Steps that are required just before the hackathon to get the latest data

#### Upload latest values for tests
1. Import data to raw_country_covid_19_test
2. run 20_update_from_raw_country_covid_19_test.sql

#### Upload latest values for deaths
1. Import data to raw_owid_covid_data
2. run 30_update_from_raw_owid_covid_data.sql


