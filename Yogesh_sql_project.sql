--EDA--
--Range of datset--
select min(transaction_date) as start_range, max(transaction_date) as end_range from credit_card_transcations
--card types--
select distinct card_type from credit_card_transcations

--expense type--
select distinct exp_type from credit_card_transcations

--City--
select distinct city from credit_card_transcations

--Questions-------------------------------Questions------------------------questions--------

--1.write a query to print top 5 cities with highest spends and their percentage
--contribution of total credit card spends
with cte1 as (
select city,sum(amount) as city_spent
from credit_card_transcations
group by city
),
cte2 as (
select sum(amount) as total_spent
from credit_card_transcations )

select top 5 city,city_spent, round(city_spent * 100/total_spent,2) as perc
from cte1 
inner join cte2 on 1=1
order by perc desc

-----
--2- write a query to print highest spend month and amount spent in that month for each card type
with cte1 as (
select  datepart(year,transaction_date) as year,datepart(month,transaction_date)as month, sum(amount) as total,card_type 
from [credit_card_transcations]
group by datepart(year,transaction_date),datepart(month,transaction_date),card_type
)
select *
from (select card_type, year, month,total,
rank() over(partition by card_type order by total desc) as rank
from cte1) as a
where rank = 1
ORDER BY card_type, year, month


--3- write a query to print the transaction details(all columns from the table) for each card type when
-- it reaches a cumulative of 1000000 total spends(We should have 4 rows in the o/p one for each card type)
with cte as(
select *, sum(amount) over(partition by card_type order by transaction_date,transaction_id) as total
from credit_card_transcations
)
select *
from (select *,rank() over(partition by card_type order by total ) as rn from cte where total >= 1000000) a
where rn=1

--4- write a query to find city which had lowest percentage spend for gold card type
WITH cte AS (
    SELECT city,
           card_type,
           SUM(amount) AS amount,
           SUM(CASE WHEN card_type = 'Gold' THEN amount END) AS gold_amount
    FROM credit_card_transcations
    GROUP BY city, card_type
)
SELECT TOP 1 city,
       ROUND(SUM(gold_amount) * 1.0 / SUM(amount), 2) AS gold_ratio
FROM cte
GROUP BY city
HAVING SUM(gold_amount) > 0  -- Ensure there is at least some gold card spend
ORDER BY gold_ratio ASC;  -- Lowest ratio first


--write a query to print 3 columns:  city, highest_expense_type ,
--lowest_expense_type (example format : Delhi , bills, Fuel)
with cte as(
select city,exp_type, sum(amount) as total
from [credit_card_transcations]
group by city,exp_type
)
select city,max(case when rank_high=1 then exp_type end) as highest, min(case when rank_low=1 then exp_type end) as lowest from 
(select city,exp_type,rank() over(partition by city order by total desc) as rank_high,
rank() over(partition by city order by total asc) as rank_low
from cte) as a 
group by city

--6- write a query to find percentage contribution of spends by females for each expense type
SELECT 
    exp_type,  
    ROUND(SUM(CASE WHEN gender = 'F' THEN amount ELSE 0 END) * 100.0 / SUM(amount), 2) AS perc
FROM 
    [credit_card_transcations]
GROUP BY 
    exp_type;

--7- which card and expense type combination saw highest month over month growth in Jan-2014
WITH cte AS (
    SELECT 
        card_type, 
        exp_type, 
        DATEPART(year, transaction_date) AS yt, 
        DATEPART(month, transaction_date) AS mt,
        SUM(amount) AS total_spend
    FROM [credit_card_transcations]
    GROUP BY card_type, exp_type, DATEPART(year, transaction_date), DATEPART(month, transaction_date)
)
SELECT TOP 1 *,
       (total_spend - prev_mont_spend) * 1.0 / prev_mont_spend AS mom_growth
FROM (
    SELECT *, 
           LAG(total_spend, 1) OVER (PARTITION BY card_type, exp_type ORDER BY yt, mt) AS prev_mont_spend
    FROM cte
) a
WHERE prev_mont_spend IS NOT NULL AND yt = 2014 AND mt = 1
ORDER BY mom_growth DESC;


--8-during weekends which city has highest total spend to total no of transcations ratio 
select top 1 city,sum(amount)*1.0/count(1) as ratio
from [credit_card_transcations]
where datepart(weekday,transaction_date) in (1,7)
group by city
order by ratio desc

--10- which city took least number of days to reach its 500th transaction after the first transaction in that city
with cte as(
select * ,
row_number() over(partition by city order by transaction_date,transaction_id) as rn
from credit_card_transcations
)
select top 1  city,datediff(day,min(transaction_date),max(transaction_date)) as datediff
from cte
where rn=1 or rn=500 
group by city
having count(1)=2
order by datediff asc