# AutoConfirm4D

[English](README.md) | [Bahasa Indonesia](README.id.md) | [Español](README.es.md)

A KernelSU / Magisk module that makes a Samsung lockscreen unlock as soon as the
4th PIN digit is entered, with no need to press OK.

It does not patch SystemUI and does not touch the credential store. It sets one
value in the system database, `Settings.Secure n_digits_pin_enabled = 4`, which is
Samsung's own "N-digit PIN" option. The PIN is still verified by the system through
the same path as the OK button.

## Requirements

| Item | Requirement |
|---|---|
| Device | Samsung Galaxy with One UI (see compatibility below) |
| Root | KernelSU or Magisk (a manager app that can flash modules) |
| LSPosed | **Not needed.** This module does not hook anything |
| Screen lock | PIN of **exactly 4 digits** |
| Fallback | Fingerprint enrolled and working (strongly recommended) |

## Compatibility

| Device | One UI | Build | Status |
|---|---|---|---|
| Galaxy A36 (SM-A366B) | 9.0 | CP2A.260605.016.A366BXXUCDZIF | Tested, works |
| Other Galaxy devices | 6.x - 9.x | - | Not tested |

| Root solution | Status |
|---|---|
| KernelSU | Boot script path used on the tested device |
| Magisk | Not tested |
| Action button | Needs a manager that supports `action.sh`. If missing, use the Termux commands below |

Only the row marked "Tested" has been verified. On other devices the setting may be
absent, ignored, or overwritten. Check with `settings get secure n_digits_pin_enabled`.

## Install

1. Make sure your PIN is exactly 4 digits and your fingerprint works.
2. Open your root manager, go to Modules, choose Install from storage, select the zip.
3. Reboot.
4. Lock the phone and enter your PIN. It should unlock after the 4th digit.

## Turn off

- Press the **Action** button on the module in the manager (toggles ON/OFF), or
- Remove the module (the original value is restored), or
- From Termux:

```
su -c "settings put secure n_digits_pin_enabled 0"
```

Disabling the module in the manager does not reset the setting. Use Action or the
command above first.

## Before you change your PIN

Turn the module OFF first, change the PIN, then turn it on again if the new PIN is
4 digits.

## If you are locked out

With the option on, input stops at 4 digits. A PIN that is not 4 digits cannot be typed.
Unlock with fingerprint, then run the command in "Turn off". Without a fingerprint,
boot into Safe Mode; the setting stays in the Settings database, so a factory reset
is the last resort.

## Known limits

- Every wrong 4-digit entry counts as a failed attempt, including Samsung's lockout timer.
- Behavior after a firmware update is not guaranteed. Re-test after each update.
- Not verified: whether Samsung Settings rewrites the value when the lock type changes.
- Not a security bypass. A 4-digit PIN is weaker than a longer one regardless of this module.

## License

MIT
