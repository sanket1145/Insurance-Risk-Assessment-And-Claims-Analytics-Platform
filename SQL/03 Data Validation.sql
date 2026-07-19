use insurance_claims_analytics;
-- ============================================================
-- SECTION 1 : DATA VALIDATION
-- ============================================================
-- ------------------------------------------------------------
-- Query 1 : Total Records
-- Business Question: Did all insurance policy records get imported successfully?
-- ------------------------------------------------------------
select count(*) as total_records
from claims_data;

-- ------------------------------------------------------------
-- Query 2 : Duplicate Policy IDs
-- Business Question: Are there any duplicate Policy IDs in the dataset
-- ------------------------------------------------------------
select count(*) as duplicate_policies
from
(
    select policy_id
    from claims_data
    group by policy_id
    having count(*) > 1
) as duplicates;

-- ------------------------------------------------------------
-- Query 3 : Missing Customer Age
-- Business Question: Are any customer ages missing?
-- ------------------------------------------------------------
select count(*) as missing_customer_age
from claims_data
where customer_age is null;

-- ------------------------------------------------------------
-- Query 4 : Missing Vehicle Age
-- Business Question: Are any vehicle ages missing?
-- ------------------------------------------------------------
select count(*) as missing_vehicle_age
from claims_data
where vehicle_age is null;

-- ------------------------------------------------------------
-- Query 5 : Claim Status Distribution
-- Business Question: How many insurance policies resulted in claims and non-claims?
-- ------------------------------------------------------------
select claim_status_label, count(*) as total_policies
from claims_data
group by claim_status_label
order by total_policies desc;

-- ------------------------------------------------------------
-- Query 6A : Total Vehicle Segments
-- Business Question: How many unique vehicle segments exist?
-- ------------------------------------------------------------
select count(distinct segment) as total_vehicle_segments
from claims_data;

-- ------------------------------------------------------------
-- Query 6B : List All Vehicle Segments
-- Business Question: Which vehicle segments are insured?
-- ------------------------------------------------------------
select distinct segment
from claims_data
order by segment;

-- ------------------------------------------------------------
-- Query 7A : Total Fuel Types
-- Business Question: How many different fuel types exist?
-- ------------------------------------------------------------
select count(distinct fuel_type) as total_fuel_types
from claims_data;

-- ------------------------------------------------------------
-- Query 7B : List All Fuel Types
-- Business Question: Which fuel types are available?
-- ------------------------------------------------------------
select distinct fuel_type
from claims_data
order by fuel_type;

-- ------------------------------------------------------------
-- Query 8 : Transmission Type Distribution
-- Business Question: How many policies belong to each transmission type?
-- ------------------------------------------------------------
select transmission_type, count(*) as total_policies
from claims_data
group by transmission_type
order by total_policies desc;

-- ------------------------------------------------------------
-- Query 9 : Customer Age Range
-- Business Question: What is the minimum, maximum, and average customer age?
-- ------------------------------------------------------------
select min(customer_age) as minimum_age,
max(customer_age) as maximum_age,
round(avg(customer_age), 2) as average_age
from claims_data;

-- ------------------------------------------------------------
-- Query 10 : Vehicle Age Range
-- Business Question: What is the minimum, maximum, and average vehicle age?
-- ------------------------------------------------------------
select min(vehicle_age) as minimum_vehicle_age,
max(vehicle_age) as maximum_vehicle_age,
round(avg(vehicle_age), 2) as average_vehicle_age
from claims_data;