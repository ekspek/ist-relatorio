# Relatório Exemplo para o Instituto Superior Técnico

Relatório de exemplo para alunos do Instituto Superior Técnico. Este projecto é independente da Universidade de Lisboa e toma algumas liberdades com estrutura e aspeto, tentando no entanto aderir a regulamentos do Instituto Superior Técnico quando possível. Deve por isso ser usado apenas como guia ou referência para quaisquer documentos submetidos para avaliação oficial dentro do Instituto Superior Técnico.

## Utilização

Para compilar um documento em LaTeX com esta classe, só é necessário fazer download do ficheiro `ist-report.cls`.
1. Colocar o ficheiro `ist-report.cls` na mesma pasta que o documento `.tex` a compilar;
2. Incluir a linha abaixo no início do ficheiro;
```
\documentclass{ist-report}
````
   - Opções podem ser incluídas entre parênteses retos entre `\documentclass` e `{ist-report}`, como no exemplo seguinte. As opções utilizáveis encontram-se na documentação.
```
\documentclass[english]{ist-report}
````
3. Compilar o documento.

## To-do

* ~~Criar uma classe separada do ficheiro .tex principal.~~
* Criar capa
* Implementar mais cores
* Implementar bibliografia
* Implementar as opções listadas
* Definir convenções utilizadas para siunitx
* Criar makefile
* Comentar class file
* Remover os logótipos pré-release, ~~criar placeholders, implementar pdfcrop~~
* Adicionar exemplos diferentes
* Obter licença LaTeX Project Public License

## Opções

De início não vão ser implementadas muitas opções, em vez aderindo a um estilo pré-definido que funcione em conjunção com a classe. À medida que o projeto progride serão implementadas não só opções adicionais como variantes de capas e estilos de páginas.

### Implementadas

* Tipo de letra
* Português / inglês
* Cores / preto e branco
* Um / dois lados

### A Implementar

* Com / sem capa / variações de capa
* Mais que um estilo de cabeçalho / rodapé
  * Escudo em TikZ com número de página?
* Arial para secções (maybe?)
* ~~Versão minted, check de instalações~~ (deixar isto para o utilizador)
* Versão IST purista (Arial, margens pré-definidas, outros detalhes)
  * Conseguido este objetivo, o repo vai a público

## Referências

Baseado em grande parte no relatório do [Huisstijl](https://www.tudelft.nl/huisstijl/ "Huisstijl TU Delft") da Technische Universiteit Delft, conteúdo adaptado também adaptado do [Modelo de Tese em LaTeX](https://fenix.tecnico.ulisboa.pt/homepage/ist31052/documentos-para-elaboracao-da-tese "Modelo de Tese em LaTeX") do professor André Calado Marta do Instituto Superior Técnico e do [modelo não oficial para tese](https://github.com/fwalch/tum-thesis-latex "TUM LaTeX Thesis") da Technische Universität München.

Regulamentos do relatório retirados do [Guia de Preparação da Dissertação](https://academica.tecnico.ulisboa.pt/files/sites/54/guia-de-preparacao-da-dissertacao-1516.pdf "Guia de Preparação da Dissertação") da Direção Académica do Instituto Superior Técnico.

A lista completa de recursos, para além de informações sobre uso e exemplos, serão documentados em ficheiros separados neste mesmo repositório.
