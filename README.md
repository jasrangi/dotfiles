# Dotfiles
Dotfiles are used on Unix-like operating systems to configure various system
settings. This repository includes all of my personally configured dotfiles for an
Arch Linux desktop.

## Installation
First clone this repository locally. To install a single configuration file, a
symbolic link must be created between the location of the repository and where
the operating system expects to see the files.
```sh
ln -s .vimrc ~/.vimrc
ln -s .xinitrc ~/.xinitrc
ln -s .zshrc ~/.zshrc
ln -s alacritty.yml ~/.config/alacritty/alacritty.yml
```
The -f flag may be needed to force the creation of the symbolic link if a default
file was created automatically. See section "Usage" for a list of dependencies
required to make the dotfiles function. Note that this may overwrite your own
custom dotfiles. \
Alternatively, to install all dotfiles, run the provided install script. Note
that this script will overwrite any present dotfiles.
```sh
chmod +x install.sh
./install.sh
```

## Usage and Important Information

### .vimrc
**Dependencies:** vim \
This configuration of .vimrc is for the vim text editor. On Arch Linux, the
default configuration file is /etc/vimrc, which is used by vim only if ~/.vimrc is
missing. The .vimrc in this repository loads the default settings for vim in
an Arch Linux environment. In addition, it sets a bar at line 81, which is
useful in tiling window managers when a file is to have a line length
restriction of 80. It also sets relative line numbers, allowing for easier
jumps, deletions, yanks, etc. to lines while editing.

### .xinitrc
**Dependencies:** xorg-server, xorg-xinit, feh, slstatus, redshift, dwm \
This file is the startup script used when the xorg display server is started with
the startx command. It is intended for use with the dwm window manager.
It initializes the desktop background with .fehbg, status bar with slstatus,
screen color warming after sunset with redshift, and the dwm window manager. \
To configure redshift to warm the screen color temperature after sunset in
your location, replace the coordinates in .xinitrc with your location's
coordinates. The current coordinates in the file are for the physical location of
the UC Davis main campus. \
To set a desktop background with feh, run the following command in a shell:
```sh
feh --bg-scale /path/to/background.file
```
This will automatically configure ~/.fehbg for use in .xinitrc.

### .zshrc
**Dependencies:** zsh, zsh-syntax-highlighting, zsh-autosuggestions \
**Dependencies for aliases:** bluez, bluez-utils, netctl \
The .zshrc file is the script used when a zsh session is created. The .zshrc file
in this repository includes defaults set by the zsh-newuser-install and
compinstall tools at the beginning. The PS1 prompt is of the form \
**user@host current_directory (git_branch) %** and includes colors to help
easily differentiate information in the prompt. Zsh extensions are then loaded
to allow for syntax highlighting and autosuggestions. The rehash script after
aliases are created allows for Arch's package manager (pacman) rehash zsh
any time a new package is installed. This will allow for correct zsh syntax
highlighting on newly installed programs without restarting zsh. For more
information on rehash, see the
[ArchWiki page for zsh](https://wiki.archlinux.org/title/Zsh#On-demand_rehash).
#### Alias usage
**airpods**: uses bluetoothctl to connect to paired AirPods (if any). \
**cl**: clears terminal. \
**cp**: changes default behavior of cp to prompt before overwriting files. \
**iploc**: prints the local ip address of the host. \
**ippub**: prints the public ip address of the host. \
**ls**: changes default behavior of ls to display color. \
**lsb**: lists files in order of size. \
**lsm**: lists files sorted by modification date, the most recently modified is at
the top. \
**mv**: changes default behavior of mv to prompt before overwriting files. \
**mkdir**: changes the default directory of mkdir to create any necessary parent
directories and to print which directories were created in the process. \
**netres**: restarts the currently active netctl profile. \
**rm**: changes default behavior of rm to list exactly which items were removed.
\
**untar**: allows user to extract tar files with a command similar to unzip for
zip files. \
**update**: one command to update Arch Linux packages and flatpaks
simultaneously. \
**vi**: calls vim any time a script makes a call to vi.

### alacritty.yml
**Dependencies:** alacritty, ttf-ubuntu-font-family \
This is my configuration for the GPU-accelerated Alacritty terminal. This will
work with no additional setup if the Alacritty terminal is installed properly.
See the [Alacritty repository](https://github.com/alacritty/alacritty) for more
information on the terminal.

## License
MIT
