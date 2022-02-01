{{config(materialized='table')}}

/*
CREATE OR REPLACE TABLE "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."locations"
 AS
SELECT
    DISTINCT * 
FROM
     ( select  location_iso_code, Location, country, continent , IFNULL(island, 'Unknown') as island, population, area_km_2_ as area,
     IFNULL(province, 'Unknown') as province from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI" )
;
*/
with temp_table_1 as (
    select  location_iso_code, Location, country, continent , IFNULL(island, 'Unknown') as island, population, area_km_2_ as area,
     IFNULL(province, 'Unknown') as province from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI"
),

temp_table_2 as (
    select DISTINCT *, uniform(1,100000000, random()) as location_id from temp_table_1
)

select * from temp_table_2
