all: refs streamstrees music

refs: refs.ml
	ocamlbuild refs.byte	

streamstrees: streamstrees.ml
	ocamlbuild streamstrees.byte	

music: music.ml
	ocamlbuild music.byte		

clean:
	rm -rf _build *.byte