*******************************************************
* 04_did_baseline.do
* Baseline fixed-effects DID models
*******************************************************

use "$PROCESSED/trade_panel.dta", clear

log using "$TABLES/table_2_baseline_did.txt", replace text

display "Model 1: DID with province, destination, and month fixed effects"
areg ln_export did i.destination_id i.month_id, absorb(province_id) vce(cluster panel_id)
estimates store did_fe

display "Model 2: DID with controls"
areg ln_export did exchange_rate province_gdp_growth inflation i.destination_id i.month_id, ///
    absorb(province_id) vce(cluster panel_id)
estimates store did_controls

display "Interpretation note: coefficient on did is the treated-post difference relative to comparison flows, conditional on fixed effects and controls."

log close

