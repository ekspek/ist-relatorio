% ---------------- Identification ----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist-report}[2018/10/20 v.0.3.0 Unofficial IST ULisboa generic report class]

% ----------------- Initial Code -----------------
\RequirePackage{etoolbox}
\newbool{@palatino}
\newbool{@portuguese}
\newbool{@english}
\newbool{@blackandwhite}

% ------------ Declaration of Options ------------
\DeclareOption{palatino}{\booltrue{@palatino}}
\DeclareOption{portuguese}{\booltrue{@portuguese}}
\DeclareOption{english}{\booltrue{@english}}
\DeclareOption{bw}{\booltrue{@blackandwhite}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% ------------- Execution of Options -------------
\ExecuteOptions{portuguese}
\ProcessOptions\relax

% --------------- Package Loading ----------------
\LoadClass{article}

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

\RequirePackage{mathtools}
\RequirePackage[bottom]{footmisc}

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

\RequirePackage{microtype}

\ifbool{@palatino}{
	\RequirePackage{newpxtext}
	\RequirePackage{eulervm}
	\RequirePackage{nimbusmono}
}{
	\RequirePackage{lmodern}
}

\RequirePackage{xcolor}

\RequirePackage{fancyhdr}

\RequirePackage{caption}

% ------------------ Main Code -------------------
\ifbool{@english}{
	\csdef{@title}{Sample Title}
	\csdef{@subtitle}{Sample Subtitle}
	\csdef{@subject}{Sample Course}
	\csdef{@course}{Sample Degree}
}{
	\csdef{@title}{Título de Exemplo}
	\csdef{@subtitle}{Subtítulo de Exemplo}
	\csdef{@subject}{Disciplina de Exemplo}
	\csdef{@course}{Curso de Exemplo}
}
\def\@institution{Instituto Superior Técnico}
\def\@groupno{0}

\renewcommand*\title[1]{\def\@title{#1}}
\newcommand*\subtitle[1]{\def\@subtitle{#1}}
\newcommand*\subject[1]{\def\@subject{#1}}
\newcommand*\course[1]{\def\@course{#1}}
\newcommand*\groupno[1]{\def\@groupno{#1}}

\geometry{a4paper,
	tmargin = 2.5cm,
	bmargin = 2.5cm,
	lmargin = 2.5cm,
	rmargin = 2.5cm}

\ifbool{@twoside}{
	\geometry{twoside}
}{
	\geometry{nomarginpar}
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
	citecolor	= {ist-gray},
	urlcolor	= {ist-cyan}}

\graphicspath{{graphics/}}

\fancyhf{}
\pagestyle{fancy}
\renewcommand\headrulewidth{0.2pt}
\renewcommand\footrulewidth{0pt}
\ifbool{@twoside}{
	\fancyhead[RO,LE]{\textsc{\@title}}
	\fancyfoot[RO]{\LARGE \raisebox{-5pt}{\includegraphics[height = 18pt]{IST_C_CMYK_NEG_CROPPED}} \hspace*{2pt} \vrule{} \hspace*{2pt} \thepage{}}
	\fancyfoot[LE]{\LARGE \thepage{} \hspace*{2pt} \vrule{} \hspace*{2pt} \raisebox{-4pt}{\includegraphics[height = 18pt]{IST_C_CMYK_NEG_CROPPED}}}
	\renewcommand\headrulewidth{0.2pt}
	\renewcommand\footrulewidth{0pt}
}{
	\fancyhead[R]{\textsc{\@title}}
	\fancyfoot[R]{\LARGE \raisebox{-5pt}{\includegraphics[height = 18pt]{IST_C_CMYK_NEG_CROPPED}} \hspace*{2pt} \vrule{} \hspace*{2pt} \thepage{}}
}
