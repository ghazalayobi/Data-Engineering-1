use brazil_deliveries;
drop procedure if exists data_warehouse_etl;
Delimiter $$
create procedure data_warehouse_etl()

Begin
Drop table if exists dw_orders_analysis;
create table dw_orders_analysis as 

select
orders.order_id as OrderID,
orders.order_status as OrderStatus,
orders.order_amount as OrderAmount,
orders.order_delivery_fee as DeliveryFee,
orders.order_delivery_cost as DeliveryCost,
orders.order_created_day as Day,
orders.order_created_month as Month,
orders.order_created_year as Year,
orders.order_moment_created as Date,

payments.payment_method as PaymentMethod,
payments.payment_status as PaymentStatus,
payments.payment_amount as PaymentAmount,

deliveries.delivery_status as DeliveryStatus,
deliveries.delivery_distance_meters as DeliveryDistance_m,

stores.store_name as StoreName,
stores.store_segment as StoreSegment,

channels.channel_name as ChannelName,
channels.channel_type as ChannelType

from orders
inner join payments using(payment_order_id)
inner join deliveries using(delivery_order_id)
inner join stores using(store_id)
inner join channels using(channel_id)
order by order_id;

End $$
Delimiter ;

call data_warehouse_etl();

-- View one: what is data summary?
drop view if exists summary;
	create view summary as 
    select count(o.OrderID) as 'Number of Records', 
    sum(o.OrderAmount) as Sales, 
    count(distinct(o.Month)) as Total_Months, 
    count(distinct(o.PaymentMethod)) as PaymentMethods
    from dw_orders_analysis as o;
-- This data covers 316200 records acorss four months where 15 types of payment methods were used.


-- View two: What total, average, maximum, and minimum sales and delivery cost in January?
drop view if exists Jan_Sales;
	create view Jan_Sales as 
select 'Total', 
sum(o.OrderAmount) as Sales, 
sum(o.DeliveryCost) as Delivery_Cost 
from dw_orders_analysis as o
where Month = 'January'
union
select 'Average', 
avg(o.orderamount) as Sales, 
avg(o.deliverycost) as Delivery_Cost  
from dw_orders_analysis as o
where Month = 'January'
union
select 'Maximum', 
max(o.orderamount) as Sales, 
max(o.deliverycost) as Delivery_Cost 
from dw_orders_analysis as o
where month = 'January'
union
select 'Minimum', 
min(o.orderamount) as Sales, 
min(o.deliverycost) as Delivery_Cost  
from dw_orders_analysis as o
where month = 'January';

-- View three: What is the average sales per month across all payment methods?
drop view if exists Monthly_Sales;
	create view Monthly_Sales as 
    select o.month, o.paymentmethod, 
    avg(o.orderamount) 
    from dw_orders_analysis as o
    group by o.month, o.paymentmethod;

    
-- View four: what is the average delivery distance from each store?
drop view if exists avg_delivery_distance;
	create view avg_delivery_distance as 
    select o.storename, 
    avg(o.deliverydistance_m) as Avg_Distance 
    from dw_orders_analysis as o
    group by o.storename
    order by Avg_Distance;

-- View five: what is the total amount for the awaiting payments?
drop view if exists awaiting_payments;
	create view awaiting_payments as 
    select distinct(o.month) as Month, 
    sum(o.paymentamount) as Awaiting_Payment 
    from dw_orders_analysis as o
    where o.paymentstatus = 'AWAITING'
    group by Month;

