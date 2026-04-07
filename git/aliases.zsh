alias g='git'
alias gti='git'
alias gls='git log --graph --pretty=format:"%C(bold red)%h%Creset [%Cblue%an%Creset] %s -%C(auto)%d%Creset %C(yellow)(%cr)%Creset"'
alias gll='git log --pretty=format:"%C(bold red)%h%Creset [%Cblue%an%Creset] %s -%C(auto)%d%Creset %C(yellow)(%cr)%Creset" --numstat'
alias glf='git log --pretty=full'
alias glm='git log -n 1 --pretty=%B'
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
alias glw='watch -c -n 1 -t git log --oneline --all --graph --decorate --color=always'

alias gcl='git clone'
alias gpl='git pull --rebase'
alias gf='git fetch --prune'
alias gs='git status -sb'
alias gp='git push origin HEAD'
alias gpc='git push origin HEAD:refs/for/master'
alias gpwip='git push origin HEAD:refs/for/master%wip'
alias grb='git rebase'
alias grbs='git rebase --skip'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grbi='git rebase -i'
alias gm='git merge'
alias gmff='git merge --ff'
alias gmt='git mergetool'

alias ga='git add'
alias gaa='git add --all'
alias gst='git stash save --include-untracked'
alias gstp='git stash pop'
alias gstcl='git stash clear'
alias gres='git reset --mixed'
alias gress='git reset --soft'
alias gresh='git reset --hard'
alias greso='git fetch --prune && git reset --hard @{upstream}'
alias gundo='git reset $@ HEAD'
alias gres1='git reset --mixed HEAD~'

alias gbss='git bisect start'
alias gbsr='git bisect reset'
alias gbsg='git bisect good'
alias gbsb='git bisect bad'

alias gc='git commit -S'
alias gca='git commit --amend'
alias gac='git add --all && git commit -S -m'

alias gco='git checkout'
alias gcob='git checkout -b'
alias gcp='git cherry-pick -x'
alias gb='git branch'
alias gbr='git branch -D'

function fre() {
    git fetch --all
    local current_branch=$(git branch --show-current)
    if git show-ref --verify --quiet refs/remotes/origin/$current_branch; then
        git rebase origin/$current_branch
    else
        git rebase origin/master
    fi
}

alias gpm='git push origin/master'

alias gcr='git reset --mixed HEAD~'