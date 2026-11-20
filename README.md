# `anti-slop-web-kit`

> **Kit universal de ingeniería de diseño, UX móvil, arquitectura web/ERP, SEO y seguridad para transformar cualquier página o sistema web generado por IA en un producto con acabado de estudio profesional.**

Funciona desde el minuto cero con **Antigravity**, **Claude Code**, **OpenAI Codex**, **Cursor**, **Windsurf** y **Gemini CLI**.  
Es **100% agnóstico de industria**: sirve para landing pages, restaurantes, clubes, tiendas, SaaS, paneles administrativos, CRMs y ERPs completos.

---

## ¿Qué incluye este kit?

1. **7 Skills especializadas (`skills/`)** con reglas exactas, paletas con códigos HEX, tipografías aprobadas vs. prohibidas, geometría de layouts, micro-interacciones, arquitectura ERP/SaaS, seguridad y SEO:
   - `anti-ai-slop-design` — Eliminación de estética genérica de IA, tipografía profesional, 3 Reglas de Oro de Color (Frío vs. Cálido), radios concéntricos.
   - `layout-grid-hierarchy` — Jerarquía visual, ritmo de secciones, protagonismo de producto/foto, mallas Bento/Grid y recetas por industria.
   - `mobile-ux-microinteractions` — Reglas estrictas de móvil (`100dvh`, inputs `>=16px` anti-zoom iOS, cero *scroll-hunting*, tabs sin salto de ancho, Framer Motion `150–250ms` sin rebote).
   - `web-systems-erp-architecture` — Diseño de ERPs, dashboards, tablas densas, paginación/índices, buscadores *combobox*, estados optimistas e historial inmutable.
   - `security-privacy-compliance` — UUIDs impredecibles, cookies seguras (`__session` en proxies/CDNs), CORS, rate-limiting, headers HTTP, privacidad y cumplimiento legal.
   - `seo-discoverability-growth` — SEO técnico (`robots.txt`, `sitemap.xml`, `H1->H2->H3`, JSON-LD) + SEO humano (palabras cotidianas + Google Maps/Search Console).
   - `production-reliability-pwa-deploy` — Manejo de fallos (`error.tsx`, reintento + fallback), PWA instalable, caché, rollback y flujo rápido de despliegue.
2. **6 Subagentes especializados (`agents/`)** listos para delegar auditorías y rediseños por rol.
3. **3 Workflows listos (`workflows/`)**:
   - `full-site-overhaul.md` — Transformar una web existente que se ve "hecha por IA".
   - `new-web-project.md` — Arrancar cualquier web o sistema desde cero con el pie derecho.
   - `pre-launch-audit.md` — Auditoría final antes de salir a producción.
4. **Auditor estático automático (`scripts/audit-site.mjs`)** en Node.js (cero dependencias) para detectar síntomas de AI Slop, fuentes genéricas, `100vh`, inputs pequeños en móvil, fallas de SEO y seguridad en segundos.
5. **Instaladores en 1 comando (`scripts/install.ps1` y `scripts/install.sh`)** para instalarlo en tu proyecto o globalmente en tu agente favorito.

---

## Instalación rápida (1 comando)

### En Windows (PowerShell)
Clona o descarga este repo e instálalo en tu proyecto actual o globalmente:

```powershell
# Instalar en el proyecto actual (crea .agents/skills, .claude/skills, AGENTS.md, CLAUDE.md, .cursor/rules)
git clone https://github.com/davidhy0129/anti-slop-web-kit.git "$env:TEMP\anti-slop-web-kit"
& "$env:TEMP\anti-slop-web-kit\scripts\install.ps1" -Target all -Scope project
```

### En macOS / Linux (Bash)
```bash
git clone https://github.com/davidhy0129/anti-slop-web-kit.git /tmp/anti-slop-web-kit
bash /tmp/anti-slop-web-kit/scripts/install.sh --target all --scope project
```

### Opciones de instalación
- `--target` / `-Target`: `all` (default), `antigravity`, `claude`, `codex`, `cursor`, `gemini`
- `--scope` / `-Scope`: `project` (en la carpeta del proyecto actual) o `global` (en tu `$HOME` para todos tus proyectos)

---

## Auditoría instantánea de cualquier proyecto web

Ejecuta el script incluido desde la raíz de cualquier proyecto (Next.js, React, Vite, Astro, HTML, etc.):

```bash
node scripts/audit-site.mjs .
```

Detecta automáticamente:
- Uso de fuentes cliché de IA (`Inter`, `Space Grotesk`, `JetBrains Mono`, `Geist`, etc.).
- Uso de `100vh` en lugar de `100dvh` (que rompe el viewport en móviles).
- Inputs/selects menores a `16px` (provocan auto-zoom molesto en iOS Safari).
- Falta de `robots.txt`, `sitemap.xml`, `error.tsx` / `404`, metadatos OpenGraph o `manifest`.
- Posibles IDs secuenciales, `console.log` excesivos o secretos expuestos.

---

## Uso rápido con cualquier IA

Una vez instalado en tu proyecto, solo pídele a tu agente (Antigravity, Claude Code, Codex, Cursor, Gemini CLI):

- *"Lee `AGENTS.md` y ejecuta una auditoría completa usando `workflows/full-site-overhaul.md`."*
- *"Aplica la skill `anti-ai-slop-design` y `mobile-ux-microinteractions` a toda la interfaz."*
- *"Revisa este sistema ERP/Dashboard con `web-systems-erp-architecture` y `security-privacy-compliance`."*
- *"Corre `workflows/pre-launch-audit.md` antes de desplegar a producción."*

---

## English Quick Overview

`anti-slop-web-kit` is a domain-agnostic AI Engineering & Design System kit for **Antigravity, Claude Code, OpenAI Codex, Cursor, Windsurf, and Gemini CLI**. It packages battle-tested anti-AI-slop visual rules, typography & 3-color contrast systems, mobile-first ergonomics, ERP/SaaS architecture patterns, security/privacy hardening, technical & intent-based SEO, and production reliability checklists into portable `SKILL.md` modules, agent roles, workflows, and a zero-dependency static auditor.
