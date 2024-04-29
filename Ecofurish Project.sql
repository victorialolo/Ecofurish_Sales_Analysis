--Ecofurnish company

-- 1. List all products available in the inventory.
select * 
from dimproduct;

-- 2. Find the total number of customers in the database.
select count(*)as Total_Customers    
from dimcustomer;

-- 3. Display distinct categories of products sold.
select distinct(category)
from dimproduct;

--4. Identify customers who signed up in 2023.
select * from dimcustomer;
select * 
from dimcustomer
where signupyear = 2022;

--5. List products priced above $500.
select * from dimproduct;
select productid, productname, price
from dimproduct
where price > 500;

--5. List products that are priced between 200 and $500.
select * from dimproduct;
select productid, productname, price
from dimproduct
where price between 200 and 500;

-- 6. Show products with less than 50 items in stock.
select * 
from dimproduct
where stockquantity < 50;

--7. List all sales transactions.
select * 
from factsales;

-- 8. Count the total number of sales transactions.
select count(saleamount) as sales_transaction
from factsales;

--9. List customer emails that contain 'gmail'.
select * from dimcustomer;
select * 
from dimcustomer
where email like '%com%'

--10. Display the top 10 most expensive products.
select *
from dimproduct
order by price desc
limit 10;

--11. Find the average sale amount per transaction.
select round(avg(saleamount), 2) as avgsales
from factsales;

--12. Calculate the total revenue generated from sales.
select round(sum(saleamount),2) as totalsales
from factsales;


-- 13. Round the average price of all products to 2 decimal places.
select * from dimproduct;
select round(avg(price),2)
from dimproduct;

-- 14. Display all products with 'Eco' in the product name.
select * 
from dimproduct
where productname like '%eco%';

-- 15. List the first 5 sales transactions in ascending order of SaleAmount.
select * from factsales;
select saleid, saleamount
from factsales
order by saleamount asc
limit 5;

-- 16. Display products priced between $100 and $300.
select productid, productname, price
from dimproduct
where price between 100 and 300;

-- 17. Count the number of products in each category.
select distinct count(productid) as countofproduct, category
from dimproduct
group by category;

-- 18. Calculate the minimum, maximum, and average price of products in each category.
select category, min(price)as minprice, max(price) as maxprice, round(avg(price),2)as avgprice
from dimproduct
group by category;

-- 19. List all sales transactions between January 1, 2023, and December 31, 2023.
 select * 
 from factsales
 where saledate between '2023-01-01' and '2023-12-31';

-- 20. Find the total quantity of products sold for each product.
select * from factsales;
select productid , sum(quantitysold)
from factsales
group by productid;

--List customer emails that contain 'gmail'.
select * from dimcustomer;
select *
from dimcustomer
where email like '%gmail%';



-- EcoFurnish is planning a promotional campaign targeted at their most loyal customers.
-- They define 'loyal customers' as those who have made at least 5 purchases in the past year.
-- Using the provided datasets, construct an SQL query that identifies these loyal customers,
-- including their total spend.

select * from factsales;
select customerid, sum(quantitysold) as totalquantity_sold,
sum(saleamount) as totalspend
from factsales
where saledate between '2023-01-01' and '2023-12-31'
group by customerid
having sum(quantitysold) >= 5
order by Totalspend desc
limit 5;

-- Additionally, analyze the sales data to recommend which product categories should be highlighted in the promotional campaign based on their profitability.

select productid, sum(saleamount) as totalsales
from factsales
group by productid
order by Totalsales desc
limit 10;

-- Prepare a brief report outlining your methodology, findings, and recommendations, ensuring to include the SQL queries used for your analysis.

--Brief Report:
--Methodology:
--For Task 1, I identified loyal customers by counting the number of distinct sales(purchases) made by each customer and summing their total spend.
--The HAVING clause filters out customers who have made less than 5 purchases, ensuring that only loyal customers are included in the results.

--For Task 2, I determined the profitability of each product category by summing the sale amounts from the factsales table and grouping by the product category from the dimproduct table. The result is ordered in descending order of profitability.


--Findings:
--Loyal customers were identified based on the criteria of making at least 5 purchases in the past year. Their total spend was calculated, providing insights into their contribution to revenue.
--Product categories were ranked by profitability, helping to prioritize those that contribute the most to overall profits.

--Recommendations:
--Focus the promotional campaign on loyal customers identified in Task 1, as they have demonstrated consistent purchasing behavior.
--Consider highlighting product categories with the highest profitability, as identified in Task 2, to maximize the impact of the promotional campaign on overall revenue.

