# Configuration for perfect system.  
  
**Distro:** Arch Linux  
**DE:** Sway  
**Display Server:** Wayland  
**Sound System:** Pipewire  
**Bar:** Waybar  
**App-menu:** Wofi   
**Terminal:** Kitty  
**TextEditor:** Nvim LazyVim
**Notification daemon:** swaync
**Font:** JetBrainsMono Nerd fonts  
  
You need to add nvim/python.lua (It's auto-complete of python) to *~/.config/nvim/lua/plugins/python.lua*  
  
Needed packages (Arch): *ttf-jetbrains-mono-nerd ,ttf-font-awesome, ttf-dejavu , sway, waybar, wofi, grim, slurp, swappy, clipman, kitty, nvim, pipewire, wayland, networkmanager, evince, bpytop, swaync* 
  
Add wofi-emoji in */usr/local/bin/wofi-emoji*  (Also you can just take it from official repo)  
  
Add wallpaper to */usr/share/backgrounds/*    
  
To connect wifi use *nmtui* (Comes with *networkmanager*).  

To use configs, remove *.git* for your own changes, use command stow to make symlinks to add config files directly, like `stow kitty`.
