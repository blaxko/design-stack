# Bento grids

Bento grids (curated at bentogrids.com) show several features at once as tiles of different sizes in one grid, like a bento box. Great for "what's inside" feature overviews; bad when every tile has the same weight or there's no story.

## When to use
- 4–7 features or facts of **different importance**: one hero tile, a couple of medium tiles, a few small ones.
- Each tile can show something real: a mini UI, a live number, a code line, a chart, a short animation.
- Not for: long explanations, step-by-step flows (use a sequence), or 3 equal features (use columns).

## Layout rules
- Desktop: 12-column CSS grid (or 4-column with spans), `gap` 12–24px, consistent radius (12–24px) and padding (20–32px) on every tile.
- Hierarchy through size: hero tile spans 2×2 (or 6–8 cols × 2 rows); secondary 1×2 or 2×1; small 1×1. Two or three distinct sizes, not seven.
- Align tile edges to the grid; no orphan gaps; total rows ≤ 3 on desktop.
- Tablet: collapse to 2 columns keeping the hero tile wide. Mobile: single column, hero first, preserve order of importance.
- Each tile: short title (3–6 words) + one line + visual. Text top-left or bottom-left consistently; visual bleeds to tile edge for polish.
- Colour: mostly neutral tiles, at most one accent tile. Subtle borders or very soft surface shifts, not heavy shadows.

## Implementation sketch
```css
.bento { display:grid; grid-template-columns:repeat(4,1fr); grid-auto-rows:minmax(180px,auto); gap:16px; }
.tile { border-radius:20px; padding:24px; overflow:hidden; }
.tile--hero { grid-column:span 2; grid-row:span 2; }
.tile--wide { grid-column:span 2; }
@media (max-width:900px){ .bento{grid-template-columns:repeat(2,1fr);} }
@media (max-width:600px){ .bento{grid-template-columns:1fr;} .tile--hero,.tile--wide{grid-column:auto;grid-row:auto;} }
```
(Tailwind: `grid grid-cols-4 auto-rows-[minmax(180px,auto)] gap-4`, `col-span-2 row-span-2`, breakpoints `max-md:grid-cols-2 max-sm:grid-cols-1`.)

## Motion (optional)
Tiles fade/rise in with a 40–60ms stagger on first view; hover lifts the visual slightly (scale 1.02, 150–200ms). Respect reduced motion.
