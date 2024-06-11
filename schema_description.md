# Database Schema Description

## Table: sales_data

| Column                  | Description                             | Data Type          |
|-------------------------|-----------------------------------------|--------------------|
| `invoice_id`            | Invoice of the sales made               | `VARCHAR(30)`      |
| `branch`                | Branch at which sales were made         | `VARCHAR(5)`       |
| `city`                  | The location of the branch              | `VARCHAR(30)`      |
| `customer_type`         | The type of the customer                | `VARCHAR(30)`      |
| `gender`                | Gender of the customer making purchase  | `VARCHAR(10)`      |
| `product_line`          | Product line of the product sold        | `VARCHAR(100)`     |
| `unit_price`            | The price of each product               | `DECIMAL(10, 2)`   |
| `quantity`              | The amount of the product sold          | `INT`              |
| `VAT`                   | The amount of tax on the purchase       | `FLOAT(6, 4)`      |
| `total`                 | The total cost of the purchase          | `DECIMAL(10, 2)`   |
| `date`                  | The date on which the purchase was made | `DATE`             |
| `time`                  | The time at which the purchase was made | `TIMESTAMP`        |
| `payment_method`        | Payment method used                     | `VARCHAR(30)`      |
| `cogs`                  | Cost of Goods Sold                      | `DECIMAL(10, 2)`   |
| `gross_margin_percentage` | Gross margin percentage                | `FLOAT(11, 9)`     |
| `gross_income`          | Gross Income                            | `DECIMAL(10, 2)`   |
| `rating`                | Rating given                            | `FLOAT(2, 1)`      |
| `timeofday`             | Time of day (Morning, Afternoon, Evening) | `VARCHAR(10)`   |
| `dayname`               | Day of the week                         | `VARCHAR(10)`      |
| `monthname`             | Month of the year                       | `VARCHAR(10)`      |
| `performance`           | Sales performance (Good, Bad)           | `VARCHAR(10)`      |
