#!/bin/sh
set -eu

if test -z "$INPUT_SLACK_WEBHOOK"; then
  echo "Set the SLACK_WEBHOOK variable."
  exit 1
fi

SLACK_PAYLOAD='{"text":"$INPUT_MESSAGE"}'

echo "PAYLOAD = $SLACK_PAYLOAD"

curl -X POST -H "Content-type: application/json" --data '{"text":"testing"}' $INPUT_SLACK_WEBHOOK