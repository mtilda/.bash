# Absolute path to this file's directory
MBASH_CUR_DIR="$( cd "$( dirname "${BASH_SOURCE}" )" &> /dev/null && pwd )"

# Management tools
. $MBASH_CUR_DIR/manage.sh

# General tools
alias c="clear"
. $MBASH_CUR_DIR/docker.sh
. $MBASH_CUR_DIR/git.sh
. $MBASH_CUR_DIR/uuid.sh
#. $MBASH_CUR_DIR/noise.sh
. $MBASH_CUR_DIR/terraform.sh

# UI
# . $MBASH_CUR_DIR/intro.sh
. $MBASH_CUR_DIR/style.sh

# Sandbox tools
. $MBASH_CUR_DIR/sandbox/profile
