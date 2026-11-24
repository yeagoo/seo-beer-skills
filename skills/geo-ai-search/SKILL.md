---
name: geo-ai-search
description: Biweekly living GEO (Generative Engine Optimization) skill brewed by SEO.Beer (batch v2026.W48). Use when optimizing content architecture, citation readiness, entity clarity, and visibility in Google AI Overviews / AI Mode, ChatGPT Search, Perplexity, Claude Search, and Chinese AI search.
version: 2026.W48
updated: 2026-11-24
source: https://seo.beer/skills/geo-ai-search/SKILL.md
---

# GEO & AI Search Optimization (Batch v2026.W48 · SEO.Beer)

> Grounded in real search engine behavior tracked biweekly at https://seo.beer — zero hype, zero fake "AI SEO hacks".

## 1. How AI Search Engines Select Citations
AI answer engines (Google AI Overviews / AI Mode, ChatGPT Search, Perplexity, Claude Search) run a multi-step retrieval + reranking pipeline:
1. **Index eligibility**: Google AIO/AI Mode relies on Googlebot; ChatGPT Search uses `OAI-SearchBot` + Bing; Perplexity uses `PerplexityBot`; Claude uses `Claude-SearchBot`.
2. **Passage-level extractability**: Chunkers favor clean semantic HTML (`<h1>`–`<h3>`, `<table>`, `<ul>`, `<dl>`) where a single section answers one discrete question cleanly.
3. **Information gain & provenance**: Primary benchmarks, official changelogs, original datasets, exact version/date stamps, and named entities outperform rehashed generic summaries.

## 2. Citation-Ready Page Blueprint
- **Answer-First Lead (40–80 words)**: State the concrete conclusion, scope, and effective date right under `<h1>`.
- **Atomic Fact Tables**: Put comparisons, matrices, pricing, specs, or status timelines in real `<table>` elements (never trapped inside screenshots or canvas charts).
- **Explicit Attribution & Freshness**: Display visible `Updated / Verified YYYY-MM-DD` timestamps and link directly to primary official sources.
- **Entity Consistency**: Align brand/product/author names across `Organization` / `Article` JSON-LD, page headings, and external authoritative profiles.

## 3. Preview Controls & Pitfalls
- **Never emit `nosnippet` or `max-snippet:0`** on pages where you want AI Overviews or AI citations.
- **Avoid `llms-full.txt` bulk dumps**: Google confirmed `llms.txt` is not a ranking factor. Publishing full article bodies in flat text or bulk JSON APIs invites wholesale content scraping without lifting citations. Keep `/llms.txt` focused on structured tools, docs, and Skills.
- **Keep core text in SSR HTML**: Tabs, accordions, or modals that fetch content only on click are invisible to most AI search fetchers.

## 4. Bilingual & Chinese AI Search Notes
- For Simplified Chinese visibility (Baidu AI Search, DeepSeek Web Search, Tencent Yuanbao, Qwen Search):
  - Allow `Baiduspider`, keep mobile-first fast TTFB, and publish native Simplified Chinese headings/tables (avoid raw machine-translated phrasing).
  - Include canonical Chinese technical terms alongside English official tokens (e.g., `AI Overviews（AI 概览）`, `robots.txt`).

## 5. Verification Checklist
- Run `seobeer_audit_robots_txt` to confirm search-citation bots are allowed while optional training bots are controlled cleanly.
- Run `seobeer_check_rules` with `topic: "geo-content"` or `topic: "meta-robots"` before shipping major template changes.
