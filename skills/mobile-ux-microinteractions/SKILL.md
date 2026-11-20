---
name: mobile-ux-microinteractions
description: Enforces strict mobile ergonomics (100dvh, >=16px inputs against iOS zoom, zero scroll-hunting, thumb-zone actions, tab width locking) and crisp Framer Motion / CSS micro-interactions (150-250ms ease-out, zero bounce).
---

# Mobile UX & Snappy Micro-Interactions

Desktop-first sites often break subtly on phones: iOS zooms in on inputs, users click a card and have to scroll blindly to find what changed, and tabs jump sideways when text turns bold. Apply these rules everywhere.

## 1. Non-Negotiable Mobile Ergonomics

### Prevent iOS Safari Auto-Zoom on Inputs
- iOS Safari automatically zooms the viewport whenever a user focuses an `<input>`, `<select>`, or `<textarea>` with `font-size < 16px`.
- **Rule:** Every form control on mobile **must** have `font-size: 16px` (`text-base` in Tailwind on `< sm` breakpoints; you may step down to `md:text-sm` on desktop if desired).

### Use Dynamic Viewport Height (`100dvh`)
- Mobile browser address bars shrink and expand dynamically. `100vh` causes bottom buttons to hide behind Safari/Chrome toolbars.
- **Rule:** Always use `min-h-dvh` / `h-dvh` (`100dvh`), never `100vh`.

### Zero "Scroll-Hunting" After Tapping
- **Anti-pattern:** Clicking a selector/button in the top half of a phone screen updates a panel 600px further down with no feedback, forcing the user to scroll down, then scroll back up to change options.
- **Fix:**
  - Keep interactive results **immediately adjacent** to the controls, OR
  - Automatically open a clean **bottom sheet / drawer / modal** on mobile, OR
  - Provide a smooth, intentional `scrollIntoView({ behavior: "smooth", block: "nearest" })` paired with a clear visual state change.

### Thumb-Zone & Touch Targets
- Minimum interactive target size: `44x44px` (`min-h-[44px] min-w-[44px]`).
- On mobile booking/checkout/form flows, pin the primary submit/next button in a sticky bottom bar (`sticky bottom-0 pb-[env(safe-area-inset-bottom)]`) so the user never hunts for the CTA.
- Never let horizontal tables or long URLs cause `overflow-x` on `<body>` (wrap tables in `overflow-x-auto`).

### Prevent Tab Width Jitter
- When an active tab changes from `font-normal` to `font-semibold`, its width grows slightly and shifts neighboring tabs.
- **Fix:** Render a hidden bold pseudo-label (`inline-grid` stacking normal + `font-semibold invisible` in the same cell) or give tabs fixed `min-w` / `flex-1` widths.

---

## 2. Physics-Based Micro-Interactions (150–250ms)

Interfaces feel robotic when state changes snap instantly, and feel cheap when animations bounce like cartoons.

### Timing & Easing Rules
- **Duration:** `150ms` to `250ms` for UI transitions (modals, tabs, accordions, dropdowns).
- **Easing:** Crisp `ease-out` (`cubic-bezier(0.16, 1, 0.3, 1)`). **Zero spring bounce** on standard business/ERP/SaaS controls.
- **Asymmetry:** Exit animations should be ~20% faster than enter animations (e.g., enter `200ms`, exit `150ms`).

### Required Tactile Feedback
- **Buttons:** Add `active:scale-[0.97] transition-transform duration-150` on all clickable buttons and cards so every tap feels physically responsive.
- **Sliding Tab Indicators:** Use Framer Motion `layoutId="active-tab-pill"` on tab groups so the active background glides smoothly between options instead of blinking.
- **Modals & Drawers:** Enter from `opacity: 0, scale: 0.97` (desktop) or `y: 16` (mobile bottom sheet) to `opacity: 1, scale: 1, y: 0`.
- **Loading & Completion States:** Show clean skeletons or subtle inline spinners during async requests, and brief confirmation feedback when saved.
- **Accessibility:** Respect `@media (prefers-reduced-motion: reduce)` (`MotionConfig reducedMotion="user"` in Framer Motion).
