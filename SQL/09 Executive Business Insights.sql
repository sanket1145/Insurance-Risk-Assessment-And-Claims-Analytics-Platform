use insurance_claims_analytics;
-- ============================================================
-- SECTION 7 : EXECUTIVE BUSINESS INSIGHTS
-- ============================================================
-- ------------------------------------------------------------
-- Business Problem 1
-- Business Objective:
-- Identify the highest-risk customer profile by combining
-- customer age, vehicle age, and vehicle segment.
-- Business Question:
-- Which combination of customer age group, vehicle age group,
-- and vehicle segment has the highest insurance claim percentage?
-- ------------------------------------------------------------
select customer_age_group,vehicle_age_group,segment,count(*) as Total_Policies,
sum(claim_status) as Total_Claims,
round(sum(claim_status)*100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by customer_age_group,vehicle_age_group,segment
order by Insurance_Claim_Percentage desc;

-- ------------------------------------------------------------
-- Business Problem 2
-- Business Objective:
-- Identify whether higher vehicle safety is associated with
-- lower insurance claim rates across different vehicle segments.
-- Business Question:
-- Which combination of vehicle segment and NCAP rating records
-- the lowest insurance claim percentage?
-- ------------------------------------------------------------
select segment,ncap_rating,count(*) as Total_Policies,
sum(claim_status) as Total_Claims,
round(sum(claim_status)*100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by segment,ncap_rating
order by Insurance_Claim_Percentage asc;

-- ------------------------------------------------------------
-- Business Problem 3
-- Business Objective:
-- Identify customer segments that require premium pricing
-- adjustments based on customer age, region, and claims.
-- Business Question:
-- Which combination of customer age group and region density
-- group records the highest insurance claim percentage?
-- ------------------------------------------------------------
select customer_age_group,region_density_group,count(*) as Total_Policies,
sum(claim_status) as Total_Claims,
round(sum(claim_status)*100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by customer_age_group,region_density_group
order by Insurance_Claim_Percentage desc;

-- ------------------------------------------------------------
-- Business Problem 4
-- Business Objective:
-- Identify vehicle categories that should receive stricter
-- underwriting based on multiple vehicle characteristics.
-- Business Question:
-- Which combination of fuel type, transmission type,
-- and engine type has the highest insurance claim percentage?
-- ------------------------------------------------------------
select fuel_type,transmission_type,engine_type,count(*) as Total_Policies,
sum(claim_status) as Total_Claims,
round(sum(claim_status)*100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by fuel_type,transmission_type,engine_type
order by Insurance_Claim_Percentage desc;

-- ------------------------------------------------------------
-- Business Problem 5
-- Business Objective:
-- Identify the overall highest-risk insurance profile by
-- combining customer demographics, vehicle characteristics, and regional factors.
-- Business Question:
-- Which combination of customer age group, vehicle segment,
-- region density group, and safety feature score represents
-- the highest insurance risk?
-- ------------------------------------------------------------
select customer_age_group,segment,region_density_group,safety_feature_score,
count(*) as Total_Policies,
sum(claim_status) as Total_Claims,
round(sum(claim_status)*100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by customer_age_group,segment,region_density_group,safety_feature_score
having count(*) >= 20
order by Insurance_Claim_Percentage desc;


