{{config(materialized='table')}}

WITH new_metrics AS (

    select  DATE,
            NEW_ACTIVE_CASES,
            NEW_DEATHS,
            NEW_CASES,
            NEW_RECOVERED,
            NEW_CASES_PER_MILLION,
            NEW_DEATHS_PER_MILLION,
            LOCATION,
            POPULATION,
            AREA    
    from {{ ref('locations') }} INNER JOIN {{ ref('cases_with_time') }} 
    USING (location_id)

)

SELECT * FROM new_metrics