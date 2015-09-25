readme = README.md

all: doc

doc: helpers4ht-doc.pdf readme.tex

helpers4ht-doc.pdf: readme.tex helpers4ht-doc.tex changelog.tex
	lualatex helpers4ht-doc.tex

readme.tex: $(readme)
	pandoc -f markdown+definition_lists+inline_notes -t LaTeX README.md > readme.tex

changelog.tex: CHANGELOG
	pandoc -f markdown+definition_lists+inline_notes -t LaTeX CHANGELOG > changelog.tex

