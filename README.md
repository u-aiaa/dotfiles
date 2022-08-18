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