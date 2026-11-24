---
name: ai-crawlers-policy
description: 由 SEO.Beer 每两周酿造更新的 AI 爬虫与 robots.txt 治理技能（批次 v2026.W48）。用于审计或生成 robots.txt、精准区分搜索引用爬虫与模型训练爬虫，以及配置 Cloudflare / WAF 放行与防搬运策略。
version: 2026.W48
updated: 2026-11-24
source: https://seo.beer/zh/skills/ai-crawlers-policy/SKILL.md
---

# AI 爬虫与 robots.txt 治理策略（Batch v2026.W48 · SEO.Beer）

> 所有 Token 均与 https://seo.beer/zh/crawlers 实时监控的官方文档一一核验。

## 1. 三类爬虫严禁混为一谈
| 分类 | 官方核验 Token | 屏蔽后的后果 |
|---|---|---|
| **搜索与 AI 引用索引** | `Googlebot`、`Bingbot`、`OAI-SearchBot`、`Claude-SearchBot`、`PerplexityBot`、`Applebot`、`Amazonbot`、`Baiduspider` | 会直接失去搜索引擎或 ChatGPT / Claude / Perplexity 的引用曝光 |
| **AI 模型训练** | `GPTBot`、`ClaudeBot`、`Google-Extended`、`GoogleOther`、`Applebot-Extended`、`Meta-ExternalAgent` | 退出大模型训练语料，**不影响**传统搜索与 AI 搜索引用 |
| **用户实时按需抓取** | `ChatGPT-User`、`Claude-User`、`Perplexity-User` | 用户在对话中粘贴你的链接时无法实时读取网页 |

## 2. 推荐生产策略：“放行搜索引用，屏蔽模型训练”
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

# 独立退出大模型训练语料
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

## 3. 2026 必知边界与反盗版防线
- **`Google-Extended` 不是独立爬虫**：屏蔽它仅拒绝 Gemini / Vertex AI 训练，不会影响 Google 搜索收录与 AI Overviews。
- **`Perplexity-User` 一般不遵守 `robots.txt`**：付费墙与受限内容务必用登录鉴权或 Cloudflare WAF 拦截。
- **WAF 放行前必须核验真实 IP / rDNS**：不要仅凭 `User-Agent` 字符串给爬虫开白名单，务必核对官方 rDNS（`*.googlebot.com`、`*.search.msn.com`）或官方 JSON IP 段。
- **防止内容被一键搬运**：在放行搜索索引爬虫的同时，下线公开的全量文章导出接口，并配合边缘限流与 Cloudflare AI Crawl Control。

## 4. 联动可执行 MCP 工具
- 审查现有 `robots.txt` 时，优先调用 `seobeer_audit_robots_txt` 获取逐条风险诊断与修复版文件。
- 新建或重构配置时，调用 `seobeer_generate_robots_txt` 按预设（`geo_citations_only` / `block_ai_training` / `allow_all` / `strict_search_only`）生成标准文件。
