#!/bin/bash
# vim: set sw=2 ts=2 sts=2:

set -e

GIT_TREE="$HOME/.dots"
CFG_ALIAS="dit"
REPO_URI="https://github.com/jt32241/dots"

usage() {
  cat << EOF
bootstrap.sh [-h] [-r repo_url] [--bootstrap-vim]

Options:
-r repository url to use
-b repository branch to checkout

--bootstrap-vim try to bootstrap vim plugins via curl (requires curl)

EOF
}

while getopts "hdr:b:-:" opt; do
  case $opt in
    r )
      REPO_URI="$OPTARG"
      ;;
    b )
      REPO_BRANCH="$OPTARG"
      ;;
    d )
      set -x
      ;;
    h )
      usage
      exit 0
      ;;
    - )
      case "$OPTARG" in
        bootstrap-vim )
          CFG_BOOTSTRAP_VIM=1
          ;;
        * )
          echo "Invalid long arg: $OPTARG"
          usage
          exit 1
          ;;
      esac
      ;;
    * )
      echo "Invalid option"
      usage
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

# NOTE: Keep it posix compliant?
bootstrap_vim_plugins() {
  [ "${CFG_BOOTSTRAP_VIM+x}" != "x" ] && { return 0; }

  fetch_plugins() {
      command -v git 2>&1 > /dev/null || { echo "no git..bye"; exit 1; }

      tgt_dir="$HOME/.vim/pack/start"
      mkdir -p "$tgt_dir"
      for uri in "$@"; do
          tgt="${uri##*/}"
          tgt="${tgt_dir}/${tgt%.*}"

          printf "[cfg::bootstrap-vim] %s -> %s\n" "$uri" "$tgt"
          [ -d "$tgt" ] || git clone "$uri" "$tgt"
      done
  }

  echo "[cfg::bootstrap] bootstraping vim (selected plugins via rtp)"
  echo "set rtp+=~/.vim/pack/start*" >> ~/.vimrc
  fetch_plugins \
      "https://github.com/tpope/vim-commentary.git" \
      "https://github.com/tpope/vim-fugitive.git" \
      "https://github.com/tpope/vim-sleuth.git" \
      "https://github.com/sheerun/vim-polyglot.git"
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
  bootstrap_vim_plugins
  checkout
}

main "$@"
