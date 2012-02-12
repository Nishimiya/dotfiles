export LANG=ja_JP.UTF-8

autoload -Uz colors
colors
case ${UID} in
0)
  PROMPT="%B%{${fg[cyan]}%}%/# %{${reset_color}%}%b "
  PROMPT2="%B%{${fg[cyan]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]: %{${reset_color}%}%b "
#  RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[cyan]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[cyan]}%}%/ $ %{${reset_color}%} "
  PROMPT2="%{${fg[cyan]}%}%_> %{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]: %{${reset_color}%} "
#  RPROMPT="%{${fg[cyan]}%}[%~] %{${reset_color}%}"
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[cyan]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

bindkey -v

autoload -Uz compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
zstyle :compinstall filename '/home/nishimiya/.zshrc'

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

## 色を使う
setopt prompt_subst
## ビープ音を鳴らさない
setopt nobeep
## 内部コマンドjobの出力をデフォルトでjobs -lにする
setopt long_list_jobs
## 保管候補一覧でファイルの種別をマーク表示
setopt list_types
## 補完候補を一覧表示
setopt auto_list
## cd時に自動でpush
setopt auto_pushd
## 同じディレクトリをpushdしない
setopt pushd_ignore_dups
## ファイル名で#,~,^の３文字を正規表現として扱う
setopt extended_glob
## TABで順に補完候補を切り替える
setopt auto_menu
## 補完候補を詰めて表示
setopt list_packed
## 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash
## ディレクトリ名だけでcd
setopt auto_cd
## スペルチェック
setopt correct
## 補完候補リストの日本語を正しく表示
setopt print_eight_bit
## lsの補完候補の色付け
eval `dircolors`
zstyle ':completion:*:default' list-colors ${LS_COLORS}
## killの補完候補の色付け
zstyle ':completion:*:kill:*;processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
alias ls="ls --color"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias rm="rm -i"
