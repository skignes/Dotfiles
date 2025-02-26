![Static Badge](https://img.shields.io/badge/Works_On-My_Machine-blue)
![Static Badge](https://img.shields.io/badge/Not_a_Bug-A_Feature-red)

# Preview

## i3lock-color

![i3lock-color](../Previews/i3color.jpg)

# Installation of the i3lock

## Prerequisites

- Linux with `i3lock-color` installed.
- Linux without `i3lock`.

## Installation of the prerequisites

### Arch Linux

#### Install `i3lock-color`

```bash
yay -S i3lock-color
```

### Debian Based

#### Install `i3lock-color`

Follow the build instruction on there repository : [i3lock-color](https://github.com/Raymo111/i3lock-color)

## Install the lock

### Download the config file

```bash
git clone https://github.com/skignes/Dotfiles.git
cd Dotfiles/i3lock
```

### Copy the config file

You can copy the theme into the `/usr/bin/` or like i do put it inside the `~/.local/bin/` :

```bash
cp conf/ScreenLock ~/.local/bin/ScreenLock
```

Like this you will have a binary you can execute !

Now when you execute the script the **LockScreen** will appear :

```bash
ScreenLock
```
