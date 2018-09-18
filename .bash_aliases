#### Docker

# "Up". Start a docker-compose.yml file and check the containers status
alias u='docker-compose up -d;p'
alias uu='docker-compose up'
# "Clean Containers". Stop and remove all the containers.
alias cc='docker stop $(docker ps -a -q); docker rm  $(docker ps -a -q);docker ps -a'

# "Docker Volumes". Delete all the Docker volumes
alias dv='docker volume prune'

# "Processes". Display docker containers status
alias p='docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'


#### Others

# "Hosts". Show the current host DNS mapings and enable the editor (will prompt password)
alias h='cat /etc/hosts;sudo nano /etc/hosts'

# "Copy". Copy the previous otuput to the clipboard, e.g. "ls|c"
alias c='xclip -sel clip'

# "Translate". Examples:
# Autodetect language: "trans patata"
# Brief translate to Spanish: "trans -b :es potato"
# Translate from English to Spanish: "trans en:es potato"
# Dictionary mode: "trans -d en:es potato"
alias trans='docker run --rm slafs/translate-shell'
alias transb='trans :es -b'
#"Speed" test
alias speed='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

#"Ports" test
alias ports='sudo nmap -sS -O'

#"Repeat"
function repeat() { 
    local times="$1"; 
    shift; 
    local cmd="$@"; 

    for ((i = 1; i <= $times; i++ )); do 
       eval "$cmd"; 
    done 
 }
#"Disk Usage Folders"
alias duf='du -h --max-depth=1 | sort -hr'

#"Count" files in the current folder
alias count='find . -type f | wc -l'

#I beat dyslexia
alias ñs='sl'
alias LS='sl'
alias ks='sl'

#Check web SSL "cert"
#e.g. cert teamchat:443
alias cert='echo "" | openssl s_client -connect '

#order files by date, "ld"
alias ld='ll -ltha --color | head -15'
