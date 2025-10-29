#!/bin/bash
# Local ZMK build script using Docker
# Usage: ./build-local.sh [corne|sofle|all]

set -e

KEYBOARD=${1:-all}

echo "🔨 Building ZMK firmware locally with Docker..."

# Function to build a keyboard
build_keyboard() {
    local board=$1
    local shield=$2
    local name=$3

    echo "📦 Building $name..."

    docker run --rm \
        -v "$(pwd)/config:/zmk/config:Z" \
        -v "$(pwd)/miryoku:/zmk/miryoku:Z" \
        -v "$(pwd)/build:/zmk/build:Z" \
        zmkfirmware/zmk-build-arm:stable \
        /bin/bash -c "\
            west build -s /zmk/app -d /zmk/build/$name -b $board -- \
            -DSHIELD=$shield \
            -DZMK_CONFIG=/zmk/config \
            && cp /zmk/build/$name/zephyr/zmk.uf2 /zmk/build/$name.uf2 \
            && echo '✅ Built: build/$name.uf2'"
}

# Create build directory
mkdir -p build

case $KEYBOARD in
    corne)
        echo "🎹 Building Corne with nice!view..."
        build_keyboard "nice_nano_v2" "corne_left nice_view_adapter nice_view" "corne_left"
        build_keyboard "nice_nano_v2" "corne_right nice_view_adapter nice_view" "corne_right"
        ;;

    sofle)
        echo "🎹 Building Sofle with encoders..."
        build_keyboard "nice_nano_v2" "sofle_left" "sofle_left"
        build_keyboard "nice_nano_v2" "sofle_right" "sofle_right"
        ;;

    all)
        echo "🎹 Building both keyboards..."
        build_keyboard "nice_nano_v2" "corne_left nice_view_adapter nice_view" "corne_left"
        build_keyboard "nice_nano_v2" "corne_right nice_view_adapter nice_view" "corne_right"
        build_keyboard "nice_nano_v2" "sofle_left" "sofle_left"
        build_keyboard "nice_nano_v2" "sofle_right" "sofle_right"
        ;;

    *)
        echo "❌ Unknown keyboard: $KEYBOARD"
        echo "Usage: ./build-local.sh [corne|sofle|all]"
        exit 1
        ;;
esac

echo ""
echo "✅ Build complete! Firmware files in: build/"
echo ""
echo "📦 Firmware files:"
ls -lh build/*.uf2 2>/dev/null || echo "No .uf2 files found"
