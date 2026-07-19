#let conf(
  title: [],
  source: [],
  url: [],
  authors: (), 
  category: [],
  doc,
) = {
  // Set rules -----------------------
  set document(
    date: auto,
    title: title,
  )
  set page(
    paper: "a4",
    header: align(
      right,
      source + " - " + title
    ),
    // margin: (x:1.8cm, y: 1.5cm),
    numbering: "1",
  )
  set heading(numbering: "1.")
  set text(
    font: "New Computer Modern",
    size: 11pt,
  )
  set par(justify: true)
  set line(length: 100%)
  // ---------------------------------
  // Title - Source
  // Author 
  text(size: 22pt)[#link(url)[*#title* - *#source*]]
  linebreak()
  text(size: 11pt)[#category]
  let count = authors.len()
  let ncols = calc.min(count, 3)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 22pt,
    ..authors.map(author => 
      [#author.name - #link("https://github.com/" + author.git)[#author.git]]),
  )
  line(stroke: 1pt + black)
  
  doc
}
