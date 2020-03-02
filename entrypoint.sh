#!/bin/sh
set -eu

if test -z "$SLACK_BOT_TOKEN"; then
  echo "Set the SLACK_BOT_TOKEN secret."
  exit 1
fi

payload=$(echo "$*" ? jq -c '.')

curl -X POST \
     -H "Content-type: application/json; charset=UTF-8" \
     -H "Authorization: Bearer $SLACK_BOT_TOKEN" \
     -d "${payload}" \
     https://slack.com/api/chat.postMessage