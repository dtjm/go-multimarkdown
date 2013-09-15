package multimarkdown

import (
	"sync"
	"testing"
)

func TestVersion(t *testing.T) {
	t.Parallel()
	v := Version()
	if v == "" {
		t.Fatalf("Should return a version number")
	}
}

func TestConvertString(t *testing.T) {
	t.Parallel()
	html, err := ConvertString("**hello**", 0, HTML_FORMAT)
	expected := "<p><strong>hello</strong></p>"
	if err != nil || html != expected {
		t.Errorf("Couldn't convert Markdown!\nIN=%s\nEXPECTED=%s\nACTUAL=%s", "**hello**", expected, html)
	}
}

func TestConcurrency(t *testing.T) {
	t.Parallel()
	wg := sync.WaitGroup{}

	for i := 0; i < 16; i++ {
		wg.Add(1)
		go func() {
			ConvertString("**hello**", 0, HTML_FORMAT)
			Version()
			wg.Done()
		}()
	}

	wg.Wait()
}

func TestBadFormat(t *testing.T) {
	t.Parallel()

	_, err := ConvertString("**hello**", 0, 12)
	if err == nil {
		t.Errorf("Should return an error for invalid format")
	}
}

func BenchmarkConvertString(b *testing.B) {
	for i := 0; i < b.N; i++ {
		ConvertString("*hello*", 0, HTML_FORMAT)
	}
}
