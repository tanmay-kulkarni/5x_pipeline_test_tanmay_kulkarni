# 5x_pipeline_test_tanmay_kulkarni
My dbt code for the 6 hour pipeline test taken on Feb 1, 2022

## Goals Achieved:

1. **Ingested data from the shared Google Sheet to the Snowflake database using Fivetran**
![image](https://user-images.githubusercontent.com/8901293/152093967-fb7baa7a-6a59-4e6b-ac88-89fb06d93d40.png)


2. **Configured dbt cloud successfully to work on the Snowflake database**
        ![image](https://user-images.githubusercontent.com/8901293/152094058-a825ac93-5100-4e06-9682-37ba1e732cb8.png)

3. **Wrote the following 5 models:**

![image](https://user-images.githubusercontent.com/8901293/152093362-a79227f8-6f39-4fd0-96ce-a7d4da0d5510.png)

    
 * locations (**Normalised geography data from the original raw table**)
       
       select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."LOCATIONS";

 * cases_with_time (**Normalised time series data that links with "locations" via location_id (new field)**)

       select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."CASES_WITH_TIME";
        
 * new_metrics (**Generates NEW case data from the normalised tables "locations" and "cases_with_time"**)

       select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."NEW_METRICS";
        
 * total_metrics (**Generates TOTAL case data from the normalised tables "locations" and "cases_with_time**)

       select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."TOTAL_METRICS";
        
 * ratios_by_geolocation (**Generates derived fields "coordinates" and case ratios from the RAW table**)

       select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."RATIOS_BY_GEOLOCATION";

 * areas_with_highest_active_cases (**Generates a table of the top locations having the highest NEW covid-19 cases**)

       select * from "INTERVIEW_DB"."PLAYGROUND_TANMAY_KULKARNI"."AREAS_WITH_HIGHEST_ACTIVE_CASES";

4. **Connected Google Data Studio with Snowflake using the Supermetrics connector (I later faced some connection issues with Supermetrics, so I then decided to export my models from Snowflake as CSV and used them as data soruces in GDS)**
        ![image](https://user-images.githubusercontent.com/8901293/152094292-44eda47f-d2e0-42fe-bf2f-68faa89d7d32.png)


5. **Created a basic dashboard using the above data**
        ![image](https://user-images.githubusercontent.com/8901293/152094417-e9eee004-a0c9-44d7-ba21-b03dfec32591.png)
        ![image](https://user-images.githubusercontent.com/8901293/152094450-7588eb24-d39f-4f63-a8e1-458ff475a93e.png)
        ![image](https://user-images.githubusercontent.com/8901293/152094481-9b0adad1-3cc4-4a0e-aef3-87cede676105.png)


