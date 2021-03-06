alias lal="ls -al"
alias ll='ls -l'
alias vssh='vagrant ssh'

alias dk="docker "
alias dkc="dk ps"
alias dkm="dk images"
alias dki="dk inspect"
alias dkb="dk build"
alias cleandkc="dkc -a --no-trunc| grep Exit | awk '{print \$1}' | xargs -L 1 -r docker rm"
alias cleandkm="docker rmi $(sudo docker images -f 'dangling=true' -q)"
#alias cleandkm="dkm -a --no-trunc | grep none | awk '{print \$3}' | xargs -L 1 -r docker rmi"
alias cleandk="cleandkc && cleandkm"
alias killdk="dk rm -f $(docker ps -qa)"

alias sd="sudo systemctl"
alias sdl="sd list-units"
alias sds="sd status"
alias sdcat="sd cat"

alias cci="sudo coreos-cloudinit --from-file"

alias j="journalctl"
alias jfu="journalctl -f -u"

alias e="etcdctl"
alias els="e ls --recursive"
alias eget="e get"
alias eset="e set"

alias f="fleetctl -strict-host-key-checking=false"
alias fcat="f cat"
alias fss="f status"
alias fst="f start"
alias fdy="f destroy"
alias flm="f list-machines"
alias flu="f list-units"
alias fsh="f ssh"

function dkip() { docker inspect --format "{{ .NetworkSettings.IPAddress }}" $1 ; }
function dkid() { docker inspect --format "{{ .ID }}" $1 ; }
function dkpid() { docker inspect --format "{{ .State.Pid }}" $1 ; }
function dkim() { docker inspect --format "{{ .Image }}" $1 ; }
function dkst() { docker inspect --format "{{ .State.Running }}" $1 ; }
function sdrit() { sudo docker run -i -t $1 bash ; }
function nsa() { docker exec -it $1 bash ; }
#function nsa { sudo nsenter -p -u -m -i -n -t $(docker inspect -f "{{ .State.Pid }}" $1) ; }

alias pj='python -m json.tool'