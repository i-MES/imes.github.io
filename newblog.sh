#!/bin/bash

topic=""
if [ $# -gt 0 ]; then
  topic=$1
else
  echo "Usage:"
  echo "    ./newblog.sh <this.blog.topic>"
  exit
fi

date=`date +'%Y-%m-%d'`
dn="blog/$date-$topic/images"
if [ ! -d $dn ]; then mkdir -p $dn; fi

fn="blog/"$date-$topic"/index.mdx"
echo "will creat file:" $fn

if [ ! -f $fn ]; then
    touch $fn
    echo "---">>$fn
    echo "title: ">>$fn
    echo "description: $topic" >>$fn
    echo "authors: wKevin" >>$fn
    echo "tags:" >>$fn
    tags=(${topic//./ })
    for t in ${tags[@]}
    do
      echo "  - $t" >>$fn
    done
    echo "---" >>$fn
    echo "<!--truncate-->" >>$fn
    echo "Creat sucess!"
else
    echo "Creat fail! File is existed"
fi

code $fn
