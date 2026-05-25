# Superstore - Advanced SQL

**Author:** Matthew Muzofa

---

## 📌 Project Overview

This project demonstrates advanced SQL skills by applying window functions to the Superstore dataset. Window functions are widely used in real business environments to perform complex calculations across rows of data without collapsing results into groups. Each query is designed to reflect the type of analysis a data analyst would perform in a professional setting.

---

## 🗃️ Dataset

- **Dataset:** Sample Superstore Dataset
- **Tool:** Microsoft SQL Server Management Studio (SSMS)
- **Data includes:** Orders, customers, products, shipping details, sales, discounts, and profit

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| Microsoft SQL Server (SSMS) | Database querying and analysis |

---

## 📊 Queries Included

| # | Query | Function | Description |
|---|-------|----------|-------------|
| 1 | Rank orders by sales amount | `ROW_NUMBER()` | Assigns a unique rank to each order from highest to lowest sales |
| 2 | Rank customers by total profit | `RANK()` | Ranks customers based on total profit, sharing ranks on ties |
| 3 | Rank products within each category | `DENSE_RANK()` | Ranks products by sales within their category with no rank gaps |
| 4 | Compare monthly sales to previous month | `LAG()` | Shows month over month sales change by looking at the previous month |
| 5 | Compare monthly sales to next month | `LEAD()` | Shows forward looking sales comparison by looking at the next month |
| 6 | Running total of sales over time | `SUM() OVER()` | Calculates a cumulative running total of sales month by month |

---

## 💡 Key Insights

- **Tracy Blumstein** had the highest single order sales but was the **least profitable customer** overall — showing that high sales don't always mean high profit
- **Janet Molinari** was the most profitable customer despite not having the highest sales
- Monthly sales show significant fluctuations year over year with peaks in **September 2015** and **December 2016**
- The running total reached **$21,504** by the end of 2017

---

## 📁 File Structure

```
superstore-window-functions/
│
├── SuperstoreDB.sql                   # Script to create and populate the Superstore database
└── superstore_window_functions.sql    # 6 window function queries with comments
```

---

## 🚀 How to Run

1. Open SuperstoreDB.sql in SSMS and run it to create and populate the Superstore database
2. Open superstore_window_functions.sql
3. Run each query individually to see the results

---

