#!/usr/bin/env bash

install_asdf_plugin() {
  local name=${1}
  local url=${2}
  local global_version=${3}
  local versions=(${4})
  asdf plugin-add "${name}" "${url}"
  for version in "${versions[@]}" ; do
    asdf install "${name}" "${version}"
  done
  asdf global "${name}" "${global_version}"
}

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
ASDF_HOME=$HOME/.asdf
. $ASDF_HOME/asdf.sh
. $ASDF_HOME/completions/asdf.bash

versions=("1.1.7" "1.2.6" "0.13.5")
install_asdf_plugin "terraform" "https://github.com/Banno/asdf-hashicorp.git" "1.2.6" "${versions[*]}"

versions=("16.14.0" "16.5.0")
install_asdf_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git" "16.14.0" "${versions[*]}"
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

versions=("1.14.7" "1.15.13" "1.16.12" "1.17.11" "1.18.3")
TARGET_GO_VERSION=1.18.3
install_asdf_plugin "golang" "https://github.com/kennyp/asdf-golang.git" "$TARGET_GO_VERSION" "${versions[*]}"

# 1.16.12 で vscode からインストールした場合
# Installing github.com/cweill/gotests/gotests@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.16.12/packages/bin/gotests) SUCCEEDED
# Installing github.com/fatih/gomodifytags@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.16.12/packages/bin/gomodifytags) SUCCEEDED
# Installing github.com/josharian/impl@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.16.12/packages/bin/impl) SUCCEEDED
# Installing github.com/haya14busa/goplay/cmd/goplay@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.16.12/packages/bin/goplay) SUCCEEDED
# Installing github.com/go-delve/delve/cmd/dlv@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.16.12/packages/bin/dlv) SUCCEEDED
# Installing honnef.co/go/tools/cmd/staticcheck@v0.2.2 (/Users/yuji.akiyama/.asdf/installs/golang/1.16.12/packages/bin/staticcheck) SUCCEEDED
# Installing golang.org/x/tools/gopls@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.16.12/packages/bin/gopls) SUCCEEDED

# 1.17.13 で vscode からインストールした場合
# Installing github.com/cweill/gotests/gotests@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.17.13/packages/bin/gotests) SUCCEEDED
# Installing github.com/fatih/gomodifytags@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.17.13/packages/bin/gomodifytags) SUCCEEDED
# Installing github.com/josharian/impl@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.17.13/packages/bin/impl) SUCCEEDED
# Installing github.com/haya14busa/goplay/cmd/goplay@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.17.13/packages/bin/goplay) SUCCEEDED
# Installing github.com/go-delve/delve/cmd/dlv@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.17.13/packages/bin/dlv) SUCCEEDED
# Installing honnef.co/go/tools/cmd/staticcheck@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.17.13/packages/bin/staticcheck) SUCCEEDED
# Installing golang.org/x/tools/gopls@latest (/Users/yuji.akiyama/.asdf/installs/golang/1.17.13/packages/bin/gopls) SUCCEEDED

asdf reshim golang $TARGET_GO_VERSION
