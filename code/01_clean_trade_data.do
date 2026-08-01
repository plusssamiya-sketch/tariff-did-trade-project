*******************************************************
* 01_clean_trade_data.do
* Import and clean raw trade and control files
*******************************************************

clear
import delimited "$RAW/sample_trade_flows.csv", clear varnames(1)

gen month_id = monthly(month, "YM")
format month_id %tm
gen ln_export = ln(export_value)

encode province, gen(province_id)
encode destination, gen(destination_id)

save "$PROCESSED/trade_flows_clean.dta", replace

clear
import delimited "$RAW/sample_controls.csv", clear varnames(1)

gen month_id = monthly(month, "YM")
format month_id %tm
encode province, gen(province_id)

save "$PROCESSED/controls_clean.dta", replace

