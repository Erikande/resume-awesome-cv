.PHONY: help build clean purge open watch spell lint

# ===== HELP =====
help:
	@echo "Available targets:"
	@echo "  build    - Build PDF from src/resume.tex to output/resume.pdf"
	@echo "  clean    - Remove auxiliary and log files in output/, including PDFs"
	@echo "  purge    - Remove all files in output/, including PDFs"
	@echo "  open     - Open the compiled PDF"
	@echo "  watch    - Auto-build on changes (needs latexmk)"
	@echo "  spell    - Spellcheck .tex sources (customize as needed)"
	@echo "  lint     - Lint .tex sources (customize as needed)"

# ===== BUILD =====
build:
	TEXINPUTS=src: xelatex -output-directory=output src/resume.tex

# ===== CLEAN AUX FILES ONLY =====
clean:
	rm -f output/*.aux output/*.log output/*.out output/*.pdf output/*.synctex.gz

# ===== REMOVE *ALL* OUTPUT (INCLUDING PDF) =====
purge:
	rm -rf output/*

# ===== OPEN PDF =====
open:
	open output/resume.pdf

# ===== LIVE REBUILD (OPTIONAL: REQUIRES latexmk) =====
watch:
	TEXINPUTS=src: latexmk -xelatex -output-directory=output -pvc src/resume.tex

# ===== SPELLCHECK (CUSTOMIZE IF YOU WANT) =====
spell:
	echo "Spellchecking (customize this if you want smarter checking)"
	aspell -c src/*.tex

# ===== LINT (CUSTOMIZE IF YOU WANT) =====
lint:
	echo "Linting (customize this if you use chktex or similar)"
	chktex src/*.tex
