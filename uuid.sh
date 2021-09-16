# Fetch UUIDs from https://www.uuidgenerator.net
uuid () {

  REGEX='^[0-9]*$'
  
  if [[ $1 =~ REGEX ]] ; then

    count="${1:-1}"

    if [ $count -le 500 ] ; then

      f_count=$( printf "%04d" "$count" )
      curl "https://www.uuidgenerator.net/api/version4/${count}"
      printf '\n'

    else
      printf '\033[0;31mError: Count may not exceed 500\n'
    fi

  else
    printf '\033[0;31mError: Argument must be an integer\n'
  fi
}
