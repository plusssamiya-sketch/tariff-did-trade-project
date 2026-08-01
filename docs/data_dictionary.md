# Data Dictionary

## Raw Trade Flows

| Variable | Type | Description |
| --- | --- | --- |
| `province` | string | Chinese province or anonymized province code. |
| `destination` | string | Destination country or region. |
| `month` | string | Monthly period in `YYYYmM` format. |
| `export_value` | numeric | Export value in consistent units. |
| `treated` | binary | 1 for policy-exposed destination group, 0 for comparison destination group. |

## Controls

| Variable | Type | Description |
| --- | --- | --- |
| `exchange_rate` | numeric | Exchange-rate control, such as RMB/USD. |
| `province_gdp_growth` | numeric | Province-level GDP growth control. |
| `inflation` | numeric | Inflation control. |

## Constructed Variables

| Variable | Type | Description |
| --- | --- | --- |
| `month_id` | monthly date | Stata monthly date generated from `month`. |
| `post` | binary | 1 for months after the policy event. |
| `did` | binary | `treated * post`. |
| `ln_export` | numeric | Natural log of export value. |
| `event_time` | integer | Month relative to the policy event. |
| `province_id` | encoded id | Province fixed-effect identifier. |
| `destination_id` | encoded id | Destination fixed-effect identifier. |
| `panel_id` | encoded id | Province-destination panel identifier. |

