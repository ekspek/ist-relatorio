% ---------------- Identification ----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist-report}[2018/10/20 v.0.4.0 Unofficial IST ULisboa generic report class]

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
%  == Setup ==
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

\newrobustcmd\makecover{
	\begin{titlepage}
	
	\begin{center}
		\vspace*{0.1\textheight}
		\includegraphics[width = 0.4\linewidth, trim = {171.76pt 202pt 171.76pt 202pt}, clip]{NMP_A_CMYK_POS}
		%\includegraphics[trim = {171.76pt 202pt 171.76pt 202pt}, clip]{IST_A_CMYK_POS}
		%\includegraphics[trim = {93.13pt 218.93pt 93.13pt 218.93pt}, clip]{IST_C_CMYK_POS}
		
		\vspace*{0.1\textheight}
% 		\vspace{\fill}
		{\huge\bfseries\@title}
		
		\vspace*{0.01\textheight}
		\ifcsdef{@subtitle}{\Large\@subtitle}{}
		
		\vspace*{3.5mm}
		{\Large \begin{tabular}[t]{c}\@author\end{tabular}}
		
		\vspace{\fill}
		{\large \@subject}
		
		\vspace*{0.01\textheight}
		{\Large \@course}
		
		\vspace*{0.01\textheight}
		{\large \@institution}
	\end{center}
	
	\end{titlepage}
}

\fancyhf{}
\pagestyle{fancy}
\renewcommand\headrulewidth{0.2pt}
\renewcommand\footrulewidth{0pt}
\ifbool{@twoside}{
	\fancyhead[RO,LE]{\textsc{\@title}}
	\fancyfoot[RO]{\LARGE \raisebox{-5pt}{\includegraphics[height = 18pt, trim = {93.13pt 218.93pt 93.13pt 218.93pt}, clip]{NMP_C_CMYK_NEG}} \hspace*{2pt} \vrule{} \hspace*{2pt} \thepage{}}
	\fancyfoot[LE]{\LARGE \thepage{} \hspace*{2pt} \vrule{} \hspace*{2pt} \raisebox{-4pt}{\includegraphics[height = 18pt, trim = {93.13pt 218.93pt 93.13pt 218.93pt}, clip]{NMP_C_CMYK_NEG}}}
	\renewcommand\headrulewidth{0.2pt}
	\renewcommand\footrulewidth{0pt}
}{
	\fancyhead[R]{\textsc{\@title}}
	\fancyfoot[R]{\LARGE \raisebox{-5pt}{\includegraphics[height = 18pt, trim = {93.13pt 218.93pt 93.13pt 218.93pt}, clip]{NMP_C_CMYK_NEG}} \hspace*{2pt} \vrule{} \hspace*{2pt} \thepage{}}
}
