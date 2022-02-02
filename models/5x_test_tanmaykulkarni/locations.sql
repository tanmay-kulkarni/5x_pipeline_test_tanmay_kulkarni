{{config(materialized='table')}}

/*

In this model, I've separated the geographical fields into a separate table,
in order to avoid redundancy while maintaining the time series data

*/

WITH locations as (
  select distinct location_iso_code, 
                Location,
                country,
                continent ,
                IFNULL(island, 'Unknown') as island,
                population, area_km_2_ as area,
                IFNULL(province, 'Unknown') as province
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI")


/* Generating a random string of 10 characters to act as the primary key of this new table */
select *, randstr(10, random(13)) as location_id from locations




