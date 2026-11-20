---
name: web-systems-erp-architecture
description: Architecture and UX patterns for complex web systems, ERPs, CRMs, admin panels, booking consoles, and operational dashboards. Covers immutable history, searchable comboboxes, indexed queries, KPI dashboards, and AI/voice input guardrails.
---

# Web Systems, Dashboards & ERP Architecture

Use this skill when building or upgrading operational web software: ERPs, CRMs, inventory/billing panels, scheduling consoles, medical/field portals, or SaaS admin workspaces.

## 1. Operational Data Integrity

- **Never Hard-Delete Business History:** Past appointments, orders, invoices, or logs must remain accessible via status transitions (`pending`, `completed`, `cancelled`, `archived`) and timestamps (`createdAt`, `updatedAt`). Users need to inspect past months and audit who did what and when.
- **Indexed Queries from Day 1:** Define database indexes on frequently filtered/sorted columns (`date`, `status`, `tenantId`, `createdAt`) so calendars, search, and ledgers stay instant even with thousands of records.
- **Server-Side Pagination & Search:** Never fetch an entire unbounded table to the browser once records grow; paginate or scope by date window/query.

---

## 2. Smart Inputs & High-Speed Data Entry

- **Searchable Combobox > Raw Text or Huge `<select>`:** Whenever a field has >12–15 structured choices (products, vehicle models, clients, SKUs, cities), use a **searchable combobox** with keyboard navigation + an optional `"Other / Custom"` fallback. Never force staff to type raw names inconsistently (which ruins analytics/dashboards).
- **Half-Hour / Flexible Slot Scheduling:** For booking systems, support configurable slot increments (e.g. `:00` and `:30`), automatic filtering of past hours on the current day, and configurable **travel/buffer lead time** so impossible near-term slots cannot be booked.
- **AI / Voice Assist with Guardrails:** When offering voice-to-structured-data (dictation -> JSON items/quotes):
  1. Show a short **dictation guide** right next to the mic button (example phrasing + units) so non-technical staff speak in a format the AI parses accurately.
  2. Always keep **manual edit/add/remove** controls visible as an equal first-class fallback if the AI quota fails or the user is offline.

---

## 3. Actionable Dashboards & Tables

- **Metrics Must Drive Action:** A good dashboard combines:
  1. **KPI Summary Cards** (`tabular-nums`, clear period comparison: this month vs historical).
  2. **Breakdown Charts / Bars** (e.g. revenue/volume by category, lead source / attribution channel, conversion funnel: *Quoted -> Closed/Installed*).
  3. **Actionable Queue** (items needing attention *now*: unconfirmed upcoming appointments with 1-tap reminder actions, overdue invoices, low stock).
- **Table Craft:**
  - Sticky table headers (`sticky top-0`) on scrollable views.
  - Right-align numbers/currency with `tabular-nums`; left-align text.
  - Provide instant search (by client name, phone, ID, address, or tag) and clear status filters.
  - Always include mobile card fallbacks (`md:table` / card list on `< md`) so staff can operate the ERP cleanly from a phone in the field.
