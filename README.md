# Overview

LaTeX class for UKRI proposals.

Requires use of [lualatex](http://www.luatex.org) or
[xelatex](https://tug.org/xetex/) since it uses the
[fontspec](https://ctan.org/pkg/fontspec?lang=en) package to use the
Arial font (as preferred by UKRI).

The class is a small wrapper around the
[KOMA-script](https://komascript.de) `scrartcl` class.

Margins are adjusted to give you a UKRI-compatible 2cm on every side,
and the spacing around section headings is reduced relative to the
defaults to enable a little more text on the page.

## Usage

```
\documentclass[a4paper,fontsize=11pt]{ukriproposal}


\begin{document}
...
\end{document}
```

### Class options

- `showframe`: Use the `geometry` package to show the 2cm margins (in
  case you're leaking over a line)
- `squeezespace`: Use the `setspace` package to slightly reduce the
  line-spacing. Use as a last resort if you really can't trim the
  proposal length shortly before a submission deadline.

Any further options are passed to the `scrartcl` class.

### Loaded packages

- `setspace`
- `geometry`
- `hyperref`
- `enumitem`
