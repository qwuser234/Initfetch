### Initfetch
---
Initfetch - fetch-like utility, what show a information about current used init system
Written on ocaml, using only one library, minicli.
Available logo:
- Systemd
- Systemd only text
- Systemd text and logo
- Runit
- Openrc
- Sysvinit
- BSDinit
But fine work only systemd! work other init was in other version

### Build
---
Need for build:
- Ocaml
- Opam
- Dune
- Minicli as library
For building:
`opam exec -- dune build`
builden executable been in _build/default/bin/main.exe (its not windows exe!)
