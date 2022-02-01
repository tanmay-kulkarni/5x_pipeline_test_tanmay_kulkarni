/*

    This model joins the denormalised "locations" table with the denormalized "cases_with_time" table
    over the key "location_id" that I've creaded in the locations model.
    Then calculates the aggregate values for the specified category

*/


{{config(materialized='table')}}

with joined_table as (
    select L.location, L.country, L.continent, L.province, T.Date, T.total_cases, T.new_cases, T.total_deaths, T.total_recovered,T.total_active_cases
    from {{ ref('locations')}} as L inner join {{ref('cases_with_time')}} as T
    using (location_id)
),

result as (

select Date, 
        Location, 
        country, 
        continent, 
        province, 
        sum(total_cases) as total_cases,
        sum(new_cases) as new_cases,
        sum(total_deaths) as total_deaths,
        sum(total_recovered) as total_recovered,
        sum(total_active_cases) as total_active_cases 

from joined_table
group by Date, Location, country, continent, province
order by Date desc
)

select * from result