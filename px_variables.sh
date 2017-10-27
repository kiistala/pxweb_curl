#!/bin/bash

TARGETDIR='data'
mkdir "$TARGETDIR"

while read url
do
  filename="${url##*/}"

  STATUSCODE=$(curl --silent --output /dev/null --write-out "%{http_code}" "$url")
  if test $STATUSCODE -ne 200
  then
    # use stderr to display http errors
    echo "Fail: $url $STATUSCODE" >&2
  else
    curl --silent --output "data/$filename" "$url"
  fi

done < "/dev/stdin"
