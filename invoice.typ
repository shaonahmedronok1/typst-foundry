// ============================================================
// invoice.typ
// Part of typst-foundry — github.com/shaonahmedronok1/typst-foundry
//
// A clean professional invoice template.
// Use for: freelance work, consulting, any billable service.
// Compile: typst compile invoice.typ
// ============================================================


// ============================================================
// CONFIGURATION — edit these only
// ============================================================

#let your-name    = "Shaon Ahmed Ronok"
#let your-email   = "shaonahmedronok@gmail.com"
#let your-web     = "shaon.neocities.org"
#let your-loc     = "Dhaka"

#let client-name  = "Client Name"
#let client-org   = "Client Organisation"
#let client-email = "client@email.com"

#let invoice-no   = "INV-2026-001"
#let issue-date   = "1 March 2026"
#let due-date     = "15 March 2026"
#let currency     = "USD"

// Line items — (description, quantity, unit price)
#let items = (
  ("Research consultation — 3 sessions", "3", "80.00"),
  ("Written report — 2,400 words", "1", "150.00"),
  ("Revisions and follow-up", "1", "40.00"),
)

#let tax-rate    = 0.0   // set to 0.10 for 10% tax, 0 for none
#let notes       = "Payment due within 14 days. Bank transfer preferred."


// ============================================================
// COMPUTED TOTALS — do not edit
// ============================================================

#let parse-price(s) = {
  float(s)
}

#let subtotal = items.fold(0.0, (acc, item) => {
  acc + float(item.at(1)) * parse-price(item.at(2))
})

#let tax-amount = subtotal * tax-rate
#let total      = subtotal + tax-amount


// ============================================================
// PAGE & TYPOGRAPHY
// ============================================================

#set document(title: "Invoice " + invoice-no, author: your-name)

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.8cm, right: 2.8cm),
)

#set text(
  font: "Libertinus Serif",
  size: 10.5pt,
  lang: "en",
)

#set par(leading: 0.65em)
#show link: it => underline(stroke: 0.4pt, it)


// ============================================================
// COLOURS
// ============================================================

#let accent = rgb("#c2185b")
#let muted  = rgb("#5a3040")
#let light  = rgb("#f5c0d8")
#let bg     = rgb("#fff8fb")


// ============================================================
// HEADER
// ============================================================

#grid(
  columns: (1fr, auto),
  [
    #text(size: 22pt, weight: "bold", tracking: -0.5pt)[#your-name]
    #v(0.2em)
    #text(font: "JetBrainsMono NF", size: 7pt, fill: accent, tracking: 2pt)[
      INVOICE
    ]
  ],
  [
    #set align(right)
    #set text(font: "JetBrainsMono NF", size: 8pt, fill: muted)
    #link("mailto:" + your-email)[#your-email] \
    #link("https://" + your-web)[#your-web] \
    #your-loc
  ],
)

#v(0.5em)
#line(length: 100%, stroke: 2pt + accent)
#v(1.2em)


// ============================================================
// INVOICE META
// ============================================================

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #text(font: "JetBrainsMono NF", size: 7.5pt, fill: accent, tracking: 1.5pt)[BILLED TO]
    #v(0.4em)
    #text(weight: "semibold")[#client-name] \
    #text(fill: muted, size: 10pt)[#client-org] \
    #text(fill: muted, size: 10pt)[#link("mailto:" + client-email)[#client-email]]
  ],
  [
    #text(font: "JetBrainsMono NF", size: 7.5pt, fill: accent, tracking: 1.5pt)[INVOICE DETAILS]
    #v(0.4em)
    #grid(
      columns: (auto, 1fr),
      gutter: (0.5em, 0.3em),
      text(fill: muted, size: 9.5pt)[Invoice No.],
      text(weight: "semibold", size: 9.5pt)[#invoice-no],
      text(fill: muted, size: 9.5pt)[Issue Date],
      text(size: 9.5pt)[#issue-date],
      text(fill: muted, size: 9.5pt)[Due Date],
      text(size: 9.5pt, weight: "semibold", fill: accent)[#due-date],
      text(fill: muted, size: 9.5pt)[Currency],
      text(size: 9.5pt)[#currency],
    )
  ],
)

#v(1.4em)


// ============================================================
// LINE ITEMS TABLE
// ============================================================

// Table header
#block(
  fill: accent,
  width: 100%,
  inset: (x: 12pt, y: 8pt),
  radius: (top: 5pt),
)[
  #grid(
    columns: (1fr, auto, auto, auto),
    gutter: 1em,
    text(fill: white, font: "JetBrainsMono NF", size: 8pt, tracking: 1pt)[DESCRIPTION],
    text(fill: white, font: "JetBrainsMono NF", size: 8pt, tracking: 1pt)[QTY],
    text(fill: white, font: "JetBrainsMono NF", size: 8pt, tracking: 1pt)[UNIT],
    text(fill: white, font: "JetBrainsMono NF", size: 8pt, tracking: 1pt)[TOTAL],
  )
]

// Table rows
#for (i, item) in items.enumerate() {
  let row-fill = if calc.rem(i, 2) == 0 { bg } else { white }
  let line-total = float(item.at(1)) * parse-price(item.at(2))
  block(
    fill: row-fill,
    width: 100%,
    inset: (x: 12pt, y: 9pt),
  )[
    #grid(
      columns: (1fr, auto, auto, auto),
      gutter: 1em,
      text(size: 10pt)[#item.at(0)],
      text(size: 10pt, fill: muted)[#item.at(1)],
      text(size: 10pt, fill: muted)[#item.at(2)],
      text(size: 10pt, weight: "semibold")[#str(line-total)],
    )
  ]
}

#line(length: 100%, stroke: 0.5pt + light)
#v(0.6em)


// ============================================================
// TOTALS
// ============================================================

#align(right)[
  #block(width: 42%)[
    #grid(
      columns: (1fr, auto),
      gutter: (0em, 0.4em),
      text(fill: muted, size: 10pt)[Subtotal],
      text(size: 10pt)[#currency #str(subtotal)],

      ..if tax-rate > 0 {(
        text(fill: muted, size: 10pt)[Tax (#str(int(tax-rate * 100))%)],
        text(size: 10pt)[#currency #str(tax-amount)],
      )},

      line(length: 100%, stroke: 0.5pt + light),
      line(length: 100%, stroke: 0.5pt + light),

      text(weight: "bold", size: 11pt)[Total Due],
      text(weight: "bold", size: 11pt, fill: accent)[#currency #str(total)],
    )
  ]
]

#v(1.4em)


// ============================================================
// NOTES & FOOTER
// ============================================================

#if notes != "" {
  block(
    fill: bg,
    stroke: (left: 3pt + accent),
    inset: (left: 10pt, top: 7pt, bottom: 7pt, right: 8pt),
    radius: (right: 4pt),
    width: 100%,
  )[
    #text(font: "JetBrainsMono NF", size: 7.5pt, fill: accent, tracking: 1.5pt)[NOTE]
    #v(0.25em)
    #text(size: 9.5pt, fill: muted)[#notes]
  ]
}

#v(1fr)
#line(length: 100%, stroke: 0.5pt + light)
#v(0.3em)
#align(center)[
  #text(font: "JetBrainsMono NF", size: 7pt, fill: muted)[
    #your-name · #your-web · #invoice-no
  ]
]
