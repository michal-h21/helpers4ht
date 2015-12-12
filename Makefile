tex_content = helpers4ht $(wildcard *.sty) $(wildcard *.4ht) $(wildcard *.tex) $(wildcard *.lua)
doc_file = helpers4ht-doc.pdf
TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/helpers4ht
MANUAL_DIR = $(TEXMFHOME)/doc/latex/helpers4ht
SYSTEM_DIR = /usr/local/bin
BUILD_DIR = build
ALT_DIR = /alt-packages
BUILD_HELPERS = $(BUILD_DIR)/helpers4ht/
BUILD_ALT = $(BUILD_HELPERS)/alt-packages
alt = $(wildcard alt-packages/*.sty)

all: doc

doc: $(doc_file) readme.tex

helpers4ht-doc.pdf: helpers4ht-doc.tex readme.tex changelog.tex
	latexmk -lualatex helpers4ht-doc.tex

readme.tex: README.md
	pandoc -f markdown+definition_lists+inline_notes -t LaTeX README.md > readme.tex

changelog.tex: CHANGELOG.md
	pandoc -f markdown+definition_lists -t LaTeX CHANGELOG.md > changelog.tex

build: doc $(tex_content)
	@rm -rf build
	@mkdir -p $(BUILD_ALT)
	@cp $(tex_content)  helpers4ht-doc.pdf $(BUILD_HELPERS)
	@cp README.md $(BUILD_HELPERS)README
	@cp $(alt) $(BUILD_ALT)
	cd $(BUILD_DIR) && zip -r helpers4ht.zip helpers4ht

install: doc $(tex_content)
	mkdir -p $(INSTALL_DIR)
	mkdir -p $(MANUAL_DIR)
	cp $(tex_content) $(INSTALL_DIR)
	cp $(alt) $(INSTALL_DIR)$(ALT_DIR)
	cp $(doc_file) $(MANUAL_DIR)

