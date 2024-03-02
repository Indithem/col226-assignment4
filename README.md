# Lexing
We want to identify the following as tokens:
- *atoms* alphanumerics starting with lowercase letters
- *variables* alphanumerics starting with uppercase letters
- `:- .` for the syntax
- `(` and `)` for grouping
- `[]` for lists
- `#` for comments
- `; \+ ,` for atoms' logic
- `!` for ofcourse

# Files
## lexer.mll
The lexer unit using ocamllex.
## parser.mly
The parser unit using ocamlyacc.
## ast.ml
Contains types for the abstract syntax tree.
Also contains functions related to parsing/creating/printing ast's.
## main.ml
Combines all theses units.
Our excecutable produced takes the source code from std in and prints out ast.
## test.ml
If possible, we will write tests for our parser and lexer here. 

Structure inspired from [this](https://www.youtube.com/watch?v=yySh6WLCn7A&list=PLre5AT9JnKShBOPeuiD9b-I4XROIJhkIU&index=156) youtube playlist.


# TODO
- [] `%left` `%right` `%nonassoc` ? what are these?