open DenotationalSemantics
open Comm

let factExpr =
  While
    ( Greater (Loc "x", Int 0),
      Seq
        ( Assign ("y", Times (Loc "x", Loc "y")),
          Assign ("x", Minus (Loc "x", Int 1)) ) )

let initState x y : State.t =
 fun l -> if l = "x" then x else if l = "y" then y else raise State.Empty

let fact x = SemFun.c factExpr (initState x 1) "y"
let x = fact 5

let () =
  print_int x;
  print_newline ()
