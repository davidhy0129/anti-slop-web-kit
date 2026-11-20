# Gemini CLI & Antigravity Instructions — `anti-slop-web-kit`

@AGENTS.md

## Execution Rules
- Treat `skills/*/SKILL.md` as authoritative specifications for UI/UX craft, ERP architecture, security, SEO, and production reliability.
- Before claiming any visual, structural, security, or SEO fix is complete, verify with `node scripts/audit-site.mjs .` and a clean production build (`npm run build` or framework equivalent).
- Keep code modular, avoid duplicating styles/components, and never ship placeholder content, fake reviews, or exposed secrets.
