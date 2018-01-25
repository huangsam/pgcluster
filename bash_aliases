# Containers
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dlog='docker log'
alias dexec='docker exec'
alias drm='docker rm'
alias drma='docker rm $(docker ps -q -a)'
alias drmav='docker rm -v $(docker ps -q -a)'
alias drms='docker rm $(docker ps -q -f "status=exited")'
alias drmsv='docker rm -v $(docker ps -q -f "status=exited")'

# Images
alias di='docker images'
alias drmi='docker rmi'
alias drmia='docker rmi $(docker images -q -a)'
alias drmid='docker rmi $(docker images -q -f "dangling=true")'

function dpull() {
    docker images | grep -v REPOSITORY | awk '{print $1 ":" $2}' | xargs -L1 docker pull
}

# Volumes
alias dvls='docker volume ls'
alias drmva='docker volume rm $(docker volume ls -q)'
alias drmvd='docker volume rm $(docker volume ls -q -f "dangling=true")'

# Networks
alias dnls='docker network ls'
alias drmn='docker network rm'

# Docker Compose
alias fig='docker-compose'

# Gerrit shortcuts
function git_publish() {
    git push origin "HEAD:refs/for/${1}"
}

function git_draft() {
    git push origin "HEAD:refs/drafts/${1}"
}

# Navigation and Listing
alias ll='ls -l'
alias la='ls -la'
alias l='ls -CF'
alias sl='ls'
alias lsl='ls -lhFA | less'
alias cd..='cd ..'
alias ..='cd ..'

# Searching
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Maven installation
alias mci='mvn clean install'

# Maven dependencies
alias mdt='mvn dependency:tree'
alias mdtml='mvn dependency:tree -DoutputType=graphml'
alias mdtdot='mvn dependency:tree -DoutputType=dot'
alias mdttgf='mvn dependency:tree -DoutputType=tgf'

# Write Maven dependency listings to disk
alias mdto='mvn dependency:tree -DoutputFile=mvn-deps.txt'
alias mdtoml='mvn dependency:tree -DoutputType=graphml -DoutputFile=mvn-deps.ml'
alias mdtocompile='mvn dependency:tree | grep ":compile" > "$(git symbolic-ref --short HEAD)-compile.txt"'
alias mdtotest='mvn dependency:tree | grep ":test" > "$(git symbolic-ref --short HEAD)-test.txt"'

# Run `git pull` in every repository within current path
alias gpull='find . -type d -name ".glide" -prune -o -name ".git" -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;'

# Run generic `git` command in every repository within current path
function gcomm() {
    find . -type d -name ".glide" -prune -o -name ".git" -exec sh -c "cd \"{}\"/../ && pwd && git $1" \;
}

# Enable assumption for file in repository
alias gignore='git update-index --assume-unchanged'

# Disable assumption for file in repository
alias gremind='git update-index --no-assume-unchanged'

# List top ten commands from history
function hstats {
    history \
        | awk '{ CMD[$2]++; count++; } END { for (a in CMD) print CMD[a] " " CMD[a]/count*100 "% " a; }' \
        | grep -v './' \
        | column -c3 -s ' ' -t \
        | sort -nr \
        | nl \
        | head -n10
}

# Download MP4 format
alias ytdl='youtube-dl --format mp4'

# Monitoring
alias osquery='/usr/local/bin/osqueryi'

# SSH connection
alias sshv='ssh -vvv -o LogLevel=DEBUG3'

# Python helpers
alias venv='source /usr/local/bin/virtualenvwrapper.sh'

function pipup() {
    pip list --outdated | awk '{if (NR > 2) print $1"=="$3}' | xargs pip install
}
