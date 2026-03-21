#!/bin/bash
set -e

export HOME=/home/claude

# Shared setup: SSH key + git identity
source /home/claude/scripts/setup-credentials.sh
rm -f /home/claude/scripts/setup-credentials.sh

# Launch claude — skip permissions by default (sandbox environment)
if [ "${CLAUDE_SKIP_PERMISSIONS:-true}" = "true" ]; then
  exec claude --dangerously-skip-permissions "$@"
else
  exec claude "$@"
fi
