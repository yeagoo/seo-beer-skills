---
name: technical-seo-live
description: 由 SEO.Beer 每两周酿造更新的技术 SEO 活体技能（批次 v2026.W48）。用于审计 SSR HTML、结构化数据（JSON-LD）、canonical/hreflang、抓取预算、IndexNow 以及排查 Google/Bing 索引与核心算法波动。
version: 2026.W48
updated: 2026-11-24
source: https://seo.beer/zh/skills/technical-seo-live/SKILL.md
---

# 技术 SEO 活体实践（Batch v2026.W48 · SEO.Beer）

> 本 Skill 每两周基于 https://seo.beer 追踪的官方文档 Diff、算法更新日志与爬虫政策同步酿造。
> 处理时效性强的排查任务时，可联动 SEO.Beer MCP 调用 `seobeer_get_policy_delta` 或 `seobeer_check_rules` 获取 2026-11-24 之后的增量规则变化。

## 1. 首屏 HTML 与渲染契约（无 JS 安全）
- 将 `<title>`、`<meta name="description">`、`<link rel="canonical">`、`hreflang`、`<h1>` 与核心正文直接输出在首屏 SSR HTML 中。
- 严禁依赖客户端水合（hydration）再写入 `canonical`、`noindex` 或主体内容：Google 渲染队列存在延迟，且主流 AI 搜索爬虫（`OAI-SearchBot`、`Claude-SearchBot`、`PerplexityBot`）普遍不执行完整 JS。
- 下线或不存在的 URL 必须返回真实的 HTTP `404` / `410`，避免返回 200 的软 404 页面。
- 多语言页面保持双向对称 `hreflang` + 自引用 `canonical` + `x-default`；绝对禁止根据 `Accept-Language` 对搜索引擎或 AI 爬虫发起 302 跳转。

## 2. 结构化数据（2026 现行 vs 已废弃）
- **优先维护**：`Article` / `NewsArticle`、`Organization`、`BreadcrumbList`、`Product`、`SoftwareApplication`、`Dataset`、`ProfilePage`。
- **停止新增并逐步清理**：`HowTo`、`SpecialAnnouncement`、`CourseInfo`、`ClaimReview`、`EstimatedSalary`、`LearningVideo` —— 均已从 Google 富结果特性中下线。
- **Data Feed 变更**：Google 于 2026 年 11 月移除了旧版 Search Console Data Feed 验证文档，商品与结构化 Feed 应迁移至 Merchant Center Next 接口。
- 所有 JSON-LD 字段必须与页面可见内容一致，日期带完整 ISO-8601 时区偏移。

## 3. 反垃圾政策与体验护栏（2026 年 11 月 FAQ）
- **严禁后退键劫持（Back-button hijacking）**：不得在页面加载时伪造 `history.pushState` 或拦截 `popstate` 将用户强行跳往广告/跳转页。
- **避免低信息增益模板页**：程序化生成的聚合页必须提供差异化筛选、一手数据或可验证结论，禁止空壳桥页。
- 移动端（390px 视口）不得用弹窗、遮罩或浮层遮挡 LCP 主体与核心标题。

## 4. 抓取预算、Sitemap 与 IndexNow
- 按内容类型拆分 XML Sitemap（`pages.xml`、`topics.xml`、`items.xml`），仅在内容发生实质修改时更新 `<lastmod>`。
- 对翻页归档、多维筛选组合、站内搜索页与个人工具页输出 `noindex, follow`。
- 在内容发布、实质更新与删除时触发 **IndexNow** 推送，加快 Bing、Copilot Search 及下游 AI 搜索收录。

## 5. 故障排查标准流（联动 SEO.Beer MCP）
当用户反馈流量或收录骤降时：
1. 调用 `seobeer_check_algo_impact` 核对异常日期与 Google/Bing 确认算法窗口是否重叠。
2. 调用 `seobeer_get_policy_delta` 查看近 14/30 天官方文档是否有新规生效。
3. 调用 `seobeer_check_rules` 传入页面的 JSON-LD 或 `<head>` 片段，排查废弃 Schema 或误设 `nosnippet`。
4. 严格区分**技术抓取/索引问题**（robots.txt、状态码、canonical 错乱）与**排名质量波动**（核心更新、信息增益、权威性）。
