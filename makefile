built_files = parser lexer
src_file = main ast


build/LogProg: $(foreach file, $(built_files), build/$(file).ml) $(foreach file, $(src_file), $(file).ml)
	@ocamlc -c build/parser.mli
	@ocamlc -cmi-file build/parser.cmi -c build/parser.ml
	@ocamlc -cmi-file build/parser.cmi -c build/lexer.ml
	@ocamlc -c $(foreach file, $(src_file), $(file).ml)
	$(foreach file, $(src_file), @mv $(file).cmo build/$(file).cmo)
	ocamlc -o $@ $(foreach file, $(built_files), build/$(file).cmo)

build/parser.ml: parser.mly
	ocamlyacc parser.mly
	@mkdir -p build
	@mv parser.mli build/parser.mli
	@mv parser.ml build/parser.ml

build/lexer.ml: lexer.mll
	ocamllex lexer.mll
	@mkdir -p build
	@mv lexer.ml build/lexer.ml

.PHONY: clean
clean:
	@rm -rf build