#!/bin/sh -ev
# Shellcheck the script

base="$(dirname "$0")/../"
shellcheck "$base/install.sh"
