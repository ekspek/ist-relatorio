# Quick-Start Guide

No time for reading docs? Get dug right in with this guide.

## Working Directory and Files

Your working directory should look like this:
```
.
├── graphics
│   ├── IST_A_CMYK_POS.pdf
│   └── IST_C_CMYK_POS.pdf
├── ist-report.cls
├── main.tex
└── preamble.tex
```

+ `/graphics` is where you should put all your images to keep things tidy.
+ Get the files `IST_A_CMYK_POS.pdf` and `IST_C_CMYK_POS.pdf` from [here](https://tecnico.ulisboa.pt/en/about-tecnico/institutional/logo-identity-standards/). They are not included in this repo to avoid copyright issues.
+ `main.tex` is your report body, it should have the following structure:

```tex
\documentclass[english]{ist-report}
\graphicspath{{graphics/}}
\input{preamble}

\begin{document}

% Your report

\end{document}

```

+ `preamble.tex` is where you should import packages and set up other configuration as you like.

## Packages

This template already imports all the useful typesetting packages, and should work with any compiler you're using. Check the full documentation for the exact packages already loaded.

Anything other packages you need, just add them to your `preamble.tex`.

## Class options

This template provides some options which you can use with the `\documentclass[]{ist-report}` command, between the squared brackets. Here is the overview:

+ `purist` - Sets the typesetting to resemble the standard IST thesis template.
+ `palatino` - Typesetting using `newpxtext` and math mode with `eulervm` - gives a more modern look.
+ `minimal` - For when the page limit is just too tight, sets the document to two-column mode and really wide margins.
+ `portuguese` or `english` - This one should be obvious.
+ `bw` - Black and white mode, useful for printing in black and white.

Check the [full documentation](https://github.com/ekspek/ist-relatorio/blob/master/doc/doc_en.pdf) for more details.

## Compiling

Compiling should be straightforward with your favorite Latex IDE. Some packages however may require special attention:

+ `biblatex` - The most popular bibliography management package. While using it, your compilation sequence is recomended to be:
```bash
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```
Look up how to do this for your editor or IDE.

+ `minted` and `verbatim` - Very good packages for integrating source code, in this case you must pass the `-shell-escape` flag to your compiler, as
```bash
xelatex main.tex -shell-escape
```
Again, search online how your editor can do this automatically.

If you use a service like Overleaf, everything is done for you :)
