
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

port() {
# $1 = port number
# $2 = user@server.com
ssh -N -f -L localhost:$1:localhost:$1 $2 &
}

function portnrnb
{
port=2531
lsof -ti:$port | xargs kill -9

if [[ $# -eq 1 ]] ; then
        echo "ssh-ing into "$1
        open http://localhost:$port/lab
        if [[ $1 == nrnb* ]] ; then
                ssh -L $port:localhost:$port ckmah@grenache.ucsd.edu -t ssh -L $port:localhost:$port ckmah@nrnb-head -t ssh -N -L $port:localhost:$port ckmah@$1
        else
                ssh -L $port:localhost:$port ckmah@grenache.ucsd.edu -t ssh -N -L $port:localhost:$port ckmah@$1
        fi
else
	echo 'ssh-ing into pinella'
	ssh -N -L ${port}:localhost:${port} ckmah@grenache.ucsd.edu -t ssh -N -L ${port}:localhost:${port} ckmah@pinella
fi
}
# Mount remotes
alias mountcomet='mkdir ~/oasis ; sudo umount ~/oasis ; sudo sshfs -o allow_other,defer_permissions ckmah@comet.sdsc.edu:/oasis/scratch/comet/ckmah/temp_project ~/oasis;'
alias mountlji='mkdir ~/lji ; sudo umount ~/lji ; sudo sshfs -o allow_other,IdentityFile=/home/clarence/.ssh/lji_id cmah@10.0.100.27:/home/cmah ~/lji'
alias mountlji-windows='mkdir ~/lji ; sudo umount ~/lji ; sudo mount -t drvfs E: ~/lji'

# =======
# Startup
# =======

#export DISPLAY=:0

