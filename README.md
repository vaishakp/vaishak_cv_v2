# Vaishak Prasad — Curriculum Vitae

LaTeX source for the CV, built with the bundled `moderncv` class. The repository is
synced with Overleaf, so the layout below is designed to be edited from either side.

## Three versions

| File | Length | Use |
|---|---|---|
| `main.tex` | ~9 pp | The full record. Everything. |
| `cv-3page.tex` | 3 pp | Job and grant applications that cap CV length. |
| `cv-1page.tex` | 1 pp | Cover-letter attachments, speaker bios, hard one-page limits. |

All three share `personal.tex` (name, address, phone, email, homepage), so contact
details are edited once. `main.tex` is assembled from `sections/`; the two short
versions are self-contained, because a shortened CV needs *selected and reworded*
content rather than a subset of the full one. When something important is added to
the long CV, decide whether it earns a place in the short ones.

CI checks the page counts and fails if `cv-1page.tex` spills past one page or
`cv-3page.tex` past three.

## Layout

```
main.tex              long version: preamble, \input list
cv-3page.tex          3-page version, self-contained
cv-1page.tex          1-page version, self-contained
personal.tex          contact details, shared by all three
sections/             one file per CV section, used by main.tex — edit these
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
latexmk -pdf main.tex && latexmk -pdf cv-3page.tex && latexmk -pdf cv-1page.tex
```

The GitHub Action in `.github/workflows/` builds all three PDFs on push, so build
artifacts (including `main.pdf`) are gitignored.
