#!/bin/sh

emacs_compile.sh
emacsclient -nc -a emacs_client_daemon $1

