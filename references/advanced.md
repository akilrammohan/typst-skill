# Advanced Typst Patterns

## Scripting

### Variables and Functions
```typst
#let title = [My Document]
#let greet(name) = [Hello, #name!]
#let add(a, b) = a + b

#title
#greet("World")
Result: #add(2, 3)
```

### Conditionals
```typst
#let score = 85
#if score >= 90 [A] else if score >= 80 [B] else [C]
```

### Loops
```typst
#for fruit in ("apple", "banana", "cherry") [
  - #fruit
]

#for i in range(1, 4) [
  Item #i
]
```

### Arrays and Dictionaries
```typst
#let arr = (1, 2, 3)
#let dict = (name: "Alice", age: 30)

Length: #arr.len()
Name: #dict.name
```

## Advanced Styling

### Where Selectors
```typst
// Style only level-1 headings
#show heading.where(level: 1): set text(red)

// Style only block equations
#show math.equation.where(block: true): set text(blue)
```

### Everything Show Rules
```typst
// Apply to entire document
#show: columns.with(2)

// Template pattern
#let template(body) = {
  set text(font: "Libertinus Serif")
  set page(margin: 2cm)
  body
}
#show: template
```

### Custom Numbering
```typst
#set heading(numbering: "I.a.")
#set enum(numbering: "(i)")
#set math.equation(numbering: "(1)")
```

## Page Layout

### Headers and Footers
```typst
#set page(
  header: context [
    #h(1fr)
    Chapter #counter(heading).display()
  ],
  footer: context [
    #h(1fr)
    #counter(page).display("1 of 1", both: true)
  ],
)
```

### Multi-column
```typst
#show: columns.with(2, gutter: 2em)

// Or specific section
#columns(2)[
  First column content
  #colbreak()
  Second column content
]
```

### Page Breaks
```typst
#pagebreak()
#pagebreak(weak: true)  // only if not at page start
```

## Bibliography

```typst
// At end of document
#bibliography("refs.bib", style: "ieee")

// Citations in text
@smith2020        // (Smith, 2020)
@smith2020[p. 5]  // (Smith, 2020, p. 5)
#cite(<smith2020>, form: "prose")  // Smith (2020)
```

## Imports and Packages

### From Files
```typst
#import "utils.typ": helper, format-date
#import "template.typ": *
#include "chapter1.typ"
```

### From Universe (Package Manager)
```typst
#import "@preview/cetz:0.3.4": canvas, draw
#import "@preview/tablex:0.0.9": tablex, rowspanx
```

## Context and Introspection

### Accessing State
```typst
// Current page number
#context counter(page).display()

// Query all headings
#context {
  let headings = query(heading)
  [Found #headings.len() headings]
}
```

### Custom Counters
```typst
#let example-counter = counter("example")
#let example(body) = {
  example-counter.step()
  [*Example #context example-counter.display():* #body]
}

#example[First example]
#example[Second example]
```

## Figure Customization

```typst
#show figure.caption: it => [
  #text(style: "italic")[#it.supplement #it.counter.display(): ]
  #it.body
]

#figure(
  rect(width: 4cm, height: 2cm, fill: gradient.linear(red, blue)),
  caption: [A colorful rectangle],
  kind: image,
  supplement: [Fig.],
)
```

## Table Styling

```typst
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  align: (left, center),
  fill: (_, y) => if calc.odd(y) { luma(240) },
  stroke: (x, y) => if y == 0 { (bottom: 1pt) },
  table.header([*Name*], [*Value*]),
  [Alpha], [100],
  [Beta], [200],
)
```

## Raw Code Blocks

```typst
// Inline
`let x = 5`

// Block with language
```python
def hello():
    print("Hello")
```

// With line numbers
#show raw.where(block: true): it => {
  set par(justify: false)
  grid(
    columns: 2,
    gutter: 1em,
    ..it.lines.enumerate().map(((i, line)) => (
      text(fill: gray)[#(i + 1)],
      line,
    )).flatten()
  )
}
```

## Common LaTeX Conversions

| LaTeX | Typst |
|-------|-------|
| `\documentclass{article}` | `#set page(...)` + `#set text(...)` |
| `\usepackage{...}` | `#import "@preview/...": ...` |
| `\newcommand` | `#let name(args) = ...` |
| `\renewcommand` | `#show element: ...` |
| `\begin{center}` | `#align(center)[...]` |
| `\vspace{1cm}` | `#v(1cm)` |
| `\hspace{1cm}` | `#h(1cm)` |
| `\textcolor{red}{...}` | `#text(fill: red)[...]` |
| `\footnote{...}` | `#footnote[...]` |
| `\label{...}` | `<label-name>` |
| `\ref{...}` | `@label-name` |
| `\tableofcontents` | `#outline()` |
| `\includegraphics` | `#image("file.png")` |

## Units and Measurements

```typst
1pt      // point
1mm      // millimeter  
1cm      // centimeter
1in      // inch
1em      // relative to font size
50%      // percentage
1fr      // fractional unit (grids/tables)
```

## Colors

```typst
red, blue, green, black, white, gray
luma(200)              // grayscale 0-255
rgb("#ff0000")         // hex
rgb(255, 0, 0)         // RGB values
color.mix(red, blue)   // mixing
```
