#!/bin/bash
#
# bash-mg ()
# ----------
#
# Library for printing color-coded and formatted messages in Bash
#
# External library to display colored messages with optional silent mode
#

DEBUG=0
EXIT_ON_ERROR=0
ERROR_CODE=10
SILENT=0    # If set to 1, suppress terminal output

msg () {
    declare -A attr
    local c="default"
    
    # foreground colors
    attr[default]="\e[39m"
    attr[red]="\e[31m"
    attr[green]="\e[32m"
    attr[yellow]="\e[33m"
    attr[blue]="\e[34m"
    attr[magenta]="\e[35m"
    attr[cyan]="\e[36m"
    
    # formatting
    attr[reset]="\e[0m"
    attr[bold]="\e[1m"
    attr[r_bold]="\e[22m"
    attr[underl]="\e[4m"
    attr[r_underl]="\e[24m"

    # color detection and validation
    if [[ $1 =~ ^(red|green|yellow|blue|magenta|cyan|default)$ ]]; then
        c=$1
        shift
    else
        if [[ $1 =~ ^[a-zA-Z]+$ ]]; then
            [[ $SILENT -ne 1 ]] && printf "\e[33mWARNING: Unknown color '%s', using default.\e[0m\n" "$1"
        fi
        c="default"
    fi

    # format message
    local message=$(echo "$@" | sed -E "
        s/\*\*([^\*]*)\*\*/\\${attr[bold]}\1\\${attr[r_bold]}/g;
        s/__([^_]*)__/${attr[underl]}\1${attr[r_underl]}/g
    ")

    [[ $SILENT -ne 1 ]] && printf "${attr[$c]}${message}${attr[reset]}"
}

error () {
    msg "red" "ERROR : $@\n"
    [[ $EXIT_ON_ERROR -eq 1 ]] && exit $ERROR_CODE
    exit
}

warning () {
    msg "yellow" "WARNING : $@\n"
}

debug () {
    if [[ $DEBUG -eq 1 ]]; then
        msg "cyan" "DEBUG : $@\n"
    fi
}
