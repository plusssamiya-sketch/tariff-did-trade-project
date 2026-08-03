# Tariff Policy and Cross-Border Trade

## One-Page Research Brief

**Question.** How can a tariff-policy event be studied using Chinese provincial exports to the United States relative to less-exposed destination markets during November 2024-April 2025?

**Data and unit.** The analysis is organized as a province-destination country-month panel. The committed public data are synthetic and show the expected structure; real coursework data should be documented locally but not uploaded if redistribution is restricted.

**Method.** The main specification is a fixed-effects difference-in-differences model. The outcome is log export value. The treatment indicator marks exports to the policy-exposed destination group, and the post indicator marks months after the policy event. Controls include exchange rate, province GDP growth, and inflation where available.

**Identification logic.** The estimate compares changes in policy-exposed trade flows with changes in less-exposed flows before and after the event. The core assumption is conditional parallel trends: in the absence of the policy event, treated and comparison flows would have followed similar paths after fixed effects and controls.

**Diagnostics.** The scripts are written to create a descriptive table, a parallel-trend figure, a baseline DID table, an event-study figure, and a placebo/robustness table. These outputs are intended as checks on the workflow and identification setup. The sample period is short, so these diagnostics should be read cautiously.

**Interpretation.** This is a course project and public portfolio package, not a definitive policy evaluation. The useful parts are the data unit, treatment definition, fixed effects, event-study setup, placebo timing check, and notes on where the design is weak.

**What I kept in the public version.** The GitHub version keeps the numbered Stata scripts, synthetic sample input files, data dictionary, methodology note, and output folders. Restricted course data should stay outside the repo.
