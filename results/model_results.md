# Retail Demand Forecasting - Model Results

## Model

Algorithm: Random Forest Regression

Framework: Apache Spark ML

Number of Trees: 50

Maximum Depth: 10

Random Seed: 42

## Features Used

The forecasting model uses:

- lag_1 - previous day's sales
- lag_7 - sales from 7 days earlier
- rolling_7 - 7-day rolling average of previous sales

## Data Split

Training period:

2013-01-01 to 2016-12-31

Training records:

727,000

Testing period:

2017-01-01 to 2017-12-31

Testing records:

182,500

## Model Performance

| Metric | Value |
|---|---:|
| RMSE | 10.0215 |
| MAE | 7.5991 |

## Forecast Output

The forecast predictions were generated for the 2017 test period.

Output location in HDFS:

`/data/retail/results/forecast_predictions`

The output contains:

- date
- store
- item
- actual sales
- predicted sales

## Key Findings

- Store 2 recorded the highest total sales.
- Item 15 was among the highest-selling items.
- Total yearly sales increased from 2013 to 2017.
- July showed the strongest seasonal sales pattern.
- The model predictions followed the overall seasonal demand pattern.
- The highest sales period was observed around July.
- December showed a relatively lower actual demand compared with the mid-year peak.

## Overall Result

The Spark ML Random Forest model successfully generated demand forecasts for the 2017 test period using historical sales and lag-based features.
