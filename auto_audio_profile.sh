# Changes profile automatically, as there is no profile that
# contains both Headphones and Speakers
# thus when second monitor is plugged in one of them, is disabled

#!/usr/bin/env bash
# Put it in ~/.local/bin/auto-audio-profile.sh
CARD="alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic"

pactl subscribe 2>/dev/null | grep --line-buffered "on card" | while read -r _; do
    AVAIL=$(pactl list cards | awk -v RS="" '/Headphones: Headphones/{print}' | grep -o "available: yes\|not available")
    if [[ "$AVAIL" == *"not available"* ]]; then
        pactl set-card-profile "$CARD" "HiFi: HDMI1,HDMI2,HDMI3,Mic1,Mic2,Speaker" 2>/dev/null
    else
        pactl set-card-profile "$CARD" "HiFi: HDMI1,HDMI2,HDMI3,Headphones,Mic1,Mic2" 2>/dev/null
    fi
done

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
