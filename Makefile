all: deps
	go build

test: deps
	go test

deps: deps/mmd4/libMultimarkdown.h deps/mmd4/parser.o

deps/mmd4/libMultimarkdown.h:
	git submodule init
	git submodule update

deps/mmd4/parser.o:
	(cd deps/mmd4; \
        git submodule init; \
        git submodule update; \
        make)

.PHONY: deps
