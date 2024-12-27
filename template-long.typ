#import "commons.typ": *

#let project(title: "", subtitle: "HEIG-VD - template", authors: ("Christophe",), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "New Computer Modern", lang: "en", size: 10pt)
  show math.equation: set text(weight: 400)
  set heading(numbering: "1.1")

  v(30%)
  
  // Subtitle information.
  pad(
    x: 2em,
    align(center)[
      #block(text(weight: 400, 1.5em, subtitle))
    ],
  )
  
  // Title row.
  align(center)[
    #block(text(weight: 700, 2.5em, title))
  ]

  // Author informations.
  pad(
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, strong(author))),
    ),
  )

  // Main body.
  set par(justify: true)

  // Set link style
  show link: underline

  // TODO formatting
  show regex("TODO.+"): it => [
    #error(it)
  ]

  show heading.where(
    level: 1
  ): it => [
    #pagebreak(weak: true, to: "odd")
    #v(2.5em)
    #it
    \
  ]
  set text(font: "New Computer Modern")
  show raw: set text(font: "New Computer Modern Mono")
  show heading.where(level:1): set text(size: 25pt)

  show outline.entry.where(
    level: 1
  ): it => {
    if it.element.func() != heading {
      // Keep default style if not a heading.
      return it
    }
    
    v(20pt, weak: true)
    strong(it)
  }

  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
  )

  pagebreak()
  outline(depth: 3)

  body
}
