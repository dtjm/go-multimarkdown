latex input:	mmd-tufte-handout-header
Title:	Citations
Author:	Fletcher T. Penney
Version:	{{version.txt}}
Revised:	2014-01-04 
Base Header Level:	2
CSS:	{{css.txt}}
MMD Footer:	links.txt
latex mode:	memoir
latex input:	mmd-tufte-handout-begin-doc
latex footer:	mmd-tufte-footer


## Citations ##

I have included support for *basic* bibliography features in this version of
MultiMarkdown. Please give me feedback on ways to improve this but keep the
following in mind:

1. Bibliography support in MultiMarkdown is rudimentary. The goal is to offer
a basic standalone feature, that can be changed using the tool of your choice
to a more robust format (e.g. BibTeX, CiteProc). My XSLT files demonstrate how
to make this format compatible with BibTeX, but I am not planning on
personally providing compatibility with other tools. Feel free to post your
ideas and tools to the wiki.

2. Those needing more detailed function sets for their bibliographies may need
customized tools to provide those services. This is a basic tool that should
work for most people. Reference librarians will probably not be satisfied
however.


To use citations in MultiMarkdown, you use a syntax much like that for
anchors:

	This is a statement that should be attributed to
	its source[p. 23][#Doe:2006].
	
	And following is the description of the reference to be
	used in the bibliography.
	
	[#Doe:2006]: John Doe. *Some Big Fancy Book*.  Vanity Press, 2006.

In HTML output, citations are indistinguishable from footnotes.

You are not required to use a locator (e.g. p. 23), and there are
no special rules on what can be used as a locator if you choose
to use one. If you prefer to omit the locator, just use an empty
set of square brackets before the citation:

	This is a statement that should be attributed to its 
	source[][#Doe:2006].

There are no rules on the citation key format that you use (e.g. `Doe:2006`),
but it must be preceded by a `#`, just like footnotes use `^`.

As for the reference description, you can use Markup code within this section,
and I recommend leaving a blank line afterwards to prevent concatenation of
several references. Note that there is no way to reformat these references in
different bibliography styles; for this you need a program designed for that
purpose (e.g. BibTeX).

If you want to include a source in your bibliography that was not cited, you
may use the following:

	[Not cited][#citekey]

The `Not cited` bit is not case sensitive.

If you are creating a LaTeX document, the citations will be included, and
natbib will be used by default. If you are not using BibTeX and are getting
errors about your citations not being compatible with 'Author-Year', you can
add the following to your documents metadata:

	latex input:		mmd-natbib-plain

This changes the citation style in natbib to avoid these errors, and is useful
when you include your citations in the MultiMarkdown document itself.


## BibTeX ##

If you are creating a LaTeX document, and need a bibliography, then you should
definitely look into [BibTeX](http://www.bibtex.org/) and
[natbib](http://merkel.zoneo.net/Latex/natbib.php). It is beyond the scope of
this document to describe how these two packages work, but it is possible to
combine them with MultiMarkdown.

To use BibTeX in a MultiMarkdown document, you need to use the [`BibTeX`
metadata][BibTeX] to specify where your citations are stored.

Since `natbib` is enabled by default, you have a choice between using the
`\citep` and `\citet` commands. The following shows how this relates to the
MultiMarkdown syntax used.

	[#citekey]    => ~\citep{citekey}
	[#citekey][]  => ~\citep{citekey}

	[foo][#citekey] => ~\citep[foo]{citekey}

	[foo\]\[bar][#citekey] => ~\citep[foo][bar]{citekey}


	[#citekey;]    => \citet{citekey}
	[#citekey;][]  => \citet{citekey}

	[foo][#citekey;] => \citet[foo]{citekey}

	[foo\]\[bar][#citekey;] => \citet[foo][bar]{citekey}
