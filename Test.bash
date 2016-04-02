#!/bin/bash
set -x
f='riddles.he'
perl -0777 -nE 'print +/[ \t]\r?$/ms?"Yes\n":"No\n"' "$f"

g()
{
    echo "Running with $@"
    grep "$@" -P '[ \t]\r?$' "$f" | tee >(wc)
}

g
g -l
g --text
g --text -l
g -a
g -a -l

