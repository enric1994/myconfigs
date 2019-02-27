#### Docker

#Dockerize folder
alias dockerize='git clone https://github.com/enric1994/docker.git'

# "Up". Start a docker-compose.yml file and check the containers status
alias u='docker-compose up -d;p'
alias uu='docker-compose up'
# "Clean Containers". Stop and remove all the containers.
alias cc='docker stop $(docker ps -a -q); docker rm  $(docker ps -a -q); dvn; p'

# "Docker Volumes". Delete all the Docker volumes
alias dvn='docker volume prune -f; docker network prune -f'

# "Processes". Display docker containers status
alias p='docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'

# "Translate". Examples:
# Autodetect language: "trans patata"
# Brief translate to Spanish: "trans -b :es potato"
# Translate from English to Spanish: "trans en:es potato"
# Dictionary mode: "trans -d en:es potato"
alias trans='docker run --rm slafs/translate-shell'
alias transb='trans :es -b'

#"Speed" test
alias speed='docker run --rm python:2.7 curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py |python -'

#"Markdown to PDF" This container creates a PDF using a Markdown file e.g. "mdpdf README.md"
alias mdpdf="docker run --rm -it -w /data -v $(pwd):/data enric1994/mdpdf mdpdf "

#Start my local "Gogs"
alias gogs='docker-compose -f /home/enric/Documents/gogs/docker-compose.yml up -d'

#Run "Python" in a container to make tests
alias dpython='docker run -it --name python2 -v /home/enric/Downloads/test/python:/data -w="/data" python:2.7 bash'
alias dpython3='docker run -it --name python3 -v /home/enric/Downloads/test/python:/data -w="/data" python:3 bash'

#Run a "Jupyter" notebook in a container and open firefox
alias djupyter='nvidia-docker run -it -p 8888:8888 -e PASSWORD=testpass -v /home/enric/Downloads/test/jupyter/:/data -w="/data" -d tensorflow/tensorflow:latest-gpu;sleep 1; firefox -new-tab -url http://jupyter:8888'

#Run "Ubuntu" container to make tests
alias dubuntu='docker run -it --name myubuntu -v /home/enric/Downloads/test/ubuntu:/data -w="/data" enric1994/myubuntu:0.1.0 bash'

#"Emoji" quick search
alias emoji='docker run --rm enric1994/emoji'

#### Others

# "Hosts". Show the current host DNS mapings and enable the editor (will prompt password)
alias h='cat /etc/hosts;sudo nano /etc/hosts'

# "Copy". Copy the previous otuput to the clipboard, e.g. "ls|c"
alias c='xclip -sel clip'


#"Ports" scan e.g. "ports 127.0.01" (will prompt password)
alias ports='sudo nmap -sS -O'

#"Repeat" e.g. repeat 4 sleep 2 
function repeat() { 
    local times="$1"; 
    shift; 
    local cmd="$@"; 

    for ((i = 1; i <= $times; i++ )); do 
       eval "$cmd"; 
    done 
 }

#"Disk Usage Folders" computes the memory usage of the folder and subfolders
alias duf='du -h --max-depth=1 | sort -hr'

#"Count" files in the folder and subfolders
alias count='find . -type f | wc -l'

#I beat dyslexia
alias ñs='sl -e'
alias LS='sl -e'
alias ks='sl -e'

#Clippy assistant
alias clippy='docker run --rm enric1994/clippy'
alias mkdr='clippy It looks like you are trying to create a directory. Do you need assistance?'

#Check web SSL "cert"
#e.g. cert 127.0.0.1:443
alias cert='echo "" | openssl s_client -connect '

#Start "tmux" with 3 panes
alias tmux3='tmux new-session \; split-window -h \; split-window -v \; attach'

#"Transfer" (https://transfer.sh/) creates a link with the selected file e.g. transfer backup.zip
transfer() {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null;
    echo " "
}

alias transfer=transfer

#Run the previous command with sudo
alias please='sudo $(fc -ln -1)'

#Weather
alias weather='curl wttr.in'
