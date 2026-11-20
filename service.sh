#!/system/bin/sh
D=/data/adb/autoconfirm4d
KEY=n_digits_pin_enabled
mkdir -p "$D"
while [ "$(getprop sys.boot_completed)" != "1" ]; do sleep 3; done
sleep 10
[ -f "$D/backup" ] || settings get secure $KEY > "$D/backup"
[ -f "$D/disable" ] && exit 0
[ "$(settings get secure $KEY)" = "4" ] || settings put secure $KEY 4
