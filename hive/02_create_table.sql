USE retail_analytics;

CREATE EXTERNAL TABLE IF NOT EXISTS retail_sales (
    sale_date DATE,
    store INT,
    item INT,
    sales INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/data/retail/raw/'
TBLPROPERTIES ("skip.header.line.count"="1");

SHOW TABLES;

DESCRIBE retail_sales;

SELECT * FROM retail_sales LIMIT 10;

SELECT COUNT(*) AS total_records
FROM retail_sales;
