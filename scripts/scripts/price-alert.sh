#!/bin/bash


noti_app=$(which dunstify)
declare -A binance_assets_ticker_top
declare -A binance_assets_ticker_bottom

binance_curl_api="https://www.binance.com/api/v3/ticker/price?symbol="
binance_assets_ticker_top=(
  [ETHUSDT]=2000 #1800 
  [MATICUSDT]=1.8 #1.4 #1.84
  [BTCUSDT]=32000
  [AAVEUSDT]=173 
  [MKRUSDT]=2000 
  [LINKUSDT]=40 
  [NEARUSDT]=20
  [ONEUSDT]=.4
)
binance_assets_ticker_bottom=(
  [ETHUSDT]=1990 #1295
  [BTCUSDT]=28800
  [MATICUSDT]=0.7 #.73
  [OPUSDT]=.5
  [NEARUSDT]=1.2
  [AAVEUSDT]=35
  [BNBUSDT]=200
  # [MKRUSDT]=2000 
  # [LINKUSDT]=40 
  [ONEUSDT]=.005
)

asset_price_grep='([A-Z]+).*\"([0-9]+\.[0-9]+)\"'

declare -A tmp_array_1
tmp_output_top_string=" SELL \n "
tmp_output_bottom_string=" BUY \n "

# for asset in ${assets}; do
for asset in ${!binance_assets_ticker_top[@]}; do
  response=$( curl -s $binance_curl_api$asset)

  if [[ -z $response ]]; then
    $noti_app -u critical "== NO INTERNET =="
    exit 1
  fi
  if [[ "$response" =~ $asset_price_grep ]]; then
    true
    # return here if fail
  fi
  # remove trailing zeros
  tmp_array_1[$asset]=$(echo ${BASH_REMATCH[2]} | sed -e 's/[0]*$//g')

    # https://stackoverflow.com/questions/11237794/how_to_compare_two_decimal_numbers_in_bash_awk
    if (( $(echo "${tmp_array_1[$asset]}  ${binance_assets_ticker_top[$asset]}" | awk '{print ($1 > $2)}') )); then
      # if (( $(echo "${tmp_array_1[$asset]} > ${binance_assets_ticker_top[$asset]}" | bc -l) )); then
      tmp_output_top_string+="$asset"
      tmp_output_top_string+=" : "
      tmp_output_top_string+=${tmp_array_1[$asset]}
      tmp_output_top_string+=" \n "
    fi

    if (( $(echo "${tmp_array_1[$asset]} ${binance_assets_ticker_bottom[$asset]}" | awk '{print ($1 < $2)}') )); then
      tmp_output_bottom_string+="$asset"
      tmp_output_bottom_string+=" : "
      tmp_output_bottom_string+=${tmp_array_1[$asset]}
      tmp_output_bottom_string+=" \n "
    fi
  done
  if [[ $tmp_output_top_string == " SELL \n " ]]; then
    tmp_output_top_string=""
  fi
  if [[ $tmp_output_bottom_string == " BUY \n " ]]; then
    tmp_output_bottom_string=""
  fi

# /var/log/syslog .. check for logs
# https://askubuntu.com/questions/298608/notify_send_doesnt_work_from_crontab
# https://stackoverflow.com/questions/16519673/cron_with_notify_send
export DISPLAY=:0
if [[ -z "$tmp_output_top_string" && -z "$tmp_output_bottom_string" ]]; then
  $noti_app -u normal "== NOTHING ==" -a "price_alert" -r 0xdead
else
  $noti_app -u critical "== PRICES ==" "$tmp_output_top_string \n $tmp_output_bottom_string" -a "price_alert" -r 0xdead

fi

# Check if a Key Exists in a Dictionary in Bash

# if [ -v test_var[key1] ]; then
#     echo "key1 exists in a dictionary"
# fi

# if [ ! -v test_var[key2] ]; then
#     echo "key2 does not exists in a dictionary"
# fi
# */15 * * * * /usr/bin/bash /home/hemant/price_alert.sh
