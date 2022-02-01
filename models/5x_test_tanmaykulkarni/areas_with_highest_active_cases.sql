{{config(materialized='table')}}

select DATE, 
        location, 
        sum(new_cases) as cases, 
        sum(NEW_DEATHS) as deaths,
        sum(NEW_RECOVERED) as recovered,
        sum(NEW_ACTIVE_CASES) as active_cases
from {{ref('cases_with_time')}} as C INNER JOIN {{ref('locations')}} as L
USING (location_id)
group by DATE, location
order by DATE, active_cases desc