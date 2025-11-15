# Obvious Adams

LaTeX typesetting of Obvious Adams by Robert R. Updegraff [recommended by Rory
Sutherland](https://www.linkedin.com/posts/rorysutherland_if-you-read-just-one-business-book-this-year-activity-7394084603398987776-e07T).

The book contents are from a scanned pdf of a [printed book from the Internet Archive](https://archive.org/details/obviousadamsstor00upderich).
There is one spelling correction of the word advertisments to advertisements, otherwise the text is reproduced as faithfully as possible.

## Available Formats

This repository produces two formats from the same LaTeX source:
- **PDF** - Typeset for print (6" × 9" trade paperback)
- **EPUB** - Ebook format for e-readers

## Building

### PDF
```bash
pdflatex obvious_adams.tex
```

### EPUB
```bash
pandoc obvious_adams.tex -o obvious_adams.epub \
  --lua-filter=doublemdash.lua \
  --metadata title="Obvious Adams: The Story of a Successful Business Man" \
  --metadata author="Robert R. Updegraff" \
  --metadata date="1916" \
  --metadata lang="en-US"
```
