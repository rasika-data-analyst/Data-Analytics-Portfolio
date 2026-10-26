# Czechoslovakia Bank — Financial Data Analysis

## 1. Project Overview

The Czechoslovakia Bank Financial Data Analysis project focuses on exploring banking operations, customer demographics, account activity, loans, credit cards, and financial transactions using SQL and Power BI.

The objective is to transform raw banking data into meaningful business insights, identify trends and potential risks, and support data-driven decision-making.

**Tools Used:** SQL, MySQL, Microsoft Power BI, Excel / data-cleaning tools

## 2. Business Problem

The bank wants to understand its financial performance, customer behavior, product usage, and operational trends over a five-year period.

The analysis aims to answer important business questions, identify opportunities to improve profitability and customer service, and explore potential new financial products.

## 3. Project Objectives

- Analyze customer demographics across districts.
- Examine banking activity over time, including year-wise and month-wise trends.
- Understand account types, usage patterns, and potential profitability drivers.
- Analyze credit card types and their usage.
- Identify major expense categories and opportunities for cost optimization.
- Explore the loan portfolio, loan purposes, and customer segments.
- Identify opportunities to improve customer service.
- Explore potential banking products and services that could attract customers.

## 4. Dataset Overview

The project uses an anonymized Czechoslovakia financial dataset containing interconnected banking information.

| Table | Description |
|---|---|
| Account | Account identifiers, district, issuance frequency and account-opening date |
| Card | Credit card details, card type and issue date |
| Client | Customer birth information, gender and district |
| Disposition | Relationships between clients and accounts |
| District | District demographics and economic indicators |
| Loan | Loan amount, duration, payments and status |
| Order | Standing orders and payment information |
| Transactions | Transaction dates, types, amounts, balances and related banking information |

The source document also describes the dataset's entity relationship diagram and the relationships between these tables.

## 5. Data Cleaning and Transformation

The project documentation identifies the following transformation tasks:

- Convert encoded date fields into appropriate date formats.
- Standardize account issuance frequency labels.
- Create a card-assignment category based on issuance frequency.
- Standardize credit card type values.
- Derive customer birth dates and gender from the encoded birth-number field.
- Rename district columns using meaningful business names and remove the specified unnecessary attribute.
- Standardize loan status descriptions.
- Transform transaction years according to the project requirements.
- Populate missing bank labels for specified transaction years.

These steps are intended to improve data consistency and make the dataset suitable for analysis.

## 6. SQL Analysis

SQL is used to define database tables, establish primary and foreign key relationships, load source data, and perform business-oriented analysis.

The project SQL script includes:
- Database and table creation.
- Primary key and foreign key definitions.
- Data-loading commands.
- SQL-based data preparation.

Further analytical queries can be organized around customer demographics, account activity, transactions, credit cards, loans, and financial performance.

## 7. Power BI Dashboard

The Power BI component is intended to present banking metrics and trends in an interactive, management-friendly format.

Planned analytical areas include:
- Financial performance trends.
- Customer and district demographics.
- Account and card analysis.
- Loan portfolio analysis.
- Transaction behavior and operational patterns.

## 8. Business Questions

The project is designed to investigate:

1. How does the customer demographic profile vary across districts?
2. How has the bank performed over time, year-wise and month-wise?
3. Which account types are most common, and how do their usage patterns differ?
4. Which credit card types are frequently used, and how can card-business profitability be assessed?
5. What are the major expenses, and where might cost reductions be possible?
6. How does the loan portfolio vary by purpose and customer segment?
7. What opportunities exist to improve customer service?
8. What new products or services could attract customers and improve profitability?

## 9. Expected Business Value

The analysis is intended to help management:

- Understand customer distribution and banking behavior.
- Monitor changes in financial activity over time.
- Evaluate account, card, and loan portfolios.
- Identify areas for further investigation into costs and risk.
- Discover opportunities for customer retention and product development.
- Use data to support business planning and decision-making.

These are project objectives, not confirmed findings. Specific recommendations should be based on validated query results and dashboard metrics.

```

The folder structure can be adjusted to match the existing portfolio repository. The Power BI report file may be maintained separately if it exceeds GitHub's normal browser-upload limit.

## 11. Data Source

Czechoslovakia Financial Dataset — Real Anonymized Transactions

Source: https://data.world/lpetrocelli/czech-financial-dataset-real-anonymized-transactions

The project problem statement documents the original data source and currency conversion references.

## 12. Project Status

This repository documents the banking data analysis workflow, including data preparation, SQL development, and Power BI reporting.

The final dashboard screenshots, validated analytical results, and business recommendations will be included as the corresponding project components are completed.

## Author

Rasika Pawar

Data Analytics Portfolio | SQL | Power BI
