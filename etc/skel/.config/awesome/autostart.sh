#!/bin/bash
# =============================================================================
# autostart.sh — awesome session startup script
#
# Called BY awesome from rc.lua (not by the display manager directly), so it
# has NO window-manager loop — it just starts the background services and
# exits. awesome manages its own wibar and uses native keybindings (no sxhkd).
#
# To autostart your own apps, add:  run "your-app"
# To stop an autostart entry, comment it out with #
# =============================================================================

# run() — start a program only if it is not already running.
# Exact-match (-x) on the 15-char process comm name avoids false "already up"
# hits from loose substring matching.
run() {
  if ! pgrep -x "$(basename "$1" | head -c 15)" >/dev/null; then
    "$@" &
  fi
}

# ── Monitor layout ────────────────────────────────────────────────────────────
# Apply a saved arandr/xrandr screen layout named after the current user.
# Generate your layout with arandr, save it to ~/.screenlayout/<username>.sh
# Uncomment the xrandr line below if you are running inside VirtualBox.
#run xrandr --output Virtual-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
# screen layout generated with arandr
[ -f "$HOME/.screenlayout/$(whoami).sh" ] && sh "$HOME/.screenlayout/$(whoami).sh"

# ── System tray applets ───────────────────────────────────────────────────────
run nm-applet                                        # NetworkManager wifi/eth tray
run pamac-tray                                       # Arch package manager tray
run variety                                          # Wallpaper rotator
run xfce4-power-manager                              # Battery / display power management
run blueberry-tray                                   # Bluetooth manager tray
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1  # Polkit auth popups (sudo GUI)

# ── Compositor ────────────────────────────────────────────────────────────────
# Provides transparency, shadows and smooth window rendering.
# fastcompmgr is the lightweight default; toggle with super+g. One at a time.
run fastcompmgr -c

# ── Keyboard ──────────────────────────────────────────────────────────────────
# awesome uses native keybindings defined in rc.lua — there is no sxhkd here.
run numlockx on                                      # Enable numlock on login

# ── Volume control ────────────────────────────────────────────────────────────
run volumeicon                                       # PipeWire/PulseAudio volume tray

# ── Wallpaper ─────────────────────────────────────────────────────────────────
# Restore the last wallpaper set by feh (saved to ~/.fehbg automatically).
# Falls back to the default Kiro wallpaper if no history exists yet.
if [ -f "$HOME/.fehbg" ]; then
    sh "$HOME/.fehbg" &
else
    feh --bg-fill /usr/share/backgrounds/kiro/kiro-wallpaper.jpg &
fi
