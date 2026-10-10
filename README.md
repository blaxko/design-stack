# Design Stack — Page Flows + Untitled UI + Checklist Design

Three design resources turned into one workflow for Claude: **research the flow → build it with real components → audit it before shipping.**

| Skill | Source | What it does |
|---|---|---|
| `page-flows` | Written for this bundle (Page Flows has no API/skill) | Teardown method + a 34-flow pattern library (accounts, onboarding, checkout, cancel, KYC, wallet connect, transactions, swaps, lifecycle email) → a step-by-step flow spec with every state and edge case. Uses pageflows.com in your signed-in browser when available. |
| `untitled-ui` | Written for this bundle + Untitled UI's official AI guide (MIT) | Finds/installs components, page templates and icons via the **official Untitled UI MCP server** and CLI; enforces semantic tokens, React Aria conventions, all states. |
| `checklist-design` | **Official** skill from Checklist Design (MIT, 129 checklists) | `audit` (item-by-item table) or `critique` of any screenshot, URL, Figma frame or source file. |
| `design-stack` | Written for this bundle | Runs all three in order. |

Plus the **Untitled UI MCP server** (`https://www.untitledui.com/react/api/mcp`), auto-registered by the plugin.

## Install — Claude Code (CLI, desktop Code tab, IDE)

**One line, any machine** — in a Claude Code session:
```
/plugin marketplace add blaxko/design-stack
/plugin install design-stack@design-stack
/plugin install checklist-design@design-stack
```
Or from a terminal: `claude plugin marketplace add blaxko/design-stack`, then the two `claude plugin install …` commands.

**From a local copy** (offline / no GitHub):

**Windows:** unzip, open the folder in Terminal, run
```
powershell -ExecutionPolicy Bypass -File .\install.ps1
```
**macOS / Linux / WSL:** `bash install.sh`

If the `claude` CLI isn't on your PATH (desktop-app-only), the script prints three lines to paste into any Claude Code session:
```
/plugin marketplace add <path printed by the script>
/plugin install design-stack@design-stack
/plugin install checklist-design@design-stack
```
Then run `/mcp` → `untitledui` → log in if you own Untitled UI PRO (free components need no login).

Use it:
- `/design-stack:design-stack build the signup and onboarding flow` — full pipeline
- `/design-stack:page-flows`, `/design-stack:untitled-ui` — one phase
- `/checklist-design:checklist-design audit` — review what's on screen
- Or just ask normally ("make the pricing page", "is this checkout complete?") — skills trigger on their own.

Checklist Design is pulled from its GitHub repo, so `/plugin` updates keep its checklists current.

Projects need `npx untitledui@latest init` (Node 18+) before Untitled UI components install.

## Install — Claude app (claude.ai / desktop / mobile)

Upload each zip in `claude-ai-uploads/` in the app's Settings, in the Skills section (upload a skill):
`page-flows.zip`, `untitled-ui.zip`, `checklist-design.zip`, `design-stack.zip`.

Optional: add Untitled UI as a custom connector with URL `https://www.untitledui.com/react/api/mcp` so its component search works there too.

## Licences
Checklist Design skill and Untitled UI's guide are MIT — licence files are included next to them. Page Flows content is not redistributed; the pattern library is original writing.
