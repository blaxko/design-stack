---
name: web-sections
description: Design and build individual website sections to a high standard using pattern libraries distilled from navbar.gallery, footer.design, cta.gallery, 404s.design, unsection.com, bentogrids.com, 60fps.design and the Jiro prompt library: navbars, heroes, feature and bento grids, logos, testimonials, pricing, FAQs, CTAs, footers, 404 pages and UI motion. Use when building, redesigning or reviewing any landing-page or marketing-site section, choosing a navbar, footer, CTA or 404 style, laying out a bento grid, adding micro-interactions or scroll motion, or when the user mentions any of those sites.
---

# Web sections

Eight design libraries, one job: make every section of a site look deliberately designed, not templated. The galleries themselves are browse-only (no API), so this skill carries their **pattern taxonomies + the rules behind good examples**, and tells you how to pull **live examples** when you need fresh references.

## Workflow (per section)

1. **Name the section and its one job.** A navbar orients, a hero states the offer, a CTA converts, a footer catches the leftovers, a 404 recovers the visitor. Write that job in one line before designing.
2. **Pick a pattern from the matching reference file** and say why it fits this product (audience, content volume, brand tone). Don't default to the most common pattern unless it's the right one.
   | Section | Read |
   |---|---|
   | Navbar, announcement bar, mega menu, sidebar, breadcrumbs | `references/navbar.md` |
   | Hero, features, logos, testimonials, stats, pricing, FAQ, team, contact, blog, portfolio | `references/sections.md` |
   | Bento / feature grid | `references/bento.md` |
   | Any call to action (button, form, newsletter, pricing, modal, download) | `references/cta.md` |
   | Footer | `references/footer.md` |
   | 404 / error / not-found page | `references/404.md` |
   | Motion, micro-interactions, scroll effects, loading/success states | `references/motion.md` |
3. **Get real references when the choice matters** (hero, navbar, CTA, footer, 404): see `references/sources.md`. Use 2–4 examples, describe what you're borrowing (structure, spacing, type scale, interaction), never copy brand assets, copy text or illustrations.
4. **Build** with the project's own stack and components (with the `untitled-ui` skill if installed). Tokens over raw values; every section responsive from 360px up.
5. **Check** against the reference file's "Must have" list, then run `checklist-design` audit if installed. For overall taste, `impeccable` critique if installed.

## Page-level rules (apply to every section)

- **One idea per section, one primary action per screen.** If a section needs two headlines, it's two sections.
- **Rhythm:** alternate dense and airy sections; vary layout (text-left, centered, grid, full-bleed) so the page doesn't read as a stack of identical cards.
- **Consistent system:** same container width, gutter, radius set, type scale and button styles on every section. Section padding from one scale (e.g. 64 / 96 / 128px desktop, roughly half on mobile).
- **Real content only.** No fake logos, invented stats, stock testimonials or lorem ipsum in shipped work; if content is missing, leave a clearly marked TODO and tell the user.
- **No AI-template tells:** purple-blue gradients, glowing blobs, everything in cards, emoji bullets, "Unlock / Seamless / Revolutionize" copy, three identical feature cards with icons as the whole page.
- **Accessibility:** semantic landmarks (`header`, `nav`, `main`, `footer`), visible focus states, 4.5:1 text contrast, motion respects `prefers-reduced-motion`.

## Jiro (optional connector)

Jiro (jiro.build) is a library of 1,300+ section and template prompts. If a `jiro` MCP server is connected in this session, search it for the section/template type and use the result as a structural starting point, then apply the rules here. If it isn't connected and the user wants it: Claude app → Settings → Connectors → Add custom connector → `https://mcp.jiro.build` (sign in with a Jiro account); Claude Code CLI: `claude mcp add --transport http jiro https://mcp.jiro.build`, then `/mcp` → jiro → Authenticate. Some templates are premium.
