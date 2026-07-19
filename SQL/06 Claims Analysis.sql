use insurance_claims_analytics;
-- ============================================================
-- SECTION 4 : CLAIMS ANALYSIS
-- ============================================================

-- ------------------------------------------------------------
-- Business Problem 1
-- Business Objective:
-- Measure the overall insurance claim rate across all policies
-- to understand the company's claim frequency.
-- Business Question:
-- What is the overall insurance claim percentage?
-- ------------------------------------------------------------
select count(*) as total_policies,
sum(claim_status) as total_claims,round(sum(claim_status)*100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data;

-- ------------------------------------------------------------
-- Business Problem 2
-- Business Objective:
-- Identify which customer age group contributes the highest
-- number of insurance claims.
-- Business Question:
-- Which customer age group has the highest claim percentage?
-- ------------------------------------------------------------
select customer_age_group,count(*) as total_policies,
sum(claim_status) as total_claims,
round(sum(claim_status)*100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by customer_age_group
order by Insurance_Claim_Percentage desc;

-- ------------------------------------------------------------
-- Business Problem 3
-- Business Objective:
-- Analyze insurance claim rates across different vehicle
-- segments to identify high-risk categories.
-- Business Question:
-- Which vehicle segment records the highest claim percentage?
-- ------------------------------------------------------------
select segment, count(*) as total_policies,
sum(claim_status) as total_claims,
round(sum(claim_status)*100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by segment 
order by Insurance_Claim_Percentage desc;

-- ------------------------------------------------------------
-- Business Problem 4
-- Business Objective:
-- Identify combinations of customer age group and vehicle age
-- group that contribute the highest insurance claim rates.
-- Business Question:
-- Which customer profile has the highest claim percentage?
-- ------------------------------------------------------------
select customer_age_group,vehicle_age_group, count(*) as total_policies,
sum(claim_status) as total_claims,
round(sum(claim_status)*100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by customer_age_group,vehicle_age_group
order by Insurance_Claim_Percentage desc;

-- ------------------------------------------------------------
-- Business Problem 5
-- Business Objective:
-- Identify the customer and vehicle characteristics associated
-- with the highest insurance claim risk to support underwriting
-- and premium pricing decisions.
-- Business Question:
-- Which combination of customer age group, vehicle segment,
-- and fuel type has the highest insurance claim percentage?
-- ------------------------------------------------------------
select customer_age_group, segment, fuel_type, count(*) as total_policies,
sum(claim_status) as total_claims,
round(sum(claim_status)*100.0/count(*),2) as Insurance_Claim_Percentage
from claims_data
group by customer_age_group, segment, fuel_type
having count(*) >= 20
order by Insurance_Claim_Percentage desc;


