#!/usr/bin/zsh
# This is what you might call a failure.
TEMPFILE=/tmp/zfg-$(whoami)-$$
trap "rm -f $TEMPFILE" 0 1 2 5 15

dialog	--radiolist "Which file?"							 	\
		40 60 10												\
		1 "~/.zshrc" on										 	\
		2 "~/.zsh-aliases" on								 	|&tee $TEMPFILE

RESULT=$?
RESULT=$(cat $TEMPFILE)
tput reset
case $RESULT in
	1) vim ~/.zshrc;;
	2)
esac
exec $SHELL