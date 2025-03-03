let help () =
  print_endline
{|
initfetch [OPTIONS...]
Fetch-like utility what show information about a current used init system

  Options:
    -t --tilda "string"  --  change a " ~ " in fetch information
    -l --logo "logo"     --  set logo what been showing in fetch informations (see list logo in --list)
    -h --help            --  show this message
    -L --list            --  show list logo
  List logo:
    systemd
    systemdtext
    systemdtextlogo
    runit
    openrc
    sysvinit
    bsdinit

  Version:
  0.1.0
|};;

let showing_help_list l h : unit =
  if (Option.is_some h) then
    help ()
  else if (Option.is_some l) then
    Initfetch.list_initfetch ()
;;

let main () =
  let argc, argv = Minicli.CLI.init () in

  if argc < 1 then
    print_int argc;
  
  let logo  = Minicli.CLI.get_string_opt ["-l"; "--logo"]  argv in
  let tilda = Minicli.CLI.get_string_def ["-t"; "--tilda"] argv " ~ " in

  let help =  Minicli.CLI.get_bool_opt  ["-h"; "--help"] argv in
  let list = Minicli.CLI.get_bool_opt    ["-L"; "--list"] argv in
    
  Minicli.CLI.finalize ();

  showing_help_list list help;
  
  Initfetch.print_fetch ((fun l : string -> match l with | None -> "nope" | _ -> Option.get l) logo) tilda;

;; 

main ();;
  
  
