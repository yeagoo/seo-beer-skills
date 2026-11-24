# SEO.Beer Living SEO & GEO Agent Skills

> **Batch `v2026.W48`** · Updated biweekly (Next brew: `2026.W50`) · Powered by **[SEO.Beer](https://seo.beer/skills)**

Static SEO prompts go stale in months. Every two weeks, **SEO.Beer** distills verified Google/Bing official documentation diffs, algorithm rollouts, AI crawler policy updates, and LLM Search API changes into versioned `SKILL.md` playbooks for **Claude Code, Cursor, OpenAI Codex, and Antigravity**.

## Quick Install

```bash
# Recommended (Skills CLI)
npx skills add yeagoo/seo-beer-skills

# Or install directly into .claude/skills, .cursor/skills, or .agents/skills
curl -fsSL https://seo.beer/skills/install.sh | bash

# Simplified Chinese editions (中文版)
curl -fsSL https://seo.beer/skills/install.sh | bash -s -- --lang zh
```

## Included Skills (`v2026.W48`)

| Skill | Focus | EN | ZH |
|---|---|---|---|
| `technical-seo-live` | Biweekly living technical SEO playbook synced to Google Search Central doc diffs, retired schema types, rendering rules, spam FAQs, and IndexNow. | [SKILL.md](./skills/technical-seo-live/SKILL.md) | [SKILL.zh.md](./skills/technical-seo-live/SKILL.zh.md) |
| `geo-ai-search` | Evidence-backed Generative Engine Optimization (GEO) rules for Google AI Overviews / AI Mode, ChatGPT Search, Perplexity, Claude Search, and Chinese AI search engines. | [SKILL.md](./skills/geo-ai-search/SKILL.md) | [SKILL.zh.md](./skills/geo-ai-search/SKILL.zh.md) |
| `ai-crawlers-policy` | Verified 17-bot robots.txt & WAF governance skill separating Search/Citation crawlers from AI model training crawlers and live user fetchers. | [SKILL.md](./skills/ai-crawlers-policy/SKILL.md) | [SKILL.zh.md](./skills/ai-crawlers-policy/SKILL.zh.md) |
| `search-api-playbook` | Up-to-date integration, attribution compliance, cost control, and fallback architecture for OpenAI, Anthropic, Gemini Grounding, Perplexity Sonar, and search APIs. | [SKILL.md](./skills/search-api-playbook/SKILL.md) | [SKILL.zh.md](./skills/search-api-playbook/SKILL.zh.md) |

## Companion Zero-Auth Diagnostic MCP Server

Connect your agent to `https://seo.beer/api/mcp` (Streamable HTTP, anonymous, read-only) for live executable checks:

```json
{
  "mcpServers": {
    "seobeer": {
      "url": "https://seo.beer/api/mcp"
    }
  }
}
```

| MCP Tool | What It Does |
|---|---|
| `seobeer_get_skill` | Fetch the latest biweekly `SKILL.md` (EN/ZH) or catalog |
| `seobeer_get_policy_delta` | Summarize last 14/30d verified official doc diffs, algorithm rollouts & active rules |
| `seobeer_audit_robots_txt` | Deterministically audit any `robots.txt` against 17 verified search/AI crawlers + return fixed config |
| `seobeer_generate_robots_txt` | Generate production `robots.txt` presets (`geo_citations_only`, `block_ai_training`, `allow_all`, `strict_search_only`) |
| `seobeer_check_algo_impact` | Cross-check a traffic/indexing/AI-citation drop date against confirmed Google/Bing rollouts |
| `seobeer_check_rules` | Query active/deprecated SEO/GEO/Search API rules or lint a pasted JSON-LD / meta / robots snippet |

## Links

- Interactive Skills & MCP Hub: https://seo.beer/skills ([中文版](https://seo.beer/zh/skills))
- Verified AI Crawler Matrix (17 tokens): https://seo.beer/crawlers
- Official Search Docs Watch: https://seo.beer/docs-watch
- Confirmed Algorithm Updates Timeline: https://seo.beer/updates

## License

MIT — Free to install, fork, and use across personal and commercial AI coding workflows.
