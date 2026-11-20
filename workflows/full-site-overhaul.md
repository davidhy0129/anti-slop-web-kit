# Workflow: Full Site Overhaul (Transformar una web existente)

Usa este flujo cuando recibas una página web, tienda, SaaS o ERP ya existente que se ve "hecha por IA", desordenada, lenta en móvil o insegura.

## Fase 1 — Diagnóstico automático (2 min)
1. Ejecuta el auditor estático:
   ```bash
   node scripts/audit-site.mjs .
   ```
2. Inventaría el stack (`package.json`), rutas actuales, fuentes configuradas, variables de color y si hay panel `/admin` o formularios críticos.

## Fase 2 — Limpieza Visual & Anti-AI-Slop (`design-engineer`)
Lee `skills/anti-ai-slop-design/SKILL.md` y `skills/layout-grid-hierarchy/SKILL.md`:
1. Reemplaza fuentes cliché (`Inter`, `Space Grotesk`, `Geist`, `JetBrains Mono`) por una familia aprobada (`Switzer`, `Familjen Grotesk`, `Poppins`, `DM Sans`, `Satoshi`, etc.).
2. Reduce la paleta a **3 colores sólidos** (Base oscura + Base clara cálida `#F6F5F1`/`#FAFAF8` + **1 solo acento protagonista** para CTAs con contraste Frío vs. Cálido).
3. Elimina:
   - Píldoras/eyebrows en MAYÚSCULAS encima de títulos.
   - Puntos finales en `H1`/`H2`.
   - Numeraciones falsas (`01`, `02`, `03`).
   - Bordes innecesarios, degradados gratuitos y badges arcoíris.
4. Dale protagonismo grande a las fotos/producto real y corrige radios concéntricos (`inner = outer - padding`).

## Fase 3 — Ergonomía Móvil & Micro-Interacciones (`ux-mobile-architect`)
Lee `skills/mobile-ux-microinteractions/SKILL.md`:
1. Cambia cualquier `100vh` por `100dvh` (`min-h-dvh`).
2. Asegura `font-size >= 16px` (`text-base`) en todos los `<input>`, `<select>` y `<textarea>` en móvil.
3. Elimina *scroll-hunting*: resultados visibles junto al control o en bottom sheet/modal, más barra CTA fija en móvil si es un flujo largo.
4. Bloquea ancho de tabs (`inline-grid`) y aplica transiciones `150–250ms` `ease-out` sin rebote + `active:scale-[0.97]`.

## Fase 4 — Arquitectura de Sistema / ERP (si aplica) (`frontend-systems-architect`)
Lee `skills/web-systems-erp-architecture/SKILL.md`:
1. Reemplaza inputs de texto libre o `<select>` gigantes (>15 opciones) por un Combobox buscable.
2. Verifica que el historial operativo no se borre (estados + timestamps + índices DB).
3. Organiza el Dashboard en: KPIs (`tabular-nums`) + Gráficos de canal/conversión + Cola de acciones pendientes.

## Fase 5 — Seguridad, SEO y Resiliencia (`security-compliance-auditor`, `seo-growth-strategist`, `production-reliability-qa`)
1. Verifica UUIDs, auth en servidor (`__session` si hay Firebase Hosting/CDN), CORS, rate-limiting y páginas legales (`/privacidad`, `/cookies`, `/terminos`).
2. Verifica `robots.txt`, `sitemap.xml`, un solo `<h1>` por página, JSON-LD y OpenGraph.
3. Verifica `error.tsx`, `not-found.tsx` y fallback de reintento + contacto directo en formularios.
4. Ejecuta `node scripts/audit-site.mjs .` y `npm run build` (0 errores) antes de desplegar.
