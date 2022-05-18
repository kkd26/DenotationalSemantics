type comm =
  | Skip
  | Assign of Loc.t * Aexp.t
  | Seq of comm * comm
  | If of Bexp.t * comm * comm
  | While of Bexp.t * comm

type t = comm
