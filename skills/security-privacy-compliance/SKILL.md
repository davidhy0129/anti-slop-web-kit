---
name: security-privacy-compliance
description: Hardens web apps and ERPs against common security flaws: unpredictable UUIDs, server-side auth, CDN/Firebase __session cookies, proxy-aware origin checks, CORS, rate limiting, security headers, secret hygiene, and privacy/cookie compliance.
---

# Security, Privacy & Compliance

Use this skill before deploying any web app or ERP that handles user data, admin panels, bookings, or payments.

## 1. Identity, IDs & Access Control

- **Unpredictable UUIDs (`crypto.randomUUID()`):** Never expose sequential integer IDs (`1, 2, 3`) in public URLs, confirmation links, or APIs (prevents IDOR enumeration).
- **Server-Side Authorization on Every Protected Route:** Never rely only on hiding UI links or client-side checks. Every `GET/POST/PATCH/DELETE` admin endpoint must verify a signed, `HttpOnly` session cookie or verified token on the server.
- **Keep `/admin` Out of Public Navigation:** Do not advertise the admin login button in the main public navbar; keep it accessible via direct URL (`/admin`) or a discreet footer link.

---

## 2. Cookies, Proxies & Origin Validation

### CDN / Firebase Hosting Cookie Stripping Gotcha
- **Critical Production Rule:** Proxies like **Firebase Hosting** strip every incoming cookie **except** a single cookie named `__session` before forwarding requests to Cloud Run / App Hosting / Cloud Functions.
- If your auth cookie is named `admin_session` or `session_token`, users will log in and get logged out immediately on the next request in production even though `localhost` works!
- **Fix:** Name the auth cookie `__session` (`HttpOnly`, `Secure` in production, `SameSite=Lax`, `Path=/`).

### Proxy-Aware Origin / CSRF Protection
- Behind CDNs/proxies (Cloud Run, Vercel, Cloudflare, Firebase Hosting), `request.url` often shows an internal host (`0.0.0.0:8080` or `*.run.app`), while `x-forwarded-host` / `host` contains the public domain (`example.com`, `*.web.app`).
- **Fix:** Validate `Origin` / `Referer` against an explicit allowlist **plus** `x-forwarded-host` and `host`, rather than blindly comparing `origin === new URL(request.url).origin`.

---

## 3. API Hardening & Secret Hygiene

- **Rate Limiting:** Protect login endpoints, AI endpoints, and public submission forms against brute-force and quota drain (per-IP + per-route sliding window).
- **Strict CORS Allowlist:** Never reflect arbitrary `Origin` headers with `Access-Control-Allow-Credentials: true`.
- **HTTP Security Headers:** Set `X-Content-Type-Options: nosniff`, `X-Frame-Options: DENY` (or `SAMEORIGIN`), `Referrer-Policy: strict-origin-when-cross-origin`, and `Strict-Transport-Security` in production.
- **Secret Hygiene:**
  - Never commit `.env.local`, service account JSONs, or API keys to Git.
  - Never expose server-only keys (Gemini, Resend, Stripe, DB admin) in `NEXT_PUBLIC_*` / `VITE_*` client variables.
  - Scope external API keys (restrict HTTP referrers or API permissions in Google Cloud Console).

---

## 4. Privacy, Cookies & Legal Transparency

- **Dedicated Legal Routes:** Ship clear, honest `/privacidad` (Privacy / Habeas Data policy, e.g., Colombia Ley 1581 de 2012 or GDPR), `/cookies` (explaining essential vs analytics cookies), and `/terminos` (Terms, cancellations, warranty boundaries).
- **Cookie Banner with Real Choice:** If analytics/marketing cookies exist, ask consent before loading non-essential trackers and store preference cleanly.
- **Consent Checkbox on Forms:** Require explicit acceptance of the privacy policy before collecting phone numbers, emails, or addresses.
