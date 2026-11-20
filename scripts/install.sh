#!/usr/bin/env bash
set -euo pipefail

TARGET="all"
SCOPE="project"
DEST="$(pwd)"
FORCE="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target) TARGET="$2"; shift 2 ;;
    --scope) SCOPE="$2"; shift 2 ;;
    --dest) DEST="$2"; shift 2 ;;
    --force) FORCE="true"; shift ;;
    *) echo "Unknown argument: $1"; exit 1 ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

copy_dir() {
  local src="$1"
  local dst="$2"
  mkdir -p "$dst"
  cp -R "$src/." "$dst/"
}

copy_file_safe() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -f "$dst" && "$FORCE" != "true" ]]; then
    echo "  [skip] $dst already exists (use --force to overwrite)"
  else
    cp "$src" "$dst"
    echo "  [ok]   $dst"
  fi
}

echo ""
echo "=== Installing anti-slop-web-kit (target: $TARGET | scope: $SCOPE) ==="

if [[ "$SCOPE" == "global" ]]; then
  if [[ "$TARGET" == "all" || "$TARGET" == "antigravity" ]]; then
    copy_dir "$KIT_ROOT/skills" "$HOME/.agents/skills"
    copy_dir "$KIT_ROOT/skills" "$HOME/.gemini/antigravity/skills"
    echo "  [ok]   Antigravity global skills installed"
  fi
  if [[ "$TARGET" == "all" || "$TARGET" == "claude" ]]; then
    copy_dir "$KIT_ROOT/skills" "$HOME/.claude/skills"
    copy_dir "$KIT_ROOT/agents" "$HOME/.claude/agents"
    echo "  [ok]   Claude Code global skills & agents installed"
  fi
  if [[ "$TARGET" == "all" || "$TARGET" == "codex" ]]; then
    copy_dir "$KIT_ROOT/skills" "$HOME/.codex/skills"
    echo "  [ok]   Codex global skills installed"
  fi
  if [[ "$TARGET" == "all" || "$TARGET" == "gemini" ]]; then
    copy_dir "$KIT_ROOT/skills" "$HOME/.gemini/skills"
    echo "  [ok]   Gemini CLI global skills installed"
  fi
  echo ""
  echo "Done! Global skills installed."
  exit 0
fi

if [[ "$TARGET" == "all" || "$TARGET" == "antigravity" || "$TARGET" == "codex" ]]; then
  copy_dir "$KIT_ROOT/skills" "$DEST/.agents/skills"
  copy_file_safe "$KIT_ROOT/AGENTS.md" "$DEST/AGENTS.md"
fi

if [[ "$TARGET" == "all" || "$TARGET" == "claude" ]]; then
  copy_dir "$KIT_ROOT/skills" "$DEST/.claude/skills"
  copy_dir "$KIT_ROOT/agents" "$DEST/.claude/agents"
  copy_file_safe "$KIT_ROOT/CLAUDE.md" "$DEST/CLAUDE.md"
fi

if [[ "$TARGET" == "all" || "$TARGET" == "cursor" ]]; then
  mkdir -p "$DEST/.cursor/rules"
  cp "$KIT_ROOT/.cursor/rules/anti-slop-web-kit.mdc" "$DEST/.cursor/rules/anti-slop-web-kit.mdc"
  echo "  [ok]   $DEST/.cursor/rules/anti-slop-web-kit.mdc"
fi

if [[ "$TARGET" == "all" || "$TARGET" == "gemini" ]]; then
  copy_dir "$KIT_ROOT/skills" "$DEST/.gemini/skills"
  copy_file_safe "$KIT_ROOT/GEMINI.md" "$DEST/GEMINI.md"
fi

copy_dir "$KIT_ROOT/workflows" "$DEST/workflows"
copy_dir "$KIT_ROOT/prompts" "$DEST/prompts"
copy_dir "$KIT_ROOT/agents" "$DEST/agents"
mkdir -p "$DEST/scripts"
cp "$KIT_ROOT/scripts/audit-site.mjs" "$DEST/scripts/audit-site.mjs"

echo ""
echo "Done! Next step: run 'node scripts/audit-site.mjs .' in $DEST"
