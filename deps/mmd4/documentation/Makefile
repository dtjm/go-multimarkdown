# Compile the MultiMarkdown User's Guide into documentation or test suite

srcfiles := $(wildcard *.md */*.md )

htmlfiles := $(patsubst %.md, %.html, $(srcfiles))

rtffiles := $(patsubst %.md, %.rtf, $(srcfiles))

texfiles := $(patsubst %.md, %.tex, $(srcfiles))

odffiles := $(patsubst %.md, %.fodt, $(srcfiles))

pdffiles := $(patsubst %.md, %.pdf, $(srcfiles))

examples := $(wildcard examples/*.text)

ex-html := $(patsubst %.text, %.html, $(examples))

ex-rtf := $(patsubst %.text, %.rtf, $(examples))

ex-tex := $(patsubst %.text, %.tex, $(examples))

ex-odf := $(patsubst %.text, %.fodt, $(examples))



all: $(htmlfiles) $(rtffiles) $(texfiles) $(odffiles)

guide: MMD_Users_Guide.html

html: $(htmlfiles)

pdf: MMD_Users_Guide.tex
	latexmk MMD_Users_Guide.tex
	latexmk -c MMD_Users_Guide.tex
	rm MMD_Users_Guide.tex

odf: MMD_Users_Guide.fodt

%.html: %.md
	multimarkdown -b -t html $*.md

%.html: %.text
	multimarkdown -b -t html $*.text

%.rtf: %.md
	multimarkdown -b -t rtf $*.md

%.rtf: %.text
	multimarkdown -b -t rtf $*.text

%.tex: %.md
	multimarkdown -b -t latex $*.md

%.tex: %.text
	multimarkdown -b -t latex $*.text

%.fodt: %.md
	multimarkdown -b -t odf $*.md

%.fodt: %.text
	multimarkdown -b -t odf $*.text


examples: $(ex-html) $(ex-rtf) $(ex-tex) $(ex-odf)


clean:
	@rm $(htmlfiles) $(rtffiles) $(texfiles) $(odffiles) $(pdffiles)

clean-examples:
	@rm $(ex-html) $(ex-rtf) $(ex-tex) $(ex-odf)
