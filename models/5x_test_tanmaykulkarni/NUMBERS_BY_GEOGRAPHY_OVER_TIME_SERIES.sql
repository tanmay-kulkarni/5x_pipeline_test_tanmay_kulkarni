/*

    This model joins the normalised "locations" table with the normalized "cases_with_time" table
    over the key "location_id" that I've creaded in the locations model,
    to give back the original time series data which includes location information

*/

{{config(materialized='table')}}

with joined_table as (
    select L.location, L.country, L.continent, L.province, T.Date, T.total_cases, T.new_cases, T.total_deaths, T.total_recovered,T.total_active_cases
    from {{ ref('locations')}} as L inner join {{ref('cases_with_time')}} as T
    using (location_id)
)

select * from joined_table