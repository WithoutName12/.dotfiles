# Configuration for perfect system.  
  
Distro: Arch Linux  
DE: Sway  
Display Server: Wayland  
Sound System: Pipewire  
Bar: Waybar  
App-menu: Wofi   
Terminal: Kitty  
TextEditor: Nvim LazyVim  
Font: JetBrainsMono Nerd fonts.  
  
You need to add nvim/python.lua (It's auto-complete of python, as I remember) to ~/.config/nvim/lua/plugins/python.lua  
  
Needed packages (Arch): ttf-jetbrains-mono-nerd ,ttf-font-awesome, ttf-dejavu (For Georgian), sway, waybar, wofi, grim, slurp, swappy, clipman, kitty, nvim, pipewire, wayland, networkmanager, evince, bpytop 
  
Add wofi-emoji in /usr/local/bin/wofi-emoji  (Also you can just take it from official repo)  
  
Add wallpaper to /usr/share/backgrounds/    
  
To connect wifi use nmtui (Comes with networkmanager).  
Can use command stow to make symlinks to add config files directly, like stow kitty (ofc you need to clone and be in my repo).
