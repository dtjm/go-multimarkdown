package multimarkdown

// #cgo CFLAGS: -Ideps/mmd4
// #cgo LDFLAGS: -Ldeps/mmd4 deps/mmd4/libMultiMarkdown.a
// #include <stdlib.h>
// #include <stdbool.h>
// #include <libMultiMarkdown.h>
import "C"

import (
	"fmt"
	"unsafe"
)

const (
	EXT_COMPATIBILITY = 1 << iota // Markdown compatibility mode
	EXT_COMPLETE                  // Create complete document
	EXT_HEAD_CLOSED               // for use by parser
	EXT_SNIPPET                   // Create snippet only
	EXT_SMART                     // Enable Smart quotes
	EXT_NOTES                     // Enable Footnotes
	EXT_NO_LABELS                 // Don't add anchors to headers, etc.
	EXT_FILTER_STYLES             // Filter out style blocks
	EXT_FILTER_HTML               // Filter out raw HTML
	EXT_PROCESS_HTML              // Process Markdown inside HTML
	EXT_NO_METADATA               // Don't parse Metadata
	EXT_OBFUSCATE                 // Mask email addresses
	EXT_CRITIC                    // Critic Markup Support
	EXT_CRITIC_ACCEPT             // Accept all proposed changes
	EXT_CRITIC_REJECT             // Reject all proposed changes
	EXT_FAKE                      // 15 is highest number allowed
)

// Define output formats we support -- first in list is default
const (
	HTML_FORMAT = iota // DEFAULT
	TEXT_FORMAT
	LATEX_FORMAT
	MEMOIR_FORMAT
	BEAMER_FORMAT
	OPML_FORMAT
	ODF_FORMAT
	RTF_FORMAT
	ORIGINAL_FORMAT // Not currently used
	CRITIC_ACCEPT_FORMAT
	CRITIC_REJECT_FORMAT
	CRITIC_HTML_HIGHLIGHT_FORMAT
)

func Version() string {
	var version *C.char = C.mmd_version()
	defer C.free(unsafe.Pointer(version))

	return C.GoString(version)
}

func ConvertString(in string, flags, format int) (string, error) {
	if format > 11 || format == 8 {
		return "", fmt.Errorf("You must use one of the *_FORMAT constants")
	}
	var out *C.char = C.markdown_to_string(C.CString(in), C.int(flags), C.int(format))
	defer C.free(unsafe.Pointer(out))
	return C.GoString(out), nil
}
