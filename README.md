# Retail Demand Forecasting

## 1. Project Overview

This project develops a Big Data Analytics solution for analyzing historical retail sales and forecasting future demand.

The project uses:

- Hadoop HDFS for distributed data storage
- Apache Hive for SQL-based analysis
- Apache Spark and PySpark for distributed processing
- Spark ML Random Forest Regression for demand forecasting

## 2. Business Problem

Retail stores need to understand historical demand patterns to improve inventory planning and reduce the risk of overstocking or stockouts.

This project analyzes historical sales data across multiple stores and items and builds a forecasting model using historical sales patterns.

## 3. Objective

The main objectives are:

1. Store the retail sales dataset in HDFS.
2. Create a Hive data model for analytical queries.
3. Analyze store, item, yearly, and monthly sales patterns.
4. Process and transform the data using PySpark.
5. Create lag and rolling-average features.
6. Build a demand forecasting model using Spark ML.
7. Evaluate the forecasting performance using RMSE and MAE.
8. Store the forecast results in HDFS.

## 4. Dataset

Dataset: Store Item Demand Forecasting Dataset

Source: Kaggle - Demand Forecasting Kernels Only

File: `train.csv`

Records: 913,000

Date range: 2013-01-01 to 2017-12-31

Columns:

| Column | Description |
|---|---|
| date | Date of sales |
| store | Store identifier |
| item | Item identifier |
| sales | Number of units sold |

The raw dataset is stored in HDFS and is not included in this GitHub repository.

## 5. Architecture

```text
Kaggle Dataset
      |
      v
    HDFS
      |
      v
    Hive
      |
      +----> Sales Analysis
      |
      v
   PySpark
      |
      +----> Data Cleaning
      |
      +----> Feature Engineering
      |
      +----> Lag Features
      |
      +----> Rolling Average
      |
      v
 Spark ML
      |
      v
Random Forest Regression
      |
      v
Forecast Predictions
      |
      v
HDFS Results
