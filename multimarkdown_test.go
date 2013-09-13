package multimarkdown

import (
	"sync"
	"testing"
)

func TestVersion(t *testing.T) {
	v := Version()
	if v == "" {
		t.Fatalf("Should return a version number")
	}
}

func TestConvert(t *testing.T) {
	html := Convert("**hello**", 0, HTML_FORMAT)
	expected := "<p><strong>hello</strong></p>"
	if html != expected {
		t.Errorf("Couldn't convert Markdown!\nIN=%s\nEXPECTED=%s\nACTUAL=%s", "**hello**", expected, html)
	}
}

func TestConcurrency(t *testing.T) {
	wg := sync.WaitGroup{}

	for i := 0; i < 1000; i++ {
		wg.Add(1)
		go func() {
			TestConvert(t)
			TestVersion(t)
			wg.Done()
		}()
	}

	wg.Wait()
}
