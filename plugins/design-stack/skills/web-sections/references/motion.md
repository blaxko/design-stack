# Motion and micro-interactions

Vocabulary from 60fps.design (2,000+ real app interaction clips, mostly iOS), translated for the web. Browse clips by tag: `https://60fps.design/shots/filter/<slug>` (e.g. `spring-physics`, `confetti`, `shimmer`, `stagger`, `bottom-sheet`). For iOS/SwiftUI work, use the `60fps-motion` skill (needs the paid 60fps MCP for clip search).

**Gestures:** drag, flick, hold/long-press, pan, pinch, pull (to refresh), scroll, scrub, swipe, tap, typing.
**Patterns:** card stack, carousel, chat, delete, empty state, get-started/onboarding, loading, logo, pricing, reward, setup, shared element, splash, stats, streak, success state, timer.
**Effects:** blur, bounce, color, confetti, draw, fade, glow, grow, morph, parallax, particles, pulse, reveal, shimmer, show/hide, spring physics, stagger, ticker, wiggle, zoom.
**Elements:** badge, bottom sheet, button, card, counter, input, menu, picker, progress, search, slider, tabs, toast, tooltip.

## Where motion earns its place
1. **Feedback:** button press (scale 0.97, 100ms), toggle, copy-to-clipboard tick, form validation shake (small, 200ms).
2. **State change:** loading → skeleton shimmer; success → check draw + short confetti only for real milestones; error → gentle shake + message.
3. **Continuity:** element morphs from list to detail (shared element / View Transitions API), modals and sheets slide from where they came from.
4. **Attention, once:** hero product visual settles in on load; live ticker/feed for activity; number counters that tick to real values.
5. **Scroll storytelling:** reveal on enter with stagger (40–80ms between items), light parallax on one hero layer. Never scroll-jacking.

Leave still: body text, navigation, anything the user reads or repeats often.

## Timing cheatsheet (web)
| Use | Duration | Easing |
|---|---|---|
| Hover/press, colour change | 100–150ms | ease-out / linear |
| Small UI (tooltip, dropdown, toast) | 150–250ms | ease-out in, ease-in out |
| Panels, modals, sheets | 250–400ms | spring (stiffness ~300, damping ~30) or `cubic-bezier(.2,.8,.2,1)` |
| Page/section reveals | 400–700ms, stagger 40–80ms | ease-out |
| Ambient (marquee, ticker) | 20–40s loops | linear |

Tools: CSS transitions + `@keyframes` for most; Motion (Framer Motion) for springs, layout and shared-element animations; View Transitions API for page-to-page continuity.

## Must have
- `@media (prefers-reduced-motion: reduce)` → disable non-essential motion, keep instant state changes.
- Animate `transform` and `opacity` only (60fps); no layout-thrashing properties.
- Interruptible: a new click cancels the running animation cleanly.
- Never delay the user: animations under 400ms on interactive paths; content readable before animations finish.
