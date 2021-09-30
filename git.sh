# Return the current git branch
# Example: "main"
gbranch () {
  echo "$(printf "$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')")"
}

# Return the current git branch in parentheses
# Example: "(main)"
gbranchf () {
  if [[ $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/') ]]; then
    echo "$(printf "\033[00m(\033[32m$(gbranch)\033[00m)")"
  else
    echo
  fi
}
