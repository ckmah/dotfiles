# ==========
# Zsh Zplug
# ==========

source ~/.zplug/init.zsh

zplug djui/alias-tips
zplug zsh-users/zsh-completions
zplug zdharma/fast-syntax-highlighting
zplug b4b4r07/enhancd
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

PURE_PROMPT_SYMBOL=→

# ==========
# PATH Setup
# ==========
# Keyboard settings in terminal (affects hyper)
xset r rate 250 25

# =======
# Aliases
# =======

# General
alias ll='ls -lah'
alias zshrc='vim ~/.zshrc; source ~/.zshrc'
alias dotfiles='vim ~/dotfiles/install'
export EDITOR=vim

# Notebook
alias lab='jupyter lab --NotebookApp.iopub_data_rate_limit=1000000000 --no-browser --port=2531'

# Projects
alias project='git clone https://github.com/ckmah/project-template.git'

# ssh
alias killport="lsof -t -i tcp:$1 | xargs kill -9"
alias tunnel="ssh -NL 2529:localhost:2529 $1"
function ssh_jupyter
{
port=8126
username=ckmah
lsof -ti:$port | xargs kill -9

if [[ $# -eq 1 ]] ; then
        echo "ssh-ing into "$1
        # open http://localhost:$port/lab

        if [[ $1 == nrnb* ]] ; then
                ssh -L ${port}:localhost:${port} $username@grenache -t ssh -L ${port}:localhost:${port} $username@nrnb-head -t ssh -N -L ${port}:localhost:${port} $username@$1
        else
                ssh -L ${port}:localhost:${port} $username@grenache -t ssh -N -L ${port}:localhost:${port} $username@$1
        fi
else
	echo 'ssh-ing into pinella'
	# open http://localhost:$port/lab
	ssh -N -L ${port}:localhost:${port} $username@grenache -t ssh -N -L ${port}:localhost:${port} $username@pinella
fi
}
# Mount remotes
alias mountcomet='mkdir ~/oasis ; sudo umount ~/oasis ; sudo sshfs -o allow_other,defer_permissions ckmah@comet.sdsc.edu:/oasis/scratch/comet/ckmah/temp_project ~/oasis;'
alias mountlji='mkdir ~/lji ; sudo umount ~/lji ; sudo sshfs -o allow_other,IdentityFile=/home/clarence/.ssh/lji_id cmah@10.0.100.27:/home/cmah ~/lji'
alias mountlji-windows='mkdir ~/lji ; sudo umount ~/lji ; sudo mount -t drvfs E: ~/lji'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/Clarence/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/Clarence/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/Clarence/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/Clarence/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

