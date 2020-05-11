#!/bin/sh
set -eu

if test -z "$INPUT_SLACK_WEBHOOK"; then
  echo "Set the SLACK_WEBHOOK variable."
  exit 1
fi

git checkout $GITHUB_HEAD_REF

MESSAGE=$(git log --format=%B -n 1 $GITHUB_SHA | head -1)

SLACK_PAYLOAD='{"text":"'$MESSAGE'"}'

echo "PAYLOAD = $SLACK_PAYLOAD"

curl -X POST -H 'Content-type: application/json' --data $SLACK_PAYLOAD $INPUT_SLACK_WEBHOOK