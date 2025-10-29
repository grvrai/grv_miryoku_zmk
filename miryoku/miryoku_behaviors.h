// Copyright 2022 Manna Harbour
// https://github.com/manna-harbour/miryoku

#pragma once

// Urob-style home row mods with left/right hand positional hold-tap
#define U_MT_L(MOD, TAP) &u_mt_l MOD TAP  // Left hand HRM
#define U_MT_R(MOD, TAP) &u_mt_r MOD TAP  // Right hand HRM
#define U_MT(MOD, TAP) &u_mt MOD TAP      // Generic mod-tap (backward compatibility)
#define U_LT(LAYER, TAP) &u_lt LAYER TAP  // Layer-tap
