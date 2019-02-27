if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

docker run --rm enric1994/phdprogress
#python3 /home/enric/Downloads/test/phd.py

source ~/.antigen.zsh

source ~/.bash_aliases
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
# Tell Antigen that you're done.
antigen apply
