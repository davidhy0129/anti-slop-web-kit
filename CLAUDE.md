# Claude Code Instructions — `anti-slop-web-kit`

@AGENTS.md

## Claude Code Subagent & Skill Usage
- When auditing or upgrading any web application (landing page, SaaS, e-commerce, restaurant, club, or ERP), load the matching `SKILL.md` from `skills/` or `.claude/skills/`.
- For multi-angle overhauls, assign distinct roles from `agents/`:
  - `agents/design-engineer.md`
  - `agents/ux-mobile-architect.md`
  - `agents/frontend-systems-architect.md`
  - `agents/security-compliance-auditor.md`
  - `agents/seo-growth-strategist.md`
  - `agents/production-reliability-qa.md`
- Always run `node scripts/audit-site.mjs .` (when available in the repo) plus the project's build/typecheck (`npm run build`) before reporting completion.
