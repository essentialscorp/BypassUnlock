ui_print "AutoConfirm4D v1.0"
ui_print "Unlocks after the 4th PIN digit (Samsung built-in option)."
ui_print "Your PIN must be exactly 4 digits. Do not install with a 6-digit PIN."
ui_print "To turn off: press Action in the manager, or remove the module."
set_perm_recursive $MODPATH 0 0 0755 0755
