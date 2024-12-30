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
\RequirePackage{multicol}

\newcommand{\rnum}[1]{\uppercase\expandafter{\romannumeral #1\relax}}

% set font to courier
\renewcommand{\rmdefault}{pcr}
\newcommand{\br}{\vspace{1em}}
\linespread{0.8}

% spacing
\raggedright
\EverySelectfont{%
    \fontdimen2\font=0.5em% interword space
}

% header
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[R]{\thepage}

% footer
\usdate
\cfoot{}
\fancyfoot[L]{
    \footnotesize
    \today
}

\newcommand{\underscoring}{\newpage}

% acts
\newcounter{act}
\newcommand{\act}{
    \ifthenelse{\theact=0}{}{\newpage}
    \stepcounter{act}
    \setcounter{scene}{0}
    \setcounter{page}{1}
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
    \br
    \begin{adjustwidth}{3in}{0in}
        \underline{Scene \Numberstringnum{\thescene}}
    \end{adjustwidth}
    % Update header
    \ifthenelse{\theact=0}{
        \fancyhead[R]{\thescene-\thepage}
    }{
        \fancyhead[R]{\rnum{\theact}-\thescene-\thepage}
    }
}

% initial stage directions
\newcommand{\init}[1]{
    \br
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
        \br
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
        \br
        \MakeUppercase{#2}
        \ifthenelse{\isempty{#1}}{}{(#1)}
    \end{adjustwidth}
}

% songs
\newcounter{songblock}
\newenvironment{song}{
    \setcounter{songblock}{0}
    \newpage
}{
    \newpage
}
\newcounter{stanza}
\newenvironment{songblock}[1]{
    \ifthenelse{\thesongblock=0}{}{\br}
    \ifdefined\intwocol
            \ifdefined\leftcol
            \begin{adjustwidth}{1.5in}{0in}
        \else
            \begin{adjustwidth}{4.5in}{0in} 
        \fi
    \else
        \begin{adjustwidth}{3in}{0in}
    \fi
    \stepcounter{songblock}
                #1
    \end{adjustwidth}
    \setcounter{stanza}{0}
}{}

\newenvironment{lyricsintro}{
    \begin{adjustwidth}{1.5in}{0in}
}{
    \end{adjustwidth}
}

\newenvironment{lyricsa}{
    \ifdefined\intwocol\relax
    \else
        \begin{adjustwidth}{0.5in}{0in}
    \fi
}{
    \ifdefined\intwocol\relax
    \else
        \end{adjustwidth}
    \fi
}

\newenvironment{lyricsb}{
    \ifdefined\intwocol\
        \begin{adjustwidth}{0.3in}{0in}
    \else
        \begin{adjustwidth}{1in}{0in}
    \fi
}{
    \end{adjustwidth}
}

\newenvironment{lyricsc}{
    \ifdefined\intwocol\
        \begin{adjustwidth}{0.6in}{0in}
    \else
        \begin{adjustwidth}{1.5in}{0in}
    \fi
}{
    \end{adjustwidth}
}

\newenvironment{twocol}[2]{
    \def\intwocol{}
    \footnotesize
    \begin{tabular}{p{0.5\textwidth}p{0.5\textwidth}}
        \begin{leftcol}{#1}
        \end{leftcol}
        &
        \begin{rightcol}{#2}
        \end{rightcol}
}{
    \end{tabular}
}

\newenvironment{leftcol}[1]{
    \def\leftcol{}
    #1
}

\newenvironment{rightcol}[1]{
    \def\rightcol{}
    #1
}

\newenvironment{stanza}{
    \ifthenelse{\thestanza=0}{}{\br}
    \stepcounter{stanza}
    \ifdefined\intwocol\relax
        \begin{itemize}[itemsep=0pt, parsep=0pt, partopsep=0pt, left=0pt, topsep=0pt, label=, labelsep=0pt, labelindent=0.3in, itemindent=-0.3in]
    \else
        \begin{itemize}[itemsep=0pt, parsep=0pt, partopsep=0pt, left=0pt, topsep=0pt, label=, labelsep=0pt, labelindent=0.5in, itemindent=-0.5in]
    \fi
}{
    \end{itemize}
}

\newcommand{\words}[1]{\item \MakeUppercase{#1}}

\newcommand{\theend}{
    \begin{adjustwidth}{3in}{0in}
        \underline{THE END}
    \end{adjustwidth}
}