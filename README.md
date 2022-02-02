# 5x_pipeline_test_tanmay_kulkarni
My dbt code for the 6 hour pipeline test taken on Feb 1, 2022


## Goals Achieved:

1. Ingested data from the shared Google Sheet to the Snowflake database using Fivetran
2. Configured dbt cloud successfully to work on the Snowflake database
3. Wrote the following 5 models:
        
    - locations (**Normalised geography data from the original raw table**)

        * `select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."LOCATIONS";`

    - cases_with_time (**Normalised time series data that links with "locations" via location_id (new field)**)

        * `select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."CASES_WITH_TIME";`
        
    - new_metrics (**Generates NEW case data from the normalised tables "locations" and "cases_with_time"**)

        * `select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."NEW_METRICS";`
        
    - total_metrics (**Generates TOTAL case data from the normalised tables "locations" and "cases_with_time**)

        * `select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."TOTAL_METRICS";`
        
    - ratios_by_geolocation (**Generates derived fields "coordinates" and case ratios from the RAW table**)

        * `select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."RATIOS_BY_GEOLOCATION";`

    - areas_with_highest_active_cases (**Generates a table of the top locations having the highest NEW covid-19 cases**)

        * `select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."AREAS_WITH_HIGHEST_ACTIVE_CASES";`

4. Connected Google Data Studio with Snowflake using the Supermetrics connector
5. Created a basic dashboard using the above data