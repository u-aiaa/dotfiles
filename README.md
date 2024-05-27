# dotfiles

```
# bashをdefaultにする場合
chsh -s /bin/bash

cd ~
git clone git@github.com:u-aiaa/dotfiles.git dotfiles
cd dotfiles
./bootstrap.sh
```

## FIXME

* binutilsをbrewでいれてしまうと、asdfでpython,ruby,nodejsが入れられなくなる。
  ```
  ld: symbol(s) not found for architecture x86_64
  ```
* Java Install
  * https://engineering.mobalab.net/2022/06/06/how-to-install-java-on-macos-in-2022/

## item2

GitHub Dark.itermcolors
https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/GitHub%20Dark.itermcolors

git clone https://github.com/powerline/fonts.git
./install.sh