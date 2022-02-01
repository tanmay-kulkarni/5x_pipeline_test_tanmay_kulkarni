{{config(materialized='table')}}


select DATE, 
        location,
        concat(latitude, ',',longitude) as coordinates,
        total_cases,
        total_deaths, 
        population,
        total_cases/population * 100 cases_to_population_ratio,
        total_deaths/population * 100 as deaths_to_population_ratio
from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_TANMAY_KULKARNI"