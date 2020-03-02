#!/bin/sh
set -eu

if test -z "$SLACK_BOT_TOKEN"; then
  echo "Set the SLACK_BOT_TOKEN secret."
  exit 1
fi

node index.js "$*"