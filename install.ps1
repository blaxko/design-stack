# Design Stack installer for Windows (PowerShell)
# Installs: page-flows + untitled-ui + design-stack skills, the Untitled UI MCP server,
# and the official Checklist Design skill — for Claude Code (CLI, desktop Code tab, IDE).
#
# Usage: right-click the unzipped folder > "Open in Terminal", then:
#   powershell -ExecutionPolicy Bypass -File .\install.ps1

$ErrorActionPreference = "Stop"
$src  = $PSScriptRoot
$home_ = [Environment]::GetFolderPath("UserProfile")
$dest = Join-Path $home_ ".claude\marketplaces\design-stack"

Write-Host "`n== Design Stack installer ==" -ForegroundColor Cyan

# 1. Put the marketplace somewhere permanent (Claude Code reads local plugins from here)
New-Item -ItemType Directory -Force -Path $dest | Out-Null
Copy-Item -Recurse -Force (Join-Path $src ".claude-plugin") $dest
Copy-Item -Recurse -Force (Join-Path $src "plugins") $dest
Write-Host "Copied marketplace to $dest"

$claude = Get-Command claude -ErrorAction SilentlyContinue
if ($claude) {
    # 2. Register marketplace + install both plugins (user scope = every project)
    try { claude plugin marketplace remove design-stack *> $null } catch { }  # ignore if not added yet
    claude plugin marketplace add "$dest"
    claude plugin install design-stack@design-stack
    claude plugin install checklist-design@design-stack
    Write-Host "`nInstalled. Check with: claude plugin list" -ForegroundColor Green
} else {
    # No claude CLI on PATH (e.g. you only use the desktop app's Code tab): finish in-app.
    Write-Host "`nNo 'claude' CLI on PATH. Finish in any Claude Code session (desktop Code tab works) by typing these three lines:" -ForegroundColor Yellow
    Write-Host "  /plugin marketplace add $dest"
    Write-Host "  /plugin install design-stack@design-stack"
    Write-Host "  /plugin install checklist-design@design-stack"
}

Write-Host "`nNext: open a session, run /mcp, and log in to 'untitledui' if you have Untitled UI PRO (free components need no login)."
Write-Host "Try:  /design-stack:design-stack build a signup + onboarding flow`n"
