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

## Documentation

The [documentation](doc/) made available in this repo contains details on the inner workings of the class file and the extra options included within. Various examples of usage are also planned for upload.

## Errors, Issues and Suggestions

Any issues with the class and its usage can be reported right here on GitHub. Any contributions to any section of the project, whether it be the class, documentation, or auxiliary code, are welcome!

## Resources

Report regulations were adapted from the [Guia de Preparação da Dissertação](https://academica.tecnico.ulisboa.pt/files/sites/54/guia-de-preparacao-da-dissertacao-1516.pdf "Guia de Preparação da Dissertação") (Dissertation Preparation Guide) from the Direção Académica of the Instituto Superior Técnico.

The full resource list can be found in the provided documentation.

## License

This project is licensed through the [LaTeX Project Public License](https://www.latex-project.org/lppl/), version 1.3c.
