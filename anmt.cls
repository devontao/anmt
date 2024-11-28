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
        \vspace{1em}
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
    \begin{adjustwidth}{3in}{0in}
        \underline{Scene \Numberstringnum{\thescene}}
        \vspace{1em}
    \end{adjustwidth}
    % Update header
    \fancyhead[R]{\rnum{\theact}-\thescene-\thepage}
}

% initial stage directions
\newcommand{\init}[1]{
    \begin{adjustwidth}{3in}{0in}
        #1
        \newline
    \end{adjustwidth}
}

% stage direction
\newcommand{\stagedir}[1]{
    \begin{adjustwidth}{1in}{1in}
        \vspace{1em}
        (#1)
        \vspace{1em}
    \end{adjustwidth}
}

% aside
\newcommand{\aside}[1]{
    \begin{adjustwidth}{1in}{1in}
        (\lowercase{#1})
    \end{adjustwidth}
}

% character name
\newcommand{\charname}[1]{
    \begin{adjustwidth}{3in}{0in}
        \vspace{1em}
        #1
    \end{adjustwidth}
}

% songs
\newenvironment{song}{
    \newpage
}{
    \newpage
}

% lyrics
\newenvironment{lyrics}{
    \begin{adjustwidth}{0.5in}{0in}
}{
    \end{adjustwidth}
}

\newcommand{\stanza}[1]{
    \MakeUppercase{#1}
    \vspace{1em}
}