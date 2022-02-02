/*
        This model combines the Latitude and Longitude fields from the original dataset,
        and creates a new field called "coordinates".

        It also calculates the ratios of total cases to population,
        and total deaths to population.

        This model will help me create a geographical map.
*/


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