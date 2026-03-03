# typst-foundry

A collection of clean, professional Typst templates for academic and professional work.

Built with deliberate typography, consistent aesthetic, and zero unnecessary complexity. Every template compiles to a production-ready PDF in one command.

---

## Templates

| File | Purpose | Best For |
|---|---|---|
| `academic-paper.typ` | Structured academic paper | Essays, submissions, coursework, research |
| `formal-letter.typ` | Formal correspondence | Scholarship letters, professor emails, cover letters |
| `invoice.typ` | Professional invoice | Freelance billing, consulting, client work |
| `research-report.typ` | Long-form research report | Working papers, proposals, independent research |
| `slides.typ` | Presentation slides | Conference talks, interviews, research pitches |

---

## Usage

### Requirements

- [Typst](https://typst.app) installed — `brew install typst` or see [typst.app/docs](https://typst.app/docs)
- Fonts: `Libertinus Serif` and `JetBrainsMono NF` — check what you have with `typst fonts`

### Compile any template

```sh
typst compile academic-paper.typ
typst compile formal-letter.typ
typst compile invoice.typ
typst compile research-report.typ
typst compile slides.typ
```

Output is a `.pdf` file in the same directory. Open it. Done.

### Customise

Every template has a **CONFIGURATION block at the top** — clearly marked. Edit only those variables. The rest of the file does not need touching for standard use.

Example from `academic-paper.typ`:

```typst
#let title    = "Your Paper Title Goes Here"
#let author   = "Your Name"
#let affil    = "Your Institution"
#let email    = "your@email.com"
#let date     = "March 2026"
```

Change those. Compile. Done.

---

## Design Principles

- **One command compile** — no build systems, no dependencies beyond Typst itself
- **Configuration at the top** — all user-facing variables in one clearly marked block
- **Consistent aesthetic** — same colour palette, typography rhythm, and visual language across all templates
- **Documented** — every structural choice has a comment explaining what it does and why
- **No bloat** — nothing in these files that doesn't earn its place

---

## Font Notes

These templates use:

- `Libertinus Serif` — open-source serif, available via most Linux package managers and directly from [GitHub](https://github.com/alerque/libertinus)
- `JetBrainsMono NF` — Nerd Font patched version of JetBrains Mono, available via [Nerd Fonts](https://www.nerdfonts.com)

If you don't have these, run `typst fonts` to see what's available on your system and substitute at the top of any template:

```typst
#set text(font: "Your Available Font Here")
```

---

## Structure

```
typst-foundry/
├── academic-paper.typ
├── formal-letter.typ
├── invoice.typ
├── research-report.typ
├── slides.typ
└── README.md
```

---

## License

MIT — use these for anything. Personal, academic, commercial. No restrictions.

If you build something with them, a star on the repo is appreciated but not required.

---

## Author

**Shaon Ahmed Ronok** — independent researcher and writer.

[shaon.neocities.org](https://shaon.neocities.org) · [github.com/shaonahmedronok1](https://github.com/shaonahmedronok1)
