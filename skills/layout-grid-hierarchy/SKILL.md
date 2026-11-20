---
name: layout-grid-hierarchy
description: Structures visual hierarchy, section rhythm, whitespace, content grids, and product-first media sizing for any website or web application across industries (restaurants, clubs, SaaS, e-commerce, B2B, ERPs).
---

# Layout, Grid & Visual Hierarchy

Use this skill to fix cluttered, repetitive, or empty-feeling pages and organize information so users immediately understand what the product/business does and what action to take.

## 1. Above-the-Fold & Visual Dominance

### "Show the Actual Product Larger"
- Generic AI templates shrink imagery into tiny thumbnails and pad the screen with long paragraphs.
- **Hero Rule:** Left/top holds a crisp headline (`6–10` words max), 1–2 lines of clear value proposition, and 1–2 clear CTAs. The other 55–65% of the hero showcases a **large, high-craft visual** (real photograph, live interactive preview, or clean product UI) with generous concentric rounded corners.
- **Project / Portfolio / Menu Cards:** Media should occupy **65–70% of the card area**, followed by 2–3 crisp data points below (title + key spec/price/outcome). Never overlay 5 badges and 3 paragraphs on top of a photo.

### Clear Contrast Between Navbar and Hero
- Never blend the top navbar seamlessly into a section of the exact same flat color without visual separation or intentional sticky glass/contrast.
- Alternate section backgrounds intentionally (e.g., Dark Hero/Navbar -> Warm Bone `#F6F5F1` -> Crisp `#FFFFFF` -> Deep Contrast Band) so each scroll stop feels structured and scannable.

---

## 2. Density & Grid Discipline by Page Type

Choose layout density based on user intent:

| System Type | Target Density | Preferred Grid | Key Rule |
|---|---|---|---|
| **Landing / Marketing** | Airy, editorial (`py-16` to `py-24`) | 12-col asymmetric (`7/5` or `6/6`) + intentional Bento | Max 1 primary idea per section; avoid wall-of-text |
| **Restaurant / Club / Events** | Visual-first, atmospheric | Full-bleed hero + clean categorized menu/schedule grid | Prices `tabular-nums`, sticky "Reserve / Order" CTA on mobile |
| **E-Commerce / Catalog** | Scannable (`3–4` cols desktop, `2` cols mobile) | Uniform aspect-ratio cards (`aspect-[4/3]` or `aspect-square`) | Instant filter chips + visible stock/price + zero clutter |
| **SaaS / Dashboard / ERP** | High-clarity functional (`p-4` to `p-6`) | Fixed sidebar/top-bar + KPI strip + full-width data workspace | Maximize viewport for tables/work queues, never center-align prose |

---

## 3. Eliminating Clutter & Dead Space

- **Progressive Disclosure:** If a section has 6+ complex options, calculators, or FAQs, use clean interactive tabs, accordions, or flashcards instead of dumping 20 blocks onto the vertical scroll.
- **Equal-Height Grid Integrity:** In multi-card rows, align titles, descriptions, and footer actions (`flex flex-col justify-between h-full`) so cards never look jagged.
- **No "Floating Orphan Elements":** Every badge, status chip, or action button must belong to a clear spatial group (proximity principle).
- **Scannable Copy:** Replace 4-line marketing fluff with concrete bullets (`<= 12` words per bullet) and real numbers.

---

## 4. Domain-Agnostic Section Blueprints

### Marketing / Business Site Flow
1. **Navbar:** Brand mark (left), 3–5 plain-language links (center/right), 1 primary CTA button (right). Keep private `/admin` or staff links out of the main public navbar (place discreetly in footer or direct URL).
2. **Hero:** Clear promise + 1 primary CTA + 1 secondary action + large real visual.
3. **Trust / Logo / Metric Strip:** Real partners, brands served, or verifiable numbers (masked marquee if >5 logos).
4. **Core Offerings / Interactive Selector:** Tabs or visual cards adapted to user's situation (e.g., *Home / Business*, *Dine-in / Catering*, *Starter / Enterprise*).
5. **Real Proof / Case Gallery:** Large photos/outcomes without fake reviews.
6. **Interactive Utility or FAQ:** Pricing estimator, availability checker, or clear myth-vs-fact cards.
7. **Focused Conversion Footer:** Direct CTA + hours/location + legal links (`/privacidad`, `/cookies`, `/terminos`).
