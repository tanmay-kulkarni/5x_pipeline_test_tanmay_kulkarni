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
        
    - location_level_numbers_over_time (**Calculates aggregate numbers from the raw data**)

        * `select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."LOCATION_LEVEL_NUMBERS_OVER_TIME";`
        
    - numbers_by_geography_over_time_aggregated (**Same as above, but uses normalised tables from #1 and #2**)

        * `select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."NUMBERS_BY_GEOGRAPHY_OVER_TIME_AGGREGATED";`
        
    - numbers_by_geography_over_time_series (**Gives the original table joined on #1 and #2 without aggregations**)

        * `select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."NUMBERS_BY_GEOGRAPHY_OVER_TIME_SERIES";`

4. Connected Google Data Studio with Snowflake using the Supermetrics connector
5. Created a basic dashboard using the above data