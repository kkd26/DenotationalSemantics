type aexp =
  | Int of int
  | Loc of Loc.t
  | Plus of aexp * aexp
  | Minus of aexp * aexp
  | Times of aexp * aexp

type t = aexp
