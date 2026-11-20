---
name: production-reliability-pwa-deploy
description: Ensures zero-dead-end failure handling (error.tsx, retry + fallback), installable PWA setup (manifest, service worker, icons), database resilience, and fast local-build -> deploy -> git-push workflows with instant rollback.
---

# Production Reliability, PWA & Fast Deployment

Use this skill to make web apps resilient under network failures, installable on mobile home screens, and fast to ship without slow cloud-build bottlenecks.

## 1. Zero-Dead-End Failure Handling

- **Global & Route Error Boundaries:** Always ship `error.tsx` (or framework error boundary) and `not-found.tsx` with plain-language recovery actions (**"Retry"** + **"Return Home"**), never raw stack traces or blank screens.
- **Never Lose a Customer on Network/DB Error:** When a booking, checkout, or contact form submission fails (offline, timeout, 5xx), show a clear inline alert with:
  1. A **Retry** button keeping the user's entered form data intact.
  2. A **Direct Fallback** button (e.g., pre-filled WhatsApp / email / phone link) so the lead or order still reaches the business.
- **AI / Third-Party API Fallbacks:** If an external AI/transcription/email API hits quota or 402/429/500, degrade gracefully with an actionable message and keep manual controls usable.

---

## 2. Installable Mobile PWA (App-Like Experience)

For dashboards, ERPs, booking consoles, and frequent-use portals:
- **`manifest.webmanifest` (or `manifest.ts`):** Set clean `name`, `short_name`, `start_url` (e.g. `/admin` or `/`), `display: "standalone"`, `theme_color`, `background_color`, and crisp `192x192` + `512x512` PNG icons (`purpose: "any maskable"`).
- **Apple Home Screen Support:** Include `apple-touch-icon` (`180x180` PNG) and `appleWebApp: { capable: true, title: "..." }`.
- **Safe Service Worker (`public/sw.js`):** Register cleanly for installability and offline shell resilience without aggressively caching stale authenticated API responses (`NetworkOnly` for `/api/*`).
- **Notifications Reality Check:** Explain clearly to stakeholders that browser push requires user permission (`Notification.requestPermission()`), and **unattended background WhatsApp messages require paid Meta WhatsApp Business Cloud API / Twilio** (otherwise provide automatic **Email** reminders + **1-tap WhatsApp** pre-filled buttons).

---

## 3. Fast, Reliable Deployment Workflow

1. **Always Build & Typecheck Locally First:** Run `npm run build` (and fix 100% of TypeScript/lint errors) before touching production.
2. **Instant Production Deploy Loop (when using Firebase Hosting / Vercel CLI):**
   - Build locally -> deploy hosting/assets directly (`firebase deploy --only hosting` / `vercel --prod`) -> push to GitHub (`git add && git commit && git push`) -> trigger SSR backend rollout if server code changed.
   - This avoids waiting blindly on slow remote CI queues for static/frontend tweaks.
3. **1-Click Rollback Readiness:** Keep commits atomic and descriptive so any regression can be rolled back in 1 click on Vercel/Firebase App Hosting or `git revert`.
4. **Database & Storage Rules:** Never store operational data only in ephemeral `/tmp` or container memory in serverless/Cloud Run environments; persist to a real database (Firestore, Postgres/Supabase, etc.) with defined indexes.
