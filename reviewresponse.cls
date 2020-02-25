% Copyright Javier Sánchez-Monedero.
% Please report bugs and suggestions to (jsanchezm at uco.es)
%
% This document is released under a Creative Commons Licence 
% CC-BY-SA (http://creativecommons.org/licenses/by-sa/3.0/) 
%
% Updated by Jackson A. Prado Lima (jacksonpradolima at gmail.com)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{reviewresponse}[2019/12/04 v2]

\DeclareOption*{\InputIfFileExists{\CurrentOption}{}{%
  \PassOptionsToClass{\CurrentOption}{article}}}
\ProcessOptions \relax

% NOTE: You can change some options here, but try to use the same model to avoid wrong use
\LoadClass[a4paper,twoside,10pt,usenames,dvipsnames]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{a4wide}
\RequirePackage{palatino}
\RequirePackage{verbatim}
\RequirePackage{color}
\RequirePackage{url}
\RequirePackage{fancyhdr}
\RequirePackage{fancybox}
\RequirePackage{fancyvrb}
\RequirePackage[authoryear]{natbib}
\RequirePackage{tcolorbox}
\RequirePackage[parfill]{parskip}
\RequirePackage[linktoc=all,bookmarks,bookmarksopen=true,bookmarksnumbered=true]{hyperref}
\RequirePackage{pgffor}                     % FOR LOOP
\RequirePackage{xargs}                      % Use more than one optional parameter in a new commands
\RequirePackage{soul}                       % To highlight text in the body of your document

\setlength{\parindent}{2em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% TODONOTES
\RequirePackage[bordercolor=white,backgroundcolor=orange!30,linecolor=black,colorinlistoftodos,prependcaption,textsize=small]{todonotes}
\newcommandx{\unsure}[2][1=]{\todo[linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}
\newcommandx{\change}[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}
\newcommandx{\info}[2][1=]{\todo[linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
\newcommandx{\improvement}[2][1=]{\todo[linecolor=Plum,backgroundcolor=Plum!25,bordercolor=Plum,#1]{#2}}
\newcommandx{\thiswillnotshow}[2][1=]{\todo[disable,#1]{#2}}
\newcommand{\rework}[1]{\todo[color=yellow,inline]{Rework: #1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Commands

\newcommand{\myShortTitle}{Response Letter} % This can be default, otherwise try to use a "renewcommand"

\pretocmd{\section}{\clearpage}{}{}% we're forcing the section to a new page

%%%%%%%%%%%% headings setup %%%%%%%%%%%%
\pagestyle{fancy}
% clear styles
\fancyhf{}
% odd pages -> chapter name
\fancyhead[LO]{\leftmark} 
% even pages
\fancyhead[RE]{\myJournal\ -- \myShortTitle}
% odd/even pages
\fancyhead[RO,LE]{\thepage}

\renewcommand{\sectionmark}[1]{\markboth{\textbf{\thesection. #1}}{}}
%\renewcommand{\subsectionmark}[1]{\markright{\textbf{\thesection. #1}}} 

% line under headings
\renewcommand{\headrulewidth}{0.6pt}
% line over foot 
%\renewcommand{\footrulewidth}{0.6pt}

% increases heading weight
\setlength{\headheight}{1.5\headheight}
\fancyfoot{}

\newcommand{\newtext}[1]{\textcolor{blue}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% New revisor comment command
\newcounter{comments}[section]

\newcommand{\rcomment}[1]
{
\stepcounter{comments}
\addcontentsline{toc}{subsection}{Reviewer \#\arabic{section} - Comment \arabic{comments}}
\begin{tcolorbox}[colback=blue!5,colframe=white!30!black,title=Reviewer \#\arabic{section} - Comment \arabic{comments}]
#1
\end{tcolorbox}
}

% New editor comment command
\newcommand{\ecomment}[1]
{
\stepcounter{comments}
\addcontentsline{toc}{subsection}{Editor - Comment \arabic{comments}}
\begin{tcolorbox}[colback=blue!5,colframe=black!70!green,title=Editor - Comment \arabic{comments}]
#1
\end{tcolorbox}
}

% New response comment command
\newcommand{\response}[1]
{
\noindent\textbf{Response:} \newline
#1
}

\newcommand{\mention}[1]
{
    \begin{quote}
	[...]
    #1	
    [...]
	\end{quote}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\header}{
    \begin{center}
        {\Large\manuscriptID} \vspace{1cm} \\
    	{\LARGE\myTitle} \vspace{0.5cm} \\
    	{\large\myJournal} \vspace{0.5cm} \\
    	\today \vspace{0.5cm} \\
    	\myAuthors 
    	\foreach \email in \myEmails {%
            \\ \url{\email} 
        }
        \vspace{1cm} \\
    	\myDept \vspace{3cm}
    \end{center}
}

\newcommand{\hypersettings}{
    \hypersetup{
    	pdfauthor = {\myAuthorsShort},
     	pdftitle = {\myTitle},
    	pdfsubject = {\myJournal\xspace},
    	colorlinks = true,
    	linkcolor=blue,           % color of internal links
    	citecolor=black!70!green, % color of links to bibliography
    	filecolor=magenta,        % color of file links
    	urlcolor=black            % color of external links
    }
}