📊 SQL Portfolio Project: Credit Card Transactions Analysis
This repository showcases a SQL-based analysis project on credit card transactions in India. The project involves importing, cleaning, and analyzing a dataset to derive meaningful insights. It demonstrates proficiency in SQL concepts like data transformation, aggregation, and window functions.

📂 Dataset Description
The dataset used in this project contains information on credit card transactions, including details like transaction dates, amounts, cities, card types, expense categories, and more.

🗂 Source
Dataset Link: Analyzing Credit Card Spending Habits in India
Alternatively, the dataset is included in the repository's ZIP file for convenience.
🚀 Project Workflow
Data Import:

Imported the dataset into SQL Server as a table named credit_card_transcations.
Renamed all column names to lowercase and replaced spaces with underscores for consistency.
Ensured proper data types were assigned to each column (e.g., transaction_date as DATE, amount as FLOAT, etc.).
Exploratory Data Analysis (EDA):

Wrote SQL queries to explore the dataset and identify key trends and patterns.
Used aggregate functions, window functions, subqueries, and CTEs for deeper insights.
Insights Derived from Analysis:

Addressed specific business questions about credit card spending habits, transaction trends, and city-wise data.
📝 Key Queries and Findings
1. Top 5 Cities with Highest Credit Card Spends
Identified the top 5 cities with the highest total spends and their percentage contribution to the total.
2. Monthly Spending Trends
Determined the highest spending month and the amount spent for each card type.
3. Milestone Transactions
Retrieved the transaction details for each card type when cumulative total spends reached ₹1,000,000.
4. Lowest Spend City for Gold Cards
Found the city with the lowest percentage spend using Gold cards.
5. City-wise Expense Patterns
Printed the highest and lowest expense types for each city (e.g., Delhi, Bills, Fuel).
6. Gender-based Spending
Calculated the percentage contribution of spends by females for each expense type.
7. Month-over-Month Growth
Identified the card type and expense category combination with the highest month-over-month growth in January 2014.
8. Weekend Efficiency
Found the city with the highest total spend-to-transaction ratio during weekends.
9. Quickest City to 500 Transactions
Determined the city that reached 500 transactions in the least number of days.
💻 Technology Used
Database Management System: SQL Server
Language: T-SQL (Transact-SQL)
🏆 Skills Demonstrated
Data Cleaning and Preprocessing
Aggregations and Grouping
Window Functions and Common Table Expressions (CTEs)
Advanced SQL Queries and Optimization
Analytical Thinking and Problem-Solving
📈 Project Setup Instructions
Download the dataset from the provided Kaggle link or use the dataset in the repository ZIP file.
Import the dataset into SQL Server as a table named credit_card_transcations.
Ensure the column names are lowercase with underscores instead of spaces.
Update the data types for better performance and query accuracy.
Use the provided SQL queries to explore the dataset and derive insights.
📚 Learnings and Challenges
This project strengthened my ability to:

Work with real-world datasets and SQL Server.
Solve analytical problems using SQL.
Handle data cleaning, normalization, and aggregation.
Challenges faced:

Optimizing queries for large datasets.
Handling edge cases like ties in rankings and missing data.
