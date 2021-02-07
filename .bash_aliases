alias gl='git log --oneline --decorate --graph --all'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gita="python3 -m gita"
alias debian-setup='cd ~/debian-setup'
alias private='cd ~/debian-setup-private'

gacp() {
    git add . && git commit -m "$1" && git push
}