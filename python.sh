#!/bin/bash

################################################################################
# NAME
#     avenv - activate a Python virual environment, creating one if none exists
#
# SYNOPSIS
#     avenv
#
# DESCRIPTION
#     If a virtual environment is not detected, avenv creates one with a name
#     based on the relative path to the current working directory from the root
#     of the current git repository.
#
# EXAMPLE USAGE
#     In some directory:
#     $ cd /home/user/project
#
#     There is a git repository:
#     $ git init
#
#     And a working directory deep within:
#     $ cd /home/user/project/domain/app
#
#     Where you activate/create a Python virtual environment:
#     $ avenv
#
#     You can use Pip and Python in that virtual environment:
#     (project-domain-app) $ pip install poetry
#     (project-domain-app) $ python
#
# EXIT STATUS
#     avenv exits with status 0 if the virtual environment was
#     detected/created and activated successfully, 1 if errors occur.
#
################################################################################
avenv () {
    # If virtual environment is missing, create one
    if [[ ! -f .venv/bin/activate ]]; then
        git_path=$(git rev-parse --show-toplevel)
        echo "Detected Git repository: $git_path" 1>&2
        git_parent_dirname=$(dirname $git_path)
        cwd_relative_to_git_parent=$(realpath\
                                  --relative-to="$git_parent_dirname" "$(pwd)"\
                                  --logical\
                           )

        # Replace non-word characters with hyphens
        # Transform from uppercase to lowercase
        venv_name=$(echo $cwd_relative_to_git_parent\
                        | sed -r 's/[^a-zA-Z0-9-]+/\-/g'\
                        | tr '[:upper:]' '[:lower:]')

        echo "Creating virtual envionment: $venv_name" 1>&2
        python3 -m venv .venv --prompt $venv_name
    fi

    if [[ ! -f .venv/bin/activate ]]; then
        echo "Failed to create virtual environment" 1>&2
        return 1
    else
        echo "Activating virtual environment" 1>&2
        source .venv/bin/activate
    fi
}
