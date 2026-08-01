*******************************************************
* 03_descriptive_stats.do
* Descriptive statistics and parallel-trend figure
*******************************************************

use "$PROCESSED/trade_panel.dta", clear

preserve
collapse (count) n=ln_export (mean) mean_ln_export=ln_export mean_export=export_value ///
    mean_exchange_rate=exchange_rate mean_gdp_growth=province_gdp_growth mean_inflation=inflation, ///
    by(treated post)
export delimited using "$TABLES/table_1_descriptive_stats.csv", replace
restore

preserve
collapse (mean) ln_export, by(treated month_id)
twoway ///
    (connected ln_export month_id if treated == 1, lcolor(navy) mcolor(navy)) ///
    (connected ln_export month_id if treated == 0, lcolor(maroon) mcolor(maroon)), ///
    legend(order(1 "Policy-exposed" 2 "Comparison")) ///
    title("Parallel-trend diagnostic: mean log exports") ///
    xtitle("Month") ytitle("Mean log export value")
graph export "$FIGURES/figure_1_parallel_trends.png", replace
restore

