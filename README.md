# Tariff DID Trade Project

This is a cleaned public version of a course empirical project. It shows how I organized a tariff-policy question into a province-destination-month panel and a fixed-effects difference-in-differences workflow in Stata.

The original course data are not uploaded. The repository includes small synthetic sample files with the same column structure, so the code, folder layout, and identification logic can be inspected. Results produced from the committed sample files are workflow checks only; they should not be interpreted as evidence about real trade flows.

## Files to Check

| Artifact | Why it matters |
| --- | --- |
| [`paper/tariff_did_research_brief.md`](paper/tariff_did_research_brief.md) | Short write-up of the question, method, and limits. |
| [`code/00_master.do`](code/00_master.do) | Runs the Stata scripts in order. |
| [`docs/methodology_note.md`](docs/methodology_note.md) | Notes on the DID setup and identification assumption. |
| [`docs/reproducibility_checklist.md`](docs/reproducibility_checklist.md) | Checklist for files, logs, outputs, and remaining verification. |

## Research Question

How can a tariff-policy event be studied using Chinese provincial exports to a policy-exposed destination group relative to less-exposed destination markets?

## Data Unit and Period

- Unit of observation: province-destination country-month.
- Public sample period: November 2024-April 2025.
- Outcome: log export value.
- Treatment: trade flows to the policy-exposed destination group.
- Post period: months after the tariff-policy event.

## Method

The baseline design is a fixed-effects difference-in-differences model:

```text
ln(exports_pdm) = beta * Treated_d x Post_m
                + province fixed effects
                + destination fixed effects
                + month fixed effects
                + controls
                + error_pdm
```

Controls include exchange rate, provincial GDP growth, and inflation where available.

## Identification Logic

The DID estimate compares changes in exports to policy-exposed destinations with changes in exports to less-exposed destinations before and after the event. The key assumption is conditional parallel trends: absent the policy event, treated and comparison trade flows would have followed similar paths after conditioning on controls and fixed effects.

The code includes:

- descriptive checks
- parallel-trend diagnostic figure
- fixed-effects DID baseline
- event-study diagnostic structure
- placebo timing check
- robustness table

## Reproducibility

Run the full project in Stata from the repository root:

```stata
do code/00_master.do
```

The master script is designed to regenerate processed data, tables, figures, logs, and a manifest. I have kept the public README cautious because the committed data are synthetic and Stata execution still needs to be verified on a machine with Stata installed.

## What I Practiced

- Building a province-destination-month panel.
- Defining treatment, post, and event-time variables.
- Writing a fixed-effects DID specification in Stata.
- Adding event-study and placebo-timing checks.
- Keeping data notes, scripts, and output folders organized without uploading restricted coursework data.

## Structure

```text
tariff-did-trade-project/
  README.md
  paper/
    tariff_did_research_brief.md
    tariff_did_research_brief.pdf
  code/
    00_master.do
    01_clean_trade_data.do
    02_build_panel.do
    03_descriptive_stats.do
    04_did_baseline.do
    05_event_study.do
    06_robustness_placebo.do
  data/
    raw/
    processed/
  output/
    tables/
    figures/
  docs/
    data_dictionary.md
    methodology_note.md
    reproducibility_checklist.md
  LICENSE
```

## Data Availability and Confidentiality

The committed sample files are synthetic. If real coursework data cannot be publicly redistributed, keep it outside GitHub and document its source, access conditions, and cleaning steps in `data/raw/README.md`.

## Short CV Note

Built a reproducible Stata workflow for a course empirical project on tariff policy and cross-border trade, including panel construction, fixed-effects DID structure, event-study diagnostics, placebo checks, and a short research brief using public sample data.
