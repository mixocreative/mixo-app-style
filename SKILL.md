---
name: mixo-app-style
description: Use when building, restyling, or reviewing the UI of a Mixo app or tool (mixomesh, mixosupports, any 3D-print prep, editor, or desktop-style web tool from mixocreative), when asked for "Mixo app style", "our UI style", "the mixosupports look", "dense/compact UI", or when adding a style switch between an app's old look and the Mixo style. Not for Mixo marketing pages or sites (that is Mixo-web).
---

# Mixo App Style

## Overview

House style for Mixo **app UIs**: unbleached paper, warm grey ink, hairlines, one red, flat, **dense**.
Source of truth is `tokens.css` + `base.css` in this folder — copy them, never re-derive values.

**Not Mixo-web.** Mixo-web is the washi/sumi marketing-site shell (warmer `#efe7d8`-type grounds,
brown accent). Do not borrow its palette, fonts or theme toggle for an app.

## Quick reference

| Thing | Value |
|---|---|
| Surfaces (3 steps only) | paper `#f4f2ed`, surface `#fbfaf7`, sunken `#ebe8e1` |
| Lines | `#dcd7cd`, strong `#c4bdb0` |
| Ink / muted | `#3b3631` / `#8a847a` |
| The one accent | red `#7f0019` (hover `#96102b`) |
| Font | Zen Kaku Gothic New; zh-Hant → PingFang TC / Noto Sans TC / Microsoft JhengHei first |
| Density | rows 22px, body 11.5px, header 32px, panel padding 8px, panels ~220/240px |
| Radius | 2px everywhere |
| Shadows | none (only exception: a 3D-viewport glass HUD) |
| Theme | light only — no dark mode unless the owner asks |

## Group headings and collapsibles

- A group heading (`.panel h3`, `summary`) must never look like body text: **ink, weight 700,
  tracked .06em, on a sunken band** (`--row` + 2px tall, 2px radius). Muted or same-weight
  headings blur into the fields under them.
- Collapsible groups use the same band plus a **chevron on the left** (right = closed, down =
  open, turns in `--dur`) and hover → `--line`. No faint `+ / −` at the far right: users miss it.
- Counts in a heading (`.count`) stay weight 400, muted.

## Colour roles (most common mistake)

- **Red:** the one primary action per view, progress fill, number-field focus underline, the single
  current-item marker (active object badge). Nothing else.
- **Ink fill + paper text:** chosen segment, active tab, pressed toggle, checked box (`accent-color: ink`).
- **Sunken background:** hover and selected rows. No colour.
- **Destructive:** `--danger` outline + text. Never a filled red, never hover-to-fill.
- Status colours (`--danger/--warning/--success/--info`) are muted text/icon colours; banners use a faint tint.

## 3D viewport tools and modes

From mixosupports (Support Edit Mode, view toggles). Lay users first.

- **View controls** (e.g. Tips only, Bottom view, Fit view): a small group of plain word buttons
  floating at the viewport's top right, under the mode's own toggle. A toggle that is on = ink fill.
  Move the group (e.g. to bottom right) rather than let a mode bar cover it.
- **A tool mode** gets a red hairline frame round the viewport, a badge top-left naming the mode and
  the current tool in words ("Click supports to select"), and one bar top-right: tool segmented
  control → that tool's options → contextual actions → **Done** (the mode's one primary).
- **Contextual actions** appear only when they apply: "{n} selected" (muted count) + actions.
  Delete there is still `.danger` outline, never a red fill; Clear is a plain button.
- **Input:** never need a key held while dragging, and no right-drag. Every shortcut (Shift/Ctrl+click,
  Delete, Esc) also has a visible button. For brush-like tools, where the drag starts decides: on the
  object = the tool, on empty space = orbit as always. Show it with the cursor: tool ring/icon only
  over the object.
- **Names:** two tools with similar gestures get different words. "Paint / Erase / Brush" only for
  marking a surface; "Select / Drag over / Size" for picking objects. Never reuse one for the other.
- **3D marks are content, not UI accent:** red `#7f0019` marks selected or about-to-be-removed items
  (solid = selected, see-through = preview under the pointer). A different kind of mark gets one
  other colour and one meaning (mixosupports: deep blue `#1d3461` layer = no-support zones on the
  surface). Mark the whole object (e.g. the whole support body), not a dot near it.

## New app

1. Copy `tokens.css` then `base.css` (in that order) into the app.
2. Bundle the font locally (apps run offline/Electron): Zen Kaku Gothic New woff2, weights 400 + 500 + 700 (700 is for group headings only)
   only, SIL OFL 1.1 — ship the licence file. Add to the service-worker cache if any.
3. Use `base.css` classes: `.primary`, `.danger`, `.segmented`, `.field-row` + `.number`, `.check`,
   `details/summary`, `.list li.selected/.current`, `.progress-*`, `header`, `footer`, `.panel section`.
4. Labels must fit at 11.5px in en / ja / zh-Hant; long labels wrap the value to its own line, never clip.

## Adding to an existing app (style switch)

Keep the old look as **Original**; add **New** = this style.
- One extra stylesheet, linked last. Scope every rule under `:root:not([data-ui-style="original"])`
  so New is the default even before JS runs; remap the app's existing tokens first, then override
  only what tokens miss. Add a test that fails on any unscoped selector. Original stays pixel-identical.
- Map the app's generic accent token to **ink** and paint red by name (primary buttons, progress,
  current marker); a red accent token leaks red into every icon, outline and checkbox.
- Apply the stored choice from a versioned localStorage key, e.g. `<app>-ui-style-v1` →
  `{ v: 1, style }`, try/catch guarded, in the earliest script the CSP allows (often a `<head>`
  module, not inline).
- Panel widths set by JS (workspace presets, resize handles) ignore CSS variables: give the JS
  per-style defaults and remember widths per style so Dense sizes never leak into Original.
- Breakpoint-specific grids: scope density overrides to the same media queries the app uses, or
  phone/tablet layouts break.
- Bundled fonts must never inline as `data:` (strict CSP blocks them; set the bundler's inline
  limit to false for fonts). Run the app's packaged/Electron smoke.
- Switch lives next to the language picker; labels translated.
- A 3D-viewport glass HUD keeps its glass material (tint, sheen, shadow) but takes the font, density
  and ink/red states.

## Common mistakes

| Mistake | Fix |
|---|---|
| system-ui / Segoe UI font | Zen Kaku Gothic New, bundled |
| 26–32px rows, 13px text | 22px rows, 11.5px text |
| Accent colour on selected segment/tab | ink fill |
| Blue/indigo or brown accent | red `#7f0019` only |
| 4–8px radius, drop shadows on panels/modals | 2px, hairline border instead |
| Five background shades | paper / surface / sunken |
| Invented dark theme | light only |
| Loading Google Fonts at runtime | local woff2 |
| Muted / uppercase-small group titles that look like body | ink 700 on a sunken band |
| Faint `+`/`−` at the right of a collapsible | left chevron on the heading band |
| Delete as a primary (red-filled) button in a tool bar | `.danger` outline; Done stays the one primary |
| Shift/Alt+drag as the only way to box/brush select | a visible tool button; drag from the object |
| "Brush" for both surface painting and selecting | Paint/Erase for surfaces, Select/Drag over for picking |

Preview of the components: open `preview.html`.
