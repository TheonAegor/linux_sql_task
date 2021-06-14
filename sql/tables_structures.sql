-----------------------------------
-- Creating rpm_future_retail
-----------------------------------
create table rpm_future_retail (
       FUTURE_RETAIL_ID         bigint primary key,
       item                     varchar(20),
       location                 integer,
       action_date              date,
       SELLING_RETAIL           decimal(10,4),
       SELLING_RETAIL_CURRENCY  varchar(3),
       SELLING_UOM              varchar(2));

-- Use the provided rpm_future_retail.sql file to insert data 
-- OR: select * from rpm_future_retail for update;  -- and then insert data manually from Excel file

-----------------------------------
-- Creating rpm_zone_future_retail
-----------------------------------
create table rpm_zone_future_retail (
       ZONE_FUTURE_RETAIL_ID   BigInt primary key,
       item                    varchar(20),
       ZONE                    integer,
       action_date             date,
       SELLING_RETAIL          decimal(10,4),
       SELLING_RETAIL_CURRENCY varchar(3),
       SELLING_UOM             varchar(2));
       
       
-- Use the provided rpm_zone_future_retail.sql file to insert data 
-- OR: select * from rpm_zone_future_retail for update;  -- and then insert data manually from Excel file 

-----------------------------------
-- Creating rpm_zone_location:
-----------------------------------
create table rpm_zone_location (zone_id  integer, 
                                location integer);
                               
-- Use the provided rpm_zone_location.sql file to insert data 
-- OR: select * from rpm_zone_location for update;  -- and then insert data manually from Excel file
