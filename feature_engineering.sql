-- Create a table and insert the data
use sql_capstone;

-- selecting all the columns from the tables
select * from amazon;

-- Add a new column named timeofday to give insight of sales in the Morning, Afternoon and Evening. 
ALTER TABLE amazon
ADD COLUMN timeofday VARCHAR(20);

UPDATE amazon
SET timeofday = CASE
    WHEN HOUR(Time) >= 0 AND HOUR(Time) < 12 THEN 'Morning'
    WHEN HOUR(Time) >= 12 AND HOUR(Time) < 18 THEN 'Afternoon'
    ELSE 'Evening'
END;

-- Add a new column named dayname that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri).
ALTER TABLE amazon
ADD COLUMN dayname VARCHAR(20);

UPDATE amazon
SET dayname = DAYNAME(Date);

-- Add a new column named monthname that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). 
ALTER TABLE amazon
ADD COLUMN monthname VARCHAR(3);
