(lang dune 3.17)

(name initfetch)

(generate_opam_files true)

;(source
; (github username/reponame)
;)

(authors "Andriy R. <qwrocket39@gmail.com>")

(maintainers "Andriy R. <qwrocket39@gmail.com>")

(license "MIT")

(version 0.1.0)

(package
 (name initfetch)
 (synopsis "initfetch is small fetch-like program for showing current init")
 (description
  "initfetch - program written on ocaml what print short information about current used fetch")
 (depends
  (ocaml
   (>= 5.3.0))
  (minicli
   (>= 5.0.2)))
 (tags
  ("linux" "util" "fetch")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
