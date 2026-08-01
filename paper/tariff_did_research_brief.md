# Tariff Policy and Cross-Border Trade

## One-Page Research Brief

**Question.** Did a tariff-policy event affect Chinese provincial exports to the United States relative to less-exposed destination markets during November 2024-April 2025?

**Data and unit.** The analysis uses a province-destination country-month panel. The committed sample data are synthetic and show the expected structure; real coursework data should be documented but not uploaded if redistribution is restricted.

**Method.** The main specification is a fixed-effects difference-in-differences model. The outcome is log export value. The treatment indicator marks exports to the policy-exposed destination group, and the post indicator marks months after the policy event. Controls include exchange rate, province GDP growth, and inflation where available.

**Identification logic.** The estimate compares changes in policy-exposed trade flows with changes in less-exposed flows before and after the event. The core assumption is conditional parallel trends: in the absence of the policy event, treated and comparison flows would have followed similar paths after fixed effects and controls.

**Diagnostics.** The scripts create a descriptive table, a parallel-trend figure, a baseline DID table, an event-study figure, and a placebo/robustness table. I used these outputs to check whether the DID setup looked reasonable, especially because the sample period is short.

**Interpretation.** This is a course project, so I would not present it as a definitive policy evaluation. The useful parts are the data unit, treatment definition, fixed effects, event-study check, and notes on where the design is weak.

**What I kept in the public version.** The GitHub version keeps the numbered Stata scripts, sample input files, data dictionary, methodology note, and output folders. Restricted course data should stay outside the repo.
