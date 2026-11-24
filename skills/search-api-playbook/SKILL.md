---
name: search-api-playbook
description: Biweekly living LLM Search API & Grounding playbook brewed by SEO.Beer (batch v2026.W48). Use when integrating OpenAI Web Search, Anthropic Web Search, Google Gemini Grounding, Perplexity Sonar, Bing Grounding, Tavily, or Exa in AI apps and agents.
version: 2026.W48
updated: 2026-11-24
source: https://seo.beer/skills/search-api-playbook/SKILL.md
---

# LLM Search API Playbook (Batch v2026.W48 · SEO.Beer)

> Practical engineering & compliance guide updated biweekly as model vendors change search tool schemas, citation rules, and pricing.

## 1. Provider Selection Matrix
| Provider / Tool | Best Use Case | Mandatory Attribution / Compliance | Key Cost / Quality Controls |
|---|---|---|---|
| **OpenAI Responses API (`web_search`)** | General web-grounded answers inside GPT workflows | Render inline clickable `url_citation` titles & links | Tune `search_context_size` (`low` / `medium` / `high`), pass `user_location` when geo-sensitive |
| **Anthropic (`web_search` server tool)** | Deep research & synthesis in Claude agents | Preserve cited text spans & source URLs | Always set `max_uses` (3–5) and `allowed_domains` / `blocked_domains` |
| **Google Gemini Grounding** | Freshness-critical queries leveraging Google Search | Must render `searchEntryPoint.renderedContent` chip + `groundingChunks` | Use dynamic retrieval threshold so non-fresh queries skip grounding cost |
| **Perplexity Sonar API** | Fast single-call search + synthesis with citations | Display returned `citations[]` array | Set `search_recency_filter` and `search_domain_filter` |
| **Tavily / Exa / Serper** | Custom RAG pipelines needing raw snippets/SERPs | Respect source robots/terms; do not mirror full copyrighted bodies | Cache by normalized query + TTL; cap `max_results` to 5–8 |

## 2. Production Guardrails
- **Separate query routing from generation**: Only invoke paid web search when the prompt requires post-cutoff facts, live prices, docs, or recent news.
- **Deduplicate & cache**: Normalize queries and cache search tool responses for 5–30 minutes (or longer for reference docs) to cut repeat spend by 40–70%.
- **Treat search snippets as untrusted input**: Fence external snippets clearly in system prompts so prompt injections embedded in web pages cannot trigger tool abuse.
- **Domain allowlists for high-stakes verticals**: For technical docs, SEO/GEO rules, finance, or medical queries, restrict search tools to authoritative official domains whenever possible.

## 3. Compliance Anti-Patterns to Avoid
- Stripping out `url_citation` or Gemini `renderedContent` chips before displaying grounded answers to end users.
- Running unbounded agent loops with `web_search` enabled and no `max_uses` / budget circuit breaker.
- Using web search APIs to bulk-scrape third-party publisher articles into a competing clone database.

## 4. Staying Current
Call SEO.Beer MCP `seobeer_get_policy_delta` (filter `vendor: "OpenAI"`, `"Anthropic"`, `"Google"`, or `"Perplexity"`) or `seobeer_check_rules` (`topic: "search-api"`) whenever upgrading search SDKs.
