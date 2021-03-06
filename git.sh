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

# Checkout a branch or checkout the previous branch
gswitch () {
  GIT_CURRENT_BRANCH=$(gbranch)
  git checkout ${1:-$GIT_LAST_BRANCH}
  GIT_LAST_BRANCH=$GIT_CURRENT_BRANCH
}

# Delete all fully merged branches
gclean () {
  git for-each-ref --format '%(refname:short)' refs/heads | grep -v "master\|main" | xargs git branch -d
}
