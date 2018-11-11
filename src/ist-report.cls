% ---------------- Identification ----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist-report}[2018/10/20 v.0.6.0 Unofficial IST ULisboa generic report class]

% ----------------- Initial Code -----------------
\RequirePackage{etoolbox}
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

\RequirePackage{ifxetex}
\RequirePackage{ifpdf}

\ifbool{xetex}{
	\RequirePackage{polyglossia}
	\ifbool{@english}{
		\setmainlanguage[variant = british]{english}
		\setotherlanguage{portuges}
	}{
		\setmainlanguage{portuges}
		\setotherlanguage[variant = british]{english}
	}
}{
	\ifbool{@portuguese}{
		\RequirePackage[english]{babel}
	}{
		\RequirePackage[portuguese]{babel}
	}
}

\ifbool{xetex}{
	\RequirePackage[xetex]{geometry}
	\RequirePackage[xetex]{graphicx}
	\RequirePackage[xetex]{hyperref}
	\RequirePackage{fontspec}
	\defaultfontfeatures{Ligatures = TeX}
}{
	\ifbool{pdf}{
		\RequirePackage[utf8]{inputenc}
		\RequirePackage[T1]{fontenc}
		\RequirePackage[pdftex]{geometry}
		\RequirePackage[pdftex]{graphicx}
		\RequirePackage[pdftex]{hyperref}
	}{
		\RequirePackage[dvips]{geometry}
		\RequirePackage[dvips]{graphicx}
		\RequirePackage[hypertex]{hyperref}
	}
}

\ifbool{@basic}{\RequirePackage{lmodern}\endinput}{}
% == Basic option ends here ==

\RequirePackage{microtype}

\ifbool{@purist}{
	\ifbool{xetex}{
		%\setmainfont{Arial}
		\ClassWarning{ist-report}{
			The 'purist' option is not supported\MessageBreak
			for unicode compilers. To be added\MessageBreak
			in the future.
		}
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

\ifbool{xetex}{\boolfalse{@purist}}{}

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
\ifbool{@english}{
	\csdef{@title}{Sample Title}
	\csdef{@subject}{Something Systems}
	\csdef{@course}{Bachelor's Degree in Sample Engineering}
}{
	\csdef{@title}{Título de Exemplo}
	\csdef{@subject}{Disciplina de Exemplo}
	\csdef{@course}{Curso de Exemplo}
}
\def\@institution{Instituto Superior Técnico}
\def\@groupno{0}

\renewcommand*\title[1]{\csdef{@title}{#1}}
\newcommand*\subtitle[1]{\csdef{@subtitle}{#1}}
\newcommand*\subject[1]{\csdef{@subject}{#1}}
\newcommand*\course[1]{\csdef{@course}{#1}}
\newcommand*\groupno[1]{\csdef{@groupno}{#1}}

\input{covers}
\input{pagestyles}
\ifbool{@purist}{
	\pagestyle{plain}
}{
	\pagestyle{default}
}
