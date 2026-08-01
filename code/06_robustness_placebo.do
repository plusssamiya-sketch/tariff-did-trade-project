*******************************************************
* 06_robustness_placebo.do
* Placebo timing and robustness checks
*******************************************************

use "$PROCESSED/trade_panel.dta", clear

log using "$TABLES/table_3_robustness_placebo.txt", replace text

display "Robustness A: baseline with controls"
areg ln_export did exchange_rate province_gdp_growth inflation i.destination_id i.month_id, ///
    absorb(province_id) vce(cluster panel_id)

display "Robustness B: excluding inflation control"
areg ln_export did exchange_rate province_gdp_growth i.destination_id i.month_id, ///
    absorb(province_id) vce(cluster panel_id)

display "Placebo: fake post period beginning one month early"
gen placebo_post = month_id >= tm(2024m12)
gen placebo_did = treated * placebo_post
areg ln_export placebo_did exchange_rate province_gdp_growth inflation i.destination_id i.month_id, ///
    absorb(province_id) vce(cluster panel_id)

display "Caution: placebo and robustness checks are diagnostics, not proof of identification."

log close

