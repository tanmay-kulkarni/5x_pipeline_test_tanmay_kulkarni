/*

select Date, Location, country, continent, province , sum(total_cases), sum(New_CASES), sum(new_deaths), sum(total_recovered), sum(total_active_cases)
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI"
group by Date, Location, country, continent, province
order by Date asc;

*/

{{config(materialized='table')}}

with result as (

select Date, 
        Location, 
        country, 
        continent, 
        province, 
        sum(total_cases) as total_cases,
        sum(new_cases) as new_cases,
        sum(new_deaths) as new_deaths,
        sum(total_recovered) as total_recovered,
        sum(total_active_cases) as total_active_cases 

from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI"
group by Date, Location, country, continent, province
order by Date desc
)

select * from result