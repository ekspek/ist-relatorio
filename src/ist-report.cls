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
  %
  % The most recent version of this work, along with
  % documentation and examples, can be found online
  % at https://github.com/ekspek/ist-relatorio

% ---------------- Identification ----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist-report}[2018/12/30 v0.7.4 Unofficial IST report class]

% ----------------- Initial Code -----------------
\typeout{_____________________________________________________________________________}
\typeout{_____________________________________________________________________________}
\typeout{__________________`:::::::::::::::::::::::::::::::::::::::`__________________}
\typeout{__________________.ooooooooooooooooooooooooooooooooooooooo`__________________}
\typeout{__________________.oooooooooooooooooooo/://:/+oooooooooooo`__________________}
\typeout{__________________.oooooooooooooooooo-`_:oo-_`-ooooooooooo`__________________}
\typeout{__________________.ooooooooooooooooo/___+oo+___+oooooooooo`__________________}
\typeout{__________________.ooooooooooooooooo/___+ooo+/+ooooooooooo`__________________}
\typeout{__________________.oooooooooo+///ooo/___+o///////ooooooooo`__________________}
\typeout{__________________.oooooooooo:___+oo/___+o.`___`.ooooooooo`__________________}
\typeout{__________________.oooooooooo:___+oo/___+o+/___/+ooooooooo`__________________}
\typeout{__________________.oooooooooo:___+oo/___+oo/___/oooooooooo`__________________}
\typeout{__________________.oooooooooo:___+oo/___+oo/___/oooooooooo`__________________}
\typeout{__________________`oooooooooo:___+oo/___+oo/___/oooooooooo___________________}
\typeout{___________________+ooooooooo:___+oo/___+oo/___/ooooooooo+___________________}
\typeout{___________________-ooooooooo:___+oo/___+oo/___/ooooooooo-___________________}
\typeout{____________________+oooooooo+///ooo/___+ooo///ooooooooo/____________________}
\typeout{____________________.ooooooooo//+ooo/___+oooooooooooooo+`____________________}
\typeout{_____________________.+oooooo/__`ooo/___+ooooooooooooo+`_____________________}
\typeout{______________________`+ooooo+.`_/o+-_`:ooooooooooooo/`______________________}
\typeout{_______________________`:oooooo+/:////oooooooooooooo:________________________}
\typeout{_________________________.+ooooooooooooooooooooooo/`_________________________}
\typeout{___________________________-+ooooooooooooooooooo/.___________________________}
\typeout{_____________________________./ooooooooooooooo/._____________________________}
\typeout{_______________________________`:+ooooooooo+-`_______________________________}
\typeout{__________________________________.:+ooo+:.__________________________________}
\typeout{_____________________________________.-`_____________________________________}
\typeout{_____________________________________________________________________________}
\typeout{_____________________________________________________________________________}

\RequirePackage{etoolbox}
\RequirePackage{ifluatex}
\RequirePackage{ifxetex}
\RequirePackage{ifpdf}
\newbool{@palatino}
\newbool{@portuguese}
\newbool{@english}
\newbool{@blackandwhite}
\newbool{@purist}
\newbool{@minimal}
\newbool{@fira}

% ------------ Declaration of Options ------------
\DeclareOption{palatino}	{\booltrue{@palatino}}
\DeclareOption{portuguese}	{\booltrue{@portuguese}}
\DeclareOption{english}		{\booltrue{@english}}
\DeclareOption{bw}			{\booltrue{@blackandwhite}}
\DeclareOption{purist}		{\booltrue{@purist}}
\DeclareOption{minimal}		{\booltrue{@minimal}}
\DeclareOption{fira}		{\booltrue{@fira}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% ------------- Execution of Options -------------
\ExecuteOptions{portuguese}
\ProcessOptions\relax

% --------------- Package Loading ----------------
\LoadClass{article}

% Define option hierarchy and set conflict resolution
\ifbool{@purist}
	{ \boolfalse{@minimal} \boolfalse{@twocolumn} \boolfalse{@palatino} \boolfalse{@fira} }
	{}
\ifbool{@fira}
	{ \boolfalse{@palatino} }
	{}
\ifbool{@minimal}
	{ \boolfalse{@twoside} \boolfalse{@twocolumn} }
	{}
\ifbool{@english}
	{ \boolfalse{@portuguese} }
	{}

% Unicode boolean for either XeTeX or LuaTeX
\newbool{unicode}
\ifbool{xetex}{
	\booltrue{unicode}
}{
	\ifbool{luatex}
		{ \booltrue{unicode} }
		{ \boolfalse{unicode} }
}

\RequirePackage{mathtools}
\RequirePackage{geometry}

% Fix for header and footer margins not updating with renewed margins
\let\Oldgeometry\geometry
\renewcommand{\geometry}[1]{
	\Oldgeometry{#1}
	\setlength{\headwidth}{\textwidth}
}

\RequirePackage{graphicx}
\RequirePackage{hyperref}

\ifbool{unicode}{
	\RequirePackage[no-math]{fontspec}
}{
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[T1]{fontenc}
}

% === Main font selection ===
\ifbool{@purist}{
	\renewcommand{\familydefault}{\sfdefault}
	\ifbool{unicode}{
		\setsansfont[
			Extension = .otf,
			UprightFont = *-regular,
			BoldFont = *-bold,
			ItalicFont = *-italic,
			BoldItalicFont = *-bolditalic]{texgyreheros}
		\setmonofont[Scale = 1.14]{inconsolata}
	}{
		\RequirePackage{tgheros}
		\RequirePackage[scaled = 1.14]{inconsolata}
	}
	\RequirePackage{newtxsf}
}{
	\ifbool{@palatino}{
		\RequirePackage[osf]{newpxtext}
		\RequirePackage{eulervm}
		\RequirePackage[scaled = 1.05]{nimbusmononarrow}
	}{
		\RequirePackage{lmodern}
	}
}
% === End font selection ===

\ifbool{unicode}{
	\RequirePackage{polyglossia}
	\ifbool{@english}{
		\setmainlanguage[variant = british]{english}
		\setotherlanguage{portuges}
	}{
		\setmainlanguage{portuges}
		\setotherlanguage[variant = british]{english}
	}
}{
	\ifbool{@english}
		{ \RequirePackage[english]{babel} }
		{ \RequirePackage[portuguese]{babel} }
}

\RequirePackage{microtype}
\RequirePackage{xcolor}
\RequirePackage{metalogo}
\RequirePackage{fancyhdr}
\RequirePackage[bottom]{footmisc}
\RequirePackage{caption}
\RequirePackage{tikz}

%\ifbool{@minimal}{
%	\RequirePackage{multicol}
%	\AfterEndPreamble{\begin{multicols}{2}}
%	\AtEndDocument{\end{multicols}}
%}{}

% ------------------ Main Code -------------------

%  == Setup ==

\ifbool{@purist}{
	\geometry{a4paper, margin = 2.5cm}
	\renewcommand\baselinestretch{1.5}
}{
	\ifbool{@minimal}{
		\geometry{a4paper,
			top = 0.7cm,
			bottom = 1cm,
			hmargin = 1cm,
			includeheadfoot,
			nomarginpar,
			head = 12pt,
			foot = 22pt,
		}
	}{
		\ifbool{@fira}{
			\geometry{a4paper, margin = 2.5cm}
			\renewcommand\baselinestretch{1.15}
		}{
			\geometry{a4paper,
				includeheadfoot,
				top = 1cm,
				bottom = 2cm,
				hmargin = 3.5cm,
			}
			\ifbool{@twoside}
				{ \geometry{twoside} }
				{}
		}
	}
}

\ifbool{@blackandwhite}{
	\definecolor{ist-cyan}{cmyk}{1,1,1,1}
	\definecolor{ist-gray}{cmyk}{1,1,1,1}
}{
	\definecolor{ist-cyan}{cmyk}{1,0,0,0}
	\definecolor{ist-gray}{cmyk}{0.2,0,0,0.8}
}

\hypersetup{colorlinks,
	linkcolor	= {ist-cyan},
	citecolor	= {ist-cyan},
	urlcolor	= {ist-cyan}}

%  == Macros ==
\def\@groupno{}
\csdef{@institution}{Instituto Superior Técnico}
\csdef{@coverdate}{\today}
\ifbool{@english}{
	\csdef{@title}{Sample Title}
	\csdef{@subtitle}{Sample Subtitle}
	\csdef{@subject}{Sample Subject}
	\csdef{@course}{Sample Degree}
	\newcommand*\setgroupno[1]{\csdef{@groupno}{Group #1}}
}{
	\csdef{@title}{Título de Exemplo}
	\csdef{@subtitle}{Subtítulo de Exemplo}
	\csdef{@subject}{Disciplina de Exemplo}
	\csdef{@course}{Curso de Exemplo}
	\newcommand*\setgroupno[1]{\csdef{@groupno}{Grupo #1}}
}

\newcommand*\settitle[1]{\csdef{@title}{#1}}
\newcommand*\setsubtitle[1]{\csdef{@subtitle}{#1}}
\newcommand*\setsubject[1]{\csdef{@subject}{#1}}
\newcommand*\setcourse[1]{\csdef{@course}{#1}}
\newcommand*\setinstitution[1]{\csdef{@institution}{#1}}

%  == Minimal mode header
\newrobustcmd\makeheader{
	%\ifbool{@minimal}{\end{multicols}}{}
	\begin{center}
		\includegraphics[scale=0.3, trim = {93.4pt 219.7pt 77pt 221.9pt}]{IST_C_CMYK_POS}

		\vspace*{3mm}
		{\huge \textbf{\@title}} \\
		\vspace*{4mm}
		{\LARGE \@subtitle}
		\vspace*{4mm} \\
		{\large \@author}

		\vspace*{3mm}
		{\Large \@coverdate}
		\vspace*{4mm} \\
		\rule{\linewidth}{0.5pt}
	\end{center}
	%\ifbool{@minimal}{\begin{multicols}{2}}
}

%  == Cover examples ==
\newrobustcmd\makecover{
	\begin{titlepage}

	\begin{center}
		\vspace*{0.1\textheight}
		\includegraphics[width = 0.4\linewidth, trim = {172.4pt 202.7pt 172.6pt 201.4pt}, clip]{IST_A_CMYK_POS}

		\vspace*{0.1\textheight}
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

		\vspace*{0.01\textheight}
		{\@date}
	\end{center}

	\end{titlepage}
	\setcounter{page}{1}
}

\newbool{fullshield}
%  == Page style examples ==
\fancypagestyle{default}{
	\fancyhf{}
	\renewcommand\headrulewidth{0pt}
	\renewcommand\footrulewidth{0pt}
	\fancyfoot[C]{\raisebox{-8.55pt}{
		\begin{tikzpicture}[x = 0.053cm, y = 0.05367cm]
			\coordinate (text) at (0,0);
			\path (text) ++(-5.5,5.5) coordinate (e1);
			\path (text) ++(5.5,0.5) coordinate (e2);
			\path (text) ++(0,-7.5) coordinate (e3);
			\ifbool{fullshield}{
				\path [fill, color = {ist-cyan}] (e1) to (e1-|e2) to (e2) to [out = -90, in = 30] (e3) to [out = 150, in = -90] (e1|-e2) to cycle;
				\node (text_fill) at (0,0) [align = center, inner sep = 0pt] {\color{white} \textbf \thepage};
			}{
				\path [thin, draw, color = {black}] (e1) to (e1-|e2) to (e2) to [out = -90, in = 30] (e3) to [out = 150, in = -90] (e1|-e2) to cycle;
				\node (text_black) at (text) [align = center, inner sep = 0pt] {\thepage};
			}
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

\fancypagestyle{minimalstyle}{
	\fancyhf{}
	\renewcommand\headrulewidth{0.2pt}
	\renewcommand\footrulewidth{0pt}
	\fancyfoot[C]{\raisebox{-8.55pt}{
		\begin{tikzpicture}[x = 0.053cm, y = 0.05367cm]
			\coordinate (c1) at (0,0);
			\coordinate (c2) at (11,0);
			\coordinate (c3) at (11,-5);
			\coordinate (c4) at (5.5,-13);
			\coordinate (c5) at (0,-5);
			\coordinate (center) at (5.5,-6.5);
			\coordinate (text) at (5.5,-5.5);
			\draw [thin, color = {black}] (c1) to (c2) to (c3) to [out = -90, in = 30] (c4) to [out = 150, in = -90] (c5) to cycle;
			\node (pageno) at (text) [align = center] {\thepage};
		\end{tikzpicture}
	}}
	\fancyhead[L]{\scshape \@institution}
	\fancyhead[R]{\scshape \@subject}
}

\fancypagestyle{style1}{
	\fancyhf{}
	\renewcommand\headrulewidth{0.2pt}
	\renewcommand\footrulewidth{0pt}
	\ifbool{@twoside}{
		\fancyhead[LO,RE]{\scshape \@title}
		\fancyfoot[LO]{\Large \thepage{} \hspace*{2pt} \vrule{} \hspace*{2pt} \raisebox{-4pt}{\includegraphics[height = 14pt, trim = {93.4pt 219.7pt 77pt 221.9pt}, clip]{IST_C_CMYK_POS}}}
		\fancyfoot[RE]{\Large \raisebox{-5pt}{\includegraphics[height = 14pt, trim = {93.4pt 219.7pt 77pt 221.9pt}, clip]{IST_C_CMYK_POS}} \hspace*{2pt} \vrule{} \hspace*{2pt} \thepage{}}
	}{
		\fancyhead[R]{\scshape \@title}
		\fancyfoot[R]{\Large \raisebox{-5pt}{\includegraphics[height = 14pt, trim = {93.4pt 219.7pt 77pt 221.9pt}, clip]{IST_C_CMYK_POS}} \hspace*{2pt} \vrule{} \hspace*{2pt} \thepage{}}
	}
}

\fancypagestyle{style2}{
	\fancyhf{}
	\renewcommand\headrulewidth{0pt}
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
	\ifbool{@minimal}{
		\pagestyle{minimalstyle}
	}{
		\pagestyle{default}
	}
}
