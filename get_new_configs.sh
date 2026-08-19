for app in kitty nvim sway waybar wofi wofi-emoji zathura; do
    cp -rv ~/.config/"$app"/. "$app/.config/$app/"
done
