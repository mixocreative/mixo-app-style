#!/usr/bin/env bash
# Links this repo into the Claude Code and Codex skill folders, so `git pull` updates all of them.
set -euo pipefail
repo="$(cd "$(dirname "$0")" && pwd)"
for t in "$HOME/.claude/skills/mixo-app-style" "$HOME/.agents/skills/mixo-app-style" "$HOME/.codex/skills/mixo-app-style"; do
  mkdir -p "$(dirname "$t")"
  if [ -L "$t" ]; then rm "$t"
  elif [ -e "$t" ]; then echo "$t exists and is not a link; move it away first." >&2; exit 1
  fi
  ln -s "$repo" "$t"
  echo "linked $t -> $repo"
done
