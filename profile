# Absolute path to this file's directory
mbash="$( cd "$( dirname "${BASH_SOURCE}" )" &> /dev/null && pwd )"

# Init
. $mbash/intro.sh
. $mbash/manage.sh
. $mbash/style.sh

# Main
. $mbash/docker.sh
. $mbash/git.sh
. $mbash/uuid.sh
