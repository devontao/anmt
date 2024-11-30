\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{anmt}[2024/11/27 Academy for New Musical Theatre Formatting (2024)]
\LoadClass[12pt]{article}
\RequirePackage[reset, letterpaper, left=1in, right=1in, top=1in, bottom=1in, marginparsep=0pt, marginparwidth=0pt]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{changepage}
\RequirePackage{everysel}
\RequirePackage[T1]{fontenc}
\RequirePackage{fmtcount}
\RequirePackage{enumitem}
\RequirePackage{datetime}
\RequirePackage{xifthen}
\newcommand{\rnum}[1]{\uppercase\expandafter{\romannumeral #1\relax}}

% set font to courier
\renewcommand{\rmdefault}{pcr}
\renewcommand{\baselinestretch}{0.9}

% spacing
\raggedright
\EverySelectfont{%
    \fontdimen2\font=0.6em% interword space
}

% header
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhead{}

% footer
\usdate
\cfoot{}
\fancyfoot[L]{
    \footnotesize
    \today
}

% acts
\newcounter{act}
\newcommand{\act}{
    \stepcounter{act}
    \setcounter{scene}{0}
    \begin{adjustwidth}{3in}{0in}
        \underline{ACT \NUMBERstringnum{\theact}}
    \end{adjustwidth}
}

%scenes
\newcounter{scene}
\newcommand{\scene}{
    \ifnum\thescene=0\relax
    \else
        \newpage
    \fi
    \stepcounter{scene}
    \vspace{1em}
    \begin{adjustwidth}{3in}{0in}
        \underline{Scene \Numberstringnum{\thescene}}
    \end{adjustwidth}
    % Update header
    \fancyhead[R]{\rnum{\theact}-\thescene-\thepage}
}

% initial stage directions
\newcommand{\init}[1]{
    \vspace{1em}
    \begin{adjustwidth}{3in}{0in}
        #1
    \end{adjustwidth}
}

\newcommand{\absoluteindent}[1]{%
    \noindent\hspace*{-\leftmargin}\hspace*{#1}%
}

% stage direction
\newcommand{\stagedir}[1]{
    \begin{adjustwidth}{1in}{1in}
        \vspace{1em}
        (#1)
    \end{adjustwidth}
}

% aside
\newcommand{\aside}[1]{
    \begin{adjustwidth}{1in}{1in}
        ({#1})
    \end{adjustwidth}
}

\newlength{\currindent}

% character name
\newcommand{\charname}[2][]{
    \begin{adjustwidth}{3in}{0in}
        \vspace{1em}
        \MakeUppercase{#2}
        \ifthenelse{\isempty{#1}}{}{(#1)}
    \end{adjustwidth}
}

% songs
\newcounter{songblock}
\newenvironment{song}{
    % \setcounter{\songblock}{0}
    \newpage
}{
    \newpage
}
\newcounter{stanza}
\newenvironment{songblock}[2][]{
    % \ifthenelse{\thesongblock=0}{\vspace{1em}}{}
    % \stepcounter{\songblock}
    \ifthenelse{\isempty{#1}}{\charname{#2}}{\charname[#1]{#2}}
    \setcounter{stanza}{0}
}{}


\newenvironment{lyricsa}{
    \begin{adjustwidth}{0.5in}{0in}
}{
    \end{adjustwidth}
}

\newenvironment{lyricsb}{
    \begin{adjustwidth}{1in}{0in}
}{
    \end{adjustwidth}
}

\newenvironment{lyricsc}{
    \begin{adjustwidth}{1.5in}{0in}
}{
    \end{adjustwidth}
}

\newenvironment{stanza}{
    \ifthenelse{\thestanza=0}{}{\vspace{1em}}
    \stepcounter{stanza}
    \begin{itemize}[itemsep=0pt, parsep=0pt, partopsep=0pt, left=0pt, topsep=0pt, label=, labelsep=0pt]
}{
    \end{itemize}
}

\newcommand{\words}[1]{\item \MakeUppercase{#1}}
