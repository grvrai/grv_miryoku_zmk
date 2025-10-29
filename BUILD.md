# Building ZMK Firmware

This guide covers both local and GitHub Actions builds for your Corne and Sofle keyboards.

---

## 🏠 LOCAL BUILD (Advanced - GitHub Actions Recommended Instead)

**⚠️ Note**: Local builds with Miryoku are complex due to the custom build system. **Using GitHub Actions is much easier and recommended** (see below).

If you still want to build locally, you'll need to:
1. Clone the full ZMK repository
2. Set up the Miryoku build environment
3. Configure west (Zephyr build tool)

This is beyond the scope of this guide. **Use GitHub Actions instead** - it's free, automated, and much simpler!

---

## ☁️ GITHUB ACTIONS BUILD (Recommended for Production)

GitHub Actions automatically builds firmware in the cloud. No local dependencies needed!

### Step 1: Push Your Changes

```bash
# Stage all changes
git add .

# Commit with a descriptive message
git commit -m "Configure QWERTY with urob HRM, nice!view, and encoders"

# Push to GitHub
git push origin master
```

### Step 2: Trigger Build

**Method A: Automatic (on push)**

The workflows automatically trigger when you push changes to:
- `config/corne.keymap` or `config/corne.conf`
- `config/sofle.keymap` or `config/sofle.conf`
- Anything in `miryoku/` directory

**Method B: Manual Trigger**

1. Go to your GitHub repository
2. Click **"Actions"** tab at the top
3. Select a workflow from the left sidebar:
   - **"Build Corne QWERTY nice_nano_v2 nice_view"**
   - **"Build Sofle QWERTY nice_nano_v2 Encoders"**
4. Click **"Run workflow"** button (top right)
5. Click green **"Run workflow"** to confirm

### Step 3: Download Firmware

1. Wait for the workflow to complete (usually 2-5 minutes)
   - Green checkmark ✅ = Success
   - Red X ❌ = Failed (check logs)

2. Click on the completed workflow run

3. Scroll down to **"Artifacts"** section

4. Download the artifact (will be a `.zip` file)

5. Extract the `.zip` to get your `.uf2` firmware files

### Artifact Contents

The downloaded artifact contains firmware for both halves:

**For Corne:**
```
miryoku_zmk-corne_left-nice_view_adapter-nice_view-nice_nano_v2.uf2
miryoku_zmk-corne_right-nice_view_adapter-nice_view-nice_nano_v2.uf2
```

**For Sofle:**
```
miryoku_zmk-sofle_left-nice_nano_v2.uf2
miryoku_zmk-sofle_right-nice_nano_v2.uf2
```

---

## 📲 FLASHING FIRMWARE TO KEYBOARD

### For Both Keyboards (Left & Right Halves):

1. **Connect via USB**
   - Plug the keyboard half into your computer

2. **Enter Bootloader Mode**
   - Double-tap the RESET button on the nice!nano controller
   - A USB drive appears named **NICENANO**

3. **Flash Firmware**
   - Drag and drop the `.uf2` file to the NICENANO drive
   - The drive will disappear automatically
   - Keyboard will reboot with new firmware

4. **Repeat for Other Half**
   - Flash the left half with `*_left.uf2`
   - Flash the right half with `*_right.uf2`

### First Time Pairing

After flashing both halves:

1. **Reset Bluetooth bonds** (if needed):
   - Hold the pairing key combination (check your layout)
   - Or reflash firmware to clear bonds

2. **Pair halves together**:
   - Both halves should automatically pair with each other
   - The right half (primary) connects to your computer

3. **Pair to macOS**:
   - Go to System Settings > Bluetooth
   - Look for "Corne" or "Sofle" in available devices
   - Click "Connect"

---

## 🔍 CHECKING BUILD LOGS

If a build fails:

### Local Build:
- Check terminal output for error messages
- Common issues:
  - Docker not running
  - Syntax errors in keymap files
  - Missing dependencies

### GitHub Actions:
1. Click on the failed workflow run (red X)
2. Click on the "build" job
3. Expand the failed step to see error details
4. Common issues:
   - Syntax errors in `.dtsi` or keymap files
   - Invalid key codes
   - Missing includes

---

## 🧪 TESTING CHANGES

**Recommended workflow:**

1. **Make small changes** - one feature at a time
2. **Build locally** for quick testing:
   ```bash
   ./build-local.sh corne  # or sofle
   ```
3. **Flash and test** on keyboard
4. **Commit working changes** to git
5. **Push to GitHub** for archive build

---

## 🎯 QUICK REFERENCE

| Task | Command |
|------|---------|
| Build everything locally | `./build-local.sh all` |
| Build only Corne | `./build-local.sh corne` |
| Build only Sofle | `./build-local.sh sofle` |
| Clean build directory | `rm -rf build/ && mkdir build` |
| Check Docker running | `docker ps` |
| Push to GitHub | `git add . && git commit -m "message" && git push` |

---

## 📦 BUILD ARTIFACTS LOCATIONS

| Method | Location |
|--------|----------|
| Local Docker | `build/*.uf2` |
| GitHub Actions | Actions tab > Workflow run > Artifacts (download) |

---

## 🆘 TROUBLESHOOTING

### "docker: command not found"
- Install Docker Desktop
- Make sure Docker Desktop is running

### "permission denied" on build script
```bash
chmod +x build-local.sh
```

### Build fails with "syntax error"
- Check your keymap files for typos
- Ensure all brackets are balanced
- Check the error message for line numbers

### Keyboard not connecting after flash
- Try resetting Bluetooth bonds
- Reflash both halves
- Check battery is charged
- Verify you flashed correct left/right files

### Encoders not working (Sofle)
- Verify `config/sofle.conf` has encoder settings
- Check physical encoder connections
- Try adjusting `CONFIG_EC11_TRIGGER_RESOLUTION`

### nice!view display blank (Corne)
- Verify `config/corne.conf` has display enabled
- Check display physical connection
- Ensure you built with `nice_view_adapter nice_view` shields

---

## 📚 ADDITIONAL RESOURCES

- [ZMK Documentation](https://zmk.dev/docs)
- [Miryoku Documentation](https://github.com/manna-harbour/miryoku)
- [urob's ZMK Config](https://github.com/urob/zmk-config)
- [ZMK Discord](https://zmk.dev/community/discord/invite)

---

**Need help?** Check the error messages carefully - they usually point to the exact issue!
