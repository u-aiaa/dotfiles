#!/usr/bin/env bash

set -eu

DOTPATH=$HOME/dotfiles

if [ ! -d "$DOTPATH" ]; then
    git clone https://github.com/yuji-a/dotfiles.git "$DOTPATH"
    [ $? -ne 0 ] && echo "Failed to git clone" && exit 1
else
    echo "$DOTPATH already downloaded. Updating..."
    cd "$DOTPATH"
    git stash
    git checkout master
    git pull origin master
    echo
fi

cd "$DOTPATH"

# Mac basic settings
scripts/configure.sh
echo

scripts/deploy.sh
echo

# install homebrew
if ! command -v brew > /dev/null 2>&1; then
    # Install homebrew: https://brew.sh/
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    [ $? -ne 0 ] && echo "Failed to install homebew" && exit 1
    echo
fi
brew bundle
[ $? -ne 0 ] && echo "Failed to brew bundle" && exit 1
sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
echo

./asdfs.sh
echo

# install aws cli
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
[ $? -ne 0 ] && echo "Failed to download awscli" && exit 1
sudo installer -pkg AWSCLIV2.pkg -target /
[ $? -ne 0 ] && echo "Failed to install awscli" && exit 1

# install google cloud sdk
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init

echo "Bootstrapping Complete!"
