## 🚀 **dbt Project**

I completed the full dbt Developer Path curriculum, applying best practices in data modeling, testing, documentation, and deployment using dbt Cloud. 
I hope you can use this project to correct and guide yourself through the process of completing it. Some things are done my way and I encourage you to do it your way too!.


**Highlights:**

🏗️ **Source Configuration**

* Defined sources using the sources: config in .yml files.
* Ensured data lineage and transparency with well-documented upstream tables.
* Applied freshness checks to monitor data quality and recency.

🧩 **Macros and Reusability**

* Created custom macros to simplify repetitive SQL logic.
* Utilized built-in macros from the dbt_utils package.
* Followed Jinja templating best practices for dynamic SQL generation.

📊 **Modeling & Refactoring**

* Built staging (stg_), intermediate (int_), and final models following the dbt medallion architecture.
* Refactored existing models for modularity and readability.
* Used ref() for proper dependency management and tested model relationships.

🧪 **Testing & Documentation**

* Implemented schema tests (unique, not_null, accepted_values) and custom tests.
* Enriched models with clear and concise descriptions.
* Executed dbt docs generate to produce interactive documentation and lineage DAGs.

⚙️ **Job Implementation**

* Configured and deployed dbt jobs (runs + tests).
* Scheduled runs to simulate production pipelines.
* Handled incremental models with is_incremental() logic.

📦 **Packages & Modularity**

* Leveraged external packages like dbt_utils and audit_helper.

* Separated code into logical subdirectories for clarity and maintenance.

🧠 **Skills Gained**

* Data Modeling with dbt best practices
* SQL Refactoring for maintainability
* Source Control & Deployment of transformations
* Documentation & Testing for data quality assurance
* Macro Design for DRY (Don’t Repeat Yourself) code
* Job Orchestration to automate workflows

<img width="1213" alt="Screenshot 2025-06-20 at 4 40 03 PM" src="https://github.com/user-attachments/assets/4a264b71-15f5-454f-9678-711b6b9bd86c" />
