# Absolute path to this file's directory
mbash="$( cd "$( dirname "${BASH_SOURCE}" )" &> /dev/null && pwd )"

# Management tools
. $mbash/manage.sh

# General tools
. $mbash/docker.sh
. $mbash/git.sh
. $mbash/uuid.sh

# UI
. $mbash/intro.sh
. $mbash/style.sh