%
% jspractice based on jsarticle
%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jspractice}[2009/10/09]

%
% Options
%
\newif\if@separateabstract
\@separateabstractfalse
\DeclareOption{separateabstract}{\@separateabstracttrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jsarticle}}
\ProcessOptions
\LoadClass[a4j, twocolumn]{jsarticle}

%
% Document Property Declarations
%
\newcommand{\@authorlabel}{発表者}
\newcommand{\@locationlabel}{場所}
\newcommand{\@teacherlabel}{指導教員}
\newcommand{\@classlabel}{科目}
\let\@keywords\@empty
\let\@abstract\@empty

\newcommand{\location}[1]{\newcommand{\@location}{#1}}
\newcommand{\teacher}[1]{\newcommand{\@teacher}{#1}}
\newcommand{\class}[1]{\newcommand{\@class}{#1}}
\newcommand{\keyword}[1]{
  \ifx\@keywords\@empty
    \renewcommand{\@keywords}{#1}
  \else
    \edef\@keywords{\@keywords, #1}
  \fi
}
\renewcommand{\abstract}[1]{
  \renewcommand{\@abstract}{#1}
}

%
% Main Part
%
\renewcommand{\maketitle}{
  \twocolumn[
    \begin{center}
      {\LARGE \@title \par}

      \vskip 1.5em

      {\large
        \lineskip .5em
        \begin{tabular}[t]{r@{ : }l}
          \@authorlabel   & \@author \\
          \@teacherlabel  & \@teacher \\
          \@classlabel    & \@class \\
          \@locationlabel & \@location 
        \end{tabular}
        \par
      }

      \vskip 1em

      {\large \@date \par}
    \end{center}

    \if@separateabstract
      \vskip 1.5em

      \section*{\centering \abstractname}
      \@abstract

      \section*{Keywords}
      \@keywords
    \else
    \fi

    \vskip 1.5em
  ]

  \if@separateabstract
  \else
    \section*{\centering \abstractname}
    \@abstract

    \section*{Keywords}
    \@keywords
    \par
  \fi
}

