// ============================================================
// slides.typ
// Part of typst-foundry — github.com/shaonahmedronok1/typst-foundry
//
// A clean presentation slides template.
// Use for: academic presentations, conference talks,
//          scholarship interviews, research pitches.
// Compile: typst compile slides.typ
// Output:  one slide per page, A5 landscape
// ============================================================


// ============================================================
// CONFIGURATION — edit these only
// ============================================================

#let talk-title    = "Your Talk Title"
#let talk-subtitle = "Conference / Occasion Name"
#let speaker       = "Shaon Ahmed Ronok"
#let affil         = "Independent Researcher"
#let date-text     = "March 2026"
#let web           = "shaon.neocities.org"


// ============================================================
// PAGE & TYPOGRAPHY
// ============================================================

#set document(title: talk-title, author: speaker)

#set page(
  paper: "presentation-16-9",
  margin: (x: 1.8cm, y: 1.4cm),
  numbering: "1 / 1",
  number-align: right + bottom,
  footer: context {
    let pg = counter(page).get().first()
    if pg > 1 {
      line(length: 100%, stroke: 0.5pt + rgb("#f5c0d8"))
      v(0.2em)
      grid(
        columns: (1fr, auto, 1fr),
        text(font: "JetBrainsMono NF", size: 6.5pt, fill: rgb("#5a3040"))[#speaker],
        align(center, text(font: "JetBrainsMono NF", size: 6.5pt, fill: rgb("#c2185b"))[#talk-title]),
        align(right, text(font: "JetBrainsMono NF", size: 6.5pt, fill: rgb("#5a3040"))[#date-text]),
      )
    }
  }
)

#set text(font: "Libertinus Serif", size: 18pt, lang: "en")
#set par(leading: 0.7em, justify: false)


// ============================================================
// COLOURS
// ============================================================

#let accent  = rgb("#c2185b")
#let muted   = rgb("#5a3040")
#let light   = rgb("#f5c0d8")
#let bg      = rgb("#fff8fb")
#let dark-bg = rgb("#1a000d")


// ============================================================
// HELPERS
// ============================================================

// Full-bleed coloured section divider slide
#let divider-slide(label) = {
  set page(margin: 0pt, footer: none, numbering: none)
  block(
    fill: accent,
    width: 100%,
    height: 100%,
    inset: 2cm,
  )[
    #align(horizon)[
      #text(
        font: "JetBrainsMono NF",
        size: 11pt,
        fill: white,
        tracking: 3pt,
      )[#upper(label)]
    ]
  ]
}

// Standard content slide
#let slide(title, body) = {
  v(0.3em)
  text(
    font: "Libertinus Serif",
    size: 22pt,
    weight: "bold",
    fill: accent,
  )[#title]
  v(0.1em)
  line(length: 100%, stroke: 1.5pt + light)
  v(0.5em)
  body
  pagebreak(weak: true)
}

// Two-column slide
#let slide-two-col(title, left, right) = {
  v(0.3em)
  text(size: 22pt, weight: "bold", fill: accent)[#title]
  v(0.1em)
  line(length: 100%, stroke: 1.5pt + light)
  v(0.5em)
  grid(
    columns: (1fr, 1fr),
    gutter: 1.4em,
    left,
    right,
  )
  pagebreak(weak: true)
}

// Quote slide
#let quote-slide(q, attribution: "") = {
  set page(margin: 0pt, footer: none)
  block(
    fill: bg,
    width: 100%,
    height: 100%,
    inset: 2.5cm,
  )[
    #align(horizon)[
      #line(length: 60pt, stroke: 2pt + accent)
      #v(0.6em)
      #text(font: "Libertinus Serif", size: 22pt, style: "italic")[#q]
      #if attribution != "" {
        v(0.8em)
        text(font: "JetBrainsMono NF", size: 10pt, fill: muted)[— #attribution]
      }
    ]
  ]
  pagebreak(weak: true)
}

// Highlight box for use inside slides
#let highlight(body) = block(
  fill: bg,
  stroke: (left: 3pt + accent),
  inset: (left: 12pt, top: 8pt, bottom: 8pt, right: 10pt),
  radius: (right: 4pt),
  width: 100%,
  body,
)


// ============================================================
// SLIDE 1 — TITLE SLIDE
// ============================================================

#set page(margin: 0pt, footer: none, numbering: none)

