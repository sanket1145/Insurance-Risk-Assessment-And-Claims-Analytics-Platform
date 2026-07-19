LOAD DATA LOCAL INFILE 'C:/Users/SANKET PATIL/OneDrive/Desktop/Data Analytics Project/Insurance Risk Assessment & Claims Analytics Platform/Dataset/Insurance_Claims_Data_Cleaned.csv'
INTO TABLE claims_data
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

