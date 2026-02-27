#!/bin/bash
# vim: set sw=2 ts=2 sts=2:

set -ex

GIT_TREE="$HOME/.dots"
CFG_ALIAS="dit"
REPO_URI="https://github.com/jt32241/dots"

usage() {
  cat << EOF
bootstrap.sh [-h] [-r repo_url]
EOF
}

while getopts "hr:b:" opts; do
  case $opt in
    r )
      REPO_URI="$OPTARG"
      ;;
    b )
      REPO_BRANCH="$OPTARG"
      ;;
    h )
      usage
      exit 0
      ;;
    * )
      echo "Invalid option"
      exit 1
      ;;
  esac
done


dit() {
  git --git-dir="$GIT_TREE" --work-tree="$HOME" "$@"
}

bootstrap() {
  printf "[cfg::bootstrap] cloning? %s -> %s\n" "$REPO_URI" "$GIT_TREE"
  [ -d "$GIT_TREE" ] || { git clone --bare "$REPO_URI" "$GIT_TREE"; }
  dit config --local status.showUntrackedFiles no
  return 0
}

checkout() {
  printf "[cfg::bootstrap] checking out\n"
  dit checkout
}

shell_cfg() {
  # Emit alias to shell rc file(s)
  return 0
}

main() {
  bootstrap
  checkout
}

main "$@"
