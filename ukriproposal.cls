\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ukriproposal}[Formatting for UKRI proposals]

% Based on the KOMA-script packages.
\LoadClass{scrartcl}

\RequirePackage{iftex}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=UKRI,
  prefix=UKRI@
}
% Slightly tighter linespacing if set to true
\DeclareBoolOption{squeezespace}
% Show the margins (to check if latex is spilling a bit
\DeclareBoolOption{showframe}
% Send everything else on to scrartcl
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessKeyvalOptions*

\RequirePackage{setspace}
\ifUKRI@squeezespace
\AtBeginDocument{%
  \setstretch{0.97}%
}
\fi

% Clickable links
\RequirePackage{hyperref}
\hypersetup{breaklinks=true, hidelinks}

% Margin sizes
\RequirePackage{geometry}
\geometry{margin=2cm}

\ifUKRI@showframe
\geometry{showframe=true}
\fi

% Font choice
\RequirePackage{fontspec}
\IfFontExistsTF{Arial}{%
  \setmainfont{Arial}
  \setsansfont{Arial}
}{
  \IfFontExistsTF{Liberation Sans}{%
    \setmainfont{Liberation Sans}
    \setsansfont{Liberation Sans}
  }{
    \ClassError{ukriproposal}{Could not find suitable font}{You need to have Arial or equivalent (e.g. liberation sans) installed}
  }
}

% A little bit better formatting (normally saves a few lines)
\RequirePackage[
final,
step=1,
stretch=10,
letterspace=50]{microtype}

% Section/paragraph heading formatting
\setkomafont{section}{\normalfont\bfseries\large}
\RedeclareSectionCommand[%
beforeskip=0.175\baselineskip,%
afterskip=0.075\baselineskip,%
afterindent=false%
]{section}

\setkomafont{subsection}{\normalfont\bfseries\normalsize}
\RedeclareSectionCommand[%
beforeskip=0.175\baselineskip,%
afterskip=0.075\baselineskip,%
afterindent=false%
]{subsection}

\setkomafont{subsubsection}{\normalfont\bfseries\normalsize}
\RedeclareSectionCommand[%
beforeskip=0.175\baselineskip,%
afterskip=0.075\baselineskip,%
afterindent=false%
]{subsubsection}

\setkomafont{paragraph}{\normalfont\bfseries\normalsize}
\RedeclareSectionCommand[%
indent=0pt,
beforeskip=0.25ex,%
afterskip=0.5ex,%
runin=true%
]{paragraph}

% Simple/smaller title
\renewcommand{\maketitle}{\par
  \begingroup
  \centering\Large\bfseries\@title
  \par
  \endgroup
}

% spacing in itemize-like environments
\RequirePackage{enumitem}
\setlist{itemsep=1pt,           % between items
  parsep=0pt,                   % between paragraphs in items
  topsep=5pt}                   % at top and bottom of environment
