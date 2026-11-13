# Dashboard requirements: Sales performance

## Audience and decisions
**Primary audience:** business head, regional sales leads, and finance partner.

The report should help leaders identify whether sales are growing, which regions and categories explain movement, and whether the reported figures reconcile to the source.

## Questions to answer
1. What is net sales revenue by month?
2. How many distinct orders were placed?
3. What is average order value (AOV)?
4. Which regions and product categories contribute most?
5. How does the current period compare with the previous period?

## KPI definitions
| KPI | Definition | Display |
|---|---|---|
| Net sales | Sum of line net amount for valid orders | Currency, INR |
| Orders | Distinct order IDs for valid orders | Whole number |
| Average order value | Net sales / distinct orders | Currency, INR |
| Sales growth | Current period net sales vs previous comparable period | Percentage |
| Category contribution | Category net sales / total net sales | Percentage |

## Filters
- Date (default: latest complete month)
- Region
- Product category
- Customer segment

## Acceptance criteria
- KPI totals reconcile to the curated sales fact for the selected filter context.
- Date slicers affect all time-based visuals consistently.
- Blank or unknown dimension members are visible and investigated, not silently dropped.
- Tooltips show the period, metric definition, and selected filters.
- Refresh timestamp and data coverage period are displayed.
- Access to customer-level detail follows the organisation's approved access policy.

## Non-functional expectations
- Common report interactions should remain responsive at expected data volumes.
- Measures should be centralised and named consistently.
- Development, test/UAT, and production releases should use controlled deployment and validation steps.
