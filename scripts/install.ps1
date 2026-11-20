<#
.SYNOPSIS
Installs anti-slop-web-kit into the current project or globally for Antigravity, Claude Code, Codex, Cursor, and Gemini CLI.

.PARAMETER Target
Target AI tool: all (default), antigravity, claude, codex, cursor, gemini

.PARAMETER Scope
Installation scope: project (default, installs into current directory) or global (installs into user home profile)

.PARAMETER Destination
Optional project path when Scope is 'project'. Defaults to current working directory.

.PARAMETER Force
Overwrite existing AGENTS.md / CLAUDE.md / GEMINI.md if present.
#>
param(
    [ValidateSet("all", "antigravity", "claude", "codex", "cursor", "gemini")]
    [string]$Target = "all",

    [ValidateSet("project", "global")]
    [string]$Scope = "project",

    [string]$Destination = (Get-Location).Path,

    [switch]$Force
)

$ErrorActionPreference = "Stop"
$KitRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

function Copy-DirContents {
    param([string]$Source, [string]$Dest)
    if (-not (Test-Path $Source)) { return }
    New-Item -ItemType Directory -Force -Path $Dest | Out-Null
    Copy-Item -Path (Join-Path $Source "*") -Destination $Dest -Recurse -Force
}

function Copy-FileSafe {
    param([string]$Source, [string]$Dest, [switch]$Overwrite)
    if (-not (Test-Path $Source)) { return }
    $parent = Split-Path -Parent $Dest
    New-Item -ItemType Directory -Force -Path $parent | Out-Null
    if ((Test-Path $Dest) -and -not $Overwrite) {
        Write-Host "  [skip] $Dest already exists (use -Force to overwrite)" -ForegroundColor DarkGray
    } else {
        Copy-Item -Path $Source -Destination $Dest -Force
        Write-Host "  [ok]   $Dest" -ForegroundColor Green
    }
}

Write-Host "`n=== Installing anti-slop-web-kit (Target: $Target | Scope: $Scope) ===" -ForegroundColor Cyan

if ($Scope -eq "global") {
    $HomeDir = $env:USERPROFILE
    if ($Target -in @("all", "antigravity")) {
        Copy-DirContents (Join-Path $KitRoot "skills") (Join-Path $HomeDir ".agents\skills")
        Copy-DirContents (Join-Path $KitRoot "skills") (Join-Path $HomeDir ".gemini\antigravity\skills")
        Write-Host "  [ok]   Antigravity global skills installed" -ForegroundColor Green
    }
    if ($Target -in @("all", "claude")) {
        Copy-DirContents (Join-Path $KitRoot "skills") (Join-Path $HomeDir ".claude\skills")
        Copy-DirContents (Join-Path $KitRoot "agents") (Join-Path $HomeDir ".claude\agents")
        Write-Host "  [ok]   Claude Code global skills & agents installed" -ForegroundColor Green
    }
    if ($Target -in @("all", "codex")) {
        Copy-DirContents (Join-Path $KitRoot "skills") (Join-Path $HomeDir ".codex\skills")
        Write-Host "  [ok]   Codex global skills installed" -ForegroundColor Green
    }
    if ($Target -in @("all", "gemini")) {
        Copy-DirContents (Join-Path $KitRoot "skills") (Join-Path $HomeDir ".gemini\skills")
        Write-Host "  [ok]   Gemini CLI global skills installed" -ForegroundColor Green
    }
    Write-Host "`nDone! Global skills installed. In any project, ask your AI to apply 'anti-ai-slop-design' or 'workflows/full-site-overhaul.md'.`n" -ForegroundColor Cyan
    exit 0
}

# Project scope installation
$DestRoot = (Resolve-Path $Destination).Path

if ($Target -in @("all", "antigravity", "codex")) {
    Copy-DirContents (Join-Path $KitRoot "skills") (Join-Path $DestRoot ".agents\skills")
    Copy-FileSafe (Join-Path $KitRoot "AGENTS.md") (Join-Path $DestRoot "AGENTS.md") -Overwrite:$Force
    Write-Host "  [ok]   .agents/skills & AGENTS.md ready (Antigravity / Codex / Universal)" -ForegroundColor Green
}

if ($Target -in @("all", "claude")) {
    Copy-DirContents (Join-Path $KitRoot "skills") (Join-Path $DestRoot ".claude\skills")
    Copy-DirContents (Join-Path $KitRoot "agents") (Join-Path $DestRoot ".claude\agents")
    Copy-FileSafe (Join-Path $KitRoot "CLAUDE.md") (Join-Path $DestRoot "CLAUDE.md") -Overwrite:$Force
    Write-Host "  [ok]   .claude/skills, .claude/agents & CLAUDE.md ready" -ForegroundColor Green
}

if ($Target -in @("all", "cursor")) {
    Copy-FileSafe (Join-Path $KitRoot ".cursor\rules\anti-slop-web-kit.mdc") (Join-Path $DestRoot ".cursor\rules\anti-slop-web-kit.mdc") -Overwrite:$true
}

if ($Target -in @("all", "gemini")) {
    Copy-DirContents (Join-Path $KitRoot "skills") (Join-Path $DestRoot ".gemini\skills")
    Copy-FileSafe (Join-Path $KitRoot "GEMINI.md") (Join-Path $DestRoot "GEMINI.md") -Overwrite:$Force
}

# Shared workflows, prompts, and static auditor
Copy-DirContents (Join-Path $KitRoot "workflows") (Join-Path $DestRoot "workflows")
Copy-DirContents (Join-Path $KitRoot "prompts") (Join-Path $DestRoot "prompts")
Copy-DirContents (Join-Path $KitRoot "agents") (Join-Path $DestRoot "agents")
Copy-FileSafe (Join-Path $KitRoot "scripts\audit-site.mjs") (Join-Path $DestRoot "scripts\audit-site.mjs") -Overwrite:$true

Write-Host "`nDone! Next step: run 'node scripts/audit-site.mjs .' in $DestRoot`n" -ForegroundColor Cyan
