# Database Modeling, Normalization, ER-diagram, and Queries

![Normalization](https://github.com/towhidrazu/towhid.github.io/blob/main/images/Normalization.png)

This project is an academic assignment focusing on database modeling and querying. It includes the following major sections:

### **1. Normalization**

* The process of normalizing a database is explained, progressing from the First Normal Form (1NF) to the Third Normal Form (3NF).
* Key steps include:

  * **1NF**: Ensuring atomicity, uniqueness, and the absence of repeating groups.
  * **2NF**: Eliminating partial dependencies by creating separate tables for attributes that do not fully depend on the composite primary key.
  * **3NF**: Addressing transitive dependencies and ensuring all non-key attributes are dependent only on the primary key.

### **2. Entity Relationship Diagram (ERD)**

* A physical ERD diagram is included, demonstrating relationships (1-to-1, 1-to-many, many-to-many) between entities using crowfoot notations.
![ERdiagram](https://github.com/towhidrazu/towhid.github.io/blob/main/images/ER%20diagram.png)

### **3. Queries**

* Ten SQL queries are presented to answer specific questions and handle various requirements, such as:

  * Retrieving employee and supervisor details based on specific conditions.
  * Calculating derived information like "person hours worked."
  * Modifying data (e.g., increasing pay rates).
  * Creating views for more complex reporting requirements.

### **Problem Solving**

The report addresses practical database issues:

1. Handling scalability as the number of records increases.
2. Managing relationships, like supervisors overseeing multiple departments and employees serving on multiple committees.
3. Optimizing database design by replacing derived columns (e.g., "Person hours worked") with dynamic calculations through queries.

Overall, the report systematically analyzes database design principles and showcases their application in practical scenarios.
