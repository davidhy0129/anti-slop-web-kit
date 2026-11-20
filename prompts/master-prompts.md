# Prompts Maestros Listos para Copiar y Pegar

Usa estos prompts directamente en **Antigravity, Claude Code, Codex, Cursor o Gemini CLI** una vez instalado `anti-slop-web-kit`.

---

## 1. Rediseño Completo Anti-AI-Slop (Español)
```markdown
Lee `AGENTS.md` y las skills `anti-ai-slop-design`, `layout-grid-hierarchy` y `mobile-ux-microinteractions`.
Ejecuta `node scripts/audit-site.mjs .` y realiza un pulido integral de nivel estudio profesional sobre todo el proyecto:
1. Reemplaza cualquier fuente genérica de IA por una tipografía aprobada, con `tracking-[-0.03em]`, `leading-[1.1]` en títulos y `tabular-nums` en cifras.
2. Simplifica la paleta a máximo 3 colores sólidos (1 oscuro base + 1 claro cálido con alma + 1 solo acento protagonista reservado para CTAs), aplicando contraste Frío vs. Cálido.
3. Elimina píldoras/eyebrows en MAYÚSCULAS encima de títulos, puntos finales en H1/H2, numeraciones falsas (`01/02/03`), bordes innecesarios y badges decorativos.
4. Haz que las fotos/producto real sean protagonistas (65-70% en tarjetas y héroe amplio) con esquinas concéntricas (`inner = outer - padding`).
5. En móvil: `100dvh`, inputs/selects de mínimo `16px` (`text-base`), cero scroll-hunting, tabs con `inline-grid` y animaciones de `150–250ms` `ease-out` sin rebote + `active:scale-[0.97]`.
Verifica al final con `node scripts/audit-site.mjs .` y `npm run build` con 0 errores.
```

## 2. Auditoría de Sistema / ERP / Panel Administrativo (Español)
```markdown
Lee `skills/web-systems-erp-architecture/SKILL.md` y `skills/security-privacy-compliance/SKILL.md`.
Audita y mejora nuestro panel administrativo / sistema ERP:
1. Asegúrate de que el historial operativo nunca se borre de forma destructiva (usa estados + timestamps + índices en BD).
2. Reemplaza cualquier campo de texto libre o `<select>` largo (>15 opciones) por un combobox con buscador + opción personalizada.
3. Organiza el Dashboard con KPIs (`tabular-nums`), desglose por canal/categoría, tasa de conversión y una cola accionable de pendientes inmediatos.
4. Verifica autenticación en servidor, cookie `__session` compatible con CDN/proxies, UUIDs impredecibles (`crypto.randomUUID()`), rate-limiting y versión responsive en tarjetas para operar desde celular.
```

## 3. Auditoría Pre-Lanzamiento: SEO, Seguridad y Resiliencia (Español)
```markdown
Ejecuta `workflows/pre-launch-audit.md` completo sobre este proyecto:
1. Revisa `robots.txt`, `sitemap.xml`, jerarquía estricta (`1 solo <h1>` por página), metadatos OpenGraph y JSON-LD.
2. Verifica manejo de fallos (`error.tsx`, `not-found.tsx` y fallback con botón Reintentar + canal alternativo en formularios).
3. Corre `node scripts/audit-site.mjs .` y `npm run build` hasta lograr 0 errores.
```

---

## 4. Full Studio Polish Prompt (English)
```markdown
Read `AGENTS.md` and load `skills/anti-ai-slop-design/SKILL.md`, `skills/layout-grid-hierarchy/SKILL.md`, and `skills/mobile-ux-microinteractions/SKILL.md`.
Run `node scripts/audit-site.mjs .`, then refactor the UI to studio-grade product engineering standards:
- Purge banned AI fonts (`Inter`, `Space Grotesk`, `Geist`, `JetBrains Mono`) and enforce tight display tracking + `tabular-nums`.
- Enforce the 3-color Warm-vs-Cool system (1 dark base, 1 soulful warm off-white, 1 single CTA accent).
- Remove decorative uppercase pill eyebrows, trailing heading periods, fake `01/02/03` numbering, gratuitous card borders, and rainbow badges.
- Enlarge real product visuals with concentric border radii (`inner = outer - padding`).
- Enforce mobile ergonomics (`100dvh`, `>=16px` inputs, zero scroll-hunting, `inline-grid` tab stability) and snappy `150–250ms` `ease-out` motion (`active:scale-[0.97]`).
Verify with `node scripts/audit-site.mjs .` and a clean `npm run build`.
```
