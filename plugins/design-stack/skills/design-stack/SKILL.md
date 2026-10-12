---
name: design-stack
description: End-to-end UI workflow that chains three skills — page-flows (research and spec the journey), untitled-ui (build it from real components), checklist-design (audit it before shipping). Use when asked to design, build, redesign or ship a screen, page, feature or app UI end to end ("build the onboarding", "make the pricing page", "design the settings area", "make this look professional"), or when the user invokes the design-stack skill by name.
argument-hint: "[what to design/build]"
---

# Design stack: Research → Build → Verify

Run these phases in order. Skip a phase only when it clearly doesn't apply (say so in one line). If a named skill isn't installed, follow the phase's fallback.

## Phase 1 — Research the flow (`page-flows`)
- Single static screen with no steps (e.g. an About page)? Skip to Phase 2.
- Otherwise follow the `page-flows` skill: name the flow, gather references, write the flow spec with every step, state and edge case.
- Share the spec with the user before building if the work is large or the direction is ambiguous; otherwise continue.

## Phase 2 — Build with real components (`untitled-ui`)
- Follow the `untitled-ui` skill: check the project is initialised, search the library/page templates for each step in the spec, install with the CLI, compose with semantic tokens.
- Not a React + Tailwind project? Keep the same discipline with the project's own system: reuse existing components, tokens over raw values, every state designed.
- For each landing-page or marketing section (navbar, hero, features/bento, CTA, footer, 404, motion), follow the `web-sections` skill to pick the pattern and pull live references.
- Build every state from the spec — loading, empty, error, success, disabled — not just the happy path.

## Phase 3 — Verify before calling it done (`checklist-design`)
- Render it (dev server + browser preview/screenshot), light and dark, phone and desktop widths.
- Run the `checklist-design` skill in **audit** mode against the closest checklist for each screen (page, component and `flows-*` checklists).
- Fix every 🔴 missing / 🟡 partial item that matters, re-check, then summarise: what shipped, what was deliberately left out and why.

## Output
Finish with: the flow spec (or a link to it), files created/changed, the audit result after fixes, and any open decisions for the user.
