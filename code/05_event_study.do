*******************************************************
* 05_event_study.do
* Event-study diagnostic
*******************************************************

use "$PROCESSED/trade_panel.dta", clear

gen event_m2 = treated * (event_time == -2)
gen event_0 = treated * (event_time == 0)
gen event_1 = treated * (event_time == 1)
gen event_2 = treated * (event_time == 2)
gen event_3 = treated * (event_time == 3)

label var event_m2 "Treated x two months before"
label var event_0 "Treated x event month"
label var event_1 "Treated x one month after"
label var event_2 "Treated x two months after"
label var event_3 "Treated x three months after"

areg ln_export event_m2 event_0 event_1 event_2 event_3 exchange_rate province_gdp_growth inflation ///
    i.destination_id i.month_id, absorb(province_id) vce(cluster panel_id)

matrix b = e(b)
clear
set obs 5
gen event_time = .
gen coef = .
replace event_time = -2 in 1
replace event_time = 0 in 2
replace event_time = 1 in 3
replace event_time = 2 in 4
replace event_time = 3 in 5
replace coef = b[1, "event_m2"] in 1
replace coef = b[1, "event_0"] in 2
replace coef = b[1, "event_1"] in 3
replace coef = b[1, "event_2"] in 4
replace coef = b[1, "event_3"] in 5

twoway connected coef event_time, ///
    xline(-1, lpattern(dash)) yline(0, lpattern(dash)) ///
    title("Event-study diagnostic") ///
    xtitle("Months relative to policy event") ytitle("Coefficient relative to omitted month -1")
graph export "$FIGURES/figure_2_event_study.png", replace

