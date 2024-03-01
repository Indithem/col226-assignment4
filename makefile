src_files = parser lexer

build/LogProg: $(foreach file, $(src_files), build/$(file).ml)
	@ocamlc -c build/parser.mli
	@ocamlc -cmi-file build/parser.cmi -c build/parser.ml
	@ocamlc -cmi-file build/parser.cmi -c build/lexer.ml
	ocamlc -o $@ $(foreach file, $(src_files), build/$(file).cmo)

build/parser.ml: parser.mly
	ocamlyacc parser.mly
	@mkdir -p build
	@mv parser.mli build/parser.mli
	@mv parser.ml build/parser.ml

build/lexer.ml: lexer.mll
	ocamllex lexer.mll
	@mkdir -p build
	@mv lexer.ml build/lexer.ml