package multimarkdown

// #cgo CFLAGS: -Ideps/mmd4
// #cgo LDFLAGS: -Ldeps/mmd4 -lparse_utilities.o -llatex.o -lparse_utilities.o -lGLibFacade.o -lmemoir.o -lparser.o -lbeamer.o -ltext.o -lcritic.o -lodf.o -lwriter.o -lhtml.o -lopml.o
// #include <stdlib.h>
// #include <stdbool.h>
// #include <libMultimarkdown.h>
import "C"

import (
    "unsafe"
)

const (
    EXT_COMPATIBILITY = 1 << iota // [ > Markdown compatibility mode <]
    EXT_COMPLETE      = 1 << iota //     [> Create complete document <]
    EXT_HEAD_CLOSED   = 1 << iota //  [> for use by parser <]
    EXT_SNIPPET       = 1 << iota //      [> Create snippet only <]
    EXT_SMART         = 1 << iota //        [> Enable Smart quotes <]
    EXT_NOTES         = 1 << iota //        [> Enable Footnotes <]
    EXT_NO_LABELS     = 1 << iota //    [> Don't add anchors to headers, etc. <]
    EXT_FILTER_STYLES = 1 << iota //[> Filter out style blocks <]
    EXT_FILTER_HTML   = 1 << iota //  [> Filter out raw HTML <]
    EXT_PROCESS_HTML  = 1 << iota // [> Process Markdown inside HTML <]
    EXT_NO_METADATA   = 1 << iota //  [> Don't parse Metadata <]
    EXT_OBFUSCATE     = 1 << iota //    [> Mask email addresses <]
    EXT_CRITIC        = 1 << iota //       [> Critic Markup Support <]
    EXT_CRITIC_ACCEPT = 1 << iota //[> Accept all proposed changes <]
    EXT_CRITIC_REJECT = 1 << iota //[> Reject all proposed changes <]
    EXT_FAKE          = 1 << iota //         [> 15 is highest number allowed <]
)

/* Define output formats we support -- first in list is default */
const (
    HTML_FORMAT                  = iota
    TEXT_FORMAT                  = iota
    LATEX_FORMAT                 = iota
    MEMOIR_FORMAT                = iota
    BEAMER_FORMAT                = iota
    OPML_FORMAT                  = iota
    ODF_FORMAT                   = iota
    RTF_FORMAT                   = iota
    ORIGINAL_FORMAT              = iota // [> Not currently used <]
    CRITIC_ACCEPT_FORMAT         = iota
    CRITIC_REJECT_FORMAT         = iota
    CRITIC_HTML_HIGHLIGHT_FORMAT = iota
)

/* These are the identifiers for node types */
func Version() string {
	var version *C.char = C.mmd_version()
	defer C.free(unsafe.Pointer(version))

	return C.GoString(version)
}

func Convert(in string, flags, format int) string {
	var out *C.char = C.markdown_to_string(C.CString(in), C.int(flags), C.int(format))
	defer C.free(unsafe.Pointer(out))

    return C.GoString(out)
}
