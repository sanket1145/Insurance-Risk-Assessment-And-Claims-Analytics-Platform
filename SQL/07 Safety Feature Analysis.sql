use insurance_claims_analytics;
-- ============================================================
-- SECTION 5 : SAFETY FEATURE ANALYSIS
-- ============================================================

-- ------------------------------------------------------------
-- Business Problem 1
-- Business Objective:
-- Evaluate whether vehicles with higher NCAP safety ratings
-- experience lower insurance claim rates.
-- Business Question:
-- Which NCAP safety rating has the lowest insurance claim percentage?
-- ------------------------------------------------------------
select ncap_rating,count(*) as total_policies,
sum(claim_status) as total_claims,
round(sum(claim_status) * 100.0/count(*),2) as Insurance_Claims_Percentage
from claims_data
group by ncap_rating
order by Insurance_Claims_Percentage asc;

-- ------------------------------------------------------------
-- Business Problem 2
-- Business Objective:
-- Assess whether vehicles with higher Safety Feature Scores
-- have lower insurance claim rates.
-- Business Question:
-- Which Safety Feature Score category has the lowest claim percentage?
-- ------------------------------------------------------------
select safety_feature_score, count(*) as total_policies,
sum(claim_status) as total_claims,
round(sum(claim_status) * 100.0/count(*),2) as Insurance_Claims_Percentage
from claims_data
group by safety_feature_score
order by Insurance_Claims_Percentage asc;

-- ------------------------------------------------------------
-- Business Problem 3
-- Business Objective:
-- Evaluate the impact of Electronic Stability Control (ESC)
-- on insurance claim frequency.
-- Business Question:
-- Do vehicles equipped with ESC experience lower insurance
-- claim rates than vehicles without ESC?
-- ------------------------------------------------------------
select  is_esc, count(*) as total_policies,
sum(claim_status) as total_claims,
round(sum(claim_status) * 100.0/count(*),2) as Insurance_Claims_Percentage
from claims_data
group by is_esc
order by Insurance_Claims_Percentage desc;

-- ------------------------------------------------------------
-- Business Problem 4
-- Business Objective:
-- Compare insurance claim rates based on the number of airbags
-- installed in vehicles.
-- Business Question:
-- Does a higher number of airbags reduce insurance claim rates?
-- ------------------------------------------------------------
select airbags,count(*) as total_policies,
sum(claim_status) as total_claims,
round(sum(claim_status) * 100.0/count(*),2) as Insurance_Claims_Percentage
from claims_data
group by airbags
order by Insurance_Claims_Percentage desc;

-- ------------------------------------------------------------
-- Business Problem 5
-- Business Objective:
-- Identify vehicles with the weakest safety profile to support
-- underwriting and premium pricing decisions.
-- Business Question:
-- Which combination of NCAP rating and Safety Feature Score
-- records the highest insurance claim percentage?
-- ------------------------------------------------------------
select ncap_rating,safety_feature_score,count(*) as total_policies,
sum(claim_status) as total_claims,
round(sum(claim_status) * 100.0/count(*),2) as Insurance_Claims_Percentage
from claims_data
group by ncap_rating,safety_feature_score
order by Insurance_Claims_Percentage desc;

