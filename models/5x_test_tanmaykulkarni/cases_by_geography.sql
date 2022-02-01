/*

select Date, Location, province, Latitude, Longitude, Population_density, total_cases
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI";

*/


{{config(materialized='table')}}

with result as (
select date, country, location, province, latitude, Longitude, Population_density, total_cases
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI"
)

select * from result