# ==========
# Zsh Zplug
# ==========

source ~/.zplug/init.zsh

zplug djui/alias-tips
zplug zsh-users/zsh-completions
zplug zdharma/fast-syntax-highlighting
zplug b4b4r07/enhancd
zplug mafredri/zsh-async, from:github
zplug dfurnes/purer, use:pure.zsh, from:github, as:theme

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

# added by Anaconda3 4.3.1 installer
if [[ $(uname) == 'Linux' ]]; then
	export PATH="/home/ckmah/miniconda3/bin:$PATH"
else
	export PATH="/Users/ckmah/anaconda3/bin:$PATH"
fi

export PATH="home/ckmah/bin/IGV_Linux_2.5.0:$PATH"

# =======
# Aliases
# =======

# General
alias ll='ls -lah'
alias zshrc='vim ~/.zshrc; source ~/.zshrc'
alias hyperjs='vim ~/Dropbox/.hyper.js'
alias dotfiles='vim ~/dotfiles/install'
export EDITOR=subl

# Notebook
alias book='jupyter notebook --no-browser --NotebookApp.iopub_data_rate_limit=10000000000'
alias lab='jupyter lab --NotebookApp.iopub_data_rate_limit=1000000000 --no-browser'

# Projects
alias newproject='git clone https://github.com/ckmah/project-template.git'

# ssh
alias ssh262="ssh ucsd-train22@tscc-login2.sdsc.edu"
alias sshbroad="ssh cmah@login.broadinstitute.org"
alias sshlji="ssh cmah@10.0.100.27"
alias sshtscc="ssh ckmah@tscc-login2.sdsc.edu"
alias sshcomet="ssh ckmah@comet.sdsc.edu"
alias sshgranache="ssh ckmah@grenache.ucsd.edu"
alias cometlab="bash ~/Dropbox/tunnel_lab_comet.sh"
alias ljilab="bash ~/Dropbox/tunnel_lab_lji.sh"
alias killport="lsof -t -i tcp:$1 | xargs kill"

# TSCC Jupyter
alias port262='nohup ssh -N -f -L localhost:2529:localhost:2529 ucsd-train22@tscc-login2.sdsc.edu'
alias 262lab='nohup ssh -f ucsd-train22@tscc-login2.sdsc.edu "qsub ~/labjob.q"; port262'

alias porttscc='nohup ssh -N -f -L localhost:2528:localhost:2528 ckmah@tscc-login2.sdsc.edu'
alias tscclab='nohup ssh -f ckmah@tscc-login2.sdsc.edu "qsub ~/bin/jupyterlab.q"; porttscc'


# Mount remotes
alias mountcomet='mkdir ~/oasis ; sudo umount ~/oasis ; sudo sshfs -o allow_other,defer_permissions ckmah@comet.sdsc.edu:/oasis/scratch/comet/ckmah/temp_project ~/oasis;'
alias mountlji='mkdir ~/lji ; sudo umount ~/lji ; sudo sshfs -o allow_other,IdentityFile=/home/clarence/.ssh/lji_id cmah@10.0.100.27:/home/cmah ~/lji'
alias mountlji-windows='mkdir ~/lji ; sudo umount ~/lji ; sudo mount -t drvfs E: ~/lji'

# =======
# Startup
# =======

#export DISPLAY=:0
