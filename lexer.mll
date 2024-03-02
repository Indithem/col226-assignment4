{
    open Parser
}

let whitespace = [' ''\t''\n']


rule logprog_parser = parse
| whitespace+ { logprog_parser lexbuf }
| ('+'|'-')?['0'-'9'] as i {ATOM_INT(int_of_string i)}
| eof {EOF}
