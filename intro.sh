# Message displayed on terminal start
clear
COLS=$(tput cols)
for (( n=1; n<=$COLS/6; n++ ))
do
  printf "🚀 🛸 "
done
echo
