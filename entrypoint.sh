#!/bin/sh
set -eu

if test -z "$INPUT_SLACK_WEBHOOK"; then
  echo "Set the SLACK_WEBHOOK variable."
  exit 1
fi

# curl -X POST -H "Content-type: application/json" --data '{"text":"'"$INPUT_MESSAGE"'"}' $INPUT_SLACK_WEBHOOK

echo '{"attachments": [{"mrkdwn_in": ["text"],"author_name": "'"$GITHUB_ACTOR"'","author_link": "https://github.com/'"$GITHUB_ACTOR"'","title": "1 new commit pushed to '"$GITHUB_HEAD_REF"'","title_link": "'"$INPUT_PR_LINK"'","text": "`'"${GITHUB_SHA::8}"'` - '"$INPUT_MESSAGE"'"} ]}'

curl -X POST -H "Content-type: application/json" --data '{"attachments": [{"mrkdwn_in": ["text"],"author_name": "'"$GITHUB_ACTOR"'","author_link": "https://github.com/'"$GITHUB_ACTOR"'","title": "1 new commit pushed to '"$GITHUB_HEAD_REF"'","title_link": "'"$INPUT_PR_LINK"'","text": "`'"${GITHUB_SHA::8}"'` - '"$INPUT_MESSAGE"'"} ]}' $INPUT_SLACK_WEBHOOK


# {
#     "attachments": [
#         {
#             "mrkdwn_in": ["text"],
#             "author_name": "'"$GITHUB_ACTOR"'",
#             "author_link": "https://github.com/'"$GITHUB_ACTOR"'",
#             "title": "1 new commit pushed to '"$GITHUB_HEAD_REF"'",
#             "title_link": "'"$INPUT_PR_LINK"'",
#             "text": "'"${GITHUB_SHA::8}"'" - '"$INPUT_MESSAGE"'"
#         }
#     ]
# }