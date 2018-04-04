all: refs streamstrees music refs_test

refs: refs.ml
	ocamlbuild refs.byte	

streamstrees: streamstrees.ml
	ocamlbuild streamstrees.byte	

music: music.ml
	ocamlbuild music.byte		

refs_test: refs_test.ml
	ocamlbuild refs_test.byte		


clean:
	rm -rf _build *.byte