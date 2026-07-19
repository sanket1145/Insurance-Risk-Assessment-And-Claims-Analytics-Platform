use insurance_claims_analytics;
-- ============================================================
-- SECTION 3 : VEHICLE RISK ANALYSIS
-- ============================================================
-- ------------------------------------------------------------
-- Business Problem 1
-- Business Objective:
-- Business Question:
-- Which vehicle segment has the highest claim percentage?
-- ------------------------------------------------------------
select segment,count(policy_id) as total_policies,
round(sum(claim_status)*100.0/count(*),2) as claim_percentage
from claims_data
group by segment
order by claim_percentage desc;

-- ------------------------------------------------------------
-- Business Problem 2
-- Business Objective:
-- Evaluate whether older vehicles are associated with higher insurance claim rates.
-- Business Question: Which vehicle age group has the highest claim rate?
-- ------------------------------------------------------------
select vehicle_age_group, 
round(sum(claim_status)*100.0/count(*),2) as claim_rate
from claims_data
group by vehicle_age_group
order by claim_rate desc;

-- ------------------------------------------------------------
-- Business Problem 3
-- Business Objective:
-- Compare insurance claim rates across different fuel types to understand vehicle risk profiles.
-- Business Question: Which fuel type has the highest insurance claim rate?
-- ------------------------------------------------------------
select fuel_type, 
round(sum(claim_status)*100.0/count(*),2) as Claim_Rate
from claims_data
group by fuel_type
order by Claim_Rate desc;

-- ------------------------------------------------------------
-- Business Problem 4
-- Business Objective:
-- Analyze whether transmission type influences insurance claim frequency.
-- Business Question: Which transmission type experiences more claims?
-- ------------------------------------------------------------
select transmission_type, sum(claim_status) as Total_Claims
from claims_data
group by transmission_type
order by Total_Claims desc;

-- ------------------------------------------------------------
-- Business Problem 5
-- Business Objective:
-- Evaluate claim rates across different engine types to identify high-risk vehicle configurations.
-- Business Question:  Which engine type has the highest claim percentage?
-- ------------------------------------------------------------
select engine_type, 
round(sum(claim_status)*100.0/count(*),2) as Claim_Rate
from claims_data
group by engine_type
order by Claim_Rate desc;

-- ------------------------------------------------------------
-- Business Problem 6
-- Business Objective:
-- Identify vehicle models that generate the highest
-- number of insurance claims.
--
-- Business Question:
-- Which vehicle models have the highest claim count?
-- ------------------------------------------------------------
select model,
round(sum(claim_status)*100.0/count(*),2) as CLaim_Rate
from claims_data
group by model
order by CLaim_Rate desc;

-- ------------------------------------------------------------
-- Business Problem 7
-- Business Objective:
-- Compare the average safety feature score across different vehicle segments.
-- Business Question: Which vehicle segment has the highest average safety feature score?
-- ------------------------------------------------------------
select segment,round(avg(Safety_Feature_Score),2) as Average_Safety_Feature_Score
from claims_data
group by segment 
order by Average_Safety_Feature_Score desc;

-- ------------------------------------------------------------
-- Business Problem 8
-- Business Objective: Analyze NCAP safety ratings across vehicle segments.
-- Business Question: Which vehicle segment has the highest average NCAP safety rating?
-- ------------------------------------------------------------
select segment,round(avg(ncap_rating),2) as Average_NCAP_Safety_Rating
from claims_data
group by segment 
order by Average_NCAP_Safety_Rating desc;

-- ------------------------------------------------------------
-- Business Problem 9
-- Business Objective:
-- Identify vehicle categories that should receive
-- additional underwriting review before policy approval.
-- Business Question:
-- Which combination of vehicle segment and fuel type
-- has the highest insurance claim rate?
-- ------------------------------------------------------------
select segment, fuel_type,
round(sum(claim_status)*100.0/count(*),2) as Claim_Rate
from claims_data
group by segment,fuel_type
order by Claim_Rate desc;

-- ------------------------------------------------------------
-- Business Problem 10
-- Business Objective:
-- Identify vehicles with the highest risk profile
-- based on claim occurrence, safety score, and vehicle age.
-- Business Question:
-- Which vehicle models appear to be the most high-risk?
-- ------------------------------------------------------------
select model,
round(avg(vehicle_age),2) as average_vehicle_age,
round(avg(safety_feature_score),2) as average_safety_score,
count(*) as total_policies,
sum(claim_status) as total_claims,
round(sum(claim_status)*100.0/count(*),2) as claim_percentage
from claims_data
group by model
order by claim_percentage desc, average_vehicle_age desc, average_safety_score asc;


