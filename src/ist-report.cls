% ---------------- Identification ----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist-report}[2018/10/20 v.0.0.1 Unofficial IST ULisboa generic report class]

% ----------------- Initial Code -----------------

% ------------ Declaration of Options ------------

% ------------- Execution of Options -------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{}
\ProcessOptions\relax

% --------------- Package Loading ----------------
\LoadClass{article}

%\RequirePackage{lmodern}
\RequirePackage{newpxtext,newpxmath}
%\RequirePackage{nimbusmononarrow}
\RequirePackage[portuguese,english]{babel} % Last language defines main document language
\RequirePackage{microtype}
\RequirePackage{xcolor}

\RequirePackage[xetex]{geometry}
\RequirePackage[xetex]{graphicx}
\RequirePackage[xetex]{hyperref}

\RequirePackage{mathtools}

\RequirePackage{fancyhdr}
\RequirePackage[bottom]{footmisc}

\RequirePackage{caption}

% ------------------ Main Code -------------------
\renewcommand*\title[1][Report Example]{\def\@title{#1}}
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
	linkcolor	= {red!50!black},
	citecolor	= {green!30!black},
	urlcolor	= {blue!80!black}}

\fancyhf{}
\pagestyle{fancy}
\fancyhead[R]{\@title}
\fancyfoot[R]{\huge \raisebox{-5pt}{\includegraphics[height = 20pt]{IST_C_CMYK_NEG_CROPPED}} \hspace*{2pt} \vrule{} \hspace*{2pt} \thepage{}}
\renewcommand\headrulewidth{0.2pt}
\renewcommand\footrulewidth{0pt}
