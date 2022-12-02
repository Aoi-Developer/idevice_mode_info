#モード取得
if [ `uname` = "Darwin" ]; then
 idevicemode="$(system_profiler SPUSBDataType 2> /dev/null | grep -B1 'Vendor ID: 0x05ac' | grep 'Product ID:' | cut -dx -f2 | cut -d' ' -f1 | tail -r)"
elif [ `uname` = "Linux" ]; then
 idevicemode="$(lsusb  | cut -d' ' -f6 | grep '05ac:' | cut -d: -f2)"
fi

#ステータス変換
for idevicemode in $idevicemode; do
 case "$idevicemode" in
  12a8|12aa|12ab)
  echo "normal"
  ;;
  1281)
  echo "recovery"
  ;;
  1227)
  echo "dfu"
  ;;
  1222)
  echo "diag"
  ;;
  1338)
  echo "heckra1n_stage2"
  ;;
  4141)
  echo "pongo"
  ;;
 esac
done
