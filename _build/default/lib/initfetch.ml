(*
  - logo

    SYSTEMD

  - fetch info -
    Init    ~ <init>
    Version ~ <initversion>
    Time    ~ </sbin/init - procinfo - time>
    Memory  ~ </sbin/init - mem>
    N.C.P   ~ <acp>
  -     
*)

let list_initfetch () : unit =
  Printf.printf
{|
List init logos:\n
systemd:\n
%s\n
systemdtext:\n
%s\n
systemdtextlogo:\n
%s\n\n
runit:\n
%s\n
openrc:\n
%s\n
sysvinit:\n
%s\n
bsdinit:\n
%s\n\n
|}
  Logoinit.systemdlogo
  Logoinit.systemdtext
  Logoinit.systemdtextlogo
  Logoinit.runitlogo
  Logoinit.openrclogo
  Logoinit.sysvinitloho
  Logoinit.bsdinitlogo
;;

let get_init (proc_status: string) : string =  
  let name_init = input_line (open_in proc_status) in
  Str.string_after name_init 6;
;;   

let get_version (init: string) : string  =
  if String.equal init "systemd" then
    (input_line (Unix.open_process_in "systemctl --version"))
  else if String.equal init "runit" then
    ((fun (pkgver: string) -> Str.string_after pkgver 8)
      (input_line (Unix.open_process_in "xbps-query -S runit | grep 'pkgver'")))
  else
    "unable get version";
;;

let get_ps_info (ps: string) : string =
  String.trim (input_line (Unix.open_process_in ps));
;;

let rec get_logo (init: string) (user: string) : string =
  match user with
    | "systemd"         -> Logoinit.systemdlogo
    | "systemdtext"     -> Logoinit.systemdtext
    | "systemdtextlogo" -> Logoinit.systemdtextlogo
    | "runit"           -> Logoinit.runitlogo
    | "openrc"          -> Logoinit.openrclogo
    | "sysvinit"        -> Logoinit.sysvinitloho
    | "bsdinit"         -> Logoinit.bsdinitlogo
    | "nope"            -> get_logo "zero" init
    | _                 -> "error"
;;               

let print_fetch (initlogo) (tilda) : unit = 
  let init    = get_init("/proc/1/status") in
  let version = get_version(init) in
  let time    = get_ps_info("ps --pid 1 --format etime=") in
  let mem     = get_ps_info("ps --pid 1 --format size=") in
  let ncp     = (input_line (Unix.open_process_in "pgrep -P 1 | wc -w")) in  

  let logo    = get_logo init initlogo in

  Printf.printf "
  %s\n\n - initfetch info -\nInit%s%s\nVers%s%s\nTime%s%s\nMem %s%s\nNCP %s%s\n" logo tilda init tilda version tilda time tilda mem tilda ncp 

;; 
