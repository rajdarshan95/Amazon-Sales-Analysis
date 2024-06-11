-- 1.What is the count of distinct cities in the dataset.
SELECT COUNT(DISTINCT City) AS distinct_cities_count
FROM amazon;

-- 2.For each branch, what is the corresponding city.
SELECT DISTINCT Branch, City
FROM amazon;

-- 3.What is the count of distinct product lines in the dataset.
SELECT COUNT(DISTINCT `Product line`) AS distinct_product_lines_count
FROM amazon;

-- 4.Which payment method occurs most frequently.
SELECT Payment, COUNT(*) AS frequency
FROM amazon
GROUP BY Payment
ORDER BY frequency DESC
LIMIT 1;

-- 5.Which product line has the highest sales.
SELECT 
    `Product line`,
    ROUND(SUM(Total), 2) AS TotalSales
FROM 
    amazon
GROUP BY 
    `Product line`
ORDER BY 
    TotalSales DESC
LIMIT 1;


-- 6. How much revenue is generated each month.
SELECT MONTH(Date) AS month, ROUND(SUM(Total),2) AS monthly_revenue
FROM amazon
GROUP BY MONTH(Date)
ORDER BY month;

-- 7.In which month did the cost of goods sold reach its peak.
SELECT MONTH(Date) AS month, ROUND(SUM(cogs),2) AS total_cogs
FROM amazon
GROUP BY MONTH(Date)
ORDER BY total_cogs DESC
LIMIT 1;

-- 8.Which product line generated the highest revenue.
SELECT `Product line`, ROUND(SUM(Total),3) AS total_revenue
FROM amazon
GROUP BY `Product line`
ORDER BY total_revenue DESC
LIMIT 1;

-- 9.In which city was the highest revenue recorded.
SELECT City, ROUND(SUM(Total),2) AS total_revenue
FROM amazon
GROUP BY City
ORDER BY total_revenue DESC
LIMIT 1;

-- 10.Which product line incurred the highest Value Added Tax.
SELECT `Product line`, ROUND(SUM(`Tax 5%`),3) AS total_vat
FROM amazon
GROUP BY `Product line`
ORDER BY total_vat DESC
LIMIT 1;

-- 11.For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
SELECT *,
       CASE 
           WHEN Total > avg_sales THEN 'Good'
           ELSE 'Bad'
       END AS sales_quality
FROM (
    SELECT *,
           AVG(Total) OVER () AS avg_sales
    FROM amazon
) AS avg_sales_table;

-- 12.Identify the branch that exceeded the average number of products sold.
SELECT Branch, COUNT(*) AS num_products_sold
FROM amazon
GROUP BY Branch
HAVING num_products_sold > (
    SELECT AVG(num_products_sold) AS avg_num_products_sold
    FROM (
        SELECT Branch, COUNT(*) AS num_products_sold
        FROM amazon
        GROUP BY Branch
    ) AS avg_products_sold
);

-- 13.Which product line is most frequently associated with each gender
SELECT Gender, `Product line`, COUNT(*) AS frequency
FROM amazon
GROUP BY Gender, `Product line`
ORDER BY Gender, frequency DESC;

-- 14.Calculate the average rating for each product line.
SELECT `Product line`, ROUND(AVG(Rating),2) AS average_rating
FROM amazon
GROUP BY `Product line`;

-- 15.Count the sales occurrences for each time of day on every weekday.
SELECT 
    DAYNAME(Date) AS weekday,
    HOUR(Time) AS hour_of_day,
    COUNT(*) AS sales_occurrences
FROM 
    amazon
GROUP BY 
    weekday,
    hour_of_day
ORDER BY 
    FIELD(weekday, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
    hour_of_day;
    
-- 16.Determine the city with the highest VAT percentage.
SELECT City, ROUND(SUM(`Tax 5%`),2) AS sum_vat_percentage
FROM amazon
GROUP BY City
ORDER BY sum_vat_percentage DESC
LIMIT 1;

-- 17.Determine the city with the highest VAT percentage.
SELECT 
    City,
    ROUND(SUM(`Tax 5%`),2) AS TotalTax,
    ROUND(SUM(cogs),2) AS TotalCOGS,
    ROUND((SUM(`Tax 5%`) / SUM(cogs)),2) * 100 AS VATPercentage
FROM 
    amazon
GROUP BY 
    City
ORDER BY 
    VATPercentage DESC
LIMIT 1;

-- 18.Identify the customer type with the highest VAT payments
SELECT `Customer type`, ROUND(SUM(`Tax 5%`),2) AS total_vat_payments
FROM amazon
GROUP BY `Customer type`
ORDER BY total_vat_payments DESC
LIMIT 1;

-- 19.What is the count of distinct customer types in the dataset
SELECT COUNT(DISTINCT `Customer type`) AS distinct_customer_types
FROM amazon;

-- 20.What is the count of distinct payment methods in the dataset
SELECT COUNT(DISTINCT Payment) AS distinct_payment_methods
FROM amazon;

-- 21.Which customer type occurs most frequently
SELECT `Customer type`, COUNT(*) AS frequency
FROM amazon
GROUP BY `Customer type`
ORDER BY frequency DESC
LIMIT 1;

-- 22.Identify the customer type with the highest purchase frequency
SELECT `Customer type`, COUNT(*) AS purchase_frequency
FROM amazon
GROUP BY `Customer type`
ORDER BY purchase_frequency DESC
LIMIT 1;

-- 23.Determine the predominant gender among customers
SELECT Gender, COUNT(*) AS gender_count
FROM amazon
GROUP BY Gender
ORDER BY gender_count DESC
LIMIT 1;

-- 24. Examine the distribution of genders within each branch.
SELECT Branch, Gender, COUNT(*) AS gender_count
FROM amazon
GROUP BY Branch, Gender;

-- 25. Identify the time of day when customers provide the most ratings.
SELECT HOUR(Time) AS hour_of_day, COUNT(*) AS rating_count
FROM amazon
GROUP BY hour_of_day
ORDER BY rating_count DESC
LIMIT 1;

-- 26.Determine the time of day with the highest customer ratings for each branch.
SELECT Branch, HOUR(Time) AS hour_of_day, COUNT(*) AS rating_count
FROM amazon
GROUP BY Branch, hour_of_day
ORDER BY Branch, rating_count DESC;

-- 27.Identify the day of the week with the highest average ratings
SELECT DAYNAME(Date) AS day_of_week, ROUND(AVG(Rating),2) AS average_rating
FROM amazon
GROUP BY day_of_week
ORDER BY average_rating DESC
LIMIT 1;

-- 28.Determine the day of the week with the highest average ratings for each branch
SELECT Branch, DAYNAME(Date) AS day_of_week, AVG(Rating) AS average_rating
FROM amazon
GROUP BY Branch, day_of_week
ORDER BY average_rating DESC;

-- 29.Identify the customer type contributing the highest revenue
SELECT `Customer type`, SUM(`Total`) AS Total_Revenue
FROM amazon
GROUP BY `Customer type`
ORDER BY Total_Revenue DESC
LIMIT 1;
