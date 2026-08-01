*******************************************************
* Tariff DID Trade Project
* Master replication script
*******************************************************

clear all
set more off
version 17

global ROOT "."
global RAW "$ROOT/data/raw"
global PROCESSED "$ROOT/data/processed"
global TABLES "$ROOT/output/tables"
global FIGURES "$ROOT/output/figures"
global DOCS "$ROOT/docs"

capture mkdir "$PROCESSED"
capture mkdir "$TABLES"
capture mkdir "$FIGURES"

log using "$ROOT/output/master_run.log", replace text

do "$ROOT/code/01_clean_trade_data.do"
do "$ROOT/code/02_build_panel.do"
do "$ROOT/code/03_descriptive_stats.do"
do "$ROOT/code/04_did_baseline.do"
do "$ROOT/code/05_event_study.do"
do "$ROOT/code/06_robustness_placebo.do"

file open manifest using "$ROOT/output/reproducibility_manifest.txt", write replace
file write manifest "Tariff DID Trade Project reproduction manifest" _n
file write manifest "Run order: 01_clean_trade_data.do through 06_robustness_placebo.do" _n
file write manifest "Main generated data: data/processed/trade_panel.dta" _n
file write manifest "Main tables: output/tables/table_1_descriptive_stats.csv; table_2_baseline_did.txt; table_3_robustness_placebo.txt" _n
file write manifest "Main figures: output/figures/figure_1_parallel_trends.png; figure_2_event_study.png" _n
file close manifest

log close
display as result "Replication package finished. Check output/ for tables, figures, and manifest."

