# Navbars

Taxonomy from navbar.gallery (550+ examples). Live examples per type: `https://www.navbar.gallery/type/<slug>`.

| Type (slug) | Use when | Watch out for |
|---|---|---|
| **Static / sticky** (`static`) | ≤ 6 top-level links; most marketing sites and apps | Sticky bars should shrink or gain a subtle background/border after scroll, not stay a heavy slab |
| **Dropdown / flyout** (`dropdowns`) | 2–3 groups with a handful of children each | Open on click (and hover on desktop with a delay); keyboard and touch must work; never nest two levels |
| **Mega menu** (`mega-menu`) | Many products/solutions/resources; enterprise or docs-heavy sites | Group with headings, add one-line descriptions, maybe one featured card; keep the panel full-width and aligned to the container |
| **Side bar** (`side-bar`) | Apps, docs, dashboards, portfolios with deep structure | Collapsible, active item obvious, sections grouped; on mobile becomes a drawer |
| **Search bar** (`search-bar`) | Content-heavy sites, stores, docs | ⌘K / Ctrl-K shortcut hint, recent and suggested queries, results as you type |
| **Announcement** (`announcement`) | One timely message: launch, event, status | One line, one link, dismissible, never stacked with a cookie banner and a promo bar |
| **Full screen** (`full-screen`) | Agencies, portfolios, brand-led sites with few pages | Large type, clear close, focus trapped inside, page scroll locked |
| **Breadcrumbs** (`breadcrumbs`) | Hierarchical content: docs, stores, settings | Secondary nav only; current page not a link |

## Must have
- Logo left (links home), primary links, **one** primary CTA right (e.g. "Open app", "Get started"); secondary action as a text link.
- Height 56–72px desktop; links ≥ 14px; hit targets ≥ 44px on touch.
- Active page state; visible focus ring; `nav` landmark with `aria-label`; skip-to-content link.
- Mobile: hamburger or "Menu" button → full-height drawer or sheet with the same links + CTA; body scroll locked while open.
- Don't hide the primary CTA on mobile; keep it in the bar or at the top of the drawer.

## Taste notes
- Transparent over the hero, solid (or blurred backdrop) after ~40px scroll.
- Fewer links beat more: move "Careers", "Press", "Legal" to the footer.
- Product + docs + pricing + login + CTA covers most SaaS/web3 products.
