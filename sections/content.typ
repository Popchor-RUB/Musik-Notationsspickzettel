#import "style.typ": *
#import "@preview/scorify:0.1.1": melody

#let ganze_note_symbol = [𝅝]
#let halbe_note_symbol = [𝅗𝅥]
#let viertel_note_symbol = [𝅘𝅥]
#let achtel_note_symbol = [𝅘𝅥𝅮]
#let sechzehntel_note_symbol = [𝅘𝅥𝅯]

#let ganze_pause_symbol = [𝄻]
#let halbe_pause_symbol = [𝄼]
#let viertel_pause_symbol = [𝄽]
#let achtel_pause_symbol = [𝄾]
#let sechzehntel_pause_symbol = [𝄿]
#let punktierte_viertel_note_symbol = [𝅘𝅥.]
#let punktierte_viertel_pause_symbol = [𝄽·]

#let duration_table = table(
  columns: (auto, auto, auto, auto),
  inset: 8pt,
  stroke: (x: 0.4pt, y: 0.4pt),
  table.header(
    [*Aussehen*], [*Wert*], [*Zählhilfe*], [*Nächste Note auf...*],
  ),
  [#align(center + horizon, [#ganze_note_symbol / #ganze_pause_symbol])], [Ganze Note = 2x Halbe oder 4x Viertel], [1 - 2 - 3 - 4], [...1 vom nächsten Takt],
  [#align(center + horizon, [#halbe_note_symbol / #halbe_pause_symbol])], [Halbe Note = 2x Viertel], [1 - 2 - 3 - 4], [...3],
  [#align(center + horizon, [#viertel_note_symbol / #viertel_pause_symbol])], [Viertelnote = 2x Achtel], [1 - 2 - 3 - 4], [...2],
  [#align(center + horizon, [#achtel_note_symbol / #achtel_pause_symbol])], [Achtelnote = 2x Sechzehntel], [1-und 2-und 3-und], [...erstem "und"],
  [#align(center + horizon, [#sechzehntel_note_symbol / #sechzehntel_pause_symbol])], [Sechzehntelnote], [1-e-und-a], [...auf "e"],
  [#align(center + horizon, [#punktierte_viertel_note_symbol / #punktierte_viertel_pause_symbol])], [Punktierte Viertel;\ Viertel + Achtel.\ Punkt = +50% des Notenwerts], [1-und 2-und 3-und 4-und], [...zweitem "und"],
)

#let symbols_table = table(
  columns: (0.75fr, 1.7fr),
  inset: 4pt,
  stroke: (x: 0.4pt, y: 0.4pt),
  table.header([*Zeichen*], [*Bedeutung*]),
  [#badge("p")], [leise singen],
  [#badge("f")], [laut singen],
  [#badge("mf")], [mittel laut],
  [#badge("mp")], [mittel leise],
  [#badge("<")], [*Crescendo*: langsam lauter],
  [#badge(">")], [*Decrescendo/Diminuendo*: langsam leiser],
  [#badge("sfz")], [plötzlicher starker Akzent],
  [#badge("ten.")], [Ton bewusst tragen],
  [#badge("stacc.")], [kurz und leicht],
  [#badge("fermata")], [Ton/Pause deutlich länger halten (Dirigat beachten)],
  [#badge("rit.")], [langsamer werden],
  [#badge("a tempo")], [zurück zum Grundtempo],
)

#let interval_staff(music) = melody(
  music: music,
  key: "C",
  time: "4/4",
  clef: "treble",
  staff-size: 1.35mm,
  width: 2.5cm,
  measures-per-line: 1,
)

#let interval_table = table(
  columns: (1.05fr, 4cm, 1.15fr),
  inset: 4pt,
  stroke: (x: 0.4pt, y: 0.4pt),
  table.header([*Intervallname*], [*Noten*], [*Merkhilfe*]),
  [kleine Sekunde], [#interval_staff("c2 d&2 |")], [sehr nah, spannungsreich],
  [große Sekunde],[#interval_staff("c2 d2|")], [Schritt zur Nachbarnote],
  [kleine Terz], [#interval_staff("c2 e&2 |")], [oft "moll"-Farbe],
  [große Terz], [#interval_staff("c2 e2 |")], [oft "dur"-Farbe],
  [Quarte], [#interval_staff("c2 f2 |")], [stabiler Sprung],
  [Quinte], [#interval_staff("c2 g2 |")], [sehr stabil, offen],
  [Oktave], [#interval_staff("c2 c'2 |")], [gleicher Ton höher oder tiefer],
)

#let cheat_sheet(body) = {
  align(center)[
    #text(size: 16pt, weight: "bold")[Musik-Notationsspickzettel für Chor]
    #linebreak()
    #text(size: 11pt, style: "italic")[Für Einsteiger:innen]
  ]

  v(0.3cm)

  section("Zählrythmen", "", [
    #table(
      columns: (auto, auto),
      stroke: (x: 0.4pt, y: 0.4pt),
      table.header([*Takte mit...*], [*Rhythmus*]),
      [... Viertelnoten], [1 - 2 - 3 - 4],
      [... Achtelnoten], [1-und 2-und 3-und 4-und],
      [... Sechzehntelnoten], [1-e-und-a 2-e-und-a 3-e-und-a 4-e-und-a]
    )
  ])

  v(0.3cm)

  section("Noten- und Pausenlängen", "", [
    #duration_table
  ])
  v(0.3cm)

  section("Wichtige musikalische Zeichen", "", [
    #symbols_table
    #v(0.2em)
  ])
  v(0.3cm)

  section("Grundintervalle", "", [
    #interval_table
  ])
}
