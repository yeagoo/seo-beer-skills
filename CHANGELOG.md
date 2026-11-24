# Changelog — SEO.Beer Living SEO & GEO Skills

## v2026.W48 (2026-11-24)

**Cadence:** Biweekly · **Next Batch:** `2026.W50`

### Highlights
- Absorbed Google Nov 2026 Core Update & back-button hijacking spam FAQ clarifications
- Flagged deprecated Google structured data types & Search Console Data Feed validation removal
- Updated verified crawler matrix with 17 search/AI tokens (OAI-SearchBot vs GPTBot, Claude-SearchBot vs ClaudeBot, Google-Extended, Applebot-Extended)
- Added LLM Search API compliance & attribution checklist (OpenAI, Anthropic, Gemini Grounding, Perplexity Sonar)

### `technical-seo-live` (Technical SEO Live)
- **Added**: Added back-button hijacking anti-spam audit rule from Google's Nov 2026 Spam Policy FAQ
- **Added**: Added 12 newly documented Google crawlers & Google-Agent verification checks
- **Updated**: Updated Search Console Data Feed validation guidance following Nov 2026 doc removal
- **Updated**: Tightened SSR HTML-first checklist for zero-JS AI search fetchers
- **Deprecated**: Deprecated HowTo, SpecialAnnouncement, CourseInfo, ClaimReview & LearningVideo rich result templates

### `geo-ai-search` (GEO & AI Search Optimization)
- **Added**: Added Google AI Mode 'Dive deeper' citation formatting & UGC/community proof patterns
- **Added**: Added Chinese AI Search GEO checklist (Baidu AI Search, DeepSeek, Yuanbao, Qwen)
- **Updated**: Clarified /llms.txt role: agent tool/skill discovery map, not a search ranking factor
- **Updated**: Refined answer-first chunk structure (40–80 word verifiable lead + structured comparison tables)
- **Deprecated**: Removed myth that adding keyword-stuffed llms-full.txt dumps improves ChatGPT or Google AIO citations

### `ai-crawlers-policy` (AI Crawlers & robots.txt Policy)
- **Added**: Added Perplexity-User robots.txt non-compliance warning and WAF fallback guidance
- **Added**: Added Baiduspider optional block for bilingual/Chinese sites
- **Updated**: Verified all 17 robots.txt tokens against official Google, Bing, OpenAI, Anthropic, Perplexity, Apple, Meta, and Amazon docs
- **Updated**: Linked directly to deterministic MCP tools seobeer_audit_robots_txt and seobeer_generate_robots_txt
- **Deprecated**: Removed conflated 'block all AI bots' templates that accidentally blocked OAI-SearchBot & Claude-SearchBot

### `search-api-playbook` (LLM Search API Playbook)
- **Added**: Added Anthropic web_search max_uses & allowed_domains/blocked_domains cost-guard pattern
- **Added**: Added Google Gemini Grounding mandatory Search Suggestions chip (renderedContent) compliance rule
- **Updated**: Updated OpenAI Responses API web_search context-size tuning (low/medium/high) & url_citation rendering
- **Updated**: Added multi-provider fallback matrix (Native LLM Search vs. Tavily / Exa / Serper)
- **Deprecated**: Deprecated legacy Chat Completions search-preview workarounds where Responses API web_search is supported
