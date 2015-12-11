readme = README.md

packages = $(wildcard *.sty)

alt = $(wildcard alt-packages/*.sty)

BUILD_DIR = build
BUILD_HELPERS = $(BUILD_DIR)/helpers4ht
BUILD_ALT = $(BUILD_HELPERS)/alt-packages

all: doc


doc: helpers4ht-doc.pdf readme.tex

helpers4ht-doc.pdf: helpers4ht-doc.tex changelog.tex
	lualatex helpers4ht-doc.tex

readme.tex: $(readme)
	pandoc -f markdown+definition_lists+inline_notes -t LaTeX README.md > readme.tex

changelog.tex: CHANGELOG
	pandoc -f markdown+definition_lists+inline_notes -t LaTeX CHANGELOG > changelog.tex

build: doc $(packages) $(alt)
	rm -rf $(BUILD_DIR)
	mkdir -p $(BUILD_ALT)
	cp helpers4ht-doc.pdf $(BUILD_HELPERS)
	cp $(packages) $(BUILD_HELPERS)
	cp $(alt) $(BUILD_ALT)
	@cd $(BUILD_DIR) && zip -r helpers4ht.zip helpers4ht
