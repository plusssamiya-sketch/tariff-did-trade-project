# Methodology Note

## Design

The empirical design is a fixed-effects difference-in-differences model using province-destination-month data. Treated observations are trade flows to the policy-exposed destination group. Comparison observations are flows to less-exposed destinations.

## Identification Assumption

The key assumption is conditional parallel trends: absent the tariff-policy event, treated and comparison trade flows would have evolved similarly after accounting for province, destination, month, and control variables.

## Diagnostics

The package includes:

- pre/post descriptive statistics
- average log-export trends by treatment group
- event-time coefficients relative to the omitted pre-event month
- placebo timing check
- robustness specification with and without controls

## Interpretation Limits

This is a course empirical project. It should not be overclaimed as definitive causal evidence. The main useful parts are the treatment definition, controls, diagnostic checks, and notes on where causal interpretation is weak.

## Threats to Validity

- Treatment and comparison destinations may differ for reasons unrelated to the tariff event.
- The period is short, limiting pre-trend diagnostics.
- Trade values may respond to exchange rates, inventory timing, demand shifts, or reporting seasonality.
- Publicly shareable data may require anonymization or synthetic replacement.
