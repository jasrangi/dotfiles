# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/jas/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# begin custom commands
# add git branch info to prompt
autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:*' formats '  %F{blue}%b%f'

# create prompt
PS1='%B%F{green}%n%f@%F{red}%m%f %F{yellow}%.%f${vcs_info_msg_0_} %%%b '

# zsh extensions (highlights, autosuggest, etc.)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# aliases
alias airpods="bluetoothctl connect $(bluetoothctl devices | grep AirPods | cut -d ' ' -f2)"
alias cl='clear'
alias cp='cp -i'
alias iploc="ip addr | grep wlp4s0 | grep inet | cut -d ' ' -f6 | cut -d '/' -f1"
alias ippub='curl ipinfo.io/ip && echo ""'
alias ls='ls --color=auto'
alias lsb='ls -s -h -S -F -1'
alias lsm='ls -t -1'
alias mv='mv -i'
alias mkdir='mkdir -pv'
alias netres="netctl restart $(netctl list | grep '*' | cut -d ' ' -f2)"
alias rm='rm -v'
alias ucdvpn='doas openconnect --protocol=pulse vpn.library.ucdavis.edu'
alias untar='tar -xvf'
alias update='doas pacman -Syu && flatpak update -y'
alias vi='vim'

# rehash hook connection with /etc/pacman.d/hooks/zsh.hook and /var/cache/zsh
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd
