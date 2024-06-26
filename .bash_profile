# vim: set filetype=sh :

export PS1="\[\e[1;34m\]\w\[\e[m\] \n> "

export BASH_SILENCE_DEPRECATION_WARNING=1

# asdf
ASDF_HOME=$HOME/.asdf
[[ -f "$ASDF_HOME/asdf.sh" ]] && . $ASDF_HOME/asdf.sh
[[ -f "$ASDF_HOME/completions/asdf.bash" ]] && . $ASDF_HOME/completions/asdf.bash

eval "$(/opt/homebrew/bin/brew shellenv)"

PATH="$PATH:$HOME/bin:/usr/local/bin:/usr/local/sbin"

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/findutils/libexec/gnubin:$MANPATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
export MANPATH

export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
# export EDITOR=nvim
export HISTTIMEFORMAT='%y-%m-%d %H:%M:%S '
export HISTSIZE=5000
# export XDG_CONFIG_HOME=~/.config
# export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
export HOMEBREW_INSTALL_CLEANUP=1 # default behaviour from homebrew 2.0.0
# export QUOTING_STYLE=literal # for GNU ls

#secretkeys="$(find ~/.ssh -name id_rsa)"
#for secretkey in $secretkeys; do
#    ssh-add -K "$secretkey" 2> /dev/null
#done

# shellcheck source=/dev/null
[[ -f ~/.brew_api_token ]] && . ~/.brew_api_token

# shellcheck source=/dev/null
[[ -f ~/.bashrc ]] && . ~/.bashrc

export JAVA_HOME=$(/usr/libexec/java_home)
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
#export JAVA_HOME=`/usr/libexec/java_home -v 11`

export GPG_TTY=$(tty)
# export PATH="/usr/local/opt/awscli@1/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/python"
eval "$(pyenv init -)"

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi
