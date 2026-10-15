# responseletter

`responseletter` is a LaTeX class for an author response letter to journal reviewers.
It numbers the reviewers and their comments, and it prints each reply in blue.

## Installation

To link the class into your personal TEXMF tree, run:

```bash
./install.sh              # ./install.sh --uninstall removes the link
```

The link target is `$(kpsewhich -var-value TEXMFHOME)/tex/latex/responseletter`.
After that, `\documentclass{responseletter}` works from any document.

## Usage

```latex
\documentclass{responseletter}
\reviewround{1}
\papertitle{Paper Title}
\manuscriptnumber{XXX-2025-01234}
\authorlist{A.\ First and B.\ Second}

\begin{document}
\maketitle
\begin{generalreply}
  We thank the editors and the reviewers.
\end{generalreply}
\begin{reviewer}
  \comment{The method is unclear.}
  \reply{We rewrote Section 3.}
\end{reviewer}
\end{document}
```

The full template is `doc/latex/responseletter/responseletter.tex`.
