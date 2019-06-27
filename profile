preferred_shell=
if [ -x $HOME/miniconda3/bin/zsh ]; then
  preferred_shell=$HOME/miniconda3/bin/zsh
fi

if [ -n "$preferred_shell" ]; then
  case $- in
    *i*) SHELL=$preferred_shell; export SHELL; exec "$preferred_shell";;
  esac
fi
