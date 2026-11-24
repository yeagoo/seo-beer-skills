---
name: ai-crawlers-policy
description: Biweekly living AI & Search Crawler governance skill brewed by SEO.Beer (batch v2026.W48). Use when auditing or generating robots.txt, separating search citation bots from AI training bots, or configuring Cloudflare/WAF crawler rules.
version: 2026.W48
updated: 2026-11-24
source: https://seo.beer/skills/ai-crawlers-policy/SKILL.md
---

# AI Crawlers & robots.txt Policy (Batch v2026.W48 · SEO.Beer)

> Verified against official vendor docs tracked continuously at https://seo.beer/crawlers.

## 1. The 3 Crawler Buckets (Never Mix Them!)
| Bucket | Verified Tokens | Impact of Blocking |
|---|---|---|
| **Search & AI Citations** | `Googlebot`, `Bingbot`, `OAI-SearchBot`, `Claude-SearchBot`, `PerplexityBot`, `Applebot`, `Amazonbot`, `Baiduspider` | Removes your site from Search / ChatGPT / Claude / Perplexity citations |
| **AI Model Training** | `GPTBot`, `ClaudeBot`, `Google-Extended`, `GoogleOther`, `Applebot-Extended`, `Meta-ExternalAgent` | Opts out of model training with **zero** classic search ranking loss |
| **User-Triggered Live Fetch** | `ChatGPT-User`, `Claude-User`, `Perplexity-User` | Blocks live link reading when a user pastes your URL in chat |

## 2. Recommended Production Policy: "Allow Search Citations, Block AI Training"
```txt
User-agent: Googlebot
Allow: /

User-agent: Bingbot
Allow: /

User-agent: OAI-SearchBot
Allow: /

User-agent: Claude-SearchBot
Allow: /

User-agent: PerplexityBot
Allow: /

User-agent: Applebot
Allow: /

# Opt out of AI foundation model training
User-agent: GPTBot
Disallow: /

User-agent: ClaudeBot
Disallow: /

User-agent: Google-Extended
Disallow: /

User-agent: Applebot-Extended
Disallow: /

User-agent: Meta-ExternalAgent
Disallow: /

User-agent: *
Allow: /
Disallow: /admin/
```

## 3. Critical Edge Cases (2026)
- **`Google-Extended` is a control token, not a separate crawler**: Blocking it stops Gemini/Vertex AI training but does NOT remove pages from Google Search or AI Overviews.
- **`Perplexity-User` does not rely on `robots.txt`**: If you run paywalled or private content, enforce server auth or Cloudflare WAF rules.
- **Verify real bots before whitelisting at WAF**: Check official rDNS (`*.googlebot.com`, `*.search.msn.com`, `*.applebot.apple.com`) or published JSON IP ranges (`googlebot.json`, `bingbot.json`, `searchbot.json`, `gptbot.json`). Never trust raw `User-Agent` strings alone for rate-limit exemptions.
- **Anti-scraping defense**: Pair `robots.txt` with retired bulk-export APIs, rate limits, and Cloudflare AI Crawl Control so scrapers cannot mirror your site.

## 4. Executable MCP Tools
- Always call `seobeer_audit_robots_txt` when reviewing an existing `robots.txt` file.
- Always call `seobeer_generate_robots_txt` with preset `geo_citations_only`, `block_ai_training`, `allow_all`, or `strict_search_only` to emit a verified production file.
