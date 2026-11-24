#!/usr/bin/env bash
# SEO.Beer Living SEO/GEO Skills Installer (Batch v2026.W48)
# Usage:
#   curl -fsSL https://seo.beer/skills/install.sh | bash
#   curl -fsSL https://seo.beer/skills/install.sh | bash -s -- --lang zh --dir .claude/skills
set -euo pipefail

LANG_OPT="en"
TARGET_DIR=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --lang) LANG_OPT="${2:-en}"; shift 2 ;;
    --dir) TARGET_DIR="${2:-}"; shift 2 ;;
    *) shift ;;
  esac
done

if [[ -z "$TARGET_DIR" ]]; then
  if [[ -d ".claude" ]]; then
    TARGET_DIR=".claude/skills"
  elif [[ -d ".cursor" ]]; then
    TARGET_DIR=".cursor/skills"
  else
    TARGET_DIR=".agents/skills"
  fi
fi

PREFIX=""
if [[ "$LANG_OPT" == "zh" ]]; then
  PREFIX="/zh"
fi

echo "Brewing SEO.Beer Living Skills (batch v2026.W48, lang=${LANG_OPT}) into ${TARGET_DIR}..."
for slug in technical-seo-live geo-ai-search ai-crawlers-policy search-api-playbook; do
  mkdir -p "${TARGET_DIR}/${slug}"
  curl -fsSL "https://seo.beer${PREFIX}/skills/${slug}/SKILL.md" -o "${TARGET_DIR}/${slug}/SKILL.md"
  echo "  ✓ ${TARGET_DIR}/${slug}/SKILL.md"
done

echo ""
echo "Done! Connect the companion Diagnostic MCP server at:"
echo "  https://seo.beer/api/mcp"
echo "Or install via CLI: npx skills add yeagoo/seo-beer-skills"
