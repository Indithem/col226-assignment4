# Surface Syntax

<!-- We represent the program and the Goals seperately in two different files of formats .pl and .gl respectively. -->

* *Fact* will be of form *head* followed by `.`.
* *Rule* will be of form *head* followed by `:-` followed by *body* followed by `.`.
* *body* will have *atomic formulae* each seperated by `,`.

* A *Goal* starts up with a `?-` consisting of by *atomic formulae*  each seperated by `,` followed by `;`.


* *Predicate Symbols* will start with lowercase or an `_` followed by alphanumerics or `_ '` .
* *Variables* will start with uppercase followed by alphanumerics or `_ '`.
* *Constants* will start with lowercase followed by alphanumerics.
* `!`  is a 0ary atomic formula.

# Lexicons
We use `.,;?-_'!` in various situations presented above. *alphanumerics* are also used. 

# Deviations from standard Prolog
