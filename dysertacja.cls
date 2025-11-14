\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dysertacja}[2022/01/26 Praca doktorska]
\LoadClass[a4paper,12pt,openright]{book}
\RequirePackage[utf8]{inputenc} 
\RequirePackage{iftex}
\ifPDFTeX
    \let\strcmp\pdfstrcmp
    \let\XeLaTeX\LaTeX
\fi
\RequirePackage{amsfonts}
\RequirePackage{amsmath} 
\RequirePackage[MeX]{polski}
\RequirePackage{listings}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{esint}


\RequirePackage[acronym, symbols, nopostdot]{glossaries}
\newcommand{\acronymstitle}{Wykaz skrótów i symboli}
\setglossarysection{section}
\RequirePackage{glossary-mcols}
\makeglossaries
\renewcommand*{\glspostdescription}{} 
\loadglsentries{glossary}
\newcommand{\acronymslist}{
    \chapter*{\acronymstitle}
    \counterwithout{lstlisting}{chapter}
    \thispagestyle{empty}
    \addcontentsline{toc}{chapter}{\acronymstitle}
    \printglossary[type=\acronymtype, title={}, style=mcolindex]
    \printglossary[title={}, style=mcolindex]
}   


\ifXeTeX
    \RequirePackage{xltxtra}
\fi
\RequirePackage{makeidx} 
\RequirePackage{a4wide}
\RequirePackage{graphicx} 
\RequirePackage{svg}
\RequirePackage[bottom]{footmisc} 
\RequirePackage{tabularray}
\RequirePackage{vcell}
\RequirePackage{chngcntr}
\RequirePackage[a4paper, tmargin=2.5cm, bmargin=2.5cm, lmargin=2.5cm, rmargin=2.5cm]{geometry} 

\newcommand{\album}[1]{\newcommand{\@album}{#1}}
\newcommand{\promotor}[1]{\newcommand{\@promotor}{#1}}
\RequirePackage{setspace}

\linespread{1.5}
% % -------------------------------------------------------------------
% % Kontrola wdów i sierot
% % -------------------------------------------------------------------
\widowpenalty 20000
\clubpenalty 20000
\raggedbottom
% % -------------------------------------------------------------------
% % Przenoszenie wyrazów do nowej linii
% % -------------------------------------------------------------------
\pretolerance 1000
\hyphenpenalty 1000
\tolerance 2000
\emergencystretch .618em
\righthyphenmin 4
\lefthyphenmin 4


\setlength{\parindent}{0.5cm}
\setlength{\parskip}{0em}
% -------------------------------------------------------------------
% Znaki cytowania % PL-EN
% -------------------------------------------------------------------
\RequirePackage{csquotes}
\RequirePackage{ragged2e}

% -------------------------------------------------------------------
% Kolory
% -------------------------------------------------------------------

\RequirePackage[dvipsnames]{xcolor}
% Kolor Wydziału Elektrycznego i dwa pokrewne monochromatyczne.
% Kolor podstawowy jest tu określony w przybliżeniu, gdyż 
% Zarządzenie definiuje go niejednoznacznie. Dla wskazanego 
% Pantone 2716C i 2716U podane wartości CMYK (50, 30, 0, 0) 
% są inne niż podaje to Pantone na swej stronie www (38, 26, 0, 0).
\definecolor{EEBlue}{cmyk}{0.50, 0.30, 0, 0}            % #8ba5d3 
% \definecolor{EEBlueLight}{cmyk}{0.14, 0.04, 0.03, 0}    % #e2ecf8
\definecolor{EEBlueDark}{cmyk}{0.73, 0.55, 0.35, 0.32}  % #45536a
% Uzupełniający dla EEBlue - pomarańczowy
\definecolor{EEOrange}{cmyk}{0.02, 0.41, 0.94, 0}       % #f6a307
% Uzupełniające bliskie dla EEBlue, 10 stopni na kole barw
\definecolor{EETangerine}{RGB}{255, 119, 0}
\definecolor{EEGold}{RGB}{255, 209, 0}
\definecolor{EEAzure}{RGB}{0, 136, 255}
\definecolor{EEUltramarine}{RGB}{0, 46, 255}
% -------------------------------------------------------------------
% Klikalne linki
% -------------------------------------------------------------------
\RequirePackage{hyperref}
\hypersetup{unicode=true,pdftoolbar=true,pdfmenubar=true,    pdffitwindow=false,pdfstartview={FitH},linktoc=all,pdfnewwindow=true,colorlinks=true,linkcolor=EEBlueDark,citecolor=EEBlueDark,filecolor=EEBlueDark,urlcolor=EEBlueDark,linkbordercolor={1 0 0},citebordercolor={0 1 0},urlbordercolor={0 1 1}}
\RequirePackage[format=plain,labelfont=bf,labelsep=period,justification=justified]{caption}
\RequirePackage{subcaption}




\RequirePackage{fancyhdr}
\fancyhf{}
% 1. Define the custom style called 'long-short'

\fancypagestyle{plain}{ %
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyfoot[RO,LE]{\thepage}
}

\fancypagestyle{headings}{ \fancyhf{} \renewcommand{\headrulewidth}{1pt} \fancyheadoffset{0cm}    \fancyhead[LE]{\textit{\nouppercase{\leftmark}}} \fancyhead[RO]{\textit{\nouppercase{\rightmark}}} \fancyfoot[C]{\thepage} \renewcommand{\footrulewidth}{0pt}\setlength{\headheight}{16pt}
}
\pagestyle{headings}








\newcommand{\tailpages}{\listoffigures 
\listoftables 
\acronymslist 
}

\newcommand{\frontpages}{\counterwithout{lstlisting}{chapter}
\pagestyle{empty}
\maketitle 
\tableofcontents 
\cleardoublepage 
\pagestyle{headings}
}



\RequirePackage[backend=biber,
        style=ieee, 
        sorting=nyt,   
        citestyle=numeric-comp,
        language=polish, 
        maxbibnames=1000
    ]{biblatex}

\addbibresource{references.bib}

\newcommand{\bibliografia}{
    \cleardoublepage
    \printbibliography[heading=bibintoc, title=Literatura]
}

\RequirePackage{emptypage}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{longtable}
\RequirePackage{colortbl}



\newcommand{\nextitem}{\par\hspace*{\labelsep}\textbullet\hspace*{\labelsep}}
\RequirePackage{threeparttable}
\RequirePackage{tabularx}
\RequirePackage{pdflscape}
\RequirePackage[np]{numprint}
\nprounddigits{2}
\RequirePackage{subcaption}
\RequirePackage{caption}
\captionsetup{justification=justified, singlelinecheck=false}
\RequirePackage[export]{adjustbox}
\RequirePackage{makecell}
\RequirePackage{tikz}
\RequirePackage{pgf}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}
\RequirePackage{siunitx}
\usepackage{layouts}