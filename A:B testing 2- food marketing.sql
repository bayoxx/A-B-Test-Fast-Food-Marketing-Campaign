--Key data extraction

WITH
  sales_data AS (
  SELECT
    promotion,
    location_id,
    ROUND(SUM(sales_in_thousands),4) AS sales
  FROM
    `tc-da-1.turing_data_analytics.wa_marketing_campaign`
  GROUP BY
    promotion,
    location_id)
SELECT
  promotion,
  COUNT(*) AS location_count,
  ROUND(AVG(sales),4) AS mean_of_sales,
  ROUND(STDDEV(sales),4) AS std_dev,
  MIN(sales) AS min_value,
  MAX(sales) AS max_value
FROM
  sales_data
GROUP BY
  promotion;


  --Sales by promotion
WITH
  sales_data AS (
  SELECT
    promotion,
    location_id,
    ROUND(SUM(sales_in_thousands),4) AS sales
  FROM
    `tc-da-1.turing_data_analytics.wa_marketing_campaign`
  GROUP BY
    promotion,
    location_id)
SELECT
  promotion,
  AVG(sales) AS mean_of_sales
FROM
  sales_data
GROUP BY
  promotion,
  sales
ORDER BY
  promotion;



  --Regression analysis
SELECT
  promotion,
  market_size,
  location_id,
  age_of_store,
  week,
  sales_in_thousands AS sales
FROM
  `tc-da-1.turing_data_analytics.wa_marketing_campaign`
GROUP BY
  promotion,
  market_size,
  location_id,
  age_of_store,
  week,
  sales
ORDER BY
  promotion;

  --Sales by market size
WITH
  sales_data AS (
  SELECT
    Promotion,
    location_id,
    market_size,
    sales_in_thousands
  FROM
    `tc-da-1.turing_data_analytics.wa_marketing_campaign`
  GROUP BY
    Promotion,
    location_id,
    market_size,
    sales_in_thousands)
SELECT
  market_size,
  ROUND(AVG(sales_in_thousands),4) AS sales
FROM
  sales_data
GROUP BY
  market_size;





