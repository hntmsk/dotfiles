#.zshrc

export LANG=ja_JP.UTF-8;
export EDITOR='vim' 
export PATH=$PATH:~/sh

# pyenv
 if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
 
#------------------------------------------------------------------
##オプション補完タブのスイッチを入れる
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=2  #補完ハイライト
bindkey "^[[Z" reverse-menu-complete  #shift-tabで補完逆順

#補完機能強化
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''
# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true
#predict-on
autoload predict-on

##vim mode
bindkey -v

##cd 入れなくてもdesktopとかhomeとかいけるやつ
setopt auto_cd

##ZMV(リネーム）設定##
autoload -Uz zmv
alias ren='noglob zmv -W'

##colors
autoload colors
colors
# ls
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'

# 補完候補もLS_COLORSに合わせて色が付くようにする
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# lsがカラー表示になるようエイリアスを設定
case "${OSTYPE}" in
darwin*)
  # Mac
  alias ls="ls -GF"
  ;;
linux*)
  # Linux
  alias ls='ls -F --color'
  ;;
esac

#PROMPT
#------------------------------------------------------------------
#PROMPT=$BLUE'[${USER}@${HOST}] %(!.#.$) '$WHITE
RPROMPT=$GREEN'[%~]'$WHITE
setopt transient_rprompt

#history
#------------------------------------------------------------------
#履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# 履歴全部表示
function history-all { history -E 1 }

#alias
#------------------------------------------------------------------

#メモリ解放
alias mem='sudo purge'
#アクセス権の修復
alias rep='diskutil repairPermissions /'
#シェルが遅くなった時
alias shellfast='sudo rm -f /private/var/log/asl/*.asl'
#デスクトップ移動
alias d='~/desktop'
#ビープ音
alias beep='echo -e "\a""\a""\a"'
#treeの文字バケ問題解消
alias tree='tree -N'

#再帰的にリネーム！下記はIMGを消去することになっているが応用で色々と使えそう！
#find . -type f -print0 | while read -r -d '' file; do mv $file ${file/IMG//}; done

#カレントディレクトリから１階層目のフォルダ容量を調べてトップ１０を発表
alias top10='du -m -d1 ./*|sort -nr|head -10'
#ls only directory or not
alias lsd='ls -F | grep /'
alias lsf='ls -F | grep -v /'
alias htop='sudo htop'
alias pc='pbcopy'
alias pp='pbpaste'

#todo.txt
alias todo='vim ~/.vim/bundle/todo.txt-vim/{todo,done}.txt'

#function
#------------------------------------------------------------------
##引数入り_ピクセル変換 ##
##長編のピクセルに合わせて縦横比も連動
function rsz(){
  sips -Z $1 *
  say finish 
} 

##pdfをpdfにまとめて結合##
function p22(){
  pdftk *.pdf cat output $1
  say finish
}

##jpgをpdfにまとめて結合##
function j22(){
  pdftk *.jpg cat output $1
  say finish
}

##コンタクトシートの完成形
function cs(){
mmm.sh $1 >/dev/null 2>&1 &
}

#google検索
#------------------------------------------------------------------
ggl() {
  local str opt
  if [ $# != 0 ]; then
    for i in $*; do
      # $strが空じゃない場合、検索ワードを+記号でつなぐ(and検索)
      str="$str${str:++}$i"
    done
    opt='search?num=100'
    opt="${opt}&q=${str}"
  fi
  open -a Google\ Chrome http://www.google.co.jp/$opt
}

#amazon検索
#------------------------------------------------------------------
amz() {
  local str opt
  if [ $# != 0 ]; then
    for i in $*; do
      # $strが空じゃない場合、検索ワードを+記号でつなぐ(and検索)
      str="$str${str:++}$i"
    done
    opt="ref=nb_sb_noss_2?__mk_ja_JP=${str}&url=search-alias%3Daps&field-keywords=${str}&x=0&Ay=0"
  fi
  open -a Google\ Chrome http://www.amazon.co.jp/s/$opt
}

#楽天検索
#------------------------------------------------------------------
rkt() {
  local str opt
  if [ $# != 0 ]; then
    for i in $*; do
      # $strが空じゃない場合、検索ワードを+記号でつなぐ(and検索)
      str="$str${str:++}$i"
    done
  fi
  open -a Google\ Chrome http://search.rakuten.co.jp/search/mall/${str}/-/
}

#串刺し検索
#------------------------------------------------------------------
kushi() {
  local str opt_a opt_g
  if [ $# != 0 ]; then
    for i in $*; do
      # $strが空じゃない場合、検索ワードを+記号でつなぐ(and検索)
      str="$str${str:++}$i"
    done
    #google's opt
    opt_g='search?num=100'
    opt_g="${opt_g}&q=${str}"
    #amazon's opt
    opt_a="ref=nb_sb_noss_2?__mk_ja_JP=${str}&url=search-alias%3Daps&field-keywords=${str}&x=0&Ay=0"
  fi
  open -a Google\ Chrome http://www.google.co.jp/$opt_g
  open -a Google\ Chrome http://www.amazon.co.jp/s/$opt_a
  open -a Google\ Chrome http://search.rakuten.co.jp/search/mall/${str}/-/
}

alias odl='open ~/Downloads'
alias odb='open ~/Dropbox'

cddir(){
cd $( find `pwd` -type d | peco )
}

#リサイズ高画質版
function RSZ(){
mogrify -resize "${1}x" -resize "x${1}>" -quality 90 -verbose *
}

function t2j(){
mogrify -format JPG *.TIF
mkdir ../JPG;mv *.JPG ../JPG
}

