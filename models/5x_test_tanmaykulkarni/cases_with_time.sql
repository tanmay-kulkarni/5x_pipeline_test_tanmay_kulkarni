{{config(materialized='table')}}

/*
select date, total_cases, total_active_cases, new_cases, new_recovered, total_deaths, location_id
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI" as R inner join "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."LOCATIONS" as L
on R.location = L.location 
and R.location_iso_code = L.location_iso_code 
and R.country = L.country 
and R.island = L.island 
and R.province = L.province;
*/


with raw_table as (
    select date, 
            total_cases, 
            total_active_cases,
            new_cases,
            new_recovered,
            total_deaths,
            location,
            location_iso_code,
            country,
            island,
            province
    from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI"
),

denormalised_table as (
    select location_id, location, location_iso_code, country, island,province
    from {{ ref('locations') }}
)

select *
from raw_table inner join denormalised_table using(location, location_iso_code, country, island,province)


-- select * from denormalised_table
