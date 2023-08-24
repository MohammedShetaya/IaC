#!/usr/bin/env bash


# treat unset variables as an error
set -u

# if one command produces a non-zero status, then exit
set -e 
set -o pipefail

# when ever a command exits with non-zero status, print this message showing the line where the error occured
# the error signal is the one that triggers that echo to run
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR

# make the ERR trap inherited by all shell functions
set -E

# print the command before its output
set -x

_get_file_dir () {
    cd -P -- "$( dirname "$0" )" && pwd -P
}

_exit_1() {
  {
    printf "%s " "$(tput setaf 1)!$(tput sgr0)"
    "${@}"
  } 1>&2
  exit 1
}


# create a random identifier for the new instance if not provided as input
# make a copy of the instance image under the file development_instance.example 
# replace each 
_create_instance_file() {

    # the local dir of this script
    local -r script_dir="$(_get_file_dir)"

    # create a Unix time stamp as a random id for this instance
    local -r random_id="$(date +%s)"

    # use the first argument to the script as the resource_id or random_id as default value
    local -r resource_id="${1:-$random_id}"

    if [[ -z "${resource_id}" ]]; then 
        _exit_1 "ERROR: could not generate a random id or did not find an input id"
    fi

    if [[ ! -f "${script_dir}/development_instance_${resource_id}.tf" ]]; then 
        # copy the image file to a new tf file 
        cp \
          "${script_dir}/development_instance.tf.example" \
          "${script_dir}/development_instance_${resource_id}.tf"

        # replace all RANDOMID occurences in the created file with resource_id
        sed -i "s/RANDOMID/${resource_id}/g" "${script_dir}/extra_staging_${resource_id}.tf"

    fi

    # print a json formated output with terraform_expected_output as the name of the output 
    # that terraform should return after running terraform apply
    echo '{"resource_file" : "development_instance_'${resource_id}'.tf", "resource_id" : "'${resource_id}'"}'
    exit 0
}


_create_instance_file ${@}