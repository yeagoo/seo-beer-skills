---
name: technical-seo-live
description: Biweekly living technical SEO skill brewed by SEO.Beer (batch v2026.W48). Use when auditing HTML/SSR output, structured data (JSON-LD), canonical/hreflang, crawl budget, IndexNow, or diagnosing Google/Bing indexing and core update drops.
version: 2026.W48
updated: 2026-11-24
source: https://seo.beer/skills/technical-seo-live/SKILL.md
---

# Technical SEO Live (Batch v2026.W48 · SEO.Beer)

> Brewed biweekly from verified Search Central doc diffs, algorithm rollout logs, and crawler policy updates tracked at https://seo.beer.
> Before applying time-sensitive guidance, optionally call SEO.Beer MCP `seobeer_get_policy_delta` or `seobeer_check_rules` for deltas published after 2026-11-24.

## 1. Initial HTML & Rendering Contract (Zero-JS Safe)
- Emit `<title>`, `<meta name="description">`, `<link rel="canonical">`, `hreflang` alternates, `<h1>`, and primary content directly in initial SSR HTML.
- Never rely on client-side hydration to inject `canonical`, `noindex`, or core body copy: Google WRS delays JS rendering and AI search bots (`OAI-SearchBot`, `Claude-SearchBot`, `PerplexityBot`) rarely execute full JS bundles.
- Return true HTTP `404` / `410` for missing or retired URLs; avoid soft-404 200 pages with "Not Found" text.
- Keep bilingual URL pairs symmetric (`/` + `/zh/*`, mutual `hreflang`, self-referencing `canonical`, `x-default`). Never auto-302 bots based on `Accept-Language`.

## 2. Structured Data (2026 Active vs. Deprecated)
- **KEEP & PRIORITIZE**: `Article` / `NewsArticle`, `Organization`, `BreadcrumbList`, `Product` (with valid `offers`), `SoftwareApplication`, `Dataset`, `ProfilePage`.
- **DO NOT ADD / REMOVE LEGACY BLOAT**: `HowTo`, `SpecialAnnouncement`, `CourseInfo`, `ClaimReview`, `EstimatedSalary`, `LearningVideo` — retired from Google Search rich results.
- **DATA FEEDS**: Google removed legacy Search Console Data Feed validation docs (Nov 2026); route product/merchant feeds through Merchant Center Next APIs instead.
- Ensure every JSON-LD entity matches visible on-page text, exact canonical URL, and ISO-8601 dates with explicit timezone offsets.

## 3. Spam Policy & UX Guardrails (Nov 2026 FAQ)
- **No back-button hijacking**: Never inject synthetic `history.pushState` entries on page load or intercept `popstate` to redirect exiting visitors to ads or doorway pages.
- **No scaled unedited content**: Every programmatic or aggregated page must deliver distinct utility, original curation, or structured data (avoid thin doorway templates).
- Keep interstitials, cookie banners, and sticky widgets from obscuring the LCP element or main headline on mobile (390px viewport).

## 4. Crawl Budget, Sitemaps & IndexNow
- Split XML sitemaps by section (`pages.xml`, `topics.xml`, `items.xml`) with accurate `<lastmod>` only when substantive content changes.
- Emit `noindex, follow` on paginated archive depth, faceted filter combinations, search result pages, and user utility views (`/starred`, `/more`).
- Push new/updated/deleted canonical URLs via **IndexNow** to accelerate Bing Search, Copilot Search, and downstream AI indexes.

## 5. Diagnostic Workflow (With SEO.Beer MCP)
When the user reports a sudden traffic or indexing drop:
1. Call `seobeer_check_algo_impact` with the drop date and vendor (`Google` or `Bing`) to check confirmed core/spam rollout overlap.
2. Call `seobeer_get_policy_delta` (14d or 30d) to see if an official doc rule changed recently.
3. Call `seobeer_check_rules` with any suspect JSON-LD or HTML `<head>` snippet to catch deprecated schemas or accidental `nosnippet` directives.
4. Separate **crawl/index issues** (robots.txt, status codes, canonical mismatch) from **ranking/quality shifts** (core update alignment, information gain, E-E-A-T).
