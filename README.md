# mixo-app-style

House UI style for Mixo apps and tools (mixomesh, mixosupports, …): unbleached paper, warm grey
ink, hairlines, one red, flat, dense. Packaged as an agent skill for Claude Code and Codex.

| File | What |
|---|---|
| `SKILL.md` | The skill: rules, colour roles, how to apply to a new app or add a style switch |
| `tokens.css` | Palette, type, density tokens |
| `base.css` | Components at Dense density (buttons, segmented, fields, lists, header, footer) |
| `preview.html` | Open in a browser to see everything together |

## Install

```powershell
git clone https://github.com/mixocreative/mixo-app-style
cd mixo-app-style
./install.ps1        # Windows: junctions into ~/.claude/skills, ~/.agents/skills, ~/.codex/skills
```

```bash
./install.sh         # macOS / Linux: symlinks, same three folders
```

Update everywhere with `git pull`.

## Font

Zen Kaku Gothic New (SIL Open Font License 1.1). Apps bundle the woff2 files (400, 500) with the
licence; `preview.html` loads it from Google Fonts for convenience only.

## Licence

MIT, see `LICENSE`.
