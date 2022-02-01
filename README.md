# 5x_pipeline_test_tanmay_kulkarni
My dbt code for the 6 hour pipeline test taken on Feb 1, 2022


## Goals Achieved:

1. Ingested data from the shared Google Sheet to the Snowflake database using Fivetran
2. Configured dbt cloud successfully to work on the Snowflake database
3. Wrote the following 5 models:
        
        - locations (*Normalised geography data from the original raw table*)

        - cases_with_time [Normalised time series data that links with "locations" via location_id (new field) ]
        
        - location_level_numbers_over_time [Calculates aggregate numbers from the raw data]
        
        - numbers_by_geography_over_time_aggregated [Same as above, but uses normalised tables from #1 and #2]
        
        - numbers_by_geography_over_time_series [Gives the original table joined on #1 and #2 without aggregations ]

4. Connected Google Data Studio with Snowflake using the Supermetrics connector
5. Created a basic dashboard using the above data