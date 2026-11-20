#!/system/bin/sh
D=/data/adb/autoconfirm4d
B=$(cat "$D/backup" 2>/dev/null)
case "$B" in ""|null) B=0;; esac
settings put secure n_digits_pin_enabled "$B"
rm -rf "$D"
