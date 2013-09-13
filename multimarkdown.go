package multimarkdown

// #cgo CFLAGS: -Ideps/mmd4
// #cgo LDFLAGS: -Ldeps/mmd4 -lparse_utilities.o -llatex.o -lparse_utilities.o -lGLibFacade.o -lmemoir.o -lparser.o -lbeamer.o -ltext.o -lcritic.o -lodf.o -lwriter.o -lhtml.o -lopml.o
// #include <stdlib.h>
// #include <libMultimarkdown.h>
import "C"

import (
    "unsafe"
)

/*const (*/
	/*EXT_COMPATIBILITY = C.enum_EXT_COMPATIBILITY [> Markdown compatibility mode <]*/
	/*EXT_COMPLETE      = C.enum_EXT_COMPLETE      [> Create complete document <]*/
	/*EXT_HEAD_CLOSED   = C.enum_EXT_HEAD_CLOSED   [> for use by parser <]*/
	/*EXT_SNIPPET       = C.enum_EXT_SNIPPET       [> Create snippet only <]*/
	/*EXT_SMART         = C.enum_EXT_SMART         [> Enable Smart quotes <]*/
	/*EXT_NOTES         = C.enum_EXT_NOTES         [> Enable Footnotes <]*/
	/*EXT_NO_LABELS     = C.enum_EXT_NO_LABELS     [> Don't add anchors to headers, etc. <]*/
	/*EXT_FILTER_STYLES = C.enum_EXT_FILTER_STYLES [> Filter out style blocks <]*/
	/*EXT_FILTER_HTML   = C.enum_EXT_FILTER_HTML   [> Filter out raw HTML <]*/
	/*EXT_PROCESS_HTML  = C.enum_EXT_PROCESS_HTML  [> Process Markdown inside HTML <]*/
	/*EXT_NO_METADATA   = C.enum_EXT_NO_METADATA   [> Don't parse Metadata <]*/
	/*EXT_OBFUSCATE     = C.enum_EXT_OBFUSCATE     [> Mask email addresses <]*/
	/*EXT_CRITIC        = C.enum_EXT_CRITIC        [> Critic Markup Support <]*/
	/*EXT_CRITIC_ACCEPT = C.enum_EXT_CRITIC_ACCEPT [> Accept all proposed changes <]*/
	/*EXT_CRITIC_REJECT = C.enum_EXT_CRITIC_REJECT [> Reject all proposed changes <]*/
	/*EXT_FAKE          = C.enum_EXT_FAKE          [> 15 is highest number allowed <]*/
/*)*/

/* Define output formats we support -- first in list is default */
/*const (*/
	/*HTML_FORMAT                  = iota*/
	/*TEXT_FORMAT                  = iota*/
	/*LATEX_FORMAT                 = iota*/
	/*MEMOIR_FORMAT                = iota*/
	/*BEAMER_FORMAT                = iota*/
	/*OPML_FORMAT                  = iota*/
	/*ODF_FORMAT                   = iota*/
	/*RTF_FORMAT                   = iota*/
	/*ORIGINAL_FORMAT              = iota [> Not currently used <]*/
	/*CRITIC_ACCEPT_FORMAT         = iota*/
	/*CRITIC_REJECT_FORMAT         = iota*/
	/*CRITIC_HTML_HIGHLIGHT_FORMAT = iota*/
/*)*/

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
