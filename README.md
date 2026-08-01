# Tariff DID Trade Project

![Status](https://img.shields.io/badge/status-portfolio%20replication%20package-blue)
![Data](https://img.shields.io/badge/data-synthetic%20sample-lightgrey)
![Method](https://img.shields.io/badge/method-DID%20%2B%20event%20study-green)

This repository is a quasi-replication package and policy-brief portfolio project for an applied economics coursework study. It asks whether a tariff-policy event affected Chinese provincial exports to the United States using a province-destination country-month panel from November 2024 to April 2025.

The project is intentionally framed as a course empirical project, not as a published causal study. Its purpose is to demonstrate reproducible research habits, identification reasoning, robustness diagnostics, and transparent limitations.

## What to Review First

| Artifact | Why it matters |
| --- | --- |
| [`paper/tariff_did_research_brief.pdf`](paper/tariff_did_research_brief.pdf) | One-page research brief suitable for a writing sample. |
| [`code/00_master.do`](code/00_master.do) | Master script showing the full Stata workflow. |
| [`docs/methodology_note.md`](docs/methodology_note.md) | Identification logic, specification choices, and limitations. |
| [`docs/reproducibility_checklist.md`](docs/reproducibility_checklist.md) | Replication-package checklist modeled on research-assistant workflows. |

## Research Question

Did the tariff-policy event affect Chinese provincial exports to the U.S. relative to less-exposed destination markets before and after the event?

## Data Unit and Period

- Unit of observation: province-destination country-month.
- Period: November 2024-April 2025.
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

The DID estimate compares changes in exports to policy-exposed destinations with changes in exports to less-exposed destinations before and after the event. The main identifying assumption is that, absent the policy shock, treated and comparison trade flows would have followed parallel trends after conditioning on controls and fixed effects.

The package therefore includes:

- descriptive checks
- parallel-trend diagnostics
- fixed-effects DID baseline
- event-study diagnostics
- placebo timing check
- robustness table

## Reproducibility

Run the full project in Stata from the repository root:

```stata
do code/00_master.do
```

The master script regenerates processed data, tables, figures, logs, and the reproducibility manifest. The repository includes synthetic sample data so the workflow can be inspected without redistributing private coursework or paid database exports.

## Skills Demonstrated

- Panel-data construction from raw province-destination-month inputs.
- Fixed-effects DID specification and event-study diagnostics.
- Placebo timing and robustness checks.
- Research transparency through data documentation, logs, and a reproducibility checklist.
- Policy-facing communication through a concise research brief.

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

The committed sample files are synthetic and for reproducibility demonstration only. If real coursework data cannot be publicly redistributed, keep it outside GitHub and document its source, access conditions, and cleaning steps in `data/raw/README.md`.

## Portfolio CV Line

Built a reproducible Stata package for a course empirical project on tariff policy and cross-border trade, including panel construction, fixed-effects DID, event-study diagnostics, placebo checks, and a one-page research brief.
