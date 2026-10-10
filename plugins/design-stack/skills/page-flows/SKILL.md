---
name: page-flows
description: Research and design multi-step user flows the way Page Flows (pageflows.com) teaches — study how real products sequence a journey, then write a step-by-step flow spec with every screen, decision, state and edge case before building. Use when designing or building any journey that spans more than one screen or step — sign up, login, onboarding, verification, checkout, upgrade, cancellation, invites, uploads, settings changes, KYC, wallet connect, deposits, swaps — or when the user mentions Page Flows, user flows, "how do other apps do X", flow inspiration or competitor teardowns.
---

# Page Flows — flow research and flow specs

Page Flows (pageflows.com) is a paid library of recorded user flows (video + annotated screenshots) from real products across iOS, Android, web and email, filterable by flow type, product and UI element. It has no public API, MCP server or export, and it blocks automated fetching — so this skill gets the *method* working everywhere, and uses the library itself when the person can open it.

The core lesson of Page Flows: **screens are easy, sequences are hard.** Good flows come from studying the order of steps, what's asked when, and how each step recovers from failure — not from one pretty screen.

## Workflow

### 1. Name the flow and its job
Write one line: who the user is, what they're trying to finish, and what "done" looks like for them and for the business. Pick the matching pattern(s) in `references/flow-patterns.md` — a real flow often chains several (sign up → verify email → onboarding → first value).

### 2. Gather references (best source available, in this order)
1. **Page Flows itself, if the person can see it.** Do not try to fetch pageflows.com with web fetch or curl — it's login-walled and blocks bots. If a browser tool that keeps the person's own sign-ins is available (e.g. the Claude desktop app's built-in browser, or Claude in Chrome) and they confirm they have a Page Flows account, open pageflows.com there, search the flow type, filter by platform, and pick 3–5 products from the person's category plus 1–2 best-in-class outliers. Read-only: don't change account settings or download anything. Otherwise ask them to drop in screenshots or a screen recording of the flows they like.
2. **Products the person names** ("do it like Revolut") — work from their screenshots or your general knowledge, and say which.
3. **The bundled pattern library** — `references/flow-patterns.md` — always available; use it to fill gaps and as the checklist for what a flow must handle.

### 3. Tear down each reference (keep it tight)
For each reference flow, capture: number of steps, what's asked at each step and why then, where the value moment lands, how errors and back-navigation are handled, and one thing worth stealing. Then summarise the convergent pattern (what almost everyone does — follow it) vs. the differentiators (deliberate choices worth considering).

### 4. Write the flow spec (the deliverable)
Produce this before any UI code:

```
Flow: <name> — <platform>
Goal: <user goal> → Success = <observable end state>
Entry points: <where users start this flow>

Step 1 — <screen/step name>
  Purpose: …
  Shows: …                     Asks for: …
  Primary action: …            Secondary / escape: …
  States: loading · empty · error (<which errors, exact copy>) · success
  Validation: <inline, on blur / on submit>
  Next: <step> | Branch: <condition> → <step>
…
Exit points & recovery: <abandon mid-way, resume later, deep link back in>
Edge cases: <slow network, session expiry, duplicate account, back button, permissions denied, …>
Copy: <button labels, headings, error text>
Metrics: <step-completion, drop-off, time-to-value>
```

Rules for the spec:
- **Ask for the minimum, as late as possible.** Every field and permission must justify itself at that exact step.
- **One primary action per step.** Always a visible way back or out.
- **Show progress** for 3+ steps (step count or progress bar) and let people resume.
- **Errors say what happened and how to fix it**, next to the field, without wiping input.
- **Never dead-end.** Every failure state has a next action.
- **Confirm destructive or irreversible actions**, and say exactly what will happen.
- **Mirror platform conventions** (iOS sheets/back-swipe, Android back, web URLs per step so refresh/back work).

### 5. Hand off
- Build it — with the `untitled-ui` skill if installed (it maps steps to components and page templates).
- Verify it — with the `checklist-design` skill if installed: its `flows-*` checklists (e.g. submitting a form, making a payment, canceling a subscription, verifying an account, uploading media, showing input errors) audit flows directly.

## Output style
Lead with the spec. Keep teardowns to a short table. Credit references by product name; don't reproduce Page Flows' annotations or screenshots wholesale — describe what you saw in your own words.
