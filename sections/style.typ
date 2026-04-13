#let bg-page = rgb("#f4f4f5")
#let fg-main = rgb("#11181c")
#let fg-muted = rgb("#4b5563")
#let line-soft = rgb("#cdd3dc")
#let blue-soft = rgb("#dbeafe")
#let blue-mid = rgb("#1e3a8a")
#let mint-soft = rgb("#e8f7ef")
#let mint-mid = rgb("#22a06b")
#let rose-soft = rgb("#fdebf2")
#let rose-mid = rgb("#d95b8a")

#let radius-card = 11pt
#let radius-pill = 999pt

#set page(
  paper: "a4",
  margin: (x: 1.15cm, y: 1.0cm),
  fill: bg-page,
)

#set text(
  font: ("Libertinus Serif", "New Computer Modern", "Noto Music"),
  size: 9pt,
  fill: fg-main,
)
#set par(justify: false, leading: 0.5em)
#set heading(numbering: none)

#let hero(title, subtitle) = block(
  inset: (x: 2pt, y: 1pt),
)[
  #align(left)[
    #text(size: 17pt, weight: "bold")[#title]
    #linebreak()
    #text(size: 9.2pt, style: "italic", fill: fg-muted)[#subtitle]
  ]
]

#let th(label) = box(
  inset: (x: 0.55em, y: 0.15em),
  fill: blue-soft,
  stroke: (paint: rgb("#93c5fd"), thickness: 0.5pt),
  radius: radius-pill,
)[
  #text(size: 9.6pt, weight: "semibold", fill: blue-mid)[#label]
]

#let badge(label) = {
  let is-hairpin = label == "<" or label == ">"
  if is-hairpin {
    context {
      let base = text(size: 9.5pt, weight: "semibold", fill: blue-mid)[#label]
      let glyph-width = measure(base).width
      let x-scale = 3cm / glyph-width * 100%
      box(
        inset: (x: 0em, y: 0.15em),
        stroke: (paint: rgb("#93c5fd"), thickness: 0.5pt),
        radius: radius-pill,
        fill: blue-soft,
        align(center, scale(x: x-scale, y: 100%, reflow: true, base)),
      )
    }
  } else {
    let is-quiet = label == "p" or label == "mp"
    let is-loud = label == "f" or label == "mf" or label == "sfz"
    let fill-color = if is-quiet { mint-soft } else if is-loud { rose-soft } else { blue-soft }
    let border-color = if is-quiet { rgb("#86d4aa") } else if is-loud { rgb("#f39dbf") } else { rgb("#93c5fd") }
    let text-color = if is-quiet { mint-mid } else if is-loud { rose-mid } else { blue-mid }
    box(
      inset: (x: 0.55em, y: 0.15em),
      stroke: (paint: border-color, thickness: 0.5pt),
      radius: radius-pill,
      fill: fill-color,
      text(size: 7.8pt, weight: "semibold", fill: text-color)[#label],
    )
  }
}

#let badge_plain(label) = {
  let is-hairpin = label == "<" or label == ">"
  if is-hairpin {
    context {
      let base = text(size: 9.5pt, weight: "semibold")[#label]
      let glyph-width = measure(base).width
      let x-scale = 3cm / glyph-width * 100%
      align(center, scale(x: x-scale, y: 100%, reflow: true, base))
    }
  } else {
    text(size: 10pt, weight: "semibold")[#label]
  }
}

#let section(title_de, title_en, body) = block(
  inset: (x: 10pt, y: 9pt),
  fill: white,
  stroke: (paint: line-soft, thickness: 0.95pt),
  radius: radius-card,
)[
  #text(size: 13pt, weight: "bold")[#title_de]
  #body
]

#let inner-row-dividers(row-count, thickness: 0.55pt) = {
  range(1, row-count).map(y =>
    table.hline(y: y, stroke: (paint: line-soft, thickness: thickness))
  )
}
