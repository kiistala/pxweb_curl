#!/bin/bash

STARTURL='http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin'

function operate_dir
{
  local url
  url="$1"
  local level
  level="$2"

  if [[ "$url" == *px ]]
  then
    # found px
    # reached end of the branch
    echo "$url"
  else
    # no px here, list sub-dirs

    # report all but 200
    STATUSCODE=$(curl --silent --output /dev/null --write-out "%{http_code}" "$url")
    if test $STATUSCODE -ne 200
    then
      # use stderr to display http errors
      echo "Fail: $url $STATUSCODE" >&2
    else
      RESULT=$(curl --silent "$url")
      DIRS=$(echo "$RESULT" | jq --raw-output '.[] | .id')
      echo "$DIRS" | grep -v '^$' | while read dir
      do
        mylevel=$((level+1))
        operate_dir "$url/$dir" "$mylevel"
      done
    fi
  fi
}

operate_dir "$STARTURL" 1
