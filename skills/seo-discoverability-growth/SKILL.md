---
name: seo-discoverability-growth
description: Implements technical SEO (robots.txt, sitemap.xml, single H1 hierarchy, JSON-LD structured data, OpenGraph previews) and human search-intent copywriting so real customers find the site on Google and Maps.
---

# SEO & Discoverability Growth

Great design fails if nobody finds the website. Combine clean technical SEO with natural, human search language.

## 1. Technical SEO Checklist

- **`robots.txt`:**
  - Allow all public landing/service pages and public assets (`Allow: /`).
  - Explicitly disallow private or API paths (`Disallow: /admin`, `Disallow: /api/`).
  - Reference `Sitemap: https://<domain>/sitemap.xml`.
- **`sitemap.xml`:**
  - Include every public route with accurate `lastModified`, `changeFrequency`, and `priority`.
  - Exclude `/admin`, `/api/*`, and auth-gated pages.
- **Strict Heading Hierarchy (`H1 -> H2 -> H3`):**
  - **Exactly one `<h1>` per page** containing the core value proposition + primary keyword.
  - Never skip heading levels (e.g., `<h1>` directly to `<h4>`) just for font size; decouple semantic tag from Tailwind text size class.
- **Metadata & Social/WhatsApp Sharing (`OpenGraph` + `Twitter`):**
  - Unique `<title>` (`50–60` chars) and `<meta name="description">` (`140–160` chars) per route.
  - Crisp `og:title`, `og:description`, and `1200x630` `og:image` so links shared on WhatsApp, Slack, LinkedIn, and iMessage render a rich preview card instead of a bare URL.
- **JSON-LD Structured Data:**
  - Embed valid `<script type="application/ld+json">` matching the business type: `LocalBusiness`, `Restaurant`, `SportsActivityLocation`, `SoftwareApplication`, `Store`, or `ProfessionalService` with name, phone, email, service area (`areaServed`), and opening hours.

---

## 2. Human Search-Intent Copywriting

Real customers rarely search internal technical jargon; they search problems, locations, and brands in everyday words:
- Write headings, FAQs, and interactive guides (such as Myth-vs-Reality flashcards) using **the exact questions people type into Google**:
  - *"How much does [service] cost in [city]?"*
  - *"Do I need permission from [HOA/building] for [X]?"*
  - *"[Service] near [neighborhood / city]"*
- Never stuff keywords unnaturally; weave them into genuinely helpful answers.

---

## 3. Off-Code Launch Growth Loop (Share with Site Owner)

1. **Google Search Console:** Verify domain ownership on launch day and submit `/sitemap.xml`.
2. **Google Business Profile (Google Maps):** Create a verified listing with exact service areas, real project photos, and business hours.
3. **Real Client Reviews:** Ask 10–15 satisfied past customers to leave honest Google Maps reviews mentioning the specific service and neighborhood — this drives local discovery faster than any ad.
