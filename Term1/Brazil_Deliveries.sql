Drop schema if exists brazil_deliveries;
create schema brazil_deliveries;
use brazil_deliveries;

-- Channels
drop table if exists channels;
create table channels(
channel_id integer,
channel_name varchar(255),
channel_type varchar(255),
primary key (channel_id)
);

TRUNCATE channels;
show variables like "secure_file_priv";
SET GLOBAL local_infile= 'on';
show variables like "local_infile";

load data infile '/Users/ghazalayobi/channels.csv'
into table channels
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(channel_id, channel_name, channel_type);

-- Drivers
drop table if exists drivers;
create table drivers(
driver_id integer,
driver_modal varchar(255),
driver_type varchar(255),
primary key (driver_id)
);

TRUNCATE drivers;
show variables like "secure_file_priv";
SET GLOBAL local_infile= 'on';
show variables like "local_infile";

load data infile '/Users/ghazalayobi/drivers.csv'
into table drivers
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(driver_id, driver_modal, driver_type);


-- Deliveries
drop table if exists deliveries;
create table deliveries(
delivery_id integer,
delivery_order_id integer,
driver_id integer,
delivery_distance_meters integer,
delivery_status varchar(255),
primary key (delivery_id)
);

TRUNCATE deliveries;
show variables like "secure_file_priv";
SET GLOBAL local_infile= 'on';
show variables like "local_infile";

load data infile '/Users/ghazalayobi/deliveries.csv'
into table deliveries
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(delivery_id, delivery_order_id, driver_id, delivery_distance_meters, delivery_status);

-- Hubs
drop table if exists hubs;
create table hubs (
hub_id integer,
hub_name varchar(255),
hub_city varchar(255),
hub_state varchar(30),
hub_latitude integer,
hub_longitude integer,
primary key (hub_id)
);

TRUNCATE hubs;
show variables like "secure_file_priv";
SET GLOBAL local_infile= 'on';
show variables like "local_infile";

load data infile '/Users/ghazalayobi/hubs.csv'
into table hubs
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(hub_id, hub_name, hub_city, hub_state, hub_latitude, hub_longitude);

-- Stores
drop table if exists stores;
create table stores (
store_id integer,
hub_id integer,
store_name varchar(255),
store_segment varchar(255),
store_plan_price integer,
store_latitude integer,
store_longitude integer,
primary key (store_id), 
key hub_id(hub_id),
foreign key (hub_id) References hubs(hub_id)
);

TRUNCATE stores;
show variables like "secure_file_priv";
SET GLOBAL local_infile= 'on';
show variables like "local_infile";

load data infile '/Users/ghazalayobi/stores.csv'
into table stores
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(store_id, hub_id, store_name, store_segment, store_plan_price, store_latitude, store_longitude);

-- Orders
drop table if exists orders;
create table orders(
order_id integer,
store_id integer,
channel_id integer,
payment_order_id integer,
delivery_order_id integer,
order_status varchar(255),
order_amount integer,
order_delivery_fee integer,
order_delivery_cost integer,
order_created_day integer,
order_created_month varchar(100),
order_created_year integer,
order_moment_created datetime,
primary key (order_id),
key channel_id(channel_id),
key store_id(store_id),
constraint orders_ibfk_1 foreign key(channel_id) references channels(channel_id)
);
TRUNCATE orders;
show variables like "secure_file_priv";
SET GLOBAL local_infile= 'on';
show variables like "local_infile";

load data infile '/Users/ghazalayobi/orders.csv'
into table orders
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(order_id, store_id, channel_id, payment_order_id, delivery_order_id, order_status, order_amount, order_delivery_fee, order_delivery_cost, order_created_day, order_created_month, order_created_year, order_moment_created);

-- Payments
drop table if exists payments;
create table payments(
payment_id integer,
payment_order_id integer,
payment_amount integer,
payment_fee integer,
payment_method varchar(255),
payment_status varchar(50),
primary key (payment_id)
);

TRUNCATE payments;
show variables like "secure_file_priv";
SET GLOBAL local_infile= 'on';
show variables like "local_infile";

load data infile '/Users/ghazalayobi/payments.csv'
into table payments
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(payment_id, payment_order_id, payment_amount, payment_fee, payment_method, payment_status);
