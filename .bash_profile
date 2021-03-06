# vim: set filetype=sh :

# asdf
#ASDF_HOME=/usr/local/Cellar/asdf/0.7.8
#ASDF_DIR=$ASDF_HOME
ASDF_HOME=$HOME/.asdf
. $ASDF_HOME/asdf.sh
. $ASDF_HOME/completions/asdf.bash

# PATH="$HOME/bin:/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/sbin:$PATH"
# PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
PATH="$PATH:$HOME/bin:/usr/local/bin:/usr/local/sbin"

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#PATH="/usr/local/opt/binutils/bin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
#MANPATH="/usr/local/opt/binutils/share/man:$MANPATH"
MANPATH="/usr/local/opt/findutils/libexec/gnubin:$MANPATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
export MANPATH

export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
# export EDITOR=nvim
export HISTTIMEFORMAT='%y-%m-%d %H:%M:%S '
export HISTSIZE=5000
# export XDG_CONFIG_HOME=~/.config
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
export HOMEBREW_INSTALL_CLEANUP=1 # default behaviour from homebrew 2.0.0
# export QUOTING_STYLE=literal # for GNU ls

if [ "$(command -v gcloud)" ]; then
    gcloudpath="$(dirname "$(dirname "$(readlink "$(command -v gcloud)")")")"
    # shellcheck source=/dev/null
    [[ -f "$gcloudpath/path.bash.inc" ]] && . "$gcloudpath/path.bash.inc"
    # shellcheck source=/dev/null
    [[ -f "$gcloudpath/completion.bash.inc" ]] && . "$gcloudpath/completion.bash.inc"
fi

secretkeys="$(find ~/.ssh -name id_rsa-rtbengine-vm)"
for secretkey in $secretkeys; do
    ssh-add -K "$secretkey" 2> /dev/null
done

# shellcheck source=/dev/null
[[ -f ~/.brew_api_token ]] && . ~/.brew_api_token

# shellcheck source=/dev/null
[[ -f ~/.bashrc ]] && . ~/.bashrc

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export GPG_TTY=$(tty)
export PATH="/usr/local/opt/awscli@1/bin:$PATH"
