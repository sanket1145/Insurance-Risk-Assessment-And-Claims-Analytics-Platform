use insurance_claims_analytics;
-- ============================================================
-- SECTION 6 : REGIONAL & POLICY ANALYSIS
-- ============================================================

-- ------------------------------------------------------------
-- Business Problem 1
-- Business Objective:
-- Analyze insurance claim rates across different regions to
-- identify high-risk geographical areas.
-- Business Question:
-- Which region code has the highest insurance claim percentage?
-- ------------------------------------------------------------
select region_code,count(*) as Total_policies, sum(claim_status) as Total_Claims,
round(sum(claim_status) * 100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by region_code
order by Insurance_Claim_Percentage desc;

-- ------------------------------------------------------------
-- Business Problem 2
-- Business Objective:
-- Evaluate whether population density influences insurance claim rates.
-- Business Question:
-- Which region density group records the highest claim percentage?
-- ------------------------------------------------------------
select region_density_group,count(*) as Total_policies, sum(claim_status) as Total_Claims,
round(sum(claim_status) * 100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by region_density_group
order by Insurance_Claim_Percentage desc;

-- ------------------------------------------------------------
-- Business Problem 3
-- Business Objective:
-- Analyze the relationship between policy subscription length
-- and insurance claim occurrence.
-- Business Question:
-- Which subscription tenure group has the highest claim rate?
-- ------------------------------------------------------------
select subscription_tenure_group,count(*) as Total_policies, sum(claim_status) as Total_Claims,
round(sum(claim_status) * 100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by subscription_tenure_group
order by Insurance_Claim_Percentage desc;

-- ------------------------------------------------------------
-- Business Problem 4
-- Business Objective:
-- Identify regional and subscription combinations associated with higher insurance risk.
-- Business Question:
-- Which combination of region density group and subscription
-- tenure group records the highest insurance claim percentage?
-- ------------------------------------------------------------
select region_density_group,subscription_tenure_group,
count(*) as Total_policies, 
sum(claim_status) as Total_Claims,
round(sum(claim_status) * 100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by region_density_group,subscription_tenure_group
order by Insurance_Claim_Percentage desc;

-- ------------------------------------------------------------
-- Business Problem 5
-- Business Objective:
-- Identify customer segments requiring stricter underwriting
-- based on regional density and policy tenure.
-- Business Question:
-- Which combination of region code and subscription tenure
-- group represents the highest insurance risk?
-- ------------------------------------------------------------
select region_code,subscription_tenure_group,
count(*) as Total_policies, 
sum(claim_status) as Total_Claims,
round(sum(claim_status) * 100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by region_code,subscription_tenure_group
order by Insurance_Claim_Percentage desc;



