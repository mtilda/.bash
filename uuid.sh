#!/bin/bash

# Do whatever is necessary to get the specified number of Version 4 UUIDs
uuid () {

  REGEX='^[0-9]*$'
  if ! [[ $1 =~ $REGEX ]]
  then
    printf '\033[0;31mError: Argument must be a non-negative integer.\n'
  fi

  count="${1:-1}"

  if command -v uuidgen 2>&1 >/dev/null
  then
    for i in $(seq $count)
    do
      uuidgen
    done
  else
    printf '\033[0;33mWarning: uuidgen not be found. Fetching UUIDs from internet.\033[0m\n' >&2

    if ! [ $count -le 500 ]
    then
      printf '\033[0;31mError: Count may not exceed 500 while fetching UUIDs from the internet.\n'
    fi

    f_count=$( printf "%04d" "$count" )
    curl "https://www.uuidgenerator.net/api/version4/${count}"
    printf '\n'
  fi

}
