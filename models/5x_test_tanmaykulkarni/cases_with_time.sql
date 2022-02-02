{{config(materialized='table')}}

/*

This model joins the raw time series data on geographical fields and keeps to location_id generated in the 
"locations" model.

Thus, it can allow us to get the original data by joining "locations" with "cases_with_time" 
on the field location_id.

*/


-- step 1: 
-- select the metrics needed from the original raw table, along with geography specific fields

with raw_table as (
    select date, 
            GROWTH_FACTOR_OF_NEW_CASES,
            CASE_RECOVERED_RATE,
            TOTAL_DEATHS_PER_MILLION,
            TOTAL_CASES_PER_MILLION,
            GROWTH_FACTOR_OF_NEW_DEATHS,
            NEW_DEATHS_PER_MILLION,
            NEW_CASES_PER_MILLION,
            CASE_FATALITY_RATE,
            TOTAL_CASES, 
            TOTAL_ACTIVE_CASES,
            NEW_ACTIVE_CASES,
            TOTAL_DEATHS,
            NEW_CASES,
            NEW_DEATHS,
            NEW_RECOVERED,
            TOTAL_RECOVERED,
            location,
            location_iso_code,
            country,
            IFNULL(island, 'Unknown') as island,
            IFNULL(province, 'Unknown') as province
    from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI"
),


-- step 2:
-- select the geography related fields from the locations model

normalised_table as (
    select location_id, location, location_iso_code, country, island, province
    from {{ ref('locations') }}
)


-- step 3:
-- Generate the final table "cases_with_time" which contains only the metrics of interest and "location_id"
-- so that we can join it with the "locations" table when needed.

select      date,
            location_id, 
            GROWTH_FACTOR_OF_NEW_CASES,
            CASE_RECOVERED_RATE,
            TOTAL_DEATHS_PER_MILLION,
            TOTAL_CASES_PER_MILLION,
            GROWTH_FACTOR_OF_NEW_DEATHS,
            NEW_DEATHS_PER_MILLION,
            NEW_CASES_PER_MILLION,
            CASE_FATALITY_RATE,
            TOTAL_CASES, 
            TOTAL_ACTIVE_CASES,
            NEW_ACTIVE_CASES,
            TOTAL_DEATHS,
            NEW_CASES,
            NEW_DEATHS,
            NEW_RECOVERED,
            TOTAL_RECOVERED
from raw_table inner join normalised_table 
using(location, location_iso_code, country, island,province)
