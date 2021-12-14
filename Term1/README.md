
# Data Engineering Project Report: Brazil Deliveries Center #

This report contains the detailed description of my project. To accomplish this task I used Food and Goods Deliveries in Brazil from Kaggle. Please find the link [here](https://www.kaggle.com/nosbielcs/brazilian-delivery-center). I upload the dataset in a zip folder becasue of big size of the files.

### Operational Layer ###

Food and Goods Deliveries in Brazil dataset contains seven tables which are as following; **Channels, Deliveries, Drivers, Hubs, Orders, Payments, Stores** which can be found [here](https://github.com/ghazalayobi/de1/blob/main/Term1/brazil_deliveries.zip). 
This dataset is the records of Food and Goods in Brazil from 2021-01-01 to 2021-04-30 across 396 stores. In order to understand the relationship between tables the below EER diagram further illustrates it. 
As the EER diagram shows **Orders** as the central table for this project. Major part of the data comes from this table. 
Second table is the payments information for the orders. Third table consists of delivery information and as so fourth stores and channel further add information about stores name and channel details. Further information about operational layer can be found [here](https://github.com/ghazalayobi/de1/blob/main/Term1/Brazil_Deliveries.sql).

![StarSchema](https://github.com/ghazalayobi/de1/blob/main/Term1/StarSchema.png)


### Analytics ###

In order to accomplish this project, my analytics plan is as following. 

-	Loading the tables
-	Creating data warehouse called dw_orders_analysis
-	Creating data marts to achieve five views

![Plan](https://github.com/ghazalayobi/de1/blob/main/Term1/Plan.png)

### Analytics Layer ###

For this layer I created a data warehouse to analyze orders.  This data warehouse consists of five dimensions, Orders, Payments, Deliveries, Stores and Chennals. Please find queries [here](https://github.com/ghazalayobi/de1/blob/main/Term1/data_warehouse_etl.sql).
![dw_orders_analysis](https://github.com/ghazalayobi/de1/blob/main/Term1/dw_orders_analysis.png)

### Data Marts ###

#### View one: Data Summary ####
I created this view to assist users to have an overview of the data. This view consists of Number of Records, Sales, Total Months and types of payment method. 

#### View two: January Sales ####
This view illustrates the total, average, minimum, and maximum Sales and delivery cost in the month of January. 

#### View three: Monthly Sales ####
This view aims to illustrate average sales across each payment method during each month. The purpose of this view is to observe which payment method generated highest sales in that specific month.

#### View four: Average Delivery Distance ####
This view aims to illustrate average delivery distance across all stores. Moreover, this view helps understand which stores on average has the longest delivery distance. 

#### View five: Awaiting Payments ####
The awaiting payment aims to show amount of pending payment across all months. It is interesting to observe that January has the highest amount of awaiting payments. 

View can be found [here](https://github.com/ghazalayobi/de1/blob/main/Term1/data_warehouse_etl.sql)


### Extras ###

#### Materialized View ####


First I created a view called segment_monthly_sales_view which show the average and total sales and costs of sales per each store segment across all months. The aim of this view is to compare and contrast to the averages and totals of sales and cost of sales during each month to learn which store segment generates the highest sales.

Moreover, I created a materialized view that to store this view. Please find it [here](https://github.com/ghazalayobi/de1/blob/main/Term1/Materialized_View.sql)

#### Events ####

In order to refresh the created table from mentioned view, I created event scheduler which can be found [here](https://github.com/ghazalayobi/de1/blob/main/Term1/Event_scheduler.sql)




