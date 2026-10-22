#!/usr/bin/env bash
set -euo pipefail

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

git clone --depth 1 git@github.com:ssweens/pi-suite.git "$tmpdir/pi-suite"
"$tmpdir/pi-suite/skills.sh"
