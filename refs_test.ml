(*
                          CS51 Problem Set 6
                       Refs, Streams, and Music
                             Refs Testing
                             Spring 2017
 *)

(* Make your refs solution available for testing *)
open Refs ;;

(* Establish some mutable lists for testing. *)
let empty_list = Nil ;;
let list1a = Cons (2, ref Nil) ;;
let list1b = Cons (2, ref list1a) ;;
let rec list1c = Cons (2, ref list1c) ;;
let list1 = Cons (1, ref list1b) ;;

let reflist = ref (Cons (2, ref Nil)) ;;
let list2 = Cons (1, ref (Cons (2, reflist))) ;;
let _ = reflist := list2 ;;

(* Some example tests. You'll want more. *)
let _ =
  assert(not(has_cycle empty_list)) ;
  assert(not(has_cycle list1a)) ;
  assert(not(has_cycle list1b)) ;
  assert(not(has_cycle list1)) ;
  assert(has_cycle(!reflist)) ;
  assert(has_cycle(list2)) ;
  assert(has_cycle(list1c)) ;
  let _ = flatten empty_list in
  assert(empty_list = Nil) ;
  let _ = flatten list1a in
  assert(list1a = Cons (2, ref Nil)) ;
  let _ = flatten list1b in
  assert(list1b = Cons (2, ref (Cons (2, ref Nil)))) ;
  let _ = flatten list1c in
  assert(list1c = Cons (2, ref Nil)) ;
  let _ = flatten list1 in
  assert(list1 = Cons (1, ref (Cons (2, ref (Cons (2, ref Nil)))))) ;
  let reflist_a = !reflist in
  let _ = flatten reflist_a in
  assert(reflist_a = Cons (1, ref (Cons (2, ref Nil)))) ;
  let _ = flatten list2 in
  assert(list2 = Cons (1, ref (Cons (2, ref Nil)))) ;
  assert(mlength empty_list = 0) ;
  assert(mlength list1a = 1) ;
  assert(mlength list1b = 2) ;
  assert(mlength list1c = 1) ;
  assert(mlength list1 = 3) ;
  assert(mlength reflist_a = 2) ;
  assert(mlength list2 = 2) ;
