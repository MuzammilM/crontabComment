#Author : MuzammilM
#Comments script passed as an argument from crontab
COLOR='\033[0;31m'
reset=`tput sgr0`

if [ $# -lt 1 ]
then
        echo -e "${COLOR}No arguments passed."
        echo -e "${COLOR}Comments a script from crontab"
        echo -e "${COLOR}Execution : crontabComment {scriptName.sh}${reset}"
        exit
fi
crontab -l > cronoutput.txt && sed  '/'$1'/s/^/#/' cronoutput.txt > _c  &&  mv -f _c cronoutput.txt && crontab cronoutput.txt && rm cronoutput.txt
crontab -l
