# Relatório Exemplo Não Oficial para o Instituto Superior Técnico

[Read this page in english.](README_EN.md)

Relatório de exemplo não oficial para alunos do Instituto Superior Técnico. Este projecto é independente da Universidade de Lisboa e do Instituto Superior Técnico e toma algumas liberdades com estrutura e aspeto, tentando no entanto aderir a regulamentos do Instituto Superior Técnico quando possível.

## Utilização

Para compilar um documento em LaTeX com esta classe, só é necessário fazer download do ficheiro [`ist-report.cls`](src/ist-report.cls).
1. Colocar o ficheiro `ist-report.cls` na mesma pasta que o documento `.tex` a compilar;
2. Incluir a linha abaixo no início do ficheiro;
````tex
\documentclass{ist-report}
````
   - Opções podem ser incluídas entre parênteses retos entre `\documentclass` e `{ist-report}`, como no exemplo seguinte. As opções utilizáveis encontram-se na [documentação](doc/).
````tex
\documentclass[english]{ist-report}
````
3. Compilar o documento.

### Compilação

Qualquer documento que utilize esta classe pode ser compilado da mesma maneira que a maior parte dos documentos LaTeX, sem configurações adicionais. Num serviço como o [Overleaf](https://www.overleaf.com/ "Overleaf"), basta fazer upload da classe e compilar. Para uma instalação local, basta correr o compilador através do editor de eleição ou através de `pdflatex doc.tex` ou `xelatex doc.tex` na linha de comandos, onde `doc.tex` é o documento a ser compilado.

### Logótipos

Os logótipos oficiais do Instituto Superior Técnico não estão incluídos neste repositório, mas podem ser encontrados na [página oficial](https://tecnico.ulisboa.pt/pt/sobre-o-tecnico/institucional/logo-e-manual-de-identidade/). A utilização destes logótipos são recomendados e o repositório tem _placeholders_, ficheiros com nome, tamanho e estrutura iguais aos logótipos oficiais, colocados no sítio certo para serem substituídos pelos ficheiros corretos.

## Documentação

A [documentação](doc/) disponibilizada inclui detalhes sobre o conteúdo da classe e como melhor fazer uso das funções incluídas. Ainda estão planeados serem incluídos diversos exemplos a utilizar a classe.

## Erros, Problemas e Sugestões

Problemas com utilização da classe podem ser reportados aqui mesmo no GitHub. Contribuições em qualquer aspeto do projeto são bem-vindas!

## Referências

Regulamentos do relatório retirados do [Guia de Preparação da Dissertação](https://academica.tecnico.ulisboa.pt/files/sites/54/guia-de-preparacao-da-dissertacao-1516.pdf "Guia de Preparação da Dissertação") da Direção Académica do Instituto Superior Técnico.

A lista completa de recursos está disponibilizada na documentação.

## Licença

Este projeto está licenciado através da [LaTeX Project Public License](https://www.latex-project.org/lppl/), versão 1.3c.
