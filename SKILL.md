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

## Colour roles (most common mistake)

- **Red:** the one primary action per view, progress fill, number-field focus underline, the single
  current-item marker (active object badge). Nothing else.
- **Ink fill + paper text:** chosen segment, active tab, pressed toggle, checked box (`accent-color: ink`).
- **Sunken background:** hover and selected rows. No colour.
- **Destructive:** `--danger` outline + text. Never a filled red, never hover-to-fill.
- Status colours (`--danger/--warning/--success/--info`) are muted text/icon colours; banners use a faint tint.

## New app

1. Copy `tokens.css` then `base.css` (in that order) into the app.
2. Bundle the font locally (apps run offline/Electron): Zen Kaku Gothic New woff2, weights 400 + 500
   only, SIL OFL 1.1 — ship the licence file. Add to the service-worker cache if any.
3. Use `base.css` classes: `.primary`, `.danger`, `.segmented`, `.field-row` + `.number`, `.check`,
   `details/summary`, `.list li.selected/.current`, `.progress-*`, `header`, `footer`, `.panel section`.
4. Labels must fit at 11.5px in en / ja / zh-Hant; long labels wrap the value to its own line, never clip.

## Adding to an existing app (style switch)

Keep the old look as **Original**; add **New** = this style.
- Scope every override under `:root[data-ui-style="new"]`; remap the app's existing tokens to these
  values instead of editing component CSS. Original must stay pixel-identical.
- Set the attribute before first paint (inline script or boot code) from a versioned localStorage
  key, e.g. `<app>-ui-style-v1` → `{ v: 1, style }`, try/catch guarded. Default `new`.
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

Preview of the components: open `preview.html`.
