# 🛒 Zepto SQL Data Analysis

A SQL-based data analysis project on a Zepto-style e-commerce/grocery dataset. The project covers table creation, data exploration, data cleaning, and business-focused analysis using PostgreSQL.

## 🛠️ Tech Stack

* 🐘 SQL (PostgreSQL syntax)

## 📋 Dataset / Schema

The dataset is stored in a single table, `zepto`, representing product-level SKU data.

| Column                 | Type         | Description                        |
| ---------------------- | ------------ | ---------------------------------- |
| sku_id                 | SERIAL (PK)  | Unique identifier for each SKU     |
| category               | VARCHAR(120) | Product category                   |
| name                   | VARCHAR(150) | Product name                       |
| mrp                    | NUMERIC(8,2) | Maximum retail price               |
| discountPercent        | NUMERIC(5,2) | Discount percentage on MRP         |
| availableQuantity      | INTEGER      | Quantity available in stock        |
| discountedSellingPrice | NUMERIC(8,2) | Final selling price after discount |
| weightInGms            | INTEGER      | Product weight in grams            |
| outOfStock             | BOOLEAN      | Stock status                       |
| quantity               | INTEGER      | Order/package quantity             |

## 🔄 Project Workflow

### 🏗️ 1. Table Creation

The `zepto` table is created (dropping any existing one) with the schema above.

### 🔍 2. Data Exploration

* 📊 Counted total rows in the table.
* 👀 Viewed a sample of 10 records.
* ✅ Checked for null values across all key columns.
* 🏷️ Listed distinct product categories.
* 📦 Compared counts of in-stock vs out-of-stock products.
* 🔄 Identified product names appearing as multiple SKUs.

### 🧹 3. Data Cleaning

* ❌ Identified and removed records where `mrp` was 0 (invalid/free entries).
* 💰 Converted `mrp` and `discountedSellingPrice` from paise to rupees by dividing by 100.

### 📈 4. Data Analysis

| #     | Question                                          | Goal                                                            |
| ----- | ------------------------------------------------- | --------------------------------------------------------------- |
| 🏆 Q1 | Top 10 best-value products by discount percentage | Find products with the steepest discounts                       |
| 🚫 Q2 | High-MRP products that are out of stock           | Spot potential lost-revenue opportunities (MRP > ₹300)          |
| 💵 Q3 | Estimated revenue per category                    | Rank categories by `discountedSellingPrice × availableQuantity` |
| 💎 Q4 | Products with MRP > ₹500 and discount < 10%       | Find premium, low-discount items                                |
| 📉 Q5 | Top 5 categories by average discount percentage   | Identify categories with the most aggressive discounting        |
| ⚖️ Q6 | Price per gram for products ≥ 100g                | Determine best value-for-weight products                        |
| 📚 Q7 | Weight-based segmentation (Low / Medium / Bulk)   | Bucket products by weight tier                                  |
| 📦 Q8 | Total inventory weight per category               | Understand category-wise inventory load                         |

## 🚀 How to Run

1. ⚙️ Set up a PostgreSQL database.
2. ▶️ Run the SQL script (`zepto_analysis.sql`) sequentially — it creates the table, then runs exploration, cleaning, and analysis queries in order.
3. 📊 Review the output of each query for insights.

## 💡 Key Insights (fill in after running queries)

* 🏷️ Best discount categories: *TBD*
* 💰 Highest revenue category: *TBD*
* 🚫 Out-of-stock high-value products: *TBD*

## 📁 File Structure

```text
├── zepto_analysis.sql   # All SQL queries (table creation, cleaning, analysis)
└── README.md            # Project documentation
```

## 👨‍💻 Author

**Khushal Suthar**
