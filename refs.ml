(*
                          CS51 Problem Set 6
                       Refs, Streams, and Music
                 Section 1: Mutable Lists and Cycles
                             Spring 2018
 *)

(* The type of mutable lists. *)
type 'a mlist = Nil | Cons of 'a * 'a mlist ref

(*......................................................................
Problem 1: Write a function has_cycle that returns whether a mutable
list has a cycle. You may want a recursive helper function. Don't
worry about space usage.
......................................................................*)                                      
(* Create function that will be used to reduce repeated code *)

(*let rec is_cycle (acc : 'a mlist list) (mlst : 'a mlist) (no : 'b) (yes : 'b) : 'b =
  match mlst with
  | Nil -> no
  | Cons (_, tl) ->
  	  if List.mem !tl acc then yes  
  	  else is_cycle (mlst :: acc) !tl no yes ;;*)

let has_cycle (lst : 'a mlist) : bool =
  let rec check_for_cycle acc mlst =
  	match mlst with
  	| Nil -> false
  	| Cons (_, tl) -> 
  	    if List.memq !tl acc then true
  		else check_for_cycle (mlst :: acc) !tl in
  	check_for_cycle [] lst ;;	 

(*......................................................................
Problem 2: Write a function flatten that flattens a list (removes its
cycles if it has any) destructively. Again, you may want a recursive
helper function and you shouldn't worry about space.
......................................................................*)
let flatten (lst : 'a mlist) : unit =
  let rec remove_cycle acc mlst =
  	match mlst with
  	| Nil -> ()
  	| Cons (_, tl) -> 
  		if List.memq !tl acc then tl := Nil
  		else remove_cycle (mlst :: acc) !tl in
  	remove_cycle [] lst ;;	 

(*......................................................................
Problem 3: Write mlength, which nondestructively finds the number of
nodes in a mutable list that may have cycles.
......................................................................*)
let mlength (lst : 'a mlist) : int =
  let rec find_length acc mlst = 
  	match mlst with
  	| Nil -> 0
  	| Cons (_, tl) ->
  		if List.memq !tl acc then 0
  		else 1 + (find_length (mlst :: acc) !tl) in
  	find_length [] lst ;;

(*======================================================================
Time estimate

Please give us an honest (if approximate) estimate of how long (in
minutes) this part of the problem set took you to complete (per person
on average, not in total).  We care about your responses and will use
them to help guide us in creating future assignments.
......................................................................*)

let minutes_spent_on_part () : int = 60 ;;
