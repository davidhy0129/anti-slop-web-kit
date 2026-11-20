# Universal Web Craft & Anti-AI-Slop Agent Instructions

You are operating with **anti-slop-web-kit** — a universal, domain-agnostic engineering and design-quality system for any website, landing page, e-commerce store, SaaS, CRM, or ERP web application.

## Core Operating Principles (Non-Negotiable)

1. **Zero AI-Slop Aesthetics:**
   - NEVER default to cliché AI typography (`Inter`, `Roboto`, `Arial`, `Geist`, `Space Grotesk`, `Bricolage Grotesque`, `Instrument Sans`, `Instrument Serif`, `Fraunces`, `Playfair Display`, `JetBrains Mono`, `Space Mono`).
   - NEVER scatter decorative uppercase pill badges (`eyebrows`) above every section, periods at the end of `H1`/`H2` headings, fake `01 / 02 / 03` numbering, rainbow badges, or gratuitous borders/dividers.
   - Follow the **3-Color Golden Rule**: 1 dark base + 1 warm/soulful light base (`#F6F5F1`, `#FAFAF8`, `#F3EBDD`) + **1 single protagonist CTA accent** with warm-vs-cool contrast.
   - Make real products/photos large and clean ("Show the actual product larger"); enforce concentric border radii (`inner = outer - padding`).

2. **Mobile-First Ergonomics & Snappy Physics:**
   - Use `100dvh` (`min-h-dvh`), NEVER `100vh`.
   - Enforce `font-size >= 16px` (`text-base`) on all `<input>`, `<select>`, and `<textarea>` elements on mobile to prevent iOS Safari auto-zoom.
   - Zero scroll-hunting: keep feedback, selectors, and sticky actions within the user's thumb reach.
   - UI transitions must be crisp and physics-based (`150ms–250ms`, `ease-out`, zero bounce, exits 20% faster than enters, `active:scale-[0.97]`, `layoutId` for sliding tabs, `inline-grid` to prevent layout shift).

3. **Web Systems & ERP Discipline:**
   - Never hard-delete operational history (preserve records with statuses and timestamps).
   - Use searchable comboboxes instead of raw text inputs or unwieldy `<select>` lists when options exceed ~15 items.
   - Design dashboards around actionable queues, `tabular-nums`, sticky table headers, and indexed queries.

4. **Production Security, SEO & Reliability:**
   - Use unpredictable UUIDs (`crypto.randomUUID()`), never sequential IDs in public/API routes.
   - Validate auth, permissions, CORS, rate limits, and security headers on the server; use `__session` cookie naming when behind Firebase Hosting/CDN proxies.
   - Ensure strict `<h1> -> <h2> -> <h3>` hierarchy (one `<h1>` per page), clean `robots.txt`, `sitemap.xml`, JSON-LD, and human-language copy.
   - Always ship graceful failure states (`error.tsx`, retry + offline/direct contact fallback) so no user or lead is ever stranded.

## Skill Routing Table

Read the relevant skill before executing specialized work:

| Task Domain | Read Skill File |
|---|---|
| Visual redesign, fonts, colors, removing AI-look | `skills/anti-ai-slop-design/SKILL.md` |
| Page structure, grids, whitespace, industry layouts | `skills/layout-grid-hierarchy/SKILL.md` |
| Mobile UX, forms, responsive layout, Framer Motion | `skills/mobile-ux-microinteractions/SKILL.md` |
| Dashboards, ERPs, tables, admin panels, data flows | `skills/web-systems-erp-architecture/SKILL.md` |
| Auth, cookies, CORS, rate limiting, GDPR/Habeas Data | `skills/security-privacy-compliance/SKILL.md` |
| Technical SEO, JSON-LD, human keywords, Google Maps | `skills/seo-discoverability-growth/SKILL.md` |
| Error states, PWA, caching, fast build/deploy/rollback | `skills/production-reliability-pwa-deploy/SKILL.md` |

## Workflows & Audit Tooling
- Run `node scripts/audit-site.mjs .` to scan any web codebase before/after edits.
- Follow `workflows/full-site-overhaul.md` for transforming existing sites.
- Follow `workflows/new-web-project.md` when starting from scratch.
- Follow `workflows/pre-launch-audit.md` before any production deployment.
