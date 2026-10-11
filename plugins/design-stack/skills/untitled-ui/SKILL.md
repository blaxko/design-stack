---
name: untitled-ui
description: Build React UI with Untitled UI (React 19 + Tailwind v4 + React Aria) — find, install and compose its components, page templates and icons via the Untitled UI MCP server and CLI, and theme them with its semantic tokens. Use when building or restyling any React/Next.js/Vite interface, adding a page (landing, pricing, dashboard, settings, login, signup), a section or a component (modal, table, select, date picker, file upload), picking icons, or when the user mentions Untitled UI, UUI, or "use a proper component library".
---

# Untitled UI

Untitled UI React is an open-source (MIT) React component library on Tailwind CSS v4 and React Aria, with a PRO tier of extra components and full page templates. Components are copied into the project by a CLI (shadcn-style), so you own and can edit the code.

**Never hand-roll something Untitled UI already ships.** Search first, install, then customise.

## 0. Check the setup (once per project)

1. **Is the project initialised?** Look for `styles/theme.css` containing `--color-brand-*` variables and a `components/base/` folder (often under `src/`).
   - New project: `npx untitledui@latest init` (add `--nextjs` for Next.js; it also offers Vite and TanStack Start). It asks for a brand colour.
   - Existing React + Tailwind v4 project: run `npx untitledui@latest init` in its root, or follow the manual steps in `references/library-guide.md`.
   - Requires Node 18+.
2. **Is the MCP server connected?** If tools like `search_components` / `get_page_templates` (server `untitledui`) are available, use them. If not, tell the user once how to add it and carry on with the CLI:
   `claude mcp add --transport http untitledui https://www.untitledui.com/react/api/mcp`
   Free components need no auth. PRO uses OAuth (a browser login on first PRO request) or `--header "Authorization: Bearer <key>"`.

## 1. Find before you build

With the MCP server:

| Need | Tool |
|---|---|
| A component or section described in words ("split login with testimonial") | `search_components` (`query`, optional `category_filter`: base, application, marketing, foundations, shared-assets) |
| Browse a category | `list_components` |
| A whole page (landing, pricing, dashboard, settings, login, signup, forgot-password, email-verification) | `get_page_templates` (`query`, `page_type`, `category`, `layout`: sidebar / header / full-width) |
| Install one / several | `get_component` / `get_component_bundle` |
| Install a page template (PRO) | `get_page_template_files` |
| Any icon | `search_icons` — **always verify an icon exists before importing it** |

Describe what you want visually and functionally — PRO search is semantic over screenshots, so "dark pricing section with comparison table and billing toggle" beats "pricing".

The tools don't write files: they return a CLI command (e.g. `npx untitledui@latest add pricing-large-table-01 --yes`, or `npx untitledui@latest example dashboards-01/12 --yes`). Run it from the project root. Show the user the screenshot URL / match reason for page-level choices when the choice isn't obvious.

Without the MCP server: `npx untitledui@latest add <component-name>` (e.g. `button`, `input`, `select`, `modal`, `table`). `--overwrite` replaces a local copy with the latest — commit first.

**CLI or MCP can't reach untitledui.com** (common in cloud sessions, where the network only allows GitHub and package registries — `npx untitledui` fails with a network/fetch error, or the MCP server isn't connected): copy the free components from Untitled UI's MIT GitHub repo instead.
1. `git clone --depth 1 https://github.com/untitleduico/react <scratch-dir>/untitledui-src`
2. First time only, copy the foundation into the project: `styles/theme.css`, `styles/globals.css` (merge with the project's own), `styles/typography.css`, `utils/cx.ts`, `utils/is-react-component.ts`, `hooks/`, and install `@untitledui/icons react-aria-components tailwindcss-react-aria-components tailwind-merge tailwindcss-animate` (needs Tailwind v4).
3. Copy only the component folders you need from `components/base`, `components/application`, `components/foundations`, `components/shared-assets` (the free repo has no `marketing` folder), keeping the same paths, and follow their internal imports so nothing is missing.
4. Make the `@/` import alias resolve to where you put them (tsconfig `paths` + bundler alias), then build to confirm.
This route has free components only — no PRO components or page templates — so compose landing/marketing sections from base + application parts.

**PRO errors:** if a tool returns `pro_access_required`, do NOT rebuild that component from scratch. Tell the user it's a PRO item and offer: log in (`npx untitledui@latest login` or the MCP OAuth prompt), or use the closest free component instead.

## 2. Compose it the Untitled UI way

Read `references/library-guide.md` (Untitled UI's own guide for AI assistants) before writing component code — especially the props reference for Button, Input, Select, Checkbox, Badge, Avatar, FeaturedIcon and the COLORS section. The rules that matter most:

- **Semantic tokens only.** Use `text-primary`, `text-secondary`, `text-tertiary`, `bg-primary`, `bg-secondary`, `border-primary`, `fg-brand-primary`, `bg-brand-solid`, `text-error-primary` etc. Never raw palette classes (`text-gray-700`, `bg-purple-600`) or hex values — tokens are what make dark mode and rebranding work.
- **Brand colour** lives in one place: the `--color-brand-25 … 950` scale in `styles/theme.css`. Change the whole scale, never one step.
- Imports from `react-aria-components` are aliased with an `Aria` prefix (`Button as AriaButton`).
- Files are kebab-case (`date-picker.tsx`).
- Icons: named imports from `@untitledui/icons` (free) or `@untitledui-pro/icons` (PRO; `/duocolor`, `/duotone`, `/solid`). Pass components to props (`iconLeading={ChevronDown}`); a JSX element passed to a prop needs `data-icon`. Sizes `size-4/5/6`. Decorative icons get `aria-hidden="true"`.
- Variants: e.g. Button sizes `xs | sm | md | lg | xl` (default `sm`) and colours `primary | secondary | tertiary | link-gray | link-color` plus `-destructive` versions — check the guide for each component's exact props, don't guess.
- Interaction: `transition duration-100 ease-linear` for hover/colour changes; disabled is `disabled:cursor-not-allowed disabled:opacity-50`; use the built-in `isLoading` / `isDisabled` / `isInvalid` props rather than custom state styling.
- Styles in new components follow the `sortCx({ common, sizes, colors })` pattern with `cx()` for merging.

## 3. Design every state, not just the happy path

Untitled UI gives you the parts for each state — use them:
- **Empty:** `application/empty-state` + a `FeaturedIcon`.
- **Loading:** `isLoading` on buttons, `application/loading-indicator`, skeletons for lists/tables.
- **Error:** `isInvalid` + `hint` on inputs; an alert/featured-icon block for page-level failures.
- **Success / feedback:** toast or inline confirmation.
- **Disabled / permission-limited:** disabled props plus a tooltip explaining why.

## 4. Verify

- Run the dev server and look at the result (browser preview, screenshot) in light **and** dark mode, at phone and desktop width.
- If the `checklist-design` skill is installed, run its **audit** on the finished screen and fix anything marked missing or partial before calling it done.

## Reference

- `references/library-guide.md` — Untitled UI's official AI guide: architecture, props for the most-used components, full semantic colour token tables. (MIT, © Untitled UI.)
- Docs: https://www.untitledui.com/react/docs/introduction · Components: https://www.untitledui.com/react/components · Icons: https://www.untitledui.com/icons
