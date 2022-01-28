(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*             Sebastien Hinderer, projet Gallium, INRIA Paris            *)
(*                                                                        *)
(*   Copyright 2016 Institut National de Recherche en Informatique et     *)
(*     en Automatique.                                                    *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

(* The configuration module for ocamltest *)

let arch = "none"

let afl_instrument = false

let asm = "gcc -c -Wno-trigraphs"

let cc = "gcc"

let cflags = "-O2 -fno-strict-aliasing -fwrapv -pthread -Wall -Wdeclaration-after-statement -Werror -fno-common"

let ccomptype = "cc"

let shared_libraries = true

let libunix = Some true

let systhreads = true

let str = true

let objext = "o"

let libext = "a"

let asmext = "s"

let system = "unknown"

let c_preprocessor = "gcc -E -P"

let ocamlsrcdir = "/Users/mdali/CC-Implementation/ocaml"

let flambda = false

let ocamlc_default_flags = ""
let ocamlopt_default_flags = ""

let safe_string = true

let flat_float_array = true

let ocamldoc = true

let ocamldebug = true

let native_compiler = false

let native_dynlink = false

let shared_library_cflags = ""

let sharedobjext = "so"

let csc = ""

let csc_flags = ""

let exe = ""

let mkdll = "gcc -shared                    -flat_namespace -undefined suppress -Wl,-no_compact_unwind                    "
let mkexe = "gcc -O2 -fno-strict-aliasing -fwrapv -pthread -Wall -Wdeclaration-after-statement -Werror -fno-common    -Wl,-no_compact_unwind"

let bytecc_libs = "-lm  -lpthread"

let nativecc_libs = "-lm  -lpthread"

let windows_unicode = 0 != 0

let function_sections = false

let instrumented_runtime = true

let naked_pointers = false
