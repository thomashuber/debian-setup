alias gl='git log --oneline --decorate --graph --all'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gita="python3 -m gita"
alias debian-setup='cd ~/debian-setup'
alias private='cd ~/debian-setup-private'

export PATH=~/debian-setup/bin:$PATH

gacp() {
    if [[ "$#" -ne 1 ]]; then 
        echo "Usage: gacp \"My commit message\""
        return 1
    else
        git add . && git commit -m "$1" && git push
        return 0
    fi
}
