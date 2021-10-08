# Absolute path to this file's directory
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE}" )" &> /dev/null && pwd )"

# Management tools
. $CURRENT_DIR/manage.sh

# General tools
. $CURRENT_DIR/docker.sh
. $CURRENT_DIR/git.sh
. $CURRENT_DIR/uuid.sh

# UI
. $CURRENT_DIR/intro.sh
. $CURRENT_DIR/style.sh