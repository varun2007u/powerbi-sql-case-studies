# Semantic model

## Fact and dimension design

**FactSales** has one row per order line. Its declared grain is essential: an order with three products contributes three fact rows but one distinct order.

| Table | Grain | Key fields |
|---|---|---|
| FactSales | One row per order line | OrderLineKey, OrderID, OrderDateKey, CustomerKey, ProductKey, Quantity, UnitPrice, DiscountAmount, NetAmount |
| DimDate | One row per calendar date | DateKey, Date, Month, MonthName, Quarter, Year |
| DimCustomer | One row per customer | CustomerKey, CustomerID, Segment, Region |
| DimProduct | One row per product | ProductKey, ProductID, ProductName, Category |

## Relationships
- DimDate[DateKey] 1 -> * FactSales[OrderDateKey]
- DimCustomer[CustomerKey] 1 -> * FactSales[CustomerKey]
- DimProduct[ProductKey] 1 -> * FactSales[ProductKey]

Use single-direction filtering from dimensions to the fact unless a documented business requirement justifies a different design. Avoid many-to-many relationships as a shortcut for unresolved grain issues.

## Design decisions
- Use surrogate keys in the warehouse model and retain source business identifiers for traceability.
- Keep descriptive attributes in dimensions and additive numeric events in the fact.
- Mark DimDate as the model's date table.
- Hide technical keys from report authors where they are not needed.
- Prefer explicit measures over implicit aggregation.
- Define handling for unknown dimension members and late-arriving records.

## Data quality and reconciliation
- Fact foreign keys should resolve to a dimension row or an approved unknown member.
- Order line key should be unique at the declared grain.
- NetAmount should reconcile to quantity, unit price, and discount according to the agreed commercial rule.
- Report totals should reconcile to the curated fact after the same date, status, and currency filters are applied.
