#!/usr/bin/env node
/**
 * anti-slop-web-kit — Zero-dependency Static Web Quality Auditor
 * Usage: node scripts/audit-site.mjs [target-directory]
 */

import fs from "node:fs";
import path from "node:path";

const targetDir = path.resolve(process.argv[2] || ".");
const IGNORE_DIRS = new Set([
  "node_modules",
  ".next",
  ".git",
  "dist",
  "build",
  ".turbo",
  ".vercel",
  "coverage",
  ".agents",
  ".claude",
  ".gemini",
]);
const CODE_EXTS = new Set([".tsx", ".jsx", ".ts", ".js", ".css", ".scss", ".html", ".vue", ".svelte", ".astro"]);

const BANNED_FONTS = [
  "Inter",
  "Space Grotesk",
  "Bricolage Grotesque",
  "Instrument Sans",
  "Instrument Serif",
  "Fraunces",
  "Playfair Display",
  "JetBrains Mono",
  "Space Mono",
  "Geist",
];

const findings = {
  critical: [],
  design: [],
  mobile: [],
  seo: [],
  info: [],
};

function walk(dir, files = []) {
  if (!fs.existsSync(dir)) return files;
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    if (IGNORE_DIRS.has(entry.name)) continue;
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      walk(full, files);
    } else if (CODE_EXTS.has(path.extname(entry.name).toLowerCase())) {
      files.push(full);
    }
  }
  return files;
}

const allFiles = walk(targetDir);
const rel = (f) => path.relative(targetDir, f);

for (const file of allFiles) {
  const content = fs.readFileSync(file, "utf8");
  const lines = content.split("\n");

  lines.forEach((line, idx) => {
    const lineNum = idx + 1;

    // 1. Banned AI-slop fonts
    for (const font of BANNED_FONTS) {
      const fontRe = new RegExp(`['"\`]${font}['"\`]|\\b${font.replace(/\s+/g, "_")}\\b`, "i");
      if (fontRe.test(line) && !rel(file).includes("audit-site")) {
        findings.design.push(`${rel(file)}:${lineNum} — Cliché AI font detected ("${font}")`);
      }
    }

    // 2. 100vh instead of 100dvh
    if (/\b(100vh|min-h-screen|h-screen)\b/.test(line) && !line.includes("100dvh") && !line.includes("dvh")) {
      findings.mobile.push(`${rel(file)}:${lineNum} — Uses 100vh/h-screen instead of 100dvh (min-h-dvh)`);
    }

    // 3. Small input text (<16px) causing iOS Safari auto-zoom
    if (/<(input|select|textarea)\b/i.test(line) && /\btext-(xs|sm)\b/.test(line) && !/\btext-base\b/.test(line)) {
      findings.mobile.push(`${rel(file)}:${lineNum} — Form control uses text-xs/text-sm without text-base (causes iOS zoom)`);
    }

    // 4. Hardcoded potential secrets
    if (/(AIza[0-9A-Za-z\-_]{35}|re_[A-Za-z0-9_]{20,}|sk_live_[A-Za-z0-9]{20,})/.test(line)) {
      findings.critical.push(`${rel(file)}:${lineNum} — Possible hardcoded API secret detected`);
    }
  });
}

// Check key project-level files
const existsAny = (candidates) => candidates.some((c) => fs.existsSync(path.join(targetDir, c)));

if (!existsAny(["public/robots.txt", "src/app/robots.ts", "app/robots.ts"])) {
  findings.seo.push("Missing robots.txt (public/robots.txt or src/app/robots.ts)");
}
if (!existsAny(["public/sitemap.xml", "src/app/sitemap.ts", "app/sitemap.ts"])) {
  findings.seo.push("Missing sitemap.xml (public/sitemap.xml or src/app/sitemap.ts)");
}
if (!existsAny(["src/app/error.tsx", "app/error.tsx", "src/pages/_error.tsx"])) {
  findings.critical.push("Missing error boundary (src/app/error.tsx or _error.tsx)");
}
if (!existsAny(["public/manifest.webmanifest", "public/manifest.json", "src/app/manifest.ts", "app/manifest.ts"])) {
  findings.info.push("No Web App Manifest found (optional unless PWA installability is desired)");
}

console.log(`\n=== anti-slop-web-kit Audit Report (${rel(targetDir) || "."}) ===`);
console.log(`Scanned ${allFiles.length} source files.\n`);

const printGroup = (title, items) => {
  console.log(`${title} (${items.length})`);
  if (items.length === 0) {
    console.log("  ✓ None detected\n");
    return;
  }
  items.slice(0, 25).forEach((item) => console.log(`  - ${item}`));
  if (items.length > 25) console.log(`  ... and ${items.length - 25} more`);
  console.log("");
};

printGroup("CRITICAL / RELIABILITY & SECRETS", findings.critical);
printGroup("DESIGN / AI-SLOP INDICATORS", findings.design);
printGroup("MOBILE UX ERGONOMICS", findings.mobile);
printGroup("SEO ESSENTIALS", findings.seo);
printGroup("OPTIONAL ENHANCEMENTS", findings.info);

if (findings.critical.length > 0) {
  process.exitCode = 1;
}
