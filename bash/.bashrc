### Setup paths and general variables
### in non-interactive shells as well.


PATH="/sbin:/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"

if [ -d "${HOME}/.local/bin" ]
then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "${HOME}/bin" ]
then
  export PATH="$HOME/bin:$PATH"
fi

# golang
if [ -d "/usr/lib/go-1.24" ]
then
  export GOROOT="/usr/lib/go-1.24"
  export GOPATH="${HOME}/.gomod"
  export PATH="${GOROOT}/bin:$PATH"
fi

if [ -d "$HOME/.gotools-install/bin" ]
then
  export PATH="$HOME/.gotools-install/bin:$PATH"
fi

# python
export PYTHONSTARTUP="$HOME/.pythonrc.py"
export PYTHONDONTWRITEBYTECODE=1
export PYTHONHASHSEED=random

export PROMPT_DIRTRIM=2
export RVC_READLINE=libreadline.so.6
export LESS='-r'

# git
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# xdg
export BROWSER=firefox

# etcdctl use v3 api
export ETCDCTL_API=3

# libvirt
export LIBVIRT_DEFAULT_URI=qemu:///system

# fzf
export FZF_DEFAULT_COMMAND='fd -t f'
export FZF_DEFAULT_OPTS=' '

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

HISTCONTROL=ignoreboth:ignoredups
HISTTIMEFORMAT="  %FT%H:%M:%S%z  "
HISTSIZE=10000
HISTFILESIZE=200000

if [ -f /etc/profile.d/vte-2.91.sh ]
then
  # shellcheck disable=SC1091
  source /etc/profile.d/vte-2.91.sh
fi

force_color_prompt=yes

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	  # We have color support; assume it's compliant with Ecma-48
	  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	  # a case would tend to support setf rather than setaf.)
	  color_prompt=yes
  else
	  color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*)
  ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    # shellcheck disable=SC1091
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    # shellcheck disable=SC1091
    . /etc/bash_completion
  fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  # shellcheck disable=SC1090,SC2015
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias ffplay='ffplay -hide_banner'

if [ -e /usr/bin/direnv ]; then
  # shellcheck disable=SC1090
  source <(direnv hook bash)
fi

for f in "${HOME}/.bash_aliases" "${HOME}/.aliases" "${HOME}/.bashrc.local" "${HOME}/.kubectl-aliases"
do
  if [ -f "${f}" ]; then
    # shellcheck disable=SC1090
    source "${f}"
  fi
done

