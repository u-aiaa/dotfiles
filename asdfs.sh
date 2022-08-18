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

# install_asdf_plugin "kubectl" "https://github.com/Banno/asdf-kubectl.git" "1.11.5"

# install_asdf_plugin "minikube" "https://github.com/alvarobp/asdf-minikube.git" "0.26.1"

# install_asdf_plugin "helm" "https://github.com/Antiarchitect/asdf-helm.git" "2.12.2"

# install_asdf_plugin "packer" "https://github.com/Banno/asdf-hashicorp.git" "1.3.3"

versions=("1.1.7" "1.2.6" "0.13.5")
install_asdf_plugin "terraform" "https://github.com/Banno/asdf-hashicorp.git" "1.2.6" "${versions[*]}"

versions=("12.14.1" "14.15.0" "16.14.0" "16.5.0")
install_asdf_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git" "16.14.0" "${versions[*]}"
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# versions=()
# install_asdf_plugin "python" "https://github.com/danhper/asdf-python.git" "2.7.10" "${versions[*]}"

versions=("2.3.1")
install_asdf_plugin "ruby" "https://github.com/asdf-vm/asdf-ruby.git" "2.3.1" "${versions[*]}"

# install_asdf_plugin "skaffold" "https://github.com/kristoflemmens/asdf-skaffold.git" "0.32.0"

versions=("1.14.7" "1.15.13" "1.16.12" "1.17.11" "1.18.3")
TARGET_GO_VERSION=1.18.3
install_asdf_plugin "golang" "https://github.com/kennyp/asdf-golang.git" "$TARGET_GO_VERSION" "${versions[*]}"
#GO111MODULE=on go get -u golang.org/x/tools/gopls@v0.6.11
# GO111MODULE=on go get -u golang.org/x/tools/gopls@v0.7.3
GO111MODULE=on go get -u golang.org/x/tools/gopls@latest
# go get -u github.com/mdempsky/gocode
# go get -u github.com/uudashr/gopkgs/v2/cmd/gopkgs
# go get -u github.com/ramya-rao-a/go-outline
# go get -u github.com/acroca/go-symbols
# go get -u golang.org/x/tools/cmd/guru
# go get -u golang.org/x/tools/cmd/gorename
# go get -u github.com/cweill/gotests/...
# go get -u github.com/fatih/gomodifytags
# go get -u github.com/josharian/impl
# go get -u github.com/davidrjenni/reftools/cmd/fillstruct
# go get -u github.com/haya14busa/goplay/cmd/goplay
# go get -u github.com/godoctor/godoctor
# go get -u github.com/go-delve/delve/cmd/dlv
# go get -u github.com/stamblerre/gocode
# go get -u github.com/rogpeppe/godef
# go get -u github.com/sqs/goreturns
# go get -u golang.org/x/lint/golint
# go get -u github.com/cweill/gotests/gotests
# go get -u honnef.co/go/tools/cmd/staticcheck

# 以下をいれるのかな？
# go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
# go install github.com/ramya-rao-a/go-outline@latest
# go install github.com/cweill/gotests/gotests@latest
# go install github.com/fatih/gomodifytags@latest
# go install github.com/josharian/impl@latest
# go install github.com/haya14busa/goplay/cmd/goplay@latest
# go install github.com/go-delve/delve/cmd/dlv@latest
# go install github.com/go-delve/delve/cmd/dlv@2f13672765fe
# go install honnef.co/go/tools/cmd/staticcheck@latest
# go install golang.org/x/tools/gopls@latest

asdf reshim golang $TARGET_GO_VERSION

#install_asdf_plugin "jsonnet" "https://github.com/Banno/asdf-jsonnet.git" "0.13.0"

#install_asdf_plugin "kubesec" "https://github.com/vitalis/asdf-kubesec.git" "0.9.2"

#install_asdf_plugin "kustomize" "https://github.com/virtualstaticvoid/asdf-kustomize.git" "2.0.3"
