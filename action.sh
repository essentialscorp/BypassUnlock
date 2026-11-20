#!/system/bin/sh
D=/data/adb/autoconfirm4d
KEY=n_digits_pin_enabled
mkdir -p "$D"
[ -f "$D/backup" ] || settings get secure $KEY > "$D/backup"
if [ "$(settings get secure $KEY)" = "4" ]; then
  touch "$D/disable"; settings put secure $KEY 0
  echo "AutoConfirm4D: OFF (nilai=$(settings get secure $KEY))"
else
  rm -f "$D/disable"; settings put secure $KEY 4
  echo "AutoConfirm4D: ON (nilai=$(settings get secure $KEY))"
fi
