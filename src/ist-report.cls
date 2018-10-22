% ---------------- Identification ----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist-report}[2018/10/20 v.0.2.1 Unofficial IST ULisboa generic report class]

% ----------------- Initial Code -----------------
\newif\if@palatino
\newif\if@portuguese
\newif\if@english
\newif\if@blackandwhite

% ------------ Declaration of Options ------------
\DeclareOption{palatino}{\@palatinotrue}
\DeclareOption{portuguese}{\@portuguesetrue\@englishfalse}
\DeclareOption{english}{\@englishtrue\@portuguesefalse}
\DeclareOption{bw}{\@blackandwhitetrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% ------------- Execution of Options -------------
\ExecuteOptions{portuguese}
\ProcessOptions\relax

% --------------- Package Loading ----------------
\LoadClass{article}

\RequirePackage{ifxetex}
\RequirePackage{ifpdf}

\ifxetex
	\RequirePackage{polyglossia}
	\if@portuguese
		\setmainlanguage{portuges}
		\setotherlanguage[variant = british]{english}
	\fi\if@english
		\setmainlanguage[variant = british]{english}
		\setotherlanguage{portuges}
	\fi
\else
	\if@portuguese
		\RequirePackage[portuguese]{babel}
	\fi
	\if@english
		\RequirePackage[english]{babel}
	\fi
\fi

\RequirePackage{mathtools}
\RequirePackage[bottom]{footmisc}

\ifxetex
	\RequirePackage[xetex]{geometry}
	\RequirePackage[xetex]{graphicx}
	\RequirePackage[xetex]{hyperref}
	\RequirePackage{fontspec}
	\defaultfontfeatures{Ligatures = TeX}
\else
	\ifpdf
		\RequirePackage[utf8]{inputenc}
		\RequirePackage[T1]{fontenc}
		\RequirePackage[pdftex]{geometry}
		\RequirePackage[pdftex]{graphicx}
		\RequirePackage[pdftex]{hyperref}
	\else
		\RequirePackage[dvips]{geometry}
		\RequirePackage[dvips]{graphicx}
		\RequirePackage[hypertex]{hyperref}
	\fi
\fi

\RequirePackage{microtype}

\if@palatino
	\RequirePackage{newpxtext}
	\RequirePackage{eulervm}
	\RequirePackage{nimbusmono}
\else
	\RequirePackage{lmodern}
\fi

\RequirePackage{xcolor}

\RequirePackage{fancyhdr}

\RequirePackage{caption}

% ------------------ Main Code -------------------
\if@portuguese
	\def\@title{Título de Exemplo}
	\def\@subtitle{Subtítulo de Exemplo}
	\def\@subject{Disciplina de Exemplo}
	\def\@course{Curso de Exemplo}
\fi\if@english
	\def\@title{Sample Title}
	\def\@subtitle{Sample Subtitle}
	\def\@subject{Sample Course}
	\def\@course{Sample Degree}
\fi
\def\@institution{Instituto Superior Técnico}
\def\@groupno{0}

\renewcommand*\title[1]{\def\@title{#1}}
\newcommand*\subtitle[1]{\def\@subtitle{#1}}
\newcommand*\subject[1]{\def\@subject{#1}}
\newcommand*\course[1]{\def\@course{#1}}
\newcommand*\groupno[1]{\def\@groupno{#1}}

\graphicspath{{graphics/}}

\geometry{a4paper, nomarginpar,
	tmargin = 2.5cm,
	bmargin = 2.5cm,
	lmargin = 2.5cm,
	rmargin = 2.5cm}

\if@blackandwhite
	\definecolor{ist-cyan}{cmyk}{1,1,1,1}
	\definecolor{ist-gray}{cmyk}{1,1,1,1}
\else
	\definecolor{ist-cyan}{cmyk}{1,0,0,0}
	\definecolor{ist-gray}{cmyk}{0.2,0,0,0.8}
\fi

\hypersetup{colorlinks,
	linkcolor	= {ist-cyan},
	citecolor	= {ist-gray},
	urlcolor	= {ist-cyan}}

\fancyhf{}
\pagestyle{fancy}
\fancyhead[R]{\@title}
\fancyfoot[R]{\huge \raisebox{-5pt}{\includegraphics[height = 20pt]{IST_C_CMYK_NEG_CROPPED}} \hspace*{2pt} \vrule{} \hspace*{2pt} \thepage{}}
\renewcommand\headrulewidth{0.2pt}
\renewcommand\footrulewidth{0pt}
