# Tariff DID Trade Project

This is a cleaned GitHub version of a course empirical project. The question is whether a tariff-policy event was related to changes in Chinese provincial exports to the United States, using a province-destination country-month panel from November 2024 to April 2025.

The original course data are not uploaded. The repository includes small synthetic sample files with the same column structure, so the Stata code and folder layout can still be checked.

## Files to Check

| Artifact | Why it matters |
| --- | --- |
| [`paper/tariff_did_research_brief.pdf`](paper/tariff_did_research_brief.pdf) | Short write-up of the question, method, and limits. |
| [`code/00_master.do`](code/00_master.do) | Runs the Stata scripts in order. |
| [`docs/methodology_note.md`](docs/methodology_note.md) | Notes on the DID setup and identification assumption. |
| [`docs/reproducibility_checklist.md`](docs/reproducibility_checklist.md) | Checklist for files, logs, and outputs. |

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

The repo includes:

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

The master script is set up to regenerate processed data, tables, figures, logs, and a manifest. The sample data are only included to show the expected file structure.

## What I Practiced

- Building a province-destination-month panel.
- Writing a fixed-effects DID specification in Stata.
- Adding event-study and placebo-timing checks.
- Keeping data notes, logs, and output folders organized.

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

Built a reproducible Stata package for a course empirical project on tariff policy and cross-border trade, including panel construction, fixed-effects DID, event-study diagnostics, placebo checks, and a one-page research brief.
