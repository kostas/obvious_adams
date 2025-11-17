# Project name
PROJECT = obvious_adams

.PHONY: all pdf epub clean

# Default target: build both PDF and EPUB
all: pdf epub

# Build PDF using LuaLaTeX
pdf: $(PROJECT).pdf

$(PROJECT).pdf: $(PROJECT).tex
	latexmk --pdflua $(PROJECT).tex

# Build EPUB using Pandoc
epub: $(PROJECT).epub

$(PROJECT).epub: $(PROJECT).tex doublemdash.lua
	pandoc $(PROJECT).tex -o $(PROJECT).epub \
		--lua-filter=doublemdash.lua \
		--metadata title="Obvious Adams: The Story of a Successful Business Man" \
		--metadata author="Robert R. Updegraff" \
		--metadata date="1916" \
		--metadata lang="en-US"

# Clean build artifacts
clean:
	rm -f $(PROJECT).aux $(PROJECT).log $(PROJECT).out $(PROJECT).toc $(PROJECT).fls $(PROJECT).pdf $(PROJECT).epub
