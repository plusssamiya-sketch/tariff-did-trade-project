*******************************************************
* 02_build_panel.do
* Merge cleaned inputs and construct analysis panel
*******************************************************

use "$PROCESSED/trade_flows_clean.dta", clear
merge m:1 province month_id using "$PROCESSED/controls_clean.dta", keep(match) nogen

gen post = month_id >= tm(2025m01)
gen did = treated * post
gen event_time = month_id - tm(2025m01)
egen panel_id = group(province destination)

label var ln_export "Log export value"
label var treated "Policy-exposed destination"
label var post "Post-policy period"
label var did "Treated x post"
label var event_time "Months relative to policy event"
label var exchange_rate "Exchange-rate control"
label var province_gdp_growth "Province GDP growth"
label var inflation "Inflation"

xtset panel_id month_id
save "$PROCESSED/trade_panel.dta", replace

