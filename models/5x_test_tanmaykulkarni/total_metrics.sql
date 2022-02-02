/*

    This model creates a separate table of only the "TOTAL" metrics from the original dataset.
    It joins the denormalized "locations" and "cases_with_time" tables,
    to obtain the final result

*/


{{config(materialized='table')}}

WITH total_metrics AS (

    select  DATE,
            TOTAL_CASES,
            TOTAL_ACTIVE_CASES,
            TOTAL_DEATHS,
            TOTAL_RECOVERED,
            TOTAL_CASES_PER_MILLION,
            TOTAL_DEATHS_PER_MILLION,
            LOCATION,
            POPULATION,
            AREA    
    from {{ ref('locations') }} INNER JOIN {{ ref('cases_with_time') }} 
    USING (location_id)

)

SELECT * FROM total_metrics