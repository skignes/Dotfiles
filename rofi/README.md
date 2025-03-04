![Static Badge](https://img.shields.io/badge/Works_On-My_Machine-blue)
![Static Badge](https://img.shields.io/badge/Not_a_Bug-A_Feature-red)

# Preview

## Shit to put

# Installation of the rofi applets / themes

## Prerequisites

- Linux with `rofi` installed.
- The config is for a PC on `i3wm`.

## Installation of the prerequisites

### Arch Linux

#### Install `rofi`

```bash
sudo pacman -S rofi
```

### Debian Based

#### Install `rofi`

```bash
sudo apt -y install rofi
```

## Install the themes / apples

```bash
git clone https://github.com/skignes/Dotfiles.git
cd Dotfiles/rofi
```

Get the rofi applets, and put theme inside the `~/.local/bin/` :

```bash
cp themes/* ~/.local/bin/
```

For the themes, i will put theme inside `~/.config/rofi/`

```bash
mkdir -p ~/.config/rofi
cp applets/* ~/.config/rofi/
```

Now you can add this to your i3 config for it to launcg with the keybind you want :

```bash
# Network
bindsym $mod+n exec --no-startup-id bash ~/.local/bin/network

# Power
bindsym $mod+Shift+i exec --no-startup-id ~/.local/bin/ScreenLock
```
