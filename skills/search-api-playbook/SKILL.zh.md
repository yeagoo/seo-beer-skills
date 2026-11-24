---
name: search-api-playbook
description: 由 SEO.Beer 每两周酿造更新的大模型 Search API 实战手册（批次 v2026.W48）。用于集成 OpenAI Web Search、Anthropic Web Search、Google Gemini Grounding、Perplexity Sonar、Bing Grounding、Tavily 或 Exa 时的选型、引用合规与成本控制。
version: 2026.W48
updated: 2026-11-24
source: https://seo.beer/zh/skills/search-api-playbook/SKILL.md
---

# 大模型 Search API 实战手册（Batch v2026.W48 · SEO.Beer）

> 紧跟各大模型厂商搜索工具协议、引用展示条款与计费策略变更，每两周更新。

## 1. 主流 Search API 选型与合规矩阵
| 厂商 / 工具 | 最佳适用场景 | 强制引用与合规要求 | 关键成本与质量控制项 |
|---|---|---|---|
| **OpenAI Responses API（`web_search`）** | GPT 工作流内的通用联网回答 | 完整渲染可点击的 `url_citation` 标题与链接 | 按需调节 `search_context_size`（`low` / `medium` / `high`），地区相关查询传 `user_location` |
| **Anthropic（`web_search` 服务端工具）** | Claude Agent 深度检索与长文综合 | 保留引用片段与来源 URL | 务必设置 `max_uses`（建议 3–5）及 `allowed_domains` / `blocked_domains` |
| **Google Gemini Grounding** | 强时效性、依赖 Google 实时索引的问答 | 必须渲染 `searchEntryPoint.renderedContent` 入口芯片与 `groundingChunks` | 配置动态检索阈值，无需联网的问题跳过 Grounding 费用 |
| **Perplexity Sonar API** | 单次请求直接完成检索 + 综合摘要 | 展示返回的 `citations[]` 列表 | 善用 `search_recency_filter` 与 `search_domain_filter` |
| **Tavily / Exa / Serper** | 需要原始搜索结果/SERP 的自建 RAG 流水线 | 遵守来源版权与条款，不批量镜像原文 | 按归一化查询缓存 5–30 分钟，限制 `max_results` 为 5–8 |

## 2. 生产级工程护栏
- **路由与生成解耦**：仅当问题涉及实时新闻、最新文档、版本变更或价格时才触发付费搜索工具。
- **查询归一化与短期缓存**：对高频相同搜索做 5–30 分钟缓存，通常可降低 40–70% 重复搜索账单。
- **将网页摘要视为不可信外部输入**：在提示词中对搜索结果做明确数据隔离，防范网页内置的间接提示词注入（Indirect Prompt Injection）。
- **高风险领域优先域名白名单**：技术文档、搜索引擎政策、金融合规等场景尽量用 `allowed_domains` 锁定官方一手来源。

## 3. 必避的合规反模式
- 向终端用户展示联网答案时删掉 `url_citation` 或隐藏 Gemini `renderedContent` 搜索建议组件。
- 在没有 `max_uses` 和预算熔断的 Agent 循环里无限调用 `web_search`。
- 利用 Search API 批量抓取第三方站点全文来搭建搬运克隆站。

## 4. 持续获取最新策略变化
升级 Search SDK 或调整联网策略前，调用 SEO.Beer MCP `seobeer_get_policy_delta`（按 `OpenAI` / `Anthropic` / `Google` / `Perplexity` 筛选）或 `seobeer_check_rules`（`topic: "search-api"`）。
