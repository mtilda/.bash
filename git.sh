# Return the current git branch
# Example: "main"
gbranch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# Return the current git branch in parentheses
# Example: "(main)"
gbranchf () {
  if [[ gbranch ]]; then
    echo "($(gbranch))"
  else
    echo
  fi
}
