---
name: geo-ai-search
description: 由 SEO.Beer 每两周酿造更新的 GEO（生成式引擎优化）活体技能（批次 v2026.W48）。用于优化内容结构、可引用性、实体清晰度，提升在 Google AI Overviews / AI Mode、ChatGPT Search、Perplexity、Claude Search 及中文 AI 搜索中的引用表现。
version: 2026.W48
updated: 2026-11-24
source: https://seo.beer/zh/skills/geo-ai-search/SKILL.md
---

# GEO 与 AI 搜索引用优化（Batch v2026.W48 · SEO.Beer）

> 基于 https://seo.beer 每两周实证追踪的搜索平台机制沉淀——拒绝玄学，只保留可验证的工程与内容准则。

## 1. AI 搜索引擎如何筛选并引用网页
主流 AI 问答引擎（Google AI Overviews / AI Mode、ChatGPT Search、Perplexity、Claude Search）遵循“检索 → 切片重排 → 归因引用”链路：
1. **索引入场券**：Google AIO / AI Mode 依赖 `Googlebot`；ChatGPT Search 依赖 `OAI-SearchBot` 与 Bing；Perplexity 依赖 `PerplexityBot`；Claude 依赖 `Claude-SearchBot`。
2. **段落级可抽取性**：RAG 切片器极度偏好语义清晰的 HTML（`<h1>`–`<h3>`、`<table>`、`<ul>`、`<dl>`），每个小节干净回答一个明确问题。
3. **信息增益与可验证出处**：一手基准测试、官方文档 Diff、结构化数据集、明确的版本/核验日期，远比洗稿综述更容易被引用。

## 2. 高引用率页面蓝图
- **结论前置（40–80 字）**：在 `<h1>` 下方直接给出明确结论、适用范围与生效日期。
- **原子事实表格**：将参数对比、政策矩阵、时间线用标准 HTML `<table>` 呈现，切勿把关键数据锁死在图片或 Canvas 中。
- **显式时效与出处**：展示 `核验日期 YYYY-MM-DD` 并链接至一手官方来源，降低模型引用犹豫度。
- **实体一致性**：确保页面标题、`Organization` / `Article` JSON-LD 与外部权威档案中的品牌与术语一致。

## 3. 常见误区与反搬运边界
- **严禁误配 `nosnippet` 或 `max-snippet:0`**：这会直接把页面排除出 Google AI Overviews 与搜索摘要。
- **不要用 `llms-full.txt` 倾倒全站正文**：Google 已确认 `llms.txt` 不是排名因素；把全站文章摊平为纯文本或全量新闻 API 只会让采集站一键搬空内容。`/llms.txt` 应聚焦于结构化能力、Skills 与 MCP 工具入口。
- **核心内容直出 SSR HTML**：需要点击才异步拉取的 Tab / 弹窗内容对大多数 AI 搜索抓取器不可见。

## 4. 中文 AI 搜索生态适配
- 面向百度 AI 搜索、DeepSeek 联网搜索、腾讯元宝与通义千问：
  - 放行 `Baiduspider`，保障境内与亚太 TTFB 速度；
  - 输出自然地道的简体中文表达，同时保留关键英文官方专有名词（如 `OAI-SearchBot`、`AI Mode`、`JSON-LD`）以对齐双语检索词。

## 5. 发布前核查
- 调用 MCP `seobeer_audit_robots_txt` 确认未误封搜索引用爬虫。
- 调用 MCP `seobeer_check_rules`（`topic: "geo-content"` 或 `"meta-robots"`）核对最新生效与废弃规则。
