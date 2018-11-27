# Unofficial Report Example for the Instituto Superior Técnico

Unofficial report example for students from the Instituto Superior Técnico. This project is independent from the Universidade de Lisboa and the Instituto Superior Técnico and takes some liberties with regards to structure and design, whilst attempting to stick to the Instituto Superior Técnico's regulations whenever possible.

## Usage

To compile a LaTeX document with this class, you only need to download the file [`ist-report.cls`](src/ist-report.cls).
1. Place the file `ist-report.cls` in the same folder as the `.tex` document to compile;
2. Include the following line in the beginning of the file;
````tex
\documentclass{ist-report}
````
   - Class options can be included in straight brackets between `\documentclass` and `{ist-report}`, as in the following example. The available options can be found in the [documentation](doc/).
````tex
\documentclass[english]{ist-report}
````
3. Compile your document.

### Building your document

Using this class requires no special attention from the user when it comes to building your document. Using a service like [Overleaf](https://www.overleaf.com/ "Overleaf"), just upload the class file and compile. With a local distribution, you can build using your editor of choice or using `pdflatex doc.tex` or `xelatex doc.tex` in your console, where `doc.tex` is the file to be compiled.

### Logos

The Instituto Superior Técnico official logos aren't included in this repository, but can be found in the [official page](https://tecnico.ulisboa.pt/pt/sobre-o-tecnico/institucional/logo-e-manual-de-identidade/). The usage of these logos is recommended and the present repository contains placeholder files, images with the same name, size and structure as the official logos, in the correct place to be replaced by the correct files available in the link above.

## Documentation

The [documentation](doc/) made available in this repo contains details on the inner workings of the class file and the extra options included within. Various examples of usage are also planned for upload.

## Errors, Issues and Suggestions

Any issues with the class and its usage can be reported right here on GitHub. Any contributions to any section of the project, whether it be the class, documentation, or auxiliary code, are welcome!

## Resources

Report regulations were adapted from the [Guia de Preparação da Dissertação](https://academica.tecnico.ulisboa.pt/files/sites/54/guia-de-preparacao-da-dissertacao-1516.pdf "Guia de Preparação da Dissertação") (Dissertation Preparation Guide) from the Direção Académica of the Instituto Superior Técnico.

The full resource list can be found in the provided documentation.

## License

This project is licensed through the [LaTeX Project Public License](https://www.latex-project.org/lppl/), version 1.3c.
