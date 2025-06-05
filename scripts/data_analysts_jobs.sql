-- 1.	How many rows are in the data_analyst_jobs table?
 SELECT * FROM data_analysts_jobs; -- 1793

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
 SELECT * FROM data_analysts_jobs LIMIT 10; -- Exxonmobil

 -- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT * FROM data_analysts_jobs
WHERE location LIKE 'TN'
OR location LIKE 'KY'; -- 21 in TN and 6 in KY equals 27 altogether for both locations

-- 4.	How many postings in Tennessee have a star rating above 4?
SELECT * FROM data_analysts_jobs
WHERE location LIKE 'TN'
AND star_rating >= 4; -- 4 postings

--5.	How many postings in the dataset have a review count between 500 and 1000?
SELECT * FROM data_analysts_jobs
WHERE review_count between 500 AND 1000; -- 151 postings

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
SELECT location AS state, company, ROUND(AVG(star_rating), 2) AS avg_rating
FROM data_analysts_jobs
WHERE star_rating IS NOT NULL
GROUP BY location, company, star_rating
ORDER BY avg_rating DESC -- WI

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT DISTINCT(title)
FROM data_analysts_jobs -- there are881 in total

-- 8.	How many unique job titles are there for California companies?
SELECT DISTINCT(title)
FROM data_analysts_jobs
WHERE location LIKE 'CA' -- 230

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT * FROM data_analysts_jobs


SELECT DISTINCT(company), ROUND(AVG(star_rating), 2) AS avg_rating -- ,review_count
FROM data_analysts_jobs
WHERE review_count > 5000
AND company IS NOT NULL
GROUP BY company, review_count -- 40 without the review count column but 45 with it included due to some companies recieving multiple review counts for the same place.
-- ORDER BY review_count DESC

-- 


