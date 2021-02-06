-- Total Sales, Total_profit, Profit Ratio, Avg.Discount

select sum(sales) as total_sales,
	   sum(profit) as total_profit,
	   round((sum(profit)/sum(sales)) * 100) as profit_ratio,
	   round(avg(discount) * 100) as avg_discount
from orders;

-- Profit per Order

select order_id, sum(profit) as profit_per_order
from orders
group by order_id 
order by profit_per_order desc; 

-- Sales and Profit per Customer

select customer_id, sum(sales) as sales, sum(profit) as profit
from orders
group by customer_id 
order by profit desc, sales desc;

-- Monthly Sales by Segment

select segment, sum(sales) as sales, sum(profit) as profit
from orders
where order_date >= '2017-10-01'
  and order_date <= '2017-11-01' 
group by segment
order by profit desc, sales desc;

-- Sales by Product Category over time

select category , sum(sales) as sales, sum(profit) as profit
from orders
group by category 
order by profit desc, sales desc;

-- Monthly Sales by Product Category

select category , sum(sales) as sales, sum(profit) as profit
from orders
where order_date >= '2017-11-01'
  and order_date <= '2017-12-01'
group by category 
order by profit desc, sales desc;

-- Monthly Sales by Product Subcategory

select category, subcategory, sum(sales) as sales, sum(profit) as profit
from orders
where order_date >= '2017-11-01'
  and order_date <= '2017-12-01'
group by category, subcategory
order by profit desc, sales desc;

-- Sales and Profit by Region Manager

select person, sum(sales) as sales, sum(profit) as profit
from orders o
join people p on o.region = p.region
group by person
order by sales desc;

-- Share of Sales by Region

select region, round(sum(sales)/(select sum(sales) from orders) * 100, 2) as sales
from orders
group by region
order by sales desc;


	    				   							 	 

