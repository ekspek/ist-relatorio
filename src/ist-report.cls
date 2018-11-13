% ---------------- Identification ----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist-report}[2018/11/13 v.0.6.1 Unofficial IST report class]

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
\newbool{@basic}
\newbool{@purist}

% ------------ Declaration of Options ------------
\DeclareOption{palatino}{\booltrue{@palatino}}
\DeclareOption{portuguese}{\booltrue{@portuguese}}
\DeclareOption{english}{\booltrue{@english}}
\DeclareOption{bw}{\booltrue{@blackandwhite}}
\DeclareOption{basic}{\booltrue{@basic}}
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

\ifbool{@basic}{\RequirePackage{lmodern}\endinput}{}
% == Basic option ends here ==

\RequirePackage{microtype}

\ifbool{xetex}{
	\boolfalse{@purist}
	\ClassWarning{ist-report}{
		The 'purist' option is not supported\MessageBreak
		for unicode compilers. To be added\MessageBreak
		in the future.
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

%  == Commands and customizations ==
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

\input{covers}
\input{pagestyles}
\ifbool{@purist}{
	\pagestyle{plain}
}{
	\pagestyle{default}
}
