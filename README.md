# Relatório Exemplo Não Oficial para o Instituto Superior Técnico

Relatório de exemplo não oficial para alunos do Instituto Superior Técnico. Este projecto é independente da Universidade de Lisboa e do Instituto Superior Técnico e toma algumas liberdades com estrutura e aspeto, tentando no entanto aderir a regulamentos do Instituto Superior Técnico quando possível. Deve por isso ser usado apenas como guia ou referência para quaisquer documentos submetidos para avaliação oficial dentro do Instituto Superior Técnico.

## Utilização

Para compilar um documento em LaTeX com esta classe, só é necessário fazer download do ficheiro `ist-report.cls`.
1. Colocar o ficheiro `ist-report.cls` na mesma pasta que o documento `.tex` a compilar;
2. Incluir a linha abaixo no início do ficheiro;
````tex
\documentclass{ist-report}
````
   - Opções podem ser incluídas entre parênteses retos entre `\documentclass` e `{ist-report}`, como no exemplo seguinte. As opções utilizáveis encontram-se na documentação.
````tex
\documentclass[english]{ist-report}
````
3. Compilar o documento.

## Opções Implementadas

* Tipo de letra
* Português / inglês
* Cores / preto e branco
* Um / dois lados
* Diferentes estilos de cabeçalho / rodapé
* Modo purista
  * Tenta corresponder ao _Guia de Preparação da Dissertação_ referenciado abaixo o melhor possível.

## Referências

Regulamentos do relatório retirados do [Guia de Preparação da Dissertação](https://academica.tecnico.ulisboa.pt/files/sites/54/guia-de-preparacao-da-dissertacao-1516.pdf "Guia de Preparação da Dissertação") da Direção Académica do Instituto Superior Técnico.

A lista completa de recursos, para além de informações sobre uso e exemplos, serão documentados em ficheiros separados neste mesmo repositório.

## Licença

Este projeto está licenciado através da [LaTeX Project Public License](https://www.latex-project.org/lppl/), versão 1.3c.
