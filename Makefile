all: deps
	go build

test: deps
	go test

deps: deps/mmd4/libMultimarkdown.h deps/mmd4/libMultimarkdown.a

deps/mmd4/libMultimarkdown.h:
	git submodule init
	git submodule update

deps/mmd4/libMultimarkdown.a:
	(cd deps/mmd4; \
        git submodule init; \
        git submodule update; \
        make; \
		ar rcs libMultimarkdown.a *.o)

.PHONY: deps
