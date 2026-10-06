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

The main objectives of the project are:

1. Store the retail sales dataset in HDFS.
2. Create a Hive data model for analytical queries.
3. Analyze store, item, yearly, and monthly sales patterns.
4. Process and transform the data using PySpark.
5. Create lag and rolling-average features.
6. Build a demand forecasting model using Spark ML.
7. Evaluate the forecasting performance using RMSE and MAE.
8. Store the forecast results in HDFS.

## 4. Dataset

**Dataset:** Store Item Demand Forecasting Dataset

**Source:** Kaggle - Demand Forecasting Kernels Only

**File:** `train.csv`

**Records:** 913,000

**Date Range:** 2013-01-01 to 2017-12-31

### Columns

| Column | Data Type | Description |
|---|---|---|
| date | Date | Date of sales |
| store | Integer | Store identifier |
| item | Integer | Item identifier |
| sales | Integer | Number of units sold |

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
```

## 6. HDFS

### HDFS Directories

```text
/data/retail/raw
/data/retail/processed
/data/retail/results
```

### Raw Dataset

```text
/data/retail/raw/train.csv
```

### Forecast Output

```text
/data/retail/results/forecast_predictions
```

HDFS commands used in the project are available in:

`hdfs/hdfs_commands.txt`

## 7. Hive

### Database

```text
retail_analytics
```

### Table

```text
retail_sales
```

### Hive SQL Files

- `hive/01_create_database.sql`
- `hive/02_create_table.sql`
- `hive/03_analysis_queries.sql`

### Hive Analysis

The Hive queries perform:

- Total sales by store
- Top-selling items
- Yearly sales analysis
- Monthly sales analysis
- Top store-item combinations

## 8. PySpark Processing

The PySpark notebook is available at:

`spark/Retail_Demand_Forecasting_Spark.ipynb`

The workflow includes:

- Reading data from HDFS
- Schema inference
- Null-value checking
- Duplicate checking
- Date conversion
- Year extraction
- Month extraction
- Day extraction
- Day-of-week extraction
- Lag feature creation
- Rolling-average feature creation
- Train/test splitting

## 9. Forecasting Model

### Algorithm

**Random Forest Regression**

### Framework

**Apache Spark ML**

### Configuration

| Parameter | Value |
|---|---:|
| Number of Trees | 50 |
| Maximum Depth | 10 |
| Random Seed | 42 |

### Features

The model uses:

- `lag_1`
- `lag_7`
- `rolling_7`

### Training Data

**Period:** 2013-2016

**Records:** 727,000

### Testing Data

**Period:** 2017

**Records:** 182,500

## 10. Model Performance

| Metric | Value |
|---|---:|
| RMSE | 10.0215 |
| MAE | 7.5991 |

The model generated predictions for the 2017 test period.

## 11. Key Findings

- Store 2 recorded the highest total sales.
- Item 15 was among the highest-selling items.
- Total yearly sales increased from 2013 to 2017.
- July showed the strongest seasonal sales pattern.
- The model predictions followed the overall seasonal demand pattern.
- The highest sales period was observed around July.
- December showed relatively lower actual demand compared with the mid-year peak.

## 12. Project Structure

```text
retail-demand-forecasting/
│
├── data/
│   └── data_dictionary.md
│
├── hdfs/
│   └── hdfs_commands.txt
│
├── hive/
│   ├── 01_create_database.sql
│   ├── 02_create_table.sql
│   └── 03_analysis_queries.sql
│
├── spark/
│   └── Retail_Demand_Forecasting_Spark.ipynb
│
├── results/
│   └── model_results.md
│
├── screenshots/
│   ├── 01_spark_master.png
│   ├── 02_spark_application_jobs.png
│   └── 03_spark_executors.png
│
└── README.md
```

## 13. Execution Flow

### Step 1 - Store Dataset in HDFS

Upload `train.csv` to:

```text
/data/retail/raw/
```

### Step 2 - Create Hive Database and Table

Run the SQL files in the `hive` directory.

### Step 3 - Perform Hive Analysis

Execute the analytical queries for store, item, yearly, monthly, and store-item sales.

### Step 4 - Run PySpark

Open:

`spark/Retail_Demand_Forecasting_Spark.ipynb`

Connect Spark to the cluster and execute the notebook.

### Step 5 - Train the Forecasting Model

The notebook creates forecasting features and trains the Random Forest model.

### Step 6 - Evaluate the Model

RMSE and MAE are calculated using the 2017 test data.

### Step 7 - Store Predictions

Predictions are written to:

```text
/data/retail/results/forecast_predictions
```

## 14. Evidence

The `screenshots` directory contains evidence of:

- Spark Master
- Spark Application Jobs
- Spark Executors

These screenshots demonstrate the distributed Spark processing environment.

## 15. Future Improvements

Possible improvements include:

- Adding additional time-series features
- Testing other regression algorithms
- Hyperparameter tuning
- Comparing multiple forecasting models
- Improving prediction accuracy
- Creating an interactive visualization dashboard

## 16. Conclusion

The project demonstrates an end-to-end Big Data Analytics workflow for retail demand forecasting using HDFS, Hive, PySpark, and Spark ML.

Historical retail sales were stored and analyzed using distributed technologies, and a Random Forest model was used to generate demand forecasts for the 2017 test period.
