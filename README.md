Dynamic Workforce & Hiring Planning Simulator
A data analytics project that combines Python, MySQL, Excel, and Power BI to analyze workforce capacity and estimate hiring requirements under different workload scenarios.
The goal of this project was to build something closer to a real workforce planning workflow rather than just creating a dashboard from a clean dataset. I started with messy employee data, cleaned and validated it using Python, performed workforce analysis in MySQL, and then used Power BI to build an interactive hiring simulator.
Project Overview
Workforce planning is not only about knowing how many employees a company has. A business also needs to understand how much capacity those employees provide, what the workforce costs, where capacity shortages exist, and how many additional employees may be required when workload increases.
This project addresses those questions through a simple analytical workflow:
Raw Workforce Data
        |
        v
Python / Pandas
Data Cleaning & Validation
        |
        v
MySQL
Workforce Analysis & Business Logic
        |
        v
Power BI
Interactive Dashboard & Hiring Simulator

Tech Stack
- Python
  - Pandas
  - Data cleaning and validation
  - Excel/CSV processing
- MySQL
  - Data storage
  - Aggregations
  - Workforce cost analysis
  - Capacity analysis
  - Hiring-gap calculations
  - SQL views
- Power BI
  - KPI dashboard
  - Workforce analysis
  - Department and location analysis
  - What-if workload simulation
- Excel
  - Initial source dataset
  - Cleaned dataset export
Dataset
The original dataset contains approximately 12,500 employee records with the following fields:
Column	Description
Emp_ID	Employee identifier
Department	Employee department
Location	Employee location
Hire_Date	Employee hiring date
Status	Employment status
Base_Salary_USD	Annual base salary
Weekly_Capacity_Hrs	Available working hours per week
Performance_Rating	Employee performance rating


The dataset intentionally contains messy text, missing values, and numerical outliers so that the project includes a realistic data-cleaning stage.
Phase 1: Data Cleaning with Python
The first stage was performed using Pandas.
The main cleaning tasks included:
- Loading the Excel dataset
- Inspecting rows, columns, data types, and missing values
- Standardizing department, location, and status values
- Removing unnecessary whitespace from text fields
- Handling missing categorical values
- Handling missing performance ratings using the median
- Identifying invalid salary values
- Identifying invalid weekly capacity values
- Converting hire dates into proper datetime format
- Validating the cleaned dataset
- Exporting the cleaned dataset to Excel and CSV
For numerical fields containing outliers, the median was used where appropriate because it is less affected by extreme values than the mean.
Phase 2: Workforce Analysis with MySQL
The cleaned employee data was imported into MySQL for business analysis.
The SQL analysis covers:
Workforce Headcount
- Total employees
- Active employees
- Workforce status distribution
- Department-wise headcount
- Location-wise headcount
Workforce Cost
- Average salary
- Total annual salary cost
- Department-wise salary cost
- Department-wise average salary
Workforce Capacity
- Total available weekly capacity
- Capacity by department
- Average capacity per employee
Hiring Analysis
The project compares available employee capacity against an assumed weekly workload requirement.
The simplified planning model uses:
Required Hours - Available Hours = Capacity Gap

The capacity gap is then converted into an estimated number of employees required using a 40-hour work week:
Capacity Gap / 40 = Estimated Employees Required

A SQL view was also created to provide a summarized department-level dataset for reporting.
Phase 3: Power BI Dashboard
The final Power BI dashboard brings the analysis together into an interactive workforce planning view.
Key KPIs
- Total Employees
- Active Employees
- Annual Salary Cost
- Weekly Workforce Capacity
- Projected Hiring Requirement
Dashboard Analysis
The dashboard includes:
- Active employees by department
- Active employees by location
- Workforce status distribution
- Workforce capacity gap by department
- Projected hiring requirement by department
What-If Hiring Simulator
The main interactive feature of the dashboard is a Required Weekly Workload parameter.
The user can change the expected workload and see how the projected hiring requirement changes.
For example:
Higher workload
       |
       v
Higher capacity requirement
       |
       v
Larger staffing gap
       |
       v
Higher projected hiring requirement

This allows the dashboard to be used as a simple scenario-planning tool rather than only a historical reporting dashboard.
Key Business Questions
The project is designed to answer questions such as:
1. How many employees are currently active?
2. Which departments have the largest workforce?
3. Which locations have the most employees?
4. What is the estimated annual salary cost?
5. How much weekly capacity does the current workforce provide?
6. Which departments have a capacity shortage?
7. How does increasing workload affect hiring requirements?
8. Which departments may require the most additional employees?
Project Structure
Dynamic-Workforce-Hiring-Simulator/
│
├── README.md
│
├── data/
│   └── sample_workforce_data.csv
│
├── python/
│   └── workforce_etl.ipynb
│
├── sql/
│   └── workforce_database.sql
│
├── powerbi/
│   └── workforce_dashboard.pbix
│
└── screenshots/
    └── dashboard.png

Important Assumptions
This is a portfolio project using a synthetic workforce dataset.
The hiring simulation uses simplified assumptions:
- Required workload is treated as a weekly requirement per department.
- One full-time employee is assumed to provide 40 working hours per week.
- Hiring requirements are estimated from available capacity versus required workload.
- Salary calculations represent base salary only and do not include benefits, bonuses, taxes, or other employment costs.
These assumptions are intentionally kept simple so that the business logic remains easy to understand and explain.
What I Learned
This project helped me practice the complete flow of a basic data analytics project:
Raw Data
   ↓
Data Cleaning
   ↓
Data Validation
   ↓
SQL Analysis
   ↓
Business Metrics
   ↓
Dashboard
   ↓
Scenario Analysis

More importantly, it helped me understand how technical work connects to a business question. Instead of only calculating headcount or creating charts, the project uses employee capacity and workload assumptions to estimate a potential hiring requirement.
Future Improvements
If this project were extended further, I would consider adding:
- Historical monthly workforce trends
- Department-specific workload requirements
- Attrition forecasting
- Hiring cost estimates
- Recruitment timelines
- Multiple workload scenarios
- Employee tenure analysis
- Forecasted workforce requirements