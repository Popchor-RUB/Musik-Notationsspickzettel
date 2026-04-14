#import "style.typ": *
#import "@preview/scorify:0.1.1": melody

#let ganze_note_symbol = [𝅝]
#let halbe_note_symbol = [𝅗𝅥]
#let viertel_note_symbol = [𝅘𝅥]
#let achtel_note_symbol = box[#move(dy: -0.4mm)[𝅘𝅥𝅮]]
#let sechzehntel_note_symbol = box[#move(dy: -0.4mm)[𝅘𝅥𝅯]]

#let ganze_pause_symbol = box[#move(dy: -0.3mm)[𝄻]]
#let halbe_pause_symbol = box[#move(dy: -0.3mm)[𝄼]]
#let viertel_pause_symbol = box[#move(dy: -0.8mm)[𝄽]]
#let achtel_pause_symbol = box[#move(dy: -0.8mm)[𝄾]]
#let sechzehntel_pause_symbol = box[#move(dy: -1.5mm)[𝄿]]
#let punktierte_viertel_note_symbol = box[𝅘𝅥#h(0.3mm).]
#let punktierte_viertel_pause_symbol = box[#move(dy: -0.8mm)[𝄽·]]


#let achtel_beam = text(size: 19pt, font: "Noto Music")[♫]
#let sechzehntel_beam = text(size: 19pt, font: "Noto Music")[♬]


