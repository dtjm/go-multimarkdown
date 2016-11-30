all: deps
	go build

clean:
	(cd deps/mmd4; make clean)
	rm  deps/mmd4/libMultiMarkdown.a

test: deps
	go test

deps: deps/mmd4/libMultiMarkdown.h deps/mmd4/libMultiMarkdown.a

deps/mmd4/libMultiMarkdown.h:
	git submodule init
	git submodule update

deps/mmd4/libMultiMarkdown.a:
	(cd deps/mmd4; \
        make; \
		ar rcs libMultiMarkdown.a *.o)

.PHONY: deps
