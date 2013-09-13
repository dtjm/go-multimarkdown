package multimarkdown

import (
    "testing"
)

func TestVersion(t *testing.T) {
    v := Version()
    if v != "4.3" {
        t.Fatalf("Should return version")
    }
}
