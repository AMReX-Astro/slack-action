#!/bin/sh
set -eu

if test -z "$INPUT_SLACK_WEBHOOK"; then
  echo "Set the SLACK_WEBHOOK variable."
  exit 1
fi

curl -X POST -H "Content-type: application/json" --data '{"text":$INPUT_MESSAGE}' $INPUT_SLACK_WEBHOOK