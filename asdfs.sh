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

_asdf "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git" "v8.9.1"
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

_asdf "packer" "https://github.com/Banno/asdf-hashicorp.git" "1.3.3"
_asdf "terraform" "https://github.com/Banno/asdf-hashicorp.git" "0.11.10"

_asdf "python" "https://github.com/danhper/asdf-python.git" "2.7.10"

_asdf "ruby" "https://github.com/asdf-vm/asdf-ruby.git" "2.3.1"
