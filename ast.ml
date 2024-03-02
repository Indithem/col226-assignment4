(* abstract syntax tree for the logprog *)

type term =
  | Var of string
  | Const_atom of string
  | Const_int of int
  | K'ary of {symbol: string; args: term list}

type head_term = 
  | Skip
  | Term of term

(*since we are using same name of Var, the following syntax 
  might be useful somewhere for distinguishing
  let m: term = Var "m" *)

type goal_ast = (** for use in goals*)
  | Atomic of term
  | And of goal_ast * goal_ast
  | Or of goal_ast * goal_ast
  | Not of goal_ast
  | OfCourse

type clause_ast = (**for use in programs*)
{
  head: string;
  args: head_term list;
  body: goal_ast option;
}
;;

type statement =
  | ClauseStatement of clause_ast
  | GoalStatement of goal_ast
;;

let print_gaps n =
  Printf.printf "\n";
  for i = 1 to n do
    Printf.printf "  "
  done;
  if n > 0 then Printf.printf "|__"
;;

  
let rec print_term t p = 
  print_gaps p;
  match t with
  | Var v -> Printf.printf "Variable %s" v
  | Const_atom a -> Printf.printf "Atom '%s'" a
  | Const_int i -> Printf.printf "Int %d" i
  | K'ary {symbol; args} -> 
    Printf.printf "%d-ary term '%s'" (List.length args) symbol;
    List.iter (fun x -> print_term x (p+1)) args


let rec print_goal_ast g p = match g with
  | Atomic t -> print_term t p
  | And (g1, g2) -> 
    print_gaps p;
    Printf.printf "And Goal";
    print_goal_ast g1 (p+1);
    print_goal_ast g2 (p+1)
  | Or (g1, g2) ->
    print_gaps p;
    Printf.printf "Or Goal";
    print_goal_ast g1 (p+1);
    print_goal_ast g2 (p+1)
  | Not g1 ->
    print_gaps p;
    Printf.printf "Not Goal";
    print_goal_ast g1 (p)
  | OfCourse ->
    print_gaps p;
    Printf.printf "OfCourse!"

let rec print_clause_ast c =
  let base = 1 in
  let print_head_terms ht = match ht with
    | Skip -> Printf.printf "\n  |__Skip _"
    | Term t -> print_term t base in
  match c.body with
    | None -> 
      Printf.printf "\nFact: %s" c.head;
      List.iter print_head_terms c.args;
    | Some g ->
      Printf.printf "\nRule: %s" c.head;
      List.iter print_head_terms c.args;
      Printf.printf "\nBody: ";
      print_goal_ast (Option.get c.body) base
  ;
;;

let print_appropriately s =
  match s with
  | ClauseStatement c -> print_clause_ast c
  | GoalStatement g -> 
    Printf.printf "\nGoal: ";
    print_goal_ast g 0
;;