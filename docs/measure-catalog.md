# Measure catalogue

The following DAX assumes the star schema described in [semantic-model.md](semantic-model.md).

```DAX
Net Sales :=
SUM ( FactSales[NetAmount] )

Orders :=
DISTINCTCOUNT ( FactSales[OrderID] )

Average Order Value :=
DIVIDE ( [Net Sales], [Orders] )

Sales Previous Month :=
CALCULATE (
    [Net Sales],
    DATEADD ( DimDate[Date], -1, MONTH )
)

Month-on-Month Growth % :=
DIVIDE (
    [Net Sales] - [Sales Previous Month],
    [Sales Previous Month]
)

Sales YTD :=
TOTALYTD ( [Net Sales], DimDate[Date] )
```

## Measure notes
- Net Sales is additive across order lines, products, customers, and dates.
- Orders is a distinct count because the fact grain is order line, not order.
- Average Order Value is non-additive; do not sum or average AOV across regions to derive the total.
- Time intelligence depends on a continuous, marked date table and a clear relationship to the fact date.
- Growth is blank when the comparison period is zero or missing; decide whether the report should show blank, not applicable, or a separate status label.

## Naming and formatting
Use business-readable names, format currency measures as INR, percentage measures as percentages, and avoid embedding display formatting into numeric measures.
