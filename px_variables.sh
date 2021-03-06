#!/bin/bash

TARGETDIR='data'
[[ -d "$TARGETDIR" ]] || mkdir -pv "$TARGETDIR"

while read url
do
  filename="${url##*/}"
  host_and_path="${url%$filename}"
  path="${host_and_path#*://*/}"

  # create directory if it does not exist already
  [[ -d "$TARGETDIR/$path" ]] || mkdir -pv "$TARGETDIR/$path"

  output="$TARGETDIR/$path/$filename"

  if [ -e "$output" ]
  then
    # echo "Skipping: curl $output"
    true
  else
    STATUSCODE=$(curl --silent --output /dev/null --write-out "%{http_code}" "$url")
    if test $STATUSCODE -ne 200
    then
      # use stderr to display http errors
      echo "Fail: $url $STATUSCODE" >&2
    else
      curl --silent --output "$output" "$url"
    fi
  fi

  # code + values, tab-separated
  cat "$output" | jq --raw-output '.variables[]|(.code + "\t" + (.values|join("\t")))' > "$output.variables" || echo "Error: $output"

done < "/dev/stdin"