#let duration_table = table(
  columns: (auto, auto, auto, auto, auto),
  inset: 4.2pt,
  stroke: none,
  align: horizon,
  table.header(
    [#th("Aussehen")], [#th("Name")], [#th("Wert (Schläge)")], [#th("Zählhilfe")], [#th("Nächste Note auf...")],
  ),
  ..inner-row-dividers(7),
  [#align(center + horizon, [#ganze_note_symbol / #ganze_pause_symbol])], [Ganze Note], [4 = 2x Halbe oder\ 4x Viertel], [1 - 2 - 3 - 4], [...1 vom nächsten Takt],
  [#align(center + horizon, [#halbe_note_symbol / #halbe_pause_symbol])], [Halbe Note], [2 = 2x Viertel], [1 - 2 - 3 - 4], [...3],
  [#align(center + horizon, [#viertel_note_symbol / #viertel_pause_symbol])], [Viertelnote], [1 = 2x Achtel], [1 - 2 - 3 - 4], [...2],
  [#align(center + horizon, [#box([#move(dy: -0.6mm, [#achtel_note_symbol#h(0.5mm)/#achtel_beam/#h(0.5mm)#achtel_pause_symbol])])])], [Achtelnote], [0,25 = 2x Sechzehntel], [1-und 2-und...], [...erstem "und"],
  [#align(center + horizon, [#box([#move(dy: -0.6mm, [#sechzehntel_note_symbol#h(0.5mm)/#sechzehntel_beam/#h(0.5mm)#sechzehntel_pause_symbol])])])], [Sechzehntel], [0,125], [1-e-und-a 2...], [...auf "e"],
  [#align(center + horizon, [#punktierte_viertel_note_symbol / #punktierte_viertel_pause_symbol])], [Punktierte\ Viertel], [1,5 = Viertel + Achtel\ Punkt = +50% des Notenwerts], [1-und 2-und...], [...zweitem "und"],
)

#let symbols_table = table(
  columns: (auto, 1fr),
  align: (center, left + horizon),
  inset: 4.2pt,
  stroke: none,
  
  table.header([#th("Symbol")], [#align(left)[#th("Bedeutung")]]),
  ..inner-row-dividers(15),
  table.cell(colspan: 2, align: left)[#move(dx: 1.95cm, badge("Dynamik"))],
  [#badge_plain("p")], [*piano*: leise singen],
  [#badge_plain("f")], [*forte*: laut singen],
  [#badge_plain("mf")], [*mezzo-forte*: mittel laut],
  [#badge_plain("mp")], [*mezzo-piano*: mittel leise],
  [#badge_plain("<")], [*Crescendo*: lauter werden],
  [#badge_plain(">")], [*Decrescendo/Diminuendo*: leiser werden],
  table.cell(colspan: 2, align: left)[#move(dx: 1.95cm, badge("Ausdruck"))],
  [
    #stack(
      dir: ttb,
      spacing: 0.25em,
      align(center)[
        #stack(
          dir: ttb,
          spacing: 0pt,
          text(size: 12pt)[♪],
          text(size: 7pt, weight: "semibold")[>],
        )
      ],
    )
  ], [*sforzando*: plötzlicher starker Akzent],
  [
    #stack(
      dir: ttb,
      spacing: 0em,
      align(center)[
        #stack(
          dir: ttb,
          spacing: 0pt,
          align(center)[#text(size: 12pt)[♪]],
          align(center)[#move(dx: -0.35mm)[#text(size: 4pt, weight: "semibold")[•]]],
        )
      ],
    )
  ], [*staccato*: kurz und leicht],
  [
    #stack(
      dir: ttb,
      spacing: 0em,
      align(center)[
        #stack(
          dir: ttb,
          spacing: 0.5mm,
          align(center)[#move(dy: 1.7mm)[#text(size: 11pt, font: "Noto Music")[𝄐]]],
          align(center)[#text(size: 12pt)[♪]],
        )
      ],
    )
  ], [*Fermate*: Ton/Pause deutlich länger halten (Dirigat beachten)],
  table.cell(colspan: 2, align: left)[#move(dx: 2.10cm, badge("Tempo"))],
  [#badge_plain("rit.")], [*ritardando*: langsamer werden],
  [#badge_plain("a tempo")], [zurück zum Grundtempo],
)

#let interval_staff(music) = box(height: 1cm, move(dy: 0.58cm ,melody(
  music: music,
  key: "C",
  time: "4/4",
  clef: "treble",
  staff-size: 1.35mm,
  width: 2.5cm,
  measures-per-line: 1,
)))

#let interval_table = table(
  columns: (1.05fr, 4cm, 1.15fr),
  inset: 4.2pt,
  align: (horizon, horizon, horizon),
  stroke: none,
  table.header([#th("Intervallname")], [#th("Noten")], [#th("Merkhilfe")]),
  ..inner-row-dividers(8),
  [kleine Sekunde], [#interval_staff("c2 d&2 |")], [sehr nah, spannungsreich],
  [große Sekunde],[#interval_staff("c2 d2|")], [Schritt zur Nachbarnote],
  [kleine Terz], [#interval_staff("c2 e&2 |")], [oft "moll"-Farbe],
  [große Terz], [#interval_staff("c2 e2 |")], [oft "dur"-Farbe],
  [Quarte], [#interval_staff("c2 f2 |")], [stabiler Sprung, _tatü-tata_],
  [Quinte], [#interval_staff("c2 g2 |")], [sehr stabil, offen],
  [Oktave], [#interval_staff("c2 c'2 |")], [gleicher Ton höher oder tiefer],
)

#let cheat_sheet(body) = {
  hero(
    [Musik-Notationsspickzettel],
    [Popchor der RUB #sym.dash Für Einsteiger:innen],
  )

  v(0.22cm)

  section("Zählrhythmen", "", [
    #table(
      columns: (auto, auto),
      inset: 4.2pt,
      stroke: none,
      table.header([#th("Takte mit...")], [#th("Rhythmus")]),
      ..inner-row-dividers(4),
      [... Viertelnoten], [1 - 2 - 3 - 4],
      [... Achtelnoten], [1-und 2-und 3-und 4-und],
      [... Sechzehntelnoten], [1-e-und-a 2-e-und-a 3-e-und-a 4-e-und-a]
    )
  ])

  v(0.22cm)

  section("Noten- und Pausenlängen", "", [
    #duration_table
  ])
  v(0.22cm)

  section("Wichtige musikalische Symbole", "", [
    #symbols_table
    #v(0.2em)
  ])

  pagebreak()
  section("Grundintervalle", "", [
    #interval_table
  ])
}
