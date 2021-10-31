
use brazil_deliveries;

-- which store segment has the highest sales and delivery cost for online payments?

drop view if exists segment_monthly_sales_view;
	create view segment_monthly_sales_view as 
    select 'January', 'Total', o.Storesegment as Segments, 
    sum(o.orderamount) as Sales, 
    sum(o.deliverycost) as Delivery_Cost
    from dw_orders_analysis as o
    where Month = 'January'
    group by Segments
    union 
	select 'January', 'Average', o.Storesegment as Segments, 
    avg(o.orderamount) as Sales, 
    avg(o.deliverycost) as Delivery_Cost
    from dw_orders_analysis as o
    where month = 'January'
    group by Segments
    union
	select 'February', 'Total', o.Storesegment as Segments, 
    sum(o.orderamount) as Sales, 
    sum(o.deliverycost) as Delivery_Cost
    from dw_orders_analysis as o
    where Month = 'February'
    group by Segments
    union 
	select 'February', 'Average', o.Storesegment as Segments, 
    avg(o.orderamount) as Sales, 
    avg(o.deliverycost) as Delivery_Cost
    from dw_orders_analysis as o
    where month = 'February'
    group by Segments
    union
	select 'March', 'Total', o.Storesegment as Segments, 
    sum(o.orderamount) as Sales, 
    sum(o.deliverycost) as Delivery_Cost
    from dw_orders_analysis as o
    where Month = 'March'
    group by Segments
    union 
	select 'March', 'Average', o.Storesegment as Segments, 
    avg(o.orderamount) as Sales, 
    avg(o.deliverycost) as Delivery_Cost
    from dw_orders_analysis as o
    where month = 'March'
    group by Segments
    union
	select 'April', 'Total', o.Storesegment as Segments, 
    sum(o.orderamount) as Sales, 
    sum(o.deliverycost) as Delivery_Cost
    from dw_orders_analysis as o
    where Month = 'April'
    group by Segments
    union 
	select 'April', 'Average', o.Storesegment as Segments, 
    avg(o.orderamount) as Sales, 
    avg(o.deliverycost) as Delivery_Cost
    from dw_orders_analysis as o
    where month = 'April'
    group by Segments
	union
	select 'May', 'Total', o.Storesegment as Segments, 
    sum(o.orderamount) as Sales, 
    sum(o.deliverycost) as Delivery_Cost
    from dw_orders_analysis as o
    where Month = 'May'
    group by Segments
    union 
	select 'May', 'Average', o.Storesegment as Segments, 
    avg(o.orderamount) as Sales, 
    avg(o.deliverycost) as Delivery_Cost
    from dw_orders_analysis as o
    where month = 'May'
    group by Segments;

-- Creating Maternalized View for View two
drop table if exists segment_monthly_sales_table;
create table segment_monthly_sales_table as
	select * from segment_monthly_sales_view;
-- Creating stored procedure to refresh maternalized view

Drop procedure if exists refresh_segment_monthly_sales_table;
Delimiter $$
create procedure refresh_segment_monthly_sales_table (
out rc int 
)
Begin
truncate table segment_monthly_sales_table;
insert into segment_monthly_sales_table
select * from segment_monthly_sales_view;

set rc = 0;
End;
$$
Delimiter ;
call refresh_segment_monthly_sales_table(@rc);
select * from segment_monthly_sales_table;

