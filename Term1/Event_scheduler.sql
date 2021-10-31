use brazil_deliveries;

-- Creating Scheduler 
drop table if exists messages;
create table messages (message varchar(320));
truncate messages;

set global event_scheduler = ON;
show variables like "event_scheduler";

Delimiter $$
create event refresh_segment_monthly_sales_table_event
on schedule every 3 hour
starts current_timestamp
ends current_timestamp + interval 5 hour
do
	begin
		insert into messages select concat('evet:',NOW());
        call refresh_segment_monthly_sales_table();
	END $$
Delimiter ;

select * from messages;
drop event if exists refresh_segment_monthly_sales_table_event;

show events;