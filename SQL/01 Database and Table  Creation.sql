create database if not exists insurance_claims_analytics;

use insurance_claims_analytics;

CREATE TABLE if not exists claims_data (

    policy_id VARCHAR(20) PRIMARY KEY,

    subscription_length DECIMAL(5,2),

    vehicle_age DECIMAL(5,2),

    customer_age INT,

    region_code varchar(10),

    region_density INT,

    segment VARCHAR(100),

    model VARCHAR(100),

    fuel_type VARCHAR(20),

    max_torque VARCHAR(50),

    max_power VARCHAR(50),

    engine_type VARCHAR(100),

    airbags INT,

    is_esc VARCHAR(5),

    is_adjustable_steering VARCHAR(5),

    is_tpms VARCHAR(5),

    is_parking_sensors VARCHAR(5),

    is_parking_camera VARCHAR(5),

    rear_brakes_type VARCHAR(30),

    displacement int,

    cylinder INT,

    transmission_type VARCHAR(20),

    steering_type VARCHAR(30),

    turning_radius DECIMAL(5,2),

    length INT,

    width INT,

    gross_weight INT,

    is_front_fog_lights VARCHAR(5),

    is_rear_window_wiper VARCHAR(5),

    is_rear_window_washer VARCHAR(5),

    is_rear_window_defogger VARCHAR(5),

    is_brake_assist VARCHAR(5),

    is_power_door_locks VARCHAR(5),

    is_central_locking VARCHAR(5),

    is_power_steering VARCHAR(5),

    is_driver_seat_height_adjustable VARCHAR(5),

    is_day_night_rear_view_mirror VARCHAR(5),

    is_ecw VARCHAR(5),

    is_speed_alert VARCHAR(5),

    ncap_rating INT,

    claim_status INT,

    max_torque_nm DECIMAL(8,2),

    max_power_bhp DECIMAL(8,2),

    customer_age_group VARCHAR(30),

    vehicle_age_group VARCHAR(30),

    subscription_tenure_group VARCHAR(30),

    region_density_group VARCHAR(30),

    safety_feature_score INT,

    claim_status_label VARCHAR(20)

);