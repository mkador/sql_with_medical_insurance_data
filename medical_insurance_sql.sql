select * from insurance_data;
-- 1. Select all columns for all patients.
select * from insurance_data;

-- 2. Display the average claim amount for patients in each region.
select region, avg(claim) from insurance_data
group by region;

-- 3. Select the maximum and minimum BMI values in the table.
select max(bmi) as Maximum_BMI , min(bmi) as Minimum_BMI from insurance_data;

-- 4. Select the PatientID, age, and BMI for patients with a BMI between 40 and 50.
select PatientID,age,bmi from insurance_data
where bmi >=40 and bmi <=50; 


-- 5. Select the number of smokers in each region.
select * from insurance_data;
select region, count(region) from insurance_data
where smoker = 'Yes'
group by region;
-- select region,count(PatientID) from insurance_data where smoker="Yes"
-- group by region;

-- 6. What is the average claim amount for patients who are both diabetic and smokers?
select * from insurance_data;
select avg(claim) as average_both from insurance_data
where diabetic = "Yes" and smoker = "Yes";



-- 7. Retrieve all patients who have a BMI greater 
-- than the average BMI of patients who are smokers.
select * from insurance_data
where bmi > (select avg(bmi) from insurance_data where smoker="Yes") and smoker = "Yes";

-- 8. Select the average claim amount for patients in each age group.
select age,round(avg(claim),2) from insurance_data
group by age
order by age desc;

-- 9. Retrieve the total claim amount for each patient, 
-- along with the average claim amount across all patients.
select * , sum(claim) over(partition by PatientID) as Total_Claim, 
avg(claim) over() as average_claim from insurance_data;



-- 10. Retrieve the top 3 patients with the highest claim amount, along with their 
-- respective claim amounts and the total claim amount for all patients.
select PatientID,claim, sum(claim) over() as Total_Claim from insurance_data
order by claim desc limit 3;

-- 11. Select the details of patients who have a claim amount 
-- greater than the average claim amount for their region.

--  i will solve it later
select * from insurance_data as t1
where claim > (select avg(claim) from insurance_data as t2 where t2.region = t1.region);


-- 12. Retrieve the rank of each patient based on their claim amount.
select * , rank() over(order by claim desc) as rank_serial from insurance_data;

-- 13. Select the details of patients along with their claim amount, 
-- and their rank based on claim amount within their region.
select * , rank() over(order by claim desc) as rank_serial from insurance_data;
