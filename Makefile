all: deps
	go build

test: deps
	go test

deps: deps/mmd4/libMultiMarkdown.h deps/mmd4/libMultiMarkdown.a

deps/mmd4/libMultiMarkdown.h:
	git submodule init
	git submodule update

deps/mmd4/libMultiMarkdown.a:
	(cd deps/mmd4; \
        git submodule init; \
        git submodule update; \
        make; \
		ar rcs libMultiMarkdown.a *.o)

.PHONY: deps
