#!/bin/bash

# bash-mg library example

source ../message.sh
EXIT_ON_ERROR=1

debug "This message will not be displayed because debug is not activated"

msg "\n**__welcome to bash-mg lib example__**\n"
msg "red" "\nMessages "
msg "green" "can "
msg "yellow" "be "
msg "blue" "colored"
msg " **bold** and __underline__ \n\n"

warning "Text with **a warning**"
msg "and when DEBUG=1\n"

DEBUG=1
debug "with debug message"

error "Or a **real** and __serious__ error that exit script when EXIT_ON_ERROR=1"

