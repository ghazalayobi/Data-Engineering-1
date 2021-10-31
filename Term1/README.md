
# Data Eingeering Project Report: Brazil Deliveries Center #

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



[dw_orders_analysis](https://github.com/ghazalayobi/de1/blob/main/Term1/dw_orders_analysis.png)

