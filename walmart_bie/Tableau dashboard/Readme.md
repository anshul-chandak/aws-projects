# 📊 Tableau Dashboard – Walmart BI Pipeline

This dashboard is the final visualization layer of the Walmart BI pipeline. It connects to data exported from Amazon Redshift (and later converted to CSV) and visualizes key metrics across six business personas.

Unlike traditional dashboards that act as static chart collections, this solution was designed to deliver a **data story**. Each page focuses on a unique stakeholder with relevant KPIs and clearly communicated insights. The goal: drive informed decision-making, not just present raw metrics.

---

## 🏢 Why Personas?

Personas represent different business functions with specific goals. We used them to guide the design of focused, actionable dashboard pages. By aligning KPIs with actual roles, the dashboard delivers clarity, relevance, and value to the business.

### 💼 Persona-Driven Dashboard Insights

| Persona               | KPIs and Decision Focus                                                  |
|-----------------------|---------------------------------------------------------------------------|
| **Sales Manager**     | Revenue by Category, Monthly Trends to monitor growth and seasonality     |
| **Regional Director** | City-level Revenue, AOV vs Orders to optimize local strategy              |
| **Customer Experience** | Repeat vs New Revenue and AOV to identify retention and loyalty levers     |
| **Marketing**         | Discount vs Non-discount Revenue and AOV to evaluate campaign ROI         |
| **Finance**           | Revenue and AOV by Payment Method to assess checkout performance          |

---

## 📷 Preview (Screenshots)

Screenshots of each dashboard page are included in `/Tableau dashboard/`.

Each story point is annotated or accompanied by a floating text box explaining:
- **What the insight is** (trend, spike, drop, anomaly)
- **Why it matters** (business impact, segmentation, opportunity)

---

## 🔗 Published Tableau Link

> [Click here to view the full dashboard on Tableau Public](https://public.tableau.com/app/profile/anshul.chandak/viz/WalmartBIDashboardAnshulChandak/Story1?publish=yes)

---

## 🛠 How This Was Built

- Raw data was cleaned, engineered, and loaded to Amazon Redshift
- Redshift views were exported to CSV using Python
- Tableau was connected to those CSVs for offline visualization
- Story Points were used to present one persona per page, with embedded insights

Each page is designed to be presentation-ready, telling a story from data to decision.
