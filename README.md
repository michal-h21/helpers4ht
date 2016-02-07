# The `helpers4ht` package. 

This is a bundle of packages providing support for tex4ht configuration. With exception of `alternative4ht`, you shouldn't use them in your documents, but in the `.cfg` files instead. Provided packages are:

alternative4ht

:    provides support for patching unsupported packages with tex4ht. See [Using fontspec package with tex4ht](http://michal-h21.github.io/samples/helpers4ht/fontspec.html) for example.

cssframework

:    simple CSS framework and preprocessor. It doesn't have any documentation or sample usage yet

include4ht 

:    declare additional files to be included, like CSS or Javascript. [Example](http://tex.stackexchange.com/a/210849/2891)

indexing4ht

:    support for indexing with Xindy see an [example](http://tex.stackexchange.com/a/210849/2891)

rfclang

:    get RFC language codes from babel language name

textstyle4ht

:    support for conversion of LaTeX text styling (color, size, etc.) to CSS. new commands tor tag insertion are introduced. See a [tutorial](http://michal-h21.github.io/samples/helpers4ht/textstyle.html)

mathjax-latex-4ht

:    save LaTeX math verbatim in the output document and use `Mathjax` for the displaying. See 
    [this answer](http://tex.stackexchange.com/a/185802/2891) for some background and [another one](http://tex.stackexchange.com/a/265916/2891) for sample use.

# Installation


    cd `kpsewhich -var-value TEXMFHOME`
    mkdir -p tex/latex
    cd tex/latex
    git clone git@github.com:michal-h21/helpers4ht.git

#Usage

To use package in the `.cfg` file, you must include it before the `\Preamble` command:

    \RequirePackage{cssframework}
    \Preamble{xhtml}
    \begin{document}
    \EndPreamble

See [wiki](https://github.com/michal-h21/helpers4ht/wiki) for more information.
