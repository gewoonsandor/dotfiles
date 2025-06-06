# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM=screen-256color
plugins=(
  tmux
)
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false
source $HOME/.oh-my-zsh/oh-my-zsh.sh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '${HOME}/.zshrc'
autoload -Uz compinit && compinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit ice proto=ssh
#zinit light ohmyzsh/ohmyzsh
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

zinit light zsh-users/zsh-completions
#zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

setopt MENU_COMPLETE
# End of lines added by compinstall
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Start the ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# For some reason needed to run some JetBrains ide's
export _JAVA_AWT_WM_NONREPARENTING=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias l="ls"
alias ll="ls -la"
alias cc="ccat"
alias amend="git commit amend --no-edit"
alias zed="zeditor"

pdf() {
  evince $* & disown
}

ssh-key()  {
  eval $(ssh-agent)
  for file in ~/.ssh/*.pub; do
    ssh-add "${file%.pub}"
  done
}

eval "$(zoxide init --cmd cd zsh)"
source <(fzf --zsh)

eval $(thefuck --alias fuck)

# Set nvim as default editor
export EDITOR=nvim
export VISUAL=nvim

export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
# Created by `pipx` on 2024-04-08 09:14:57
export PATH="$PATH:$HOME/.local/bin"

export PATH=$PATH:/home/sandor/.spicetify
source /usr/share/nvm/init-nvm.sh
