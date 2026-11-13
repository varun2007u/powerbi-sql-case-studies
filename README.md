# Power BI & SQL Case Studies

A practical BI portfolio project built around a fictional retail business. It documents the path from business questions to a governed semantic model, SQL-ready data, and dashboard design.

## Case study: Sales performance

The fictional leadership team wants a monthly view of revenue, order volume, average order value, product mix, and regional performance.

### Deliverables
- [Dashboard requirements](docs/dashboard-spec.md)
- [Semantic model](docs/semantic-model.md)
- [Measure catalogue with DAX examples](docs/measure-catalog.md)
- [SQL analysis](sql/sales_performance.sql)
- [Synthetic sample data](data/)

## Recommended report pages
1. **Executive overview:** revenue, orders, average order value, monthly trend.
2. **Regional performance:** revenue and order count by region.
3. **Product analysis:** product category mix and contribution.
4. **Data quality:** missing customer/product keys, duplicate orders, invalid amounts.

## Getting started
The SQL examples use common ANSI-style constructs; adapt date functions and table names for your database. The DAX examples assume a star schema with a marked Date table and single-direction dimension-to-fact relationships.

All data is fictional and generated for this portfolio. It is not company or customer data. Amounts are illustrative INR values.

## How to discuss the design
Be ready to explain the grain of each table, why dimensions filter facts, how date intelligence is enabled, how measures differ from calculated columns, and what reconciliation checks protect the headline KPIs.
