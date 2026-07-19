use insurance_claims_analytics;
-- ============================================================
-- SECTION 8 : ADVANCED SQL ANALYTICS
-- ============================================================

-- ------------------------------------------------------------
-- Business Problem 1
-- Business Objective:
-- Identify vehicle segments whose insurance claim percentage
-- is higher than the overall average claim percentage.
-- Business Question:
-- Which vehicle segments perform worse than the overall insurance portfolio?
-- ------------------------------------------------------------
with segment_claim_rate as
(
    select
        segment,
        count(*) as total_policies,
        sum(claim_status) as total_claims,
        round(sum(claim_status)*100.0/count(*),2) as claim_percentage
    from claims_data
    group by segment
)
select * from segment_claim_rate
where claim_percentage >
(
    select round(sum(claim_status)*100.0/count(*),2)
    from claims_data
);

-- ------------------------------------------------------------
-- Business Problem 2
-- Business Objective:
-- Rank customer age groups based on insurance claim percentage.
-- Business Question:
-- Which customer age groups have the highest claim risk?
-- ------------------------------------------------------------
select customer_age_group,
count(*) as total_policies,
sum(claim_status) as total_claims,
round(sum(claim_status)*100.0/count(*),2) as claim_percentage,
rank() over( order by round(sum(claim_status)*100.0/count(*),2) desc) as risk_rank
from claims_data
group by customer_age_group;

-- ------------------------------------------------------------
-- Business Problem 3
-- Business Objective:
-- Assign a unique ranking to vehicle segments based on  insurance claim percentage.
-- Business Question:
-- Which vehicle segment is the highest-risk segment?
-- ------------------------------------------------------------
select segment, round(sum(claim_status)*100.0/count(*),2) as claim_percentage,
row_number() over( order by round(sum(claim_status)*100.0/count(*),2) desc) as row_number_rank
from claims_data
group by segment;

-- ------------------------------------------------------------
-- Business Problem 4
-- Business Objective:
-- Rank region codes according to insurance claim percentage while allowing ties.
-- Business Question:
-- Which regions share similar insurance claim rankings?
-- ------------------------------------------------------------
select region_code, round(sum(claim_status)*100.0/count(*),2) as claim_percentage,
dense_rank() over( order by round(sum(claim_status)*100.0/count(*),2) desc) as denserank
from claims_data
group by region_code;

-- ------------------------------------------------------------
-- Business Problem 5
-- Business Objective:
-- Divide all region codes into four risk groups.
-- Business Question:
-- Which regions belong to the highest insurance risk quartile?
-- ------------------------------------------------------------
select region_code,
round(sum(claim_status)*100.0/count(*),2) as claim_percentage,
ntile(4) over(order by round(sum(claim_status)*100.0/count(*),2) desc ) as risk_quartile
from claims_data
group by region_code;

-- ------------------------------------------------------------
-- Business Problem 6
-- Business Objective:
-- Compare each NCAP safety rating with the previous rating's  insurance claim percentage.
-- Business Question:
-- How does claim percentage change as NCAP rating changes?
-- ------------------------------------------------------------
with ncap_analysis as
(
select ncap_rating,
round(sum(claim_status)*100.0/count(*),2) as claim_percentage
from claims_data
group by ncap_rating
)
select *, lag(claim_percentage)
over(order by ncap_rating) as previous_claim_percentage
from ncap_analysis;

-- ------------------------------------------------------------
-- Business Problem 7
-- Business Objective:
-- Compare each subscription tenure group's insurance claim
-- percentage with the next tenure group.
-- Business Question:
-- How does insurance claim percentage change across
-- subscription tenure groups?
-- ------------------------------------------------------------
with subscription_analysis as
(
select subscription_tenure_group,
round(sum(claim_status)*100.0/count(*),2) as claim_percentage
from claims_data
group by subscription_tenure_group
)
select *, lead(claim_percentage)
over(order by subscription_tenure_group) as next_claim_percentage
from subscription_analysis;

-- ------------------------------------------------------------
-- Business Problem 8
-- Business Objective:
-- Calculate the cumulative number of insurance policies across region codes.
-- Business Question:
-- What is the running total of insurance policies?
-- ------------------------------------------------------------
select region_code, count(*) as total_policies,sum(count(*))
over(order by region_code) as running_total_policies
from claims_data
group by region_code;

-- ------------------------------------------------------------
-- Business Problem 9
-- Business Objective:
-- Measure the contribution of each vehicle segment toward total insurance claims.
-- Business Question:
-- Which vehicle segment contributes the largest percentage of all insurance claims?
-- ------------------------------------------------------------
select segment,sum(claim_status) as total_claims,
round(sum(claim_status)*100.0/sum(sum(claim_status)) over(),2)
as contribution_percentage
from claims_data
group by segment;