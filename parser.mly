// terminants
%token LPAREN RPAREN
// %token LBRACK RBRACK     !TODO
// %token COMMENT_HASH      --this will be ignored in the lexer
%token DEFINE SEP END OFCOURSE
%token EOF
%left OR_FORMULAE           // could also be right, but it doesn't matter
%left AND_FORMULAE
%token <string> ATOM VARIABLE
%token <int> ATOM_INT

%start program
%type <Ast.statement list> program
%type <Ast.statement> stmt


// non-terminants

%%
program:
    | stmt EOF             { [$1] }
    | stmt program EOF     { $1 :: $2 }
;

stmt:
    | ATOM_INT        {Ast.GoalStatement (Ast.Atomic (Ast.Const_int $1))}
;
