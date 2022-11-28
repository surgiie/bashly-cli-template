## remove trailing character.
remove_trailing() {
    value="$1"
    char="$2"
    echo ${value%"$char"}
}
## remove leading character.
remove_leading() {
    value="$1"
    char="$2"
    echo ${value#"$char"}
}

## get the string content after the given substring.
str_after() {
    value="$1"
    substring="$2"
    echo ${value##*$substring}
}
## get the string content before the given substring.
str_before() {
    value="$1"
    substring="$2"
    echo ${value%$substring*}
}

## generate a path relative to the root of the cli directory.
application_cli_path() {
    path="${1:-/}"
    base="$SURGE_CLI_PATH"
    path=$(remove_leading "$path" "/")
    path=$(remove_trailing "$path" "/")
    path="$base/$path"
    echo $(remove_trailing "$path" "/")
}

## Check if we are running in winsows ubuntu.
running_in_ubuntu_for_windows() {
    if grep -qi microsoft /proc/version; then
        true
    else
        false
    fi
}

## export env variables from .env file.
export_env_file_vars() {
    if [ -f $1 ]; then
        set -o allexport
        source $1
        set +o allexport
    fi
}
