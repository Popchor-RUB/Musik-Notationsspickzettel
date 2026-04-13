#set page(
  paper: "a4",
  margin: (x: 1.2cm, y: 1.0cm),
)

#set text(font: ("New Computer Modern", "Noto Music"), size: 9pt)
#set par(justify: false, leading: 0.45em)
#set heading(numbering: none)

#let badge(label) = {
  let is-hairpin = label == "<" or label == ">"
  if is-hairpin {
    context {
      let base = text(size: 9.5pt, weight: "semibold")[#label]
      let glyph-width = measure(base).width
      let x-scale = 3cm / glyph-width * 100%
      box(
        inset: (x: 0.0em, y: 0.15em),
        stroke: (paint: luma(180), thickness: 0.5pt),
        radius: 2pt,
        fill: luma(245),
        align(center, scale(x: x-scale, y: 100%, reflow: true, base)),
      )
    }
  } else {
    box(
      inset: (x: 0.35em, y: 0.15em),
      stroke: (paint: luma(180), thickness: 0.5pt),
      radius: 2pt,
      fill: luma(245),
      text(size: 8pt, weight: "semibold")[#label],
    )
  }
}

#let section(title_de, title_en, body) = {
  block[
    #text(size: 11pt, weight: "bold")[#title_de]
    #if title_en != "" {
      h(0.6em)
      text(size: 9pt, style: "italic")[#title_en]
    }
    #v(0.25em)
    #body
  ]
}
