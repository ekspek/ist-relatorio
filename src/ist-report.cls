% ---------------- Identification ----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist-report}[2018/10/20 v.0.0.1 Unofficial IST ULisboa generic report class]

% ----------------- Initial Code -----------------
\newif\if@palatino

% ------------ Declaration of Options ------------
\DeclareOption{palatino}{\@palatinotrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% ------------- Execution of Options -------------
\ExecuteOptions{}
\ProcessOptions\relax

% --------------- Package Loading ----------------
\LoadClass{article}

\RequirePackage[portuguese,english]{babel} % Last language defines main document language

\RequirePackage{mathtools}
\RequirePackage[bottom]{footmisc}

\RequirePackage{ifxetex}
\RequirePackage{ifpdf}
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
\renewcommand*\title[1][Right Header]{\def\@title{#1}}
\title{}

\graphicspath{{graphics/}}

\geometry{a4paper, nomarginpar,
	tmargin = 2.5cm,
	bmargin = 2.5cm,
	lmargin = 2.5cm,
	rmargin = 2.5cm}

\definecolor{ist-cyan}{cmyk}{1,0,0,0}
\definecolor{ist-gray}{cmyk}{0.2,0,0,0.8}

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
