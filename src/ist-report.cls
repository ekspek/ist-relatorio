  %% ist-report.cls
  %% Copyright 2018 Daniel de Schiffart
  %
  % This work may be distributed and/or modified under the
  % conditions of the LaTeX Project Public License, either version 1.3
  % of this license or (at your option) any later version.
  % The latest version of this license is in
  %   http://www.latex-project.org/lppl.txt
  % and version 1.3 or later is part of all distributions of LaTeX
  % version 2005/12/01 or later.
  %
  % This work has the LPPL maintenance status `maintained'.
  %
  % The Current Maintainer of this work is Daniel de Schiffart.
  %
  % This work consists of the file ist-report.cls.

% ---------------- Identification ----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist-report}[2018/11/13 v.0.6.2 Unofficial IST report class]

% ----------------- Initial Code -----------------
\typeout{_______________________________________________}
\typeout{_______________________________________________}
\typeout{___`:::::::::::::::::::::::::::::::::::::::`___}
\typeout{___.ooooooooooooooooooooooooooooooooooooooo`___}
\typeout{___.oooooooooooooooooooo/://:/+oooooooooooo`___}
\typeout{___.oooooooooooooooooo-`_:oo-_`-ooooooooooo`___}
\typeout{___.ooooooooooooooooo/___+oo+___+oooooooooo`___}
\typeout{___.ooooooooooooooooo/___+ooo+/+ooooooooooo`___}
\typeout{___.oooooooooo+///ooo/___+o///////ooooooooo`___}
\typeout{___.oooooooooo:___+oo/___+o.`___`.ooooooooo`___}
\typeout{___.oooooooooo:___+oo/___+o+/___/+ooooooooo`___}
\typeout{___.oooooooooo:___+oo/___+oo/___/oooooooooo`___}
\typeout{___.oooooooooo:___+oo/___+oo/___/oooooooooo`___}
\typeout{___`oooooooooo:___+oo/___+oo/___/oooooooooo____}
\typeout{____+ooooooooo:___+oo/___+oo/___/ooooooooo+____}
\typeout{____-ooooooooo:___+oo/___+oo/___/ooooooooo-____}
\typeout{_____+oooooooo+///ooo/___+ooo///ooooooooo/_____}
\typeout{_____.ooooooooo//+ooo/___+oooooooooooooo+`_____}
\typeout{______.+oooooo/__`ooo/___+ooooooooooooo+`______}
\typeout{_______`+ooooo+.`_/o+-_`:ooooooooooooo/`_______}
\typeout{________`:oooooo+/:////oooooooooooooo:_________}
\typeout{__________.+ooooooooooooooooooooooo/`__________}
\typeout{____________-+ooooooooooooooooooo/.____________}
\typeout{______________./ooooooooooooooo/.______________}
\typeout{________________`:+ooooooooo+-`________________}
\typeout{___________________.:+ooo+:.___________________}
\typeout{______________________.-`______________________}
\typeout{_______________________________________________}
\typeout{_______________________________________________}

\RequirePackage{etoolbox}
\RequirePackage{ifxetex}
\RequirePackage{ifpdf}
\newbool{@palatino}
\newbool{@portuguese}
\newbool{@english}
\newbool{@blackandwhite}
\newbool{@purist}

% ------------ Declaration of Options ------------
\DeclareOption{palatino}{\booltrue{@palatino}}
\DeclareOption{portuguese}{\booltrue{@portuguese}}
\DeclareOption{english}{\booltrue{@english}}
\DeclareOption{bw}{\booltrue{@blackandwhite}}
\DeclareOption{purist}{\booltrue{@purist}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% ------------- Execution of Options -------------
\ExecuteOptions{portuguese}
\ProcessOptions\relax

% --------------- Package Loading ----------------
\LoadClass{article}

\RequirePackage{mathtools}

\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{hyperref}

\ifbool{xetex}{
	\RequirePackage{fontspec}
	\defaultfontfeatures{Ligatures = TeX}
	\RequirePackage{polyglossia}
	\ifbool{@english}{
		\setmainlanguage[variant = british]{english}
		\setotherlanguage{portuges}
	}{
		\setmainlanguage{portuges}
		\setotherlanguage[variant = british]{english}
	}
}{
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[T1]{fontenc}
	\ifbool{@english}{
		\RequirePackage[portuguese]{babel}
	}{
		\RequirePackage[english]{babel}
	}
}

\RequirePackage{microtype}

\ifbool{xetex}{
	\boolfalse{@purist}
	\ClassWarning{ist-report}{
		The 'purist' option is not supported\MessageBreak
		for unicode engines. To be added in\MessageBreak
		the future.
	}
}

\ifbool{@purist}{
	\ifbool{xetex}{
		% Temporarily unavailable.
		%\setmainfont{Arial}
	}{
		\RequirePackage[scaled = 0.92]{helvet}
		\renewcommand{\familydefault}{\sfdefault}
		%\usepackage[scaled = 1.05]{inconsolata}
	}
}{
	\ifbool{@palatino}{
		\RequirePackage[osf]{newpxtext}
		\RequirePackage{eulervm}
		\RequirePackage[scaled = 1.05]{nimbusmononarrow}
	}{
		\RequirePackage{lmodern}
	}
}

\RequirePackage{xcolor}
\RequirePackage{metalogo}
\RequirePackage{fancyhdr}
\RequirePackage[bottom]{footmisc}
\RequirePackage{caption}
\RequirePackage{tikz}

% ------------------ Main Code -------------------

%  == Setup ==
\geometry{a4paper,
	tmargin = 2.5cm,
	bmargin = 2.5cm,
	lmargin = 2.5cm,
	rmargin = 2.5cm}

\ifbool{@purist}{\renewcommand\baselinestretch{1.5}}

\ifbool{@twoside}{\geometry{twoside}}{\geometry{nomarginpar}}

\ifbool{@blackandwhite}{
	\definecolor{ist-cyan}{cmyk}{1,1,1,1}
	\definecolor{ist-gray}{cmyk}{1,1,1,1}
}{
	\definecolor{ist-cyan}{cmyk}{1,0,0,0}
	\definecolor{ist-gray}{cmyk}{0.2,0,0,0.8}
}

\hypersetup{colorlinks,
	linkcolor	= {ist-cyan},
	citecolor	= {ist-gray},
	urlcolor	= {ist-cyan}}

\graphicspath{{graphics/}}

%  == Macros ==
\def\@groupno{}
\ifbool{@english}{
	\csdef{@title}{Sample Title}
	\csdef{@subject}{Sample Subject}
	\csdef{@course}{Bachelor's Degree in Sample Engineering}
	\newcommand*\groupno[1]{\csdef{@groupno}{Group #1}}
}{
	\csdef{@title}{Título de Exemplo}
	\csdef{@subject}{Disciplina de Exemplo}
	\csdef{@course}{Curso de Exemplo}
	\newcommand*\groupno[1]{\csdef{@groupno}{Grupo #1}}
}
\def\@institution{Instituto Superior Técnico}

\renewcommand*\title[1]{\csdef{@title}{#1}}
\newcommand*\subtitle[1]{\csdef{@subtitle}{#1}}
\newcommand*\subject[1]{\csdef{@subject}{#1}}
\newcommand*\course[1]{\csdef{@course}{#1}}

%  == Cover examples ==
\newrobustcmd\makecover{
	\begin{titlepage}
	
	\begin{center}
		\vspace*{0.1\textheight}
		\includegraphics[width = 0.4\linewidth, trim = {172.4pt 202.7pt 172.6pt 201.4pt}, clip]{IST_A_CMYK_POS}
		
		\vspace*{0.1\textheight}
% 		\vspace{\fill}
		{\huge\bfseries\@title}
		
		\vspace*{0.01\textheight}
		\ifcsdef{@subtitle}{\Large\@subtitle}{}
		
		\vspace*{0.3\textheight}
		{\Large\begin{tabular}[t]{c}\@author\end{tabular}}
		{\ifdefempty{\@groupno}{}{\vspace*{0.01\textheight}\\\@groupno}}
		
		\vspace{\fill}
		{\large \@subject}
		
		\vspace*{0.01\textheight}
		{\Large\@course}
		
		\vspace*{0.01\textheight}
		{\large\@institution}
	\end{center}
	
	\end{titlepage}
	\setcounter{page}{1}
}

%  == Page style examples ==
\fancypagestyle{default}{
	\fancyhf{}
	\renewcommand\headrulewidth{0.pt}
	\renewcommand\footrulewidth{0pt}
	\fancyfoot[C]{\raisebox{-8.55pt}{
		% Set variable size depending on page number if possible (or set as node)
		\begin{tikzpicture}[x = 0.053cm, y = 0.05367cm]
			\coordinate (c1) at (0,0); % Redo setting (0,0) to the south anchor of the text node
			\coordinate (c2) at (11,0);
			\coordinate (c3) at (11,-5);
			\coordinate (c4) at (5.5,-13);
			\coordinate (c5) at (0,-5);
			\coordinate (center) at (5.5,-6.5); % Set using relative positioning
			\coordinate (text) at (5.5,-5.5); % Set relative to (center)
			%\fill [color = {black!80!white}] (c1) to (c2) to (c3) to [out = -90, in = 30] (c4) to [out = 150, in = -90] (c5) to cycle;
			%\node (pageno) at (text) [align = center] {\color{white} \textbf \thepage};
			\draw [thin, color = {black}] (c1) to (c2) to (c3) to [out = -90, in = 30] (c4) to [out = 150, in = -90] (c5) to cycle;
			\node (pageno) at (text) [align = center] {\thepage};
		\end{tikzpicture}}
	}
	\ifbool{@twoside}{
		\fancyhead[LO,RE]{\scshape \@institution}
		\fancyhead[RO,LE]{\scshape \@title}
	}{
		\fancyhead[L]{\scshape \@institution}
		\fancyhead[R]{\scshape \@title}
	}
}

\fancypagestyle{style1}{
	\fancyhf{}
	\renewcommand\headrulewidth{0.2pt}
	\renewcommand\footrulewidth{0pt}
	\ifbool{@twoside}{
		\fancyhead[LO,RE]{\scshape \@title}
		\fancyfoot[LO]{\Large \thepage{} \hspace*{2pt} \vrule{} \hspace*{2pt} \raisebox{-4pt}{\includegraphics[height = 14pt, trim = {93.4pt 219.7pt 77pt 221.9pt}, clip]{IST_C_CMYK_NEG}}}
		\fancyfoot[RE]{\Large \raisebox{-5pt}{\includegraphics[height = 14pt, trim = {93.4pt 219.7pt 77pt 221.9pt}, clip]{IST_C_CMYK_NEG}} \hspace*{2pt} \vrule{} \hspace*{2pt} \thepage{}}
	}{
		\fancyhead[R]{\scshape \@title}
		\fancyfoot[R]{\Large \raisebox{-5pt}{\includegraphics[height = 14pt, trim = {93.4pt 219.7pt 77pt 221.9pt}, clip]{IST_C_CMYK_NEG}} \hspace*{2pt} \vrule{} \hspace*{2pt} \thepage{}}
	}
}

\fancypagestyle{style2}{
	\fancyhf{}
	\renewcommand\headrulewidth{0.pt}
	\renewcommand\footrulewidth{0pt}
	\ifbool{@twoside}{
		\fancyhead[LO,RE]{\scshape \@institution}
		\fancyhead[RO,LE]{\scshape \@title}
		\fancyfoot[C]{- \hspace*{2pt}\thepage \hspace*{2pt} -}
	}{
		\fancyhead[L]{\scshape \@institution}
		\fancyhead[R]{\scshape \@title}
		\fancyfoot[C]{- \hspace*{2pt}\thepage \hspace*{2pt} -}
	}
}

\ifbool{@purist}{
	\pagestyle{plain}
}{
	\pagestyle{default}
}
