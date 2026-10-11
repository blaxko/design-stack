# More skills — 10 community skill packs

Each zip here is one uploadable skill that bundles a whole repo's skills (a short index + the original skills inside). Upload them in the Claude app's Settings → Skills. They then work in chat and in cloud Code-tab sessions, where plugins aren't available.

| Upload | Source | Use it for | Try |
|---|---|---|---|
| `superpowers.zip` | obra/superpowers | Disciplined coding workflow: brainstorm → plan → build with TDD → debug systematically → verify before "done" → review | "Use superpowers to brainstorm and plan the export feature" |
| `ponytail.zip` | DietrichGebert/ponytail | Write the least code that works; review/audit for over-engineering and tech debt | "/ponytail-review this diff" |
| `ui-ux-pro-max.zip` | nextlevelbuilder/ui-ux-pro-max-skill | Pick styles, palettes, font pairs and a full design system for a product type; brand, banners, slides, Tailwind/shadcn styling | "Generate a design system for a fintech dashboard" |
| `graphify.zip` | Graphify-Labs/graphify | Map a codebase (and docs/PDFs) into a knowledge graph you query instead of grepping | "/graphify ." then "how does auth reach the DB?" |
| `caveman.zip` | JuliusBrussee/caveman | Terse replies to save tokens; terse commits/reviews; compress prompts; lean bug-fix workflows | "/caveman" (say "normal mode" to stop) |
| `agent-skills.zip` | addyosmani/agent-skills | Production engineering lifecycle: /spec, /plan, /build, /test, /review, /webperf, /ship, plus security, perf, CI/CD | "/spec a referral system" |
| `understand-anything.zip` | Egonex-AI/Understand-Anything | Interactive knowledge graph + guided tours of an unfamiliar repo; explain modules; diff impact | "/understand" then "/understand-onboard" |
| `awesome-claude-skills.zip` (sent in chat, not in this repo: the source repo has no licence) | ComposioHQ/awesome-claude-skills (20 picked) | Changelogs from git, MCP server builder, Playwright app testing, posters/canvas art, themes, resumes, lead research, tweet optimizing, and more | "Write a changelog from the last 30 commits" |
| `archify.zip` | tt-a1i/archify | Polished interactive architecture / sequence / data-flow / state diagrams as HTML (+PNG/SVG) | "Archify the architecture of this repo" |
| `impeccable.zip` | pbakaus/impeccable | Design direction and critique that avoids generic AI-looking UI: /impeccable init, audit, critique, polish, bolder, quieter… | "/impeccable audit the landing page" |

Notes
- Graphify needs its CLI: the skill installs it with `pip install graphifyy` when missing.
- Understand Anything needs Node 22+ and pnpm; the skill copies its bundled workspace somewhere writable first.
- Not included from Composio's list: its 832 app-automation skills (need a Composio account), and duplicates of built-in skills (docx, pdf, pptx, xlsx, skill-creator).
- Session-start hooks (superpowers auto-start, caveman always-on) only run in the plugin versions below.

## Local Claude Code sessions (plugin versions, full features incl. hooks)

```
/plugin marketplace add obra/superpowers
/plugin install superpowers@superpowers-dev
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
/plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
/plugin install ui-ux-pro-max@ui-ux-pro-max-skill
/plugin marketplace add JuliusBrussee/caveman
/plugin install caveman@caveman
/plugin marketplace add addyosmani/agent-skills
/plugin install agent-skills@addy-agent-skills
/plugin marketplace add Egonex-AI/Understand-Anything
/plugin install understand-anything@understand-anything
/plugin marketplace add pbakaus/impeccable
/plugin install impeccable@impeccable
```
Graphify: `pip install graphifyy` then `graphify install`. Archify: `npx skills add tt-a1i/archify`.

Licences (MIT / Apache-2.0) are kept inside each zip.
