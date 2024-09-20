## Title: Fast Food Marketing Campaign A/B Test (ANOVA, Tukey HSD, Pairwise- 2 sample T-test & Bonferroni, and Linear regression)

Note: I attached a more detailed report to this repository, or you can check it [here](https://docs.google.com/document/d/1CICzOzr1PZKkQZcmo6-8n4zekRmGX7MsKygdNgfhD84/edit?usp=sharing).

**Scenario**

A fast-food chain is preparing to introduce a new menu item but has yet to decide which of three potential marketing campaigns to use for promotion. The new item is launched in multiple locations across randomly selected markets to identify which campaign will drive the most sales. Each location implements a different campaign, and weekly sales of the new item are tracked for the first four weeks.

**Goal** 
Evaluate A/B testing results and decide which marketing strategy works the best.

**Note:** 
The dataset is aggregated by LocationID, PromotionID and week. However, I aggregated by LocationID and PromotionID before conducting the statistical tests.

Aggregating by LocationID and PromotionID before conducting statistical tests simplifies the data, reducing noise from weekly variations. This helps focus the analysis on differences between promotions across locations, leading to clearer insights and more reliable comparisons.

Experiment Design

Task Variables

The variables provided in the dataset include:
- MarketID: unique identifier for market
- MarketSize: the size of the market area by sales
- LocationID: unique identifier for store location
- AgeOfStore: age of store in years
- Promotion: one of three promotions that were tested
- Week: one of four weeks when the promotions were run
- SalesInThousands: sales amount for a specific LocationID, Promotion, and week

**Metrics Choice**

I used BigQuery to run queries and generate key metrics required for this analysis.

Check this [spreadsheet](https://docs.google.com/spreadsheets/d/1vDLBzpOBF0HsrjT-u6D7UhCy54ata4Ea_wrpynUZRiY/edit?usp=sharing) or the table below.

| Promotion | Location Count | Mean of Sales | Std Dev   | Min Value | Max Value |
|-----------|----------------|---------------|-----------|-----------|-----------|
| 1         | 43             | 232.3960      | 64.1129   | 151.14    | 380.36    |
| 2         | 47             | 189.3177      | 57.9884   | 111.36    | 332.63    |
| 3         | 47             | 221.4579      | 65.5355   | 124.74    | 354.31    |



The table shows that promotion ‘1’ performed the best overall, with the highest average sales. 

*However, to gain deeper insights from the A/B testing results and verify the best marketing strategy, I carried out a various test*

### Test 1: ANOVA (Analysis of Variance)

To carry out this test, I used the XLMiner Analysis ToolPak Add-on in Google Sheets. The ANOVA test determined if there are statistically significant differences between the effects of promotions on sales. ANOVA is ideal for comparing multiple groups and can be a preliminary test before further pairwise comparisons.

**Hypotheses**

H0: M1 = M2 = M3 There is no difference between promotion averages
H1: M1 != M2 = M3 At least one of the promotion averages is different

|         Pairwise comparison (α = 0.01) and Bonferroni correction (α = 0.0033)                 | 
-------------------------------------------------------------------------------------------------
| Compared Metrics | Mean Difference (d) | Standard Error | p-value  | Statistical Significant? |
|------------------|---------------------|----------------|----------|--------------------------|
| 1 vs 2           | 43.078              | 12.9280        | 0.0013   | YES                      |
| 1 vs 3           | 10.938              | 13.6740        | 0.4300   | NO                       |
| 2 vs 3           | -32.14              | 12.7640        | 0.0136   | NO                       |




