// ============================================================
// academic-paper.typ
// Part of typst-foundry — github.com/shaonahmedronok1/typst-foundry
//
// A clean academic paper template.
// Usage: fill in the variables at the top, write your content below.
// Compile: typst compile academic-paper.typ
// ============================================================


// ============================================================
// CONFIGURATION — edit these
// ============================================================

#let title    = "Your Paper Title Goes Here: A Subtitle If Needed"
#let author   = "Your Name"
#let affil    = "Independent / Your Institution"
#let email    = "your@email.com"
#let date     = "March 2026"
#let keywords = ("information theory", "philosophy of science", "your keyword")
#let abstract-text = [
  Write your abstract here. One paragraph, 150–250 words. State the problem,
  your approach, your main finding, and why it matters. Committees read this
  first. Make every sentence earn its place.
]


// ============================================================
// PAGE & TYPOGRAPHY SETUP
// ============================================================

#set document(title: title, author: author)

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 3cm),
  numbering: "1",
  number-align: center,
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

#show par: set par(spacing: 0.65em)

// Headings
#set heading(numbering: "1.1")

#show heading.where(level: 1): it => {
  v(1.4em)
  text(size: 12pt, weight: "bold")[#it]
  v(0.5em)
}

#show heading.where(level: 2): it => {
  v(1em)
  text(size: 11pt, weight: "semibold", style: "italic")[#it]
  v(0.4em)
}

#show heading.where(level: 3): it => {
  v(0.8em)
  text(size: 11pt, weight: "regular", style: "italic")[#it]
  v(0.3em)
}

// Links
#show link: it => underline(stroke: 0.5pt, it)

// Footnotes
#set footnote.entry(separator: line(length: 40%, stroke: 0.5pt))


// ============================================================
// COLOURS
// ============================================================

#let accent = rgb("#c2185b")
#let muted  = rgb("#5a3040")
#let rule-c = rgb("#f5c0d8")


// ============================================================
// TITLE BLOCK
// ============================================================

#v(1cm)

#align(center)[
  #block(width: 90%)[
    #text(
      font: "Libertinus Serif",
      size: 20pt,
      weight: "bold",
      hyphenate: false,
    )[#title]
  ]
]

#v(0.8em)

#align(center)[
  #text(size: 11pt, weight: "semibold")[#author] \
  #v(0.15em)
  #text(size: 9.5pt, fill: muted, style: "italic")[#affil] \
  #v(0.1em)
  #text(size: 9pt, fill: muted, font: "JetBrainsMono NF")[#email] \
  #v(0.1em)
  #text(size: 9pt, fill: muted)[#date]
]

#v(1.2em)
#line(length: 100%, stroke: 1.5pt + accent)
#v(0.8em)


// ============================================================
// ABSTRACT
// ============================================================

#block(
  fill: rgb("#fff8fb"),
  stroke: (left: 3pt + accent),
  inset: (left: 14pt, top: 10pt, bottom: 10pt, right: 12pt),
  radius: (right: 5pt),
  width: 100%,
)[
  #text(
    font: "JetBrainsMono NF",
    size: 7.5pt,
    fill: accent,
    tracking: 2pt,
  )[ABSTRACT]
  #v(0.4em)
  #text(size: 10pt, style: "italic")[#abstract-text]
  #v(0.6em)
  #text(font: "JetBrainsMono NF", size: 7.5pt, fill: muted)[
    Keywords: #keywords.join(" · ")
  ]
]

#v(1.2em)
#line(length: 100%, stroke: 0.5pt + rule-c)
#v(1em)


// ============================================================
// PAPER BODY — write your paper below
// ============================================================

= Introduction

Begin your introduction here. State the problem clearly in the first paragraph.
Do not bury the lede. A reader should know what you are arguing within the first
three sentences.

#lorem(80)

= Background

== Theoretical Framework

#lorem(60)

== Prior Work

#lorem(50)

= Argument

== Main Claim

State your central claim here, as directly as possible. One sentence if you can
manage it.

#lorem(70)

== Supporting Evidence

#lorem(65)

=== Primary Evidence

#lorem(40)

=== Secondary Evidence

#lorem(35)

= Discussion

#lorem(80)

= Conclusion

#lorem(50)


// ============================================================
// REFERENCES
// ============================================================

#v(1.5em)
#line(length: 100%, stroke: 0.5pt + rule-c)
#v(0.5em)

#text(
  font: "JetBrainsMono NF",
  size: 7.5pt,
  fill: accent,
  tracking: 2pt,
)[REFERENCES]

#v(0.6em)

// Replace these with your actual references.
// Format: Author, A. (Year). _Title_. Publisher/Journal.

#set par(first-line-indent: 0em, hanging-indent: 1.5em)
#set text(size: 9.5pt)

Deutsch, D. (2011). _The Beginning of Infinity: Explanations That Transform the World_. Allen Lane.

Floridi, L. (2010). _Information: A Very Short Introduction_. Oxford University Press.

Walker, S. I. (2024). _Life As No One Knows It: The Physics of Life's Emergence_. Riverhead Books.

// Add more references above this line.
