# Sponsoring Agreement Generator

A LaTeX-based system to generate professional sponsoring agreements for non-profit organizations.

## Overview

This system generates PDF sponsoring agreements from customizable data files. Users only need to modify the `data.tex` file with their specific information - the main LaTeX document (`src/main.tex`) remains unchanged.

## Quick Start

1. Edit `data.tex` with your specific information (sponsor details, non-profit details, agreement terms)
2. Build the PDF: `make pdf`
3. Find your generated agreement at `build/main.pdf`

## Structure

```
.
├── Makefile           # Build system for PDF generation
├── data.tex           # Variables and data (EDIT THIS FILE)
├── src/
│   └── main.tex       # Main LaTeX document (DO NOT EDIT)
├── assets/            # Directory for additional resources
└── build/             # Generated files (PDF output)
```

## Usage

### Customizing Your Agreement

Edit the `data.tex` file to include your specific information:

- **Sponsor Information**: Company name, representative, address, VAT ID, contact details
- **Non-profit Information**: Organization name, representative, address, registration, contact details  
- **Agreement Terms**: Amount, currency, purpose, duration, payment terms

### Building the PDF

```bash
# Build the PDF
make pdf

# Clean and rebuild
make rebuild

# View available commands
make help
```

## Requirements

- LaTeX distribution with `pdflatex`
- Standard LaTeX packages (included in most distributions)

## Features

- Professional layout with proper typography
- International address format support
- Automatic date insertion
- Proper legal structure for sponsoring agreements
- Signature sections for both parties
- Clean separation of data and presentation

## License

MIT License - see LICENSE file for details.