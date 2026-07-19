#!/bin/bash

while getopts "n:s:w" opt; do
  case $opt in
    n) name=$OPTARG ;;
    s) source=$OPTARG ;;
    w) watch=1 ;;
  esac
done

[ -z "$name" ] && read -p "Name: " name
[ -z "$source" ] && read -p "Source: " source

if [ ! -f "Typ/${source}_${name}.typ" ]; then
  echo "Typ/${source}_${name}.typ not found"
  exit 1
fi

cmd="compile"
[ -n "$watch" ] && cmd="watch"

typst $cmd --root . "Typ/${source}_${name}.typ" "Main/${source}_${name}.pdf"
