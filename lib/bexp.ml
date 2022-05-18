type bexp =
  | True
  | False
  | Eq of Aexp.t * Aexp.t
  | Not of bexp
  | Greater of Aexp.t * Aexp.t

type t = bexp
