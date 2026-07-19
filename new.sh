#!/bin/bash

while getopts "n:s:" opt; do
  case $opt in
    n) name=$OPTARG ;;
    s) source=$OPTARG ;;
  esac
done

[ -z "$name" ] && read -p "Name: " name
[ -z "$source" ] && read -p "Source: " source

if [ -f "Typ/${source}.typ" ]; then
  echo "Typ/${source}.typ already exists"
  exit 1
fi

read -p "Create Typ/${source}_${name}.typ? [y/N] " confirm
case $confirm in y|Y) ;; *) exit 0 ;; esac

cp src/base_writeup.typ "Typ/${source}_${name}.typ"
