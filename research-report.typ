// ============================================================
// research-report.typ
// Part of typst-foundry — github.com/shaonahmedronok1/typst-foundry
//
// A structured research report template.
// Use for: independent research, project reports, working papers,
//          scholarship research proposals, committee submissions.
// Compile: typst compile research-report.typ
// ============================================================


// ============================================================
// CONFIGURATION — edit these only
// ============================================================

#let title       = "Research Report Title"
#let subtitle    = "A Working Paper"
#let author      = "Shaon Ahmed Ronok"
#let affil       = "Independent Researcher"
#let email       = "shaonahmedronok@gmail.com"
#let web         = "shaon.neocities.org"
#let date        = "March 2026"
#let version     = "v0.1 — Draft"

#let executive-summary = [
  One paragraph. Maximum 200 words. State: what question you investigated,
  what method you used, what you found, and what it means. This is the only
  part most readers will read. Make it work completely on its own.
]


// ============================================================
// PAGE & TYPOGRAPHY
// ============================================================

#set document(title: title, author: author)

#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 2.5cm, left: 0cm, right: 0cm),
  numbering: "1",
  number-align: center,
  header: context {
    if counter(page).get().first() > 1 {
      block(
        fill: rgb("#fff8fb"),
        width: 100%,
        inset: (x: 3cm, y: 0.6cm),
      )[
        #grid(
          columns: (1fr, auto),
          text(font: "JetBrainsMono NF", size: 7.5pt, fill: rgb("#c2185b"))[#title],
          text(font: "JetBrainsMono NF", size: 7.5pt, fill: rgb("#5a3040"))[#author · #date],
        )
      ]
      line(length: 100%, stroke: 0.5pt + rgb("#f5c0d8"))
    }
  }
)

#set text(
  font: "Libertinus Serif",
  size: 11pt,
  lang: "en",
)

#set par(
  justify: true,
  leading: 0.75em,
  first-line-indent: 1.5em,
)

#show par: set par(spacing: 0.7em)

#set heading(numbering: "1.1")

#show heading.where(level: 1): it => {
  v(1.6em)
  block(
    fill: rgb("#fff8fb"),
    stroke: (left: 3pt + rgb("#c2185b")),
    inset: (left: 12pt, top: 8pt, bottom: 8pt, right: 10pt),
    radius: (right: 5pt),
    width: 100%,
  )[
    #text(size: 12pt, weight: "bold")[#it]
  ]
  v(0.5em)
}

#show heading.where(level: 2): it => {
  v(1em)
  text(size: 11pt, weight: "semibold", style: "italic", fill: rgb("#5a3040"))[#it]
  v(0.4em)
}

#show heading.where(level: 3): it => {
  v(0.7em)
  text(size: 10.5pt, style: "italic")[#it]
  v(0.3em)
}

#show link: it => underline(stroke: 0.4pt, it)


// ============================================================
// COLOURS
// ============================================================

#let accent = rgb("#c2185b")
#let muted  = rgb("#5a3040")
#let light  = rgb("#f5c0d8")
#let bg     = rgb("#fff8fb")


// ============================================================
// COVER BLOCK
// ============================================================

#block(
  fill: accent,
  width: 100%,
  inset: (x: 3cm, top: 3cm, bottom: 2.5cm),
)[
  #text(
    font: "JetBrainsMono NF",
    size: 7.5pt,
    fill: white,
    tracking: 3pt,
  )[RESEARCH REPORT]

  #v(0.8em)

  #text(
    font: "Libertinus Serif",
    size: 24pt,
    weight: "bold",
    fill: white,
    hyphenate: false,
  )[#title]

  #if subtitle != "" {
    v(0.4em)
    text(
      font: "Libertinus Serif",
      size: 13pt,
      fill: rgba(255,255,255,180),
      style: "italic",
    )[#subtitle]
  }

  #v(1.5em)
  #line(length: 100%, stroke: 0.5pt + rgba(255,255,255,80))
  #v(0.8em)

  #grid(
    columns: (1fr, auto),
    [
      #text(fill: white, size: 11pt, weight: "semibold")[#author] \
      #text(fill: rgba(255,255,255,180), size: 9.5pt)[#affil] \
      #text(fill: rgba(255,255,255,180), font: "JetBrainsMono NF", size: 8.5pt)[#email]
    ],
    [
      #set align(right)
      #text(fill: rgba(255,255,255,180), font: "JetBrainsMono NF", size: 8.5pt)[
        #date \
        #version \
        #web
      ]
    ],
  )
]


// ============================================================
// BODY STARTS — page margin now applies
// ============================================================

#set page(margin: (top: 1.5cm, bottom: 2.5cm, left: 3cm, right: 3cm))
#v(1.2em)


// ============================================================
// EXECUTIVE SUMMARY
// ============================================================

#block(
  fill: bg,
  stroke: (left: 3pt + accent),
  inset: (left: 14pt, top: 12pt, bottom: 12pt, right: 12pt),
  radius: (right: 6pt),
  width: 100%,
)[
  #text(font: "JetBrainsMono NF", size: 7.5pt, fill: accent, tracking: 2pt)[EXECUTIVE SUMMARY]
  #v(0.5em)
  #text(size: 10.5pt, style: "italic")[#executive-summary]
]

#v(0.5em)


// ============================================================
// REPORT BODY — write your report below
// ============================================================

= Introduction and Research Question

State your research question in the first paragraph. One sentence,
as clear and specific as possible.

#lorem(70)

= Background and Context

== Theoretical Framework

#lorem(55)

== Existing Literature

#lorem(50)

= Methodology

== Data Sources

#lorem(40)

== Method of Analysis

#lorem(45)

=== Primary Method

#lorem(30)

=== Limitations

#lorem(25)

= Findings

== Main Finding

#lorem(60)

== Secondary Findings

#lorem(50)

= Discussion and Implications

#lorem(70)

= Conclusion and Next Steps

#lorem(45)


// ============================================================
// REFERENCES
// ============================================================

#v(1.5em)
#line(length: 100%, stroke: 0.5pt + light)
#v(0.5em)

#text(font: "JetBrainsMono NF", size: 7.5pt, fill: accent, tracking: 2pt)[REFERENCES]

#v(0.6em)

#set par(first-line-indent: 0em, hanging-indent: 1.5em)
#set text(size: 9.5pt)

Floridi, L. (2010). _Information: A Very Short Introduction_. Oxford University Press.

Walker, S. I. (2024). _Life As No One Knows It: The Physics of Life's Emergence_. Riverhead Books.

Deutsch, D. (2011). _The Beginning of Infinity_. Allen Lane.

// Add references above this line.


// ============================================================
// FOOTER NOTE
// ============================================================

#v(1em)
#line(length: 100%, stroke: 0.5pt + light)
#v(0.3em)
#text(font: "JetBrainsMono NF", size: 7pt, fill: muted)[
  #author · #web · #version · This document was typeset with Typst.
]
