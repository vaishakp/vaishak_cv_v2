# Vaishak Prasad — Curriculum Vitae

LaTeX source for the CV, built with the bundled `moderncv` class. The repository is
synced with Overleaf, so the layout below is designed to be edited from either side.

## Layout

```
main.tex              root document: preamble, contact details, \input list
sections/             one file per CV section — edit these
  positions.tex       positions held
  education.tex       Ph.D thesis and education
  publications.tex    in preparation + published/archived
  research.tex        research interests, research and work experience
  grants.tex          fellowships, grants, awards; achievements
  skills.tex          computing skills, codes developed, languages
  conferences.tex     conferences and schools attended
  talks.tex           talks and posters presented
  teaching.tex        supervision, mentoring and teaching
  service.tex         commission of trust, outreach, hobbies
  references.tex      references
moderncv.cls          bundled class and styles — do not edit
moderncv*.sty
pictures/
```

`main.tex` must stay the Overleaf root document. To reorder the CV, move the
`\input` lines in `main.tex`; to edit content, open only the relevant file in
`sections/`.

## Conventions

- Every dated list runs **newest first**.
- Publications are numbered independently within each subsection. When a preprint
  is published, move the entry from *In preparation* to *Published/Archived*, put
  the journal reference ahead of the arXiv link, and renumber.
- When a pending grant is decided, move it into *Awarded* with its award number
  and amount, or delete it.

## Building

```sh
pdflatex main.tex && pdflatex main.tex   # twice, for the page refs
```

The GitHub Action in `.github/workflows/` builds the PDF on push, so build
artifacts (including `main.pdf`) are gitignored.