#block(
  fill: dark-bg,
  width: 100%,
  height: 100%,
  inset: 0pt,
)[
  #block(
    fill: accent,
    width: 8pt,
    height: 100%,
  )
  #place(
    left + horizon,
    dx: 1.8cm,
    dy: 0pt,
    block(width: 85%)[
      #text(
        font: "JetBrainsMono NF",
        size: 9pt,
        fill: rgba(255,255,255,150),
        tracking: 2pt,
      )[#upper(talk-subtitle)]
      #v(0.6em)
      #text(
        font: "Libertinus Serif",
        size: 32pt,
        weight: "bold",
        fill: white,
        hyphenate: false,
      )[#talk-title]
      #v(1em)
      #line(length: 80pt, stroke: 1.5pt + accent)
      #v(0.6em)
      #text(fill: white, size: 14pt, weight: "semibold")[#speaker] \
      #text(fill: rgba(255,255,255,180), size: 11pt)[#affil] \
      #text(font: "JetBrainsMono NF", fill: rgba(255,255,255,150), size: 9pt)[#date-text · #web]
    ]
  )
]

#pagebreak()

// Reset page style for content slides
#set page(
  margin: (x: 1.8cm, y: 1.4cm),
  numbering: "1 / 1",
  number-align: right + bottom,
)


// ============================================================
// SLIDES — edit / add / remove below
// ============================================================

// --- AGENDA ---
#slide("Agenda")[
  #set text(size: 16pt)
  #v(0.3em)
  + Introduction and research question
  + Background and context
  + Main argument
  + Evidence
  + Implications
  + Conclusion and questions
]


// --- SECTION DIVIDER ---
#divider-slide("01 — Introduction")


// --- CONTENT SLIDE ---
#slide("The Question")[
  #set text(size: 16pt)

  State your central research question here in one sentence.

  #v(0.5em)

  #highlight[
    #text(size: 15pt, style: "italic")[
      "The question, stated as directly as possible."
    ]
  ]

  #v(0.5em)
  #text(size: 14pt, fill: muted)[
    Why this question matters, in two sentences.
  ]
]


// --- TWO COLUMN SLIDE ---
#slide-two-col("Context")[
  #set text(size: 14pt)
  *Left side* \
  #v(0.3em)
  Use this column for the problem or background. Keep it to 3–4 bullet points maximum.

  #v(0.4em)
  - Point one
  - Point two
  - Point three
][
  #set text(size: 14pt)
  *Right side* \
  #v(0.3em)
  Use this column for your response or your data. Mirror structure of left column.

  #v(0.4em)
  - Response one
  - Response two
  - Response three
]


// --- SECTION DIVIDER ---
#divider-slide("02 — Argument")


// --- CONTENT SLIDE ---
#slide("Main Claim")[
  #set text(size: 16pt)

  #highlight[
    #text(size: 16pt, weight: "semibold")[
      Your central claim in one sentence. Be direct. Do not hedge.
    ]
  ]

  #v(0.7em)
  Supporting point one.

  #v(0.3em)
  Supporting point two.

  #v(0.3em)
  Supporting point three.
]


// --- QUOTE SLIDE ---
#quote-slide(
  "The architecture of an information environment determines not just what people know — but what they are capable of wanting to know.",
  attribution: "Shaon Ahmed Ronok"
)


// --- SECTION DIVIDER ---
#divider-slide("03 — Evidence")


// --- CONTENT SLIDE ---
#slide("Evidence")[
  #set text(size: 15pt)

  Present your evidence here. Data, examples, citations.
  Keep slides sparse — one idea per slide is better than five ideas crammed together.

  #v(0.5em)
  #highlight[
    Key finding or data point goes here, set apart so it reads first.
  ]
]


// --- SECTION DIVIDER ---
#divider-slide("04 — Conclusion")


// --- CONTENT SLIDE ---
#slide("Conclusion")[
  #set text(size: 16pt)

  Restate your answer to the opening question.

  #v(0.4em)
  - What you found
  - What it means
  - What comes next

  #v(0.5em)
  #text(size: 13pt, fill: muted)[
    Contact: #web · #speaker
  ]
]


// --- FINAL SLIDE ---
#set page(margin: 0pt, footer: none, numbering: none)
#block(
  fill: accent,
  width: 100%,
  height: 100%,
  inset: 2.5cm,
)[
  #align(horizon)[
    #text(font: "Libertinus Serif", size: 30pt, weight: "bold", fill: white)[
      Thank you.
    ]
    #v(0.6em)
    #text(font: "JetBrainsMono NF", size: 10pt, fill: rgba(255,255,255,200))[
      Questions welcome. \
      #web · #speaker
    ]
  ]
]
