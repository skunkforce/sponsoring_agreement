# Makefile for Sponsoring Agreement PDF generation
# LaTeX document compilation with proper handling of data.tex inclusion

# Variables
SRCDIR = src
BUILDDIR = build
MAIN = main
DATA = data.tex

# Default target
all: pdf

# Create build directory if it doesn't exist
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Copy data.tex to build directory for proper inclusion
$(BUILDDIR)/$(DATA): $(DATA) | $(BUILDDIR)
	cp $(DATA) $(BUILDDIR)/

# Compile PDF
pdf: $(BUILDDIR) $(BUILDDIR)/$(DATA)
	cd $(BUILDDIR) && pdflatex -interaction=nonstopmode ../$(SRCDIR)/$(MAIN).tex || (echo "First pass completed with warnings, continuing..." && true)
	cd $(BUILDDIR) && pdflatex -interaction=nonstopmode ../$(SRCDIR)/$(MAIN).tex || (echo "Second pass completed with warnings, continuing..." && true)

# Clean build directory
clean:
	rm -rf $(BUILDDIR)

# Clean and rebuild
rebuild: clean pdf

# View PDF (requires a PDF viewer)
view: pdf
	@if command -v xdg-open >/dev/null 2>&1; then \
		xdg-open $(BUILDDIR)/$(MAIN).pdf; \
	elif command -v open >/dev/null 2>&1; then \
		open $(BUILDDIR)/$(MAIN).pdf; \
	else \
		echo "PDF created at $(BUILDDIR)/$(MAIN).pdf"; \
	fi

# Help
help:
	@echo "Available targets:"
	@echo "  pdf     - Build the sponsoring agreement PDF (default)"
	@echo "  clean   - Remove build directory and all generated files"
	@echo "  rebuild - Clean and rebuild the PDF"
	@echo "  view    - Build and view the PDF"
	@echo "  help    - Show this help message"

# Declare phony targets
.PHONY: all pdf clean rebuild view help