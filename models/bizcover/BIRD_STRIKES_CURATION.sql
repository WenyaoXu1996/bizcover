/*  This is a model config block. With it, you can create model specific configurations and override the configurations set on the dbt_project.yml. 
*/
{{ config(
    materialized="table"
) }}

/* This is a dbt model  which means that it fits 2 requirements:
- Is a select statement
- Defined in a .sql file under the models directory
When you run the dbt model, dbt will wrap the correct DDL and DML to create the object in Snowflake. This allows users to
focus on writing the SQL without worry about the create statement. 
Full documention: https://docs.getdbt.com/docs/building-a-dbt-project/building-models
*/
with src as (

    select * from {{ source('bizcover_landing', 'BIRD_STRIKES_LANDING') }}

),

renamed AS (
    select 
        "Record ID" AS record_id,
        "Aircraft: Type" AS aircraft_type,
        "Airport: Name" AS airport_name,
        "Altitude bin" AS altitude_bin,
        "Aircraft: Make/Model" AS aircraft_model,
        "Wildlife: Number struck" AS wildlife_struck,
        "Wildlife: Number Struck Actual" AS wildlife_struck_actual,
        "Effect: Impact to flight" AS flight_impact,
        flightdate AS flight_date,
        "Effect: Indicated Damage" AS indicated_damage,
        "Aircraft: Airline/Operator" AS airline_operator,
        "Origin State" AS origin_state,
        "When: Phase of flight" AS flight_phase,
        "Conditions: Precipitation" AS precipitation,
        "Remains of wildlife collected?" AS wildlife_collected,
        "Remains of wildlife sent to Smithsonian" AS wildlife_sent,
        remarks AS remarks,
        "Wildlife: Size" AS wildlife_size,
        "Conditions: Sky" AS sky_condition,
        "Wildlife: Species" AS wildlife_species,
        "Pilot warned of birds or wildlife?" AS pilot_warned,
        "Cost: Total $" AS total_cost,
        "Feet above ground" AS ground_feet,
        "Number of people injured" AS people_injured,
        "Is Aircraft Large?" AS large_aircraft,
        "var_1" AS aircraft_engines,
        "filename"  

    from src
)


    
select
    * 
from renamed