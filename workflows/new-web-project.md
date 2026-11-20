# Workflow: New Web Project from Minute Zero

Usa este flujo al iniciar cualquier proyecto web nuevo (landing page, restaurante, club, e-commerce, SaaS o ERP) para que nazca limpio, rápido y profesional.

## Paso 1 — Definir Identidad Visual antes de escribir JSX/HTML
Lee `skills/anti-ai-slop-design/SKILL.md`:
1. Elige **1 fuente principal** (máximo 2) fuera de la lista prohibida (ej. `Familjen Grotesk` + `Poppins`, o `Switzer`, o `DM Sans`).
2. Define **exactamente 3 colores** en CSS variables (`--bg-dark`, `--bg-light` cálido, `--accent-cta` opuesto en temperatura).
3. Define el radio base de tarjetas (`rounded-3xl` = `24px`) y la regla concéntrica (`inner = outer - padding`).

## Paso 2 — Arquitectura de Rutas y Datos
Lee `skills/layout-grid-hierarchy/SKILL.md` y `skills/web-systems-erp-architecture/SKILL.md`:
1. Separa rutas públicas (`/`, `/reservar` o `/agendar`, `/privacidad`, `/cookies`, `/terminos`) de rutas privadas (`/admin`) sin exponer `/admin` en el navbar público.
2. Diseña el esquema de base de datos con **UUIDs** (`crypto.randomUUID()`), timestamps (`createdAt`, `updatedAt`), estados de ciclo de vida (sin borrado destructivo de historial) e índices en `date` y `status`.

## Paso 3 — Mobile-First y Micro-Interacciones desde el inicio
Lee `skills/mobile-ux-microinteractions/SKILL.md`:
1. Configura `min-h-dvh`, `text-base` (`16px`) en inputs en móvil y `tabular-nums` en cifras.
2. Envuelve la app en `MotionConfig reducedMotion="user"` y usa duraciones `150–250ms` `ease-out` sin rebote.

## Paso 4 — SEO, Seguridad, PWA y Errores base
Lee `skills/security-privacy-compliance/SKILL.md`, `skills/seo-discoverability-growth/SKILL.md` y `skills/production-reliability-pwa-deploy/SKILL.md`:
1. Crea desde el día 1: `robots.txt`, `sitemap.xml`, JSON-LD, `error.tsx`, `not-found.tsx` y `manifest.webmanifest`.
2. Configura cookie `__session` (`HttpOnly`, `Secure`, `SameSite=Lax`), rate-limiting y validación de origen compatible con proxies (`x-forwarded-host`).
3. Verifica con `node scripts/audit-site.mjs .` y `npm run build`.
