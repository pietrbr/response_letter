% ============================================================
% responseletter.cls
% LaTeX class for author response letters to peer reviewers
% ============================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{responseletter}[2025/02/10 Author Response Letter Class]

% ------------------------------------------------------------
% Base class
% ------------------------------------------------------------
\LoadClass[11pt,letter]{article}

% ------------------------------------------------------------
% Required packages
% ------------------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{hyperref}
\RequirePackage{etoolbox}

% ------------------------------------------------------------
% Colours
% ------------------------------------------------------------
\definecolor{replyblue}{RGB}{0, 0, 180}
\definecolor{rulegray}{RGB}{120, 120, 120}

% ------------------------------------------------------------
% Hyperref defaults
% ------------------------------------------------------------
\hypersetup{
	colorlinks=true,
	linkcolor=black,
	urlcolor=blue,
}

% ------------------------------------------------------------
% Section formatting (no numbering)
% ------------------------------------------------------------
\setcounter{secnumdepth}{0}
\titleformat{\section}{\large\bfseries}{}{0pt}{}[\vspace{-0.3em}\textcolor{rulegray}{\rule{\textwidth}{0.4pt}}]
\titleformat{\subsection}{\normalsize\bfseries}{}{0pt}{}

% ------------------------------------------------------------
% Metadata commands
% ------------------------------------------------------------
\newcommand{\papertitle}[1]{\def\@papertitle{#1}}
\newcommand{\manuscriptnumber}[1]{\def\@manuscriptnumber{#1}}
\newcommand{\authorlist}[1]{\def\@authorlist{#1}}
\newcommand{\reviewround}[1]{\def\@reviewround{#1}}

% Defaults
\papertitle{Untitled Paper}
\manuscriptnumber{XXXX-XXXX-XXXXXX}
\authorlist{Author One, Author Two, Author Three}
\reviewround{1}

% ------------------------------------------------------------
% Title block
% ------------------------------------------------------------
\renewcommand{\maketitle}{%
	\begin{center}
		{\LARGE \textbf{Response Letter by Authors (Review~\@reviewround)}}\\[1em]
		{\large \textit{\@papertitle}}\\[0.5em]
		Manuscript No.: \@manuscriptnumber\\[0.5em]
		\@authorlist
	\end{center}
	\vspace{1em}
	\noindent\rule{\textwidth}{0.4pt}
	\vspace{1em}
}

% ------------------------------------------------------------
% General reply environment
% ------------------------------------------------------------
\newenvironment{generalreply}{%
	% 	\noindent\textbf{Dear Editors and Reviewers,}\par\vspace{0.5em}\noindent
	% }{%
	% 	\vspace{1.5em}
}

% ------------------------------------------------------------
% Reviewer environment — auto-resets comment counter
% ------------------------------------------------------------
\newcounter{reviewernumber}
\newcounter{commentnumber}

\newenvironment{reviewer}[1][]{%
	\stepcounter{reviewernumber}%
	\setcounter{commentnumber}{0}%
	\section*{Reviewer \thereviewernumber%
	  \ifstrempty{#1}{}{ — #1}%  optional subtitle, e.g. "Minor Revision"
	 }%
	\vspace{0.3em}%
}{%
	\vspace{1em}%
}

% ------------------------------------------------------------
% \comment{text} — prints "Reviewer Comment X.Q — text"
% ------------------------------------------------------------
\newcommand{\comment}[1]{%
	\stepcounter{commentnumber}%
	\noindent\textbf{Reviewer Comment \thereviewernumber.\thecommentnumber}%
	\space---\space #1\par\vspace{0.5em}%
}

% ------------------------------------------------------------
% \reply{text} — prints the author reply in blue
% ------------------------------------------------------------
\newcommand{\reply}[1]{%
	\noindent\textcolor{replyblue}{\textbf{Reply:}\space #1}\par\vspace{1.5em}%
}

% ============================================================
\endinput
