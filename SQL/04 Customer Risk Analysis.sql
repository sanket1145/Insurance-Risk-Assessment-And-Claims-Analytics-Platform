use insurance_claims_analytics;
-- ============================================================
-- SECTION 2 : CUSTOMER RISK ANALYSIS
-- ============================================================
-- ------------------------------------------------------------

-- Business Problem 1
-- Business Objective:
-- Identify which customer age group has the highest insurance claim rate
-- to support risk-based premium pricing.
-- ------------------------------------------------------------
select customer_age_group, count(*) as total_policies, sum(claim_status) as total_claims,
round(sum(claim_status)*100.0/count(*),2) as claim_rate
from claims_data
group by customer_age_group
order by claim_rate desc;

-- ------------------------------------------------------------
-- Business Problem 2
-- Business Objective:
-- Identify customers who represent high-risk profiles based on
-- older vehicles and long subscription periods.
-- ------------------------------------------------------------
select policy_id, customer_age, vehicle_age, subscription_length, customer_age_group, vehicle_age_group
from claims_data
where vehicle_age >= 10
and subscription_length >= 5
order by vehicle_age desc;

-- ------------------------------------------------------------
-- Business Problem 3
-- Business Objective:
-- Determine whether older customers tend to own vehicles with
-- better safety feature scores.
-- ------------------------------------------------------------
select customer_age_group,
round(avg(safety_feature_score),2) as average_safety_score
from claims_data
group by customer_age_group
order by average_safety_score desc;

-- ------------------------------------------------------------
-- Business Problem 4
-- Business Objective:
-- Identify customer age groups that may qualify for premium
-- discounts due to lower insurance claim rates.
-- ------------------------------------------------------------
select customer_age_group, count(*) as total_policies,
sum(claim_status) as total_claims,
round(sum(claim_status)*100.0/count(*),2) as claim_rate
from claims_data
group by customer_age_group
having claim_rate < 10
order by claim_rate;

-- ------------------------------------------------------------
-- Business Problem 5
-- Business Objective:
-- Compare average subscription length across customer age groups
-- to understand customer retention behaviour.
-- ------------------------------------------------------------
select customer_age_group,
round(avg(subscription_length),2) as average_subscription_length
from claims_data
group by customer_age_group
order by average_subscription_length desc;

-- ------------------------------------------------------------
-- Business Problem 6
-- Business Objective:
-- Identify senior customers who have never filed an insurance
-- claim and could be considered low-risk policyholders.
-- ------------------------------------------------------------
select policy_id, customer_age, customer_age_group, subscription_length
from claims_data
where customer_age >= 60
and claim_status = 0
order by customer_age desc;

-- ------------------------------------------------------------
-- Business Problem 7
-- Business Objective:
-- Compare insurance claim rates across customer age groups to
-- support underwriting decisions.
-- ------------------------------------------------------------
select customer_age_group,
sum(claim_status) as total_claims,
count(*) as total_policies,
round(sum(claim_status)*100.0/count(*),2) as claim_percentage
from claims_data
group by customer_age_group
order by claim_percentage desc;

-- ------------------------------------------------------------
-- Business Problem 8
-- Business Objective:
-- Identify customer age groups that should receive additional
-- risk assessment during policy underwriting.
-- ------------------------------------------------------------
select customer_age_group,
round(avg(vehicle_age),2) as average_vehicle_age,
round(avg(safety_feature_score),2) as average_safety_score,
round(sum(claim_status)*100.0/count(*),2) as claim_rate
from claims_data
group by customer_age_group
order by claim_rate desc;
