# Custom ZMK Configuration

**QWERTY layout with urob-style timeless home row mods for macOS**

## 🎹 Keyboards

### Corne 42
- ✅ QWERTY layout
- ✅ Urob-style timeless home row mods (GACS)
- ✅ nice!view e-paper displays
- ✅ Nav/Num/Fun on right thumb
- ✅ macOS optimized

### Sofle 60
- ✅ QWERTY layout
- ✅ Urob-style timeless home row mods (GACS)
- ✅ 2x rotary encoders (volume + desktop switching)
- ✅ Nav/Num/Fun on right thumb
- ✅ macOS optimized

## 🚀 Quick Start

### Local Build (Fast)
```bash
# Build all keyboards
./build-local.sh all

# Build specific keyboard
./build-local.sh corne
./build-local.sh sofle
```

### GitHub Actions Build
1. Push changes: `git push`
2. Go to **Actions** tab
3. Run workflow or wait for auto-trigger
4. Download artifacts

See [BUILD.md](BUILD.md) for detailed instructions.

## 📂 Custom Configuration Files

- `config/corne.conf` - nice!view display settings
- `config/sofle.conf` - Encoder settings
- `config/sofle.keymap` - Encoder bindings
- `miryoku/custom_config.h` - QWERTY + macOS settings
- `miryoku/miryoku_behaviors.dtsi` - Urob HRM implementation

## 🎛️ Key Features

### Home Row Mods (Urob-style Timeless)
- 280ms tapping term (forgiving timing)
- Positional hold-tap (opposite hand only)
- 150ms prior-idle requirement (prevents accidental activation)
- Virtually eliminates misfires!

**GACS Layout:**
```
A → ⌘ (Command)
S → ⌥ (Option)
D → ⌃ (Control)
F → ⇧ (Shift)
```

### Thumb Clusters
**Right thumb (your nav/num/fn):**
- Space → Nav layer (arrows, navigation)
- Backspace → Number layer (0-9)
- Delete → Function layer (F1-F12)

### Encoders (Sofle)
- **Left**: Volume up/down
- **Right**: Desktop switching (Mission Control)

## 🔧 Customization

Edit these values in the config files:

**Encoder sensitivity** (`config/sofle.conf`):
```conf
CONFIG_EC11_TRIGGER_RESOLUTION=20  # Try 15-30
```

**HRM timing** (`miryoku/miryoku_behaviors.dtsi`):
```c
tapping-term-ms = <280>;           # Hold duration
require-prior-idle-ms = <150>;     # Fast typing threshold
quick-tap-ms = <175>;              # Rapid tap threshold
```

## 📲 Flashing

1. Double-tap RESET button on nice!nano
2. Drag `.uf2` file to NICENANO drive
3. Keyboard reboots automatically

## 🎯 Workflows

- `.github/workflows/build-corne-nice_nano_v2-qwerty.yml`
- `.github/workflows/build-sofle-nice_nano_v2-qwerty.yml`

Auto-triggers on push to config files.

---

**Based on**: [Miryoku ZMK](https://github.com/manna-harbour/miryoku_zmk) + [urob's timeless HRM](https://github.com/urob/zmk-config)
