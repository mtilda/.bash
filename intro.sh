# Message displayed on terminal start

# If this is the first time this script is sourced,
#   Change to home directory
[[ -z "$SHELL_INITIALIZED" ]] && cd
SHELL_INITIALIZED=1

clear
COLS=$(tput cols)
for (( n=1; n<=$COLS/6; n++ ))
do
  printf "🚀 🛸 "
done
echo
echo
