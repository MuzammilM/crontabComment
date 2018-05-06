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


arg=$1
if [[ "$arg" == id* ]]
   then
        echo "Commenting "$arg
        crontab -l > crontab
        line=`cat crontab | grep -n $1 | cut -d : -f 1`
        line2=$((line+1))
        sed -i $line2's/^/#/' crontab
        more crontab
        crontab crontab
        rm crontab
        crontab -l
   else
        echo "Commenting "$1
        crontab -l > crontab && sed -i '/'$1'/s/^/#/' crontab && crontab crontab && rm crontab
        crontab -l
fi
