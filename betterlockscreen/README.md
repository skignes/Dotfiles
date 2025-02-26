![Static Badge](https://img.shields.io/badge/Works_On-My_Machine-blue)
![Static Badge](https://img.shields.io/badge/Not_a_Bug-A_Feature-red)

# Preview

## Some random Image

![Random Image](../Previews/betterlockscreen.jpg)

# Installation of BetterLockScreen

## Prerequisites

- `i3lock-color`, this is a replacement of `i3lock`.
- `imagemagick`, for the image.
- `bc`, for some calculator.
- `feh`, for the background image.
- `root` or `sudo` to install the binary.

## Install my configuration

### Download my binary

```bash
git clone https://github.com/skignes/Dotfiles.git
cd betterlockscreen
```
### Install the Binary

#### Arch Linux

```bash
# Download the package
sudo pacman -S betterlockscreen

# Change the Binary
sudo rm /usr/bin/betterlockscreen
sudo cp conf/betterlockscreen /usr/bin
```

#### Debian Based

```bash
# Just add the binary
sudo cp conf/betterlockscreen
```

If you can't execute it then maybe try :

```bash
sudo chmod +x /usr/bin/betterlockscreen
```

## Configuration

Now you need to configure your **BetterLockScreen**.

To add the same image as me, you need to execute this inside the repository, you need to do this :

```bash
betterlockscreen -u conf/landscape_fantasy.jpg
```

Then you can use your configuration to replace `i3lock`.

To use it as a lock you need to execute like this :

```bash
betterlockscreen -l
```
