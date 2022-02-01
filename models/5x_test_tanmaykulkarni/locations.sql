{{config(materialized='table')}}

/*

In this model, I've separated the geographical fields into a separate table,
in order to avoid redundancy while maintaining the time series data

CREATE OR REPLACE TABLE "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."locations"
 AS
SELECT
    DISTINCT * 
FROM
     ( select  location_iso_code, Location, country, continent , IFNULL(island, 'Unknown') as island, population, area_km_2_ as area,
     IFNULL(province, 'Unknown') as province from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI" )
;
*/


-- with temp_table_1 as (
--     select  location_iso_code, Location, country, continent , IFNULL(island, 'Unknown') as island, population, area_km_2_ as area,
--      IFNULL(province, 'Unknown') as province from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI"
-- ),

-- -- In the following step, I add a random number on each row, to treat it as the primary key
-- -- so that it can be joined with the cases_with_time table to generate the original table
-- temp_table_2 as (
--     select DISTINCT *, uniform(1,100000000, random()) as location_id from temp_table_1
-- )

-- select * from temp_table_2


WITH locations as (
  select distinct location_iso_code, 
                Location,
                country,
                continent ,
                IFNULL(island, 'Unknown') as island,
                population, area_km_2_ as area,
                IFNULL(province, 'Unknown') as province
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI")

select *, randstr(10, random(13)) as location_id from locations




