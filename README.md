Dynamic Workforce & Hiring Planning Simulator
A data analytics project built with Python, MySQL, Excel, and Power BI to analyze workforce capacity, costs, staffing gaps, and projected hiring requirements under different workload scenarios.
The project follows a practical analytics workflow, starting with messy employee data and ending with an interactive Power BI hiring simulator.
Dashboard Screenshot
 
Project Overview
The project analyzes:
- Workforce headcount
- Employee capacity
- Workforce costs
- Department and location distribution
- Capacity shortages
- Projected hiring requirements
- Workload-based hiring scenarios
Workflow
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
Dashboard & Hiring Simulator

Tech Stack
Technology	Purpose
Python / Pandas	Data cleaning and validation
MySQL	Data storage and workforce analysis
Power BI	Dashboard and scenario analysis
Excel / CSV	Source and processed data


Dataset
The dataset contains approximately 12,500 employee records with:
Column	Description
Emp_ID	Employee identifier
Department	Employee department
Location	Employee location
Hire_Date	Employee hiring date
Status	Employment status
Base_Salary_USD	Annual base salary
Weekly_Capacity_Hrs	Available weekly working hours
Performance_Rating	Employee performance rating


The dataset intentionally contains messy text, missing values, and numerical outliers to simulate a realistic data-cleaning workflow.
Phase 1: Python Data Cleaning
Using Pandas, I:
- Inspected data types and missing values
- Standardized text fields
- Removed unnecessary whitespace
- Handled missing categorical values
- Imputed missing performance ratings
- Identified invalid salary and capacity values
- Converted hiring dates to datetime
- Validated the cleaned dataset
- Exported the processed data to Excel and CSV
Phase 2: MySQL Workforce Analysis
The cleaned dataset was imported into MySQL for business analysis.
Headcount Analysis
- Total employees
- Active employees
- Workforce status
- Department-wise headcount
- Location-wise headcount
Workforce Cost
- Average salary
- Total annual salary cost
- Department-level salary cost
Workforce Capacity
- Total weekly capacity
- Department-level capacity
- Average employee capacity
Hiring Analysis
The project compares required workload against available workforce capacity:
Capacity Gap = Required Hours - Available Hours

The capacity gap is then converted into an estimated hiring requirement using a 40-hour work week:
Employees Required = Capacity Gap / 40

A SQL view was created to provide summarized department-level workforce metrics.
Phase 3: Power BI Dashboard
The Power BI dashboard contains:
- Total Employees
- Active Employees
- Annual Salary Cost
- Weekly Workforce Capacity
- Projected Hiring Requirement
- Active Employees by Department
- Active Employees by Location
- Workforce Status
- Workforce Capacity Gap
- Projected Hiring Requirement by Department
What-If Hiring Simulator
The dashboard includes a Required Weekly Workload parameter.
Changing the workload allows the user to evaluate how projected hiring requirements change under different scenarios.
Higher Workload
       |
       v
Higher Capacity Requirement
       |
       v
Larger Staffing Gap
       |
       v
Higher Hiring Requirement

Key Business Questions
The project helps answer:
1. How many employees are currently active?
2. Which departments have the largest workforce?
3. Which locations have the most employees?
4. What is the estimated annual salary cost?
5. How much weekly capacity is available?
6. Which departments have capacity shortages?
7. How does increased workload affect hiring requirements?
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
    └── dashboard.jpeg

Assumptions
This is a portfolio project using a synthetic workforce dataset.
- Workload is modeled as a weekly requirement per department.
- One full-time employee is assumed to provide 40 hours per week.
- Hiring requirements are estimated from capacity gaps.
- Salary calculations include base salary only.
These assumptions keep the model simple and focused on demonstrating the analytics workflow.
What I Learned
This project helped me practice an end-to-end data analytics workflow:
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
Power BI Dashboard
   ↓
Scenario Analysis

The main focus was understanding how cleaned data and business logic can be transformed into insights that support workforce planning decisions.
Future Improvements
Potential extensions include:
- Historical workforce trends
- Department-specific workload requirements
- Attrition forecasting
- Hiring cost estimates
- Recruitment timelines
- Employee tenure analysis
- Workforce demand forecasting
