#!/bin/bash

while getopts "n:s:u:a:g" opt; do
  case $opt in
    n) name=$OPTARG ;;
    s) source=$OPTARG ;;
    u) url=$OPTARG ;;
    a) author=$OPTARG ;;
    g) github=$OPTARG ;;
  esac
done

[ -z "$name" ] && read -p "Title: " name
[ -z "$source" ] && read -p "Source: " source

if [ -f "Typ/${source}_${name}.typ" ]; then
  echo "Typ/${source}_${name}.typ already exists"
  exit 1
fi

read -p "Category: " category
read -p "URL: " url
read -p "Author name: " author
read -p "Author GitHub: " github

echo "Creating Typ/${source}_${name}.typ with:"
echo "  title: $name"
echo "  source: $source"
echo "  category: $category"
echo "  url: $url"
echo "  author: $author"
echo "  github: $github"
read -p "Proceed? [y/N] " confirm
case $confirm in y|Y) ;; *) exit 0 ;; esac

sed -e "s|title: \"Title\"|title: \"$name\"|" \
    -e "s|source: \"Source\"|source: \"$source\"|" \
    -e "s|url: \"Url\"|url: \"$url\"|" \
    -e "s|category: \"Category\"|category: \"$category\"|" \
    -e "s|name: \"Name\",|name: \"$author\",|" \
    -e "s|git: \"GitHub\"|git: \"$github\"|" \
    src/base_writeup.typ > "Typ/${source}_${name}.typ"
