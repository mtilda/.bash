# Absolute path to this file
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

source $SCRIPT_DIR/docker.sh
source $SCRIPT_DIR/git.sh
source $SCRIPT_DIR/uuid.sh

msource() {
  source $SCRIPT_DIR/profile
}

clear
COLS=$(tput cols)
for (( n=1; n<=$COLS/6; n++ ))
do
  printf "🚀 🛸 "
done
echo
echo

export PS1="\
\[\033[00m\]\
\u\
 👾 \
\[\033[35m\]\
\w\
\[\033[33m\]\
\$(parse_git_branch)\
\n\[\033[00m\] 🍄 "

export PS2="   ✨ "