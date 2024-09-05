##Query to find which gender consumes more bevarages
select distinct(gender), count(gender) as Gender_count
from dim_repondents
group by gender
order by Gender_count desc;

##Query to find which age_group consumes more bevarages
select distinct(age),count(age) as Age_Wise_count
from dim_repondents
group by age
order by Age_Wise_count desc;

## Query to find Which type of marketing reaches the most Youth (15-30)?
select distinct Marketing_channels,count(Marketing_channels) as Channels_count from fact_survey_responses s
join dim_repondents d
on s.Respondent_ID = d.Respondent_ID
where age in ("15-18","19-30")
group by Marketing_channels
order by Channels_count desc;

## What are the preferred ingredients of energy drinks among respondents?
SELECT Current_brands as Drink_name,Ingredients_expected as Preffered_ingredients,
count(Ingredients_expected) Preffered_Ingred_Count FROM fact_survey_responses
group by Current_brands,Ingredients_expected
order by Preffered_Ingred_Count desc;

##What packaging preferences do respondents have for energy drinks
select current_brands as Energy_Drink,packaging_preference,count(Packaging_preference) as Package_pref from fact_survey_responses
group by Current_brands,Packaging_preference
order by Package_pref desc;

## Who are the current market leaders
select Current_brands,
count(Respondent_ID) as No_of_people from fact_survey_responses
group by Current_brands
order by No_of_people desc;

## What are the primary reasons consumers prefer those brands over ours
##reasons are : Availability,Taste/flavour preference
select Current_brands,Reasons_for_choosing_brands,
count(Reasons_for_choosing_brands) as No_of_consumers from fact_survey_responses
group by Current_brands,Reasons_for_choosing_brands
order by No_of_consumers desc;

## Which marketing channel can be used to reach more customers?
select distinct Marketing_channels,
count(Marketing_channels) as No_of_People_Viewed
from fact_survey_responses
group by Marketing_channels
order by No_of_People_Viewed desc;

##How effective are different marketing strategies and channels in reaching our customers ?
select marketing_channels, count(Marketing_channels) as Marketing_count
from fact_survey_responses
where Current_brands =  "codex"
group by Marketing_channels
order by Marketing_count desc;

## What do people think about our brand? (overall rating)
select Brand_perception,
Current_brands,
count(Brand_perception) as Feedback_count from fact_survey_responses
where Current_brands = "Codex"
group by Brand_perception
order by Feedback_count desc;


##Which cities do we need to focus more on?
select distinct city, count(name) as No_of_Customers from dim_cities  c
join dim_repondents r
on c.City_ID = r.City_ID
group by city
order by No_of_Customers desc;

## Where do respondents prefer to purchase energy drinks?
select Purchase_location,
count(Respondent_ID)  as count_of_buyers
from fact_survey_responses
group by Purchase_location
order by count_of_buyers desc;

## What are the typical consumption situations for energy drinks among respondents?
select Current_brands,Typical_consumption_situations,
count(Respondent_ID)  as count_of_consumers
from fact_survey_responses
group by Current_brands,Typical_consumption_situations
order by count_of_consumers desc;


## What factors influence respondents' purchase decisions, such as price range and limited edition packaging?
select Limited_edition_packaging,Price_range,
count(Respondent_ID) as no_of_respondents
from fact_survey_responses
group by Limited_edition_packaging,Price_range
order by no_of_respondents desc;



##EXTRA Analysis  
## our brand_consumed more in which city
select distinct s.Current_brands,city,
count(s.Respondent_ID) as counts from fact_survey_responses s
join dim_repondents r
on s.Respondent_ID = r.Respondent_ID
join dim_cities c
on r.City_ID = c.City_ID
where Current_brands = "codex"
group by s.Current_brands,City
order by counts desc;

## City - wise No.of consumers
select distinct city,
count(s.Respondent_ID) as counts from fact_survey_responses s
join dim_repondents r
on s.Respondent_ID = r.Respondent_ID
join dim_cities c
on r.City_ID = c.City_ID
group by City
order by counts desc;

## Tier wise no.of Consumers
select distinct tier,
count(s.Respondent_ID) as No_of_consumers from fact_survey_responses s
join dim_repondents r
on s.Respondent_ID = r.Respondent_ID
join dim_cities c
on r.City_ID = c.City_ID
group by tier
order by No_of_consumers desc;

#######################################################################



