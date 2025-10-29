# Smart-Num (Numword) Feature

**Inspired by urob's zmk-config implementation**

## What is Smart-Num?

Smart-num is an intelligent number layer activation system that makes typing numbers on a compact keyboard much more efficient. It solves the problem of having to hold a layer key while typing multiple digits.

## How It Works

The number layer thumb key (Backspace) now has **dual behavior**:

### **TAP** = Sticky Number Layer (Smart Mode)
- **Single tap** activates the number layer
- **Stays active** while you type numbers (0-9) and related symbols
- **Auto-deactivates** when you press any non-number key
- Perfect for typing phone numbers, dates, calculations

### **HOLD** = Regular Number Layer
- **Hold down** the key for traditional layer behavior
- Layer stays active as long as you hold
- Deactivates when you release

## Examples

### Typing a Phone Number
```
Before (traditional):
Hold Backspace → type 5551234567 → release Backspace

With Smart-Num:
Tap Backspace → type 5551234567 → press Space (auto-deactivates)
```

### Typing a Date
```
Tap Backspace → type 2025-01-30 → press any letter (auto-deactivates)
```

### Typing Multiple Separate Numbers
```
Tap Backspace → type 42 → tap Backspace again → type 100
(Each tap reactivates for the next number)
```

## Allowed Keys in Smart-Num Mode

The layer stays active when you press:
- **Numbers**: 0-9
- **Math operators**: + - * / =
- **Punctuation**: . , (decimal point, comma for thousands)
- **Editing**: Backspace, Delete

## Auto-Deactivation Triggers

The layer deactivates when you press:
- Any letter key (A-Z)
- Space
- Enter/Return
- Tab
- Escape
- Any other non-number key

## Known Limitations

**⚠️ Important**: If you type numbers followed immediately by these letters in number positions (without space), the auto-deactivation may not work:
- W, F, P, R, S, T, X, C, D

**Workaround**: Add a space or other character between the number and these letters, OR use the hold behavior instead of tap.

## Configuration Location

- **Behavior definition**: [miryoku/miryoku_smart_num.dtsi](miryoku/miryoku_smart_num.dtsi)
- **Enable/disable**: [miryoku/custom_config.h](miryoku/custom_config.h) - `MIRYOKU_LAYER_NUM`
- **Module dependency**: [config/west.yml](config/west.yml) - `zmk-auto-layer` from urob

## Advantages Over Traditional Number Layer

| Feature | Traditional | Smart-Num (Tap) |
|---------|-------------|----------------|
| **Single digit** | Hold + press + release | Tap + press + any key |
| **Multiple digits** | Hold entire time | Tap once, type freely |
| **Mental load** | Remember to hold | Type naturally |
| **Hand strain** | One thumb held down | No holding required |
| **Speed** | Slower | Faster |

## Tips for Best Experience

1. **For single digits**: Either method works fine
2. **For multiple digits**: Use tap (smart mode)
3. **For mixing numbers and letters closely**: Use hold mode or add spaces
4. **Practice**: The auto-deactivation feels natural after a few uses

## Credit

This feature is inspired by and based on:
- **urob's zmk-config**: https://github.com/urob/zmk-config
- **Jonas Hietala's Numword for QMK**: Original concept
- **zmk-auto-layer module**: Implementation by urob

## Disable Smart-Num

If you prefer traditional behavior, comment out or remove this line from `miryoku/custom_config.h`:

```c
// #define MIRYOKU_LAYER_NUM U_SMART_NUM
```

The number layer will return to standard hold-only behavior.

---

**Enjoy typing numbers more efficiently! 🎯**
