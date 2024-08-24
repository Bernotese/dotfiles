# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="geoffgarside"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# History
HIST_STAMPS="mm/dd/yyyy"
HIST_FILE="$HOME/.history/.zsh_history"

# Plugis
plugins=(git pip colorize brew python macos zsh-autosuggestions zsh-syntax-highlighting)

# Source
source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/scripts/aliases.sh
