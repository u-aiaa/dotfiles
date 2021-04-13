#!/usr/bin/env bash

_asdf() {
  local name=$1
  local url=$2
  local version=$3
  asdf plugin-add "${name}" "${url}"
  asdf install "${name}" "${version}"
  asdf global "${name}" "${version}"
}

_asdf "kubectl" "https://github.com/Banno/asdf-kubectl.git" "1.11.5"

_asdf "minikube" "https://github.com/alvarobp/asdf-minikube.git" "0.26.1"

_asdf "helm" "https://github.com/Antiarchitect/asdf-helm.git" "2.12.2"

_asdf "packer" "https://github.com/Banno/asdf-hashicorp.git" "1.3.3"
_asdf "terraform" "https://github.com/Banno/asdf-hashicorp.git" "0.11.10"

_asdf "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git" "8.9.1"
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

_asdf "python" "https://github.com/danhper/asdf-python.git" "2.7.10"

_asdf "ruby" "https://github.com/asdf-vm/asdf-ruby.git" "2.3.1"

_asdf "skaffold" "https://github.com/kristoflemmens/asdf-skaffold.git" "0.32.0"

TARGET_GO_VERSION=1.13.15
_asdf "golang" "https://github.com/kennyp/asdf-golang.git" "$TARGET_GO_VERSION"
GO111MODULE=on go get -u golang.org/x/tools/gopls@v0.6.9
go get -u github.com/mdempsky/gocode
go get -u github.com/uudashr/gopkgs/v2/cmd/gopkgs
go get -u github.com/ramya-rao-a/go-outline
go get -u github.com/acroca/go-symbols
go get -u golang.org/x/tools/cmd/guru
go get -u golang.org/x/tools/cmd/gorename
go get -u github.com/cweill/gotests/...
go get -u github.com/fatih/gomodifytags
go get -u github.com/josharian/impl
go get -u github.com/davidrjenni/reftools/cmd/fillstruct
go get -u github.com/haya14busa/goplay/cmd/goplay
go get -u github.com/godoctor/godoctor
go get -u github.com/go-delve/delve/cmd/dlv
go get -u github.com/stamblerre/gocode
go get -u github.com/rogpeppe/godef
go get -u github.com/sqs/goreturns
go get -u golang.org/x/lint/golint
go get -u github.com/cweill/gotests/gotests
go get -u honnef.co/go/tools/cmd/staticcheck

asdf reshim golang $TARGET_GO_VERSION

_asdf "jsonnet" "https://github.com/Banno/asdf-jsonnet.git" "0.13.0"

_asdf "kubesec" "https://github.com/vitalis/asdf-kubesec.git" "0.9.2"

_asdf "kustomize" "https://github.com/virtualstaticvoid/asdf-kustomize.git" "2.0.3"
