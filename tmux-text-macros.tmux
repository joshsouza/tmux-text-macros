#!/usr/bin/env bash
#Macro strings. Everything after the last ":" gets removed and is just there as a search string in fzf
strings=(
"¯\\_(ツ)_/¯:a Shruggie"
"ಠ_ಠ: Look of Disaprooval"
"(V) (;,,;) (V): Why not Zoidberg?"
)



if [ "$1" = "-r" ];then
for e in "${strings[@]}"; do
    echo $e
done|fzf-tmux|sed -e 's/\\/\\\\/g' -e 's/\(.*\):.*/\1/'|xargs -I_ tmux send-keys '_'
else
    tmux bind e run-shell '~/.tmux/emoticons -r'
fi