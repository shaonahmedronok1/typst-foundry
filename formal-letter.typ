// ============================================================
// formal-letter.typ
// Part of typst-foundry — github.com/shaonahmedronok1/typst-foundry
//
// A clean formal letter template.
// Use for: cover letters, scholarship letters, emails to professors,
//          application letters, letters of intent.
// Compile: typst compile formal-letter.typ
// ============================================================


// ============================================================
// CONFIGURATION — edit these only
// ============================================================

#let sender-name   = "Shaon Ahmed Ronok"
#let sender-email  = "shaonahmedronok@gmail.com"
#let sender-web    = "shaon.neocities.org"
#let sender-loc    = "Dhaka"

#let recipient-name  = "Professor / Programme Officer Name"
#let recipient-title = "Title, Department"
#let recipient-org   = "University / Organisation Name"
#let recipient-loc   = "City, Country"

#let date-text = "March 2026"
#let subject   = "Application for — [Programme / Position Name]"

#let salutation = "Dear Professor [Name],"
#let closing    = "Yours sincerely,"


// ============================================================
// PAGE & TYPOGRAPHY
// ============================================================

#set document(title: subject, author: sender-name)

#set page(
  paper: "a4",
  margin: (top: 2.8cm, bottom: 2.5cm, left: 3cm, right: 3cm),
)

#set text(
  font: "Libertinus Serif",
  size: 11pt,
  lang: "en",
)

#set par(
  justify: true,
  leading: 0.78em,
)

#show par: set par(spacing: 0.9em)
#show link: it => underline(stroke: 0.4pt, it)


// ============================================================
// COLOURS
// ============================================================

#let accent = rgb("#c2185b")
#let muted  = rgb("#5a3040")
#let light  = rgb("#f5c0d8")


// ============================================================
// HEADER — sender identity
// ============================================================

#grid(
  columns: (1fr, auto),
  gutter: 1em,
  [
    #text(
      font: "Libertinus Serif",
      size: 18pt,
      weight: "bold",
      tracking: -0.5pt,
    )[#sender-name]
    #v(0.1em)
    #text(fill: accent, font: "JetBrainsMono NF", size: 7pt, tracking: 2pt)[
      INDEPENDENT RESEARCHER · WRITER
    ]
  ],
  [
    #set align(right)
    #set text(font: "JetBrainsMono NF", size: 8pt, fill: muted)
    #link("mailto:" + sender-email)[#sender-email] \
    #link("https://" + sender-web)[#sender-web] \
    #sender-loc
  ],
)

#v(0.4em)
#line(length: 100%, stroke: 2pt + accent)
#v(1.4em)


// ============================================================
// DATE & RECIPIENT
// ============================================================

#text(font: "JetBrainsMono NF", size: 9pt, fill: muted)[#date-text]

#v(1.2em)

#text(weight: "semibold")[#recipient-name] \
#text(fill: muted, size: 10pt)[#recipient-title] \
#text(fill: muted, size: 10pt)[#recipient-org] \
#text(fill: muted, size: 10pt)[#recipient-loc]

#v(1em)

// Subject line
#block(
  fill: rgb("#fff8fb"),
  stroke: (left: 3pt + accent),
  inset: (left: 10pt, top: 7pt, bottom: 7pt, right: 8pt),
  radius: (right: 4pt),
)[
  #text(font: "JetBrainsMono NF", size: 7.5pt, fill: accent, tracking: 1.5pt)[RE: ]
  #text(weight: "semibold", size: 10.5pt)[#subject]
]

#v(1.2em)


// ============================================================
// SALUTATION
// ============================================================

#text(weight: "semibold")[#salutation]

#v(0.8em)


// ============================================================
// LETTER BODY — write your letter below
// ============================================================

// OPENING PARAGRAPH — who you are and why you are writing
I am writing to apply for [programme / position name] at [institution name].
I am an independent researcher and writer based in Dhaka, working at the
intersection of information theory, philosophy of science, and technology
ethics. I am seeking postgraduate study that will give rigorous methodological
grounding to work I have already begun independently.

// PARAGRAPH 2 — what you have done / what makes you serious
Replace this paragraph with your intellectual background. Be specific.
Name the books you have read, the essays you have written, the projects
you have built. Do not describe yourself in adjectives — describe yourself
in facts and let the reader draw the conclusions.

// PARAGRAPH 3 — why this specific programme / person / institution
Replace this paragraph with why _this_ programme specifically. Not why
you want to study in general — why _here_. Reference specific faculty,
specific research groups, specific methodological approaches that align
with your work. Generic letters get generic responses.

// PARAGRAPH 4 — what you will bring / what you are asking for
Replace this paragraph with a direct statement of what you are asking for
and what you offer in return. Be clear. Do not hedge. Committees read
dozens of letters where applicants circle the point without making it.
Make yours the one that states it plainly.

#v(1em)


// ============================================================
// CLOSING
// ============================================================

#text(weight: "semibold")[#closing]

#v(2.5em)

#text(weight: "semibold")[#sender-name] \
#v(0.1em)
#text(font: "JetBrainsMono NF", size: 8.5pt, fill: muted)[#sender-email]

#v(1em)
#line(length: 100%, stroke: 0.5pt + light)
#v(0.4em)
#text(font: "JetBrainsMono NF", size: 7pt, fill: muted)[
  #sender-web · Enclosures: CV attached
]
