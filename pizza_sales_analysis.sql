create database pizza_sales;
use pizza_sales;
select * from pizza_sales;

# Q.1) Pizaa Monthly Sales (August has the highest number of orders.)
select monthname(str_to_date(`Order Time` ,'%d-%m-%Y %H:%i')) as month_name,
count(*) as total_no from pizza_sales
group by month_name 
order by total_no desc;
use pizza_sales;

# Q.2)  Find Popular Pizzas (Non-Veg)
select 
`Pizza Type` , count(*) as pizza_count from pizza_sales
group by `Pizza Type` 
order by pizza_count desc;

#Q.3) Weekend Vs Weekday Saales 
select case 
when `Is Weekend`='True'
then 'weekend' else
'weekday'
end as day_type , count(*) as sales_count from pizza_sales
group by day_type
order by sales_count desc;

# Q.4) Find Peak Hour Trends in data sate
select 
case 
when `Is Peak Hour`='TRUE' then 'Peak_hour'
else 'not_peak_hour'
end as peak_hour_trand ,count(*) as order_count
from pizza_sales
group by peak_hour_trand
order by order_count desc;
select hour(str_to_date(`Order Time`,'%d-%m-%Y %H:%i')) as hour_order , count(*) as order_count
from pizza_sales
group by hour_order
order by order_count desc;
# Q.5) find Delay Patterns in data set

select case 
when `Delivery Duration (min)`<= 30 then 'on-time'
else 'delay'
end as delivery_pattern ,
count(*) as orders from pizza_sales
group by delivery_pattern;
DESCRIBE pizza_sales;
select * from pizza_sales;

#  find Topping Preferences 
select `Toppings Count` , count(*) as total_order
from pizza_sales
group by `Toppings Count`
order by total_order desc ;
# Find Best Locations as sales
select Location ,count(*) as total_sales
 from pizza_sales
 group by Location
 order by total_sales desc;
 # Atlanta,GA has higest sales .
 
 # find the Traffic Impact and peak hours affect
 select `Traffic Level`,`Is Peak Hour`,
 count(*) as total_order,
 round(avg (`Delivery Duration (min)`),2) as avg_delavry_time,
 round(avg(`Delay (min)`),2) as avg_delay
 from pizza_sales
 group by `Traffic Level`,`Is Peak Hour`
 order by avg_delay;
 # find  most uses Payment Method 
 select `Payment Method`,count(*) as total_order
 from pizza_sales
 group by `Payment Method`
 order by total_order desc;
 
 # most frequently ordered by size
 select `Pizza Size`,
 count(*) as total_order
 from pizza_sales
 group by `Pizza Size`
 order by total_order desc;
 
 #Delivery Efficiency Orders in high-traffic zones are significantly less efficient.
 select case
 when `Traffic Level`='High' then 'less_efficient'
 else 'high_efficient'
 end  as efficiency, count(*) as order_count
 from pizza_sales
 group by efficiency
 order by order_count;
 
 # Worst Deliveries
 select `Order ID`,`Restaurant Name`,`Location`,
 `Distance (km)`, `Delivery Duration (min)`,
 `Traffic Level`,
 -- Calculate minutes taken per kilometer
 (`Delivery Duration (min)`/ `Distance (km)`) as minut_per_km
 from pizza_sales
 where  `Distance (km)`>1
 order by  minut_per_km desc limit 10;
  select * from pizza_sales;
  

 
