# Changes profile automatically, as there is no profile that
# contains both Headphones and Speakers
# thus when second monitor is plugged in one of them, is disabled

# Put it in ~/.local/bin/auto-audio-profile.sh
!/usr/bin/env bash
CARD="alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic"
HP="HiFi (HDMI1, HDMI2, HDMI3, Headphones, Mic1, Mic2)"
SPK="HiFi (HDMI1, HDMI2, HDMI3, Mic1, Mic2, Speaker)"

sync() {
    local line target
    line=$(pactl list cards | awk -v c="$CARD" '
        $0~"Name: "c{f=1} /^Card #/{f=0} f&&/Headphones: Headphones/{print;exit}')
    [[ "$line" == *"available"* && "$line" != *"not available"* ]] && target="$HP" || target="$SPK"
    pactl set-card-profile "$CARD" "$target" 2>/dev/null
}

sync
pactl subscribe 2>/dev/null | grep --line-buffered "on card" | while read -r _; do sync; done

# Put this in  ~/.config/systemd/user/auto-audio-profile.service
#[Unit]
#Description=Auto switch audio profile on headphone jack
#
#[Service]
#ExecStart=%h/.local/bin/auto-audio-profile.sh
#Restart=always
#
#[Install]
#WantedBy=default.target

# Activate:
# systemctl --user daemon-reload
# systemctl --user enable --now auto-audio-profile.service
