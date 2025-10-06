
# HR Data Analysis Project

This project focuses on analyzing employee data from an HR dataset to generate insights about workforce demographics, salaries, attrition, and other key HR metrics. It uses SQL queries to clean, transform, and analyze the data.

## 📌 Project Overview

The HR dataset contains employee information such as personal details, employment history, salary, performance, and termination records. The primary goal is to explore, preprocess, and analyze the data to derive meaningful insights that can support HR decision-making.

## ⚙️ Key Steps in the Project

1. **Database Creation**

   * Created a new database named `hrdata`.
   * Uploaded the employee dataset into a table called `employees`.

2. **Data Exploration**

   * Checked the structure of the dataset (columns, datatypes, missing values).
   * Printed sample rows to verify data import.

3. **Data Cleaning & Transformation**

   * Converted salary into proper decimal format.
   * Transformed date fields (`DOB`, `DateOfHire`, `LastPerformanceReview_Date`) into SQL date type.
   * Handled missing/empty values in `DateOfTermination`.
   * Added calculated columns such as **Age** and **Employee Current Status**.

4. **Analysis Performed**

   * **Employee Count Metrics:** Total employees, current employees, terminated employees.
   * **Salary Insights:** Average salary, salary distribution across defined ranges, salary by department.
   * **Attrition Analysis:** Attrition rate, termination by cause.
   * **Demographics:** Average age, age distribution, gender distribution, marital status breakdown.
   * **Department & Position Analysis:** Employee counts by department, position, and manager.
   * **Tenure Analysis:** Average years employees stay in the company.
   * **Performance Metrics:** Distribution of performance scores.
   * **Geographical Insights:** Employee distribution by state.

## 📊 Key Insights

* Distribution of employees by **salary ranges and age groups**.
* Gender ratio and marital status proportions.
* Departments and positions with the highest concentration of employees.
* Termination reasons contributing to attrition.
* Salary and performance comparison across departments.

## 🚀 Tools & Technologies

* **SQL (MySQL)** for querying and data analysis.
* **CSV file** for employee dataset.

## 📂 Repository Structure

* `hrdata.sql` → SQL script with database creation, cleaning, and analysis queries.
* `README.md` → Project documentation (this file).

## ✅ Outcomes

This project demonstrates how SQL can be used to clean HR data, calculate workforce metrics, and generate insights for data-driven HR strategies. It helps HR teams track attrition, salary trends, demographics, and performance effectively.

---


