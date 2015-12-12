tex_content = helpers4ht $(wildcard *.sty) $(wildcard *.4ht) $(wildcard *.tex) $(wildcard *.lua)
doc_file = helpers4ht-doc.pdf
TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/helpers4ht
MANUAL_DIR = $(TEXMFHOME)/doc/latex/helpers4ht
SYSTEM_DIR = /usr/local/bin
BUILD_DIR = build
BUILD_TEX4EBOOK = $(BUILD_DIR)/helpers4ht/

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
	@mkdir -p $(BUILD_TEX4EBOOK)
	@cp $(tex_content)  helpers4ht-doc.pdf $(BUILD_TEX4EBOOK)
	@cp README.md $(BUILD_TEX4EBOOK)README
	cd $(BUILD_DIR) && zip -r helpers4ht.zip helpers4ht

install: doc $(tex_content)
	mkdir -p $(INSTALL_DIR)
	mkdir -p $(MANUAL_DIR)
	cp $(tex_content) $(INSTALL_DIR)
	cp $(doc_file) $(MANUAL_DIR)
	chmod +x $(INSTALL_DIR)/helpers4ht
	ln -s $(INSTALL_DIR)/helpers4ht $(SYSTEM_DIR)/helpers4ht

