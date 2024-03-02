(* Printf.printf "Hello, world!\n";;

while true do *)
  let lexbufr = Lexing.from_channel stdin in
  let stmts = Parser.program Lexer.logprog_parser lexbufr in
  List.iter Ast.print_appropriately stmts;
(* done; *)
