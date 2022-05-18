let rec a : Aexp.t -> State.t -> int = function
  | Int n -> fun _s -> n
  | Loc l -> fun s -> s l
  | Plus (a1, a2) -> fun s -> a a1 s + a a2 s
  | Minus (a1, a2) -> fun s -> a a1 s - a a2 s
  | Times (a1, a2) -> fun s -> a a1 s * a a2 s

let rec b : Bexp.t -> State.t -> bool = function
  | True -> fun _s -> true
  | False -> fun _s -> false
  | Eq (a1, a2) -> fun s -> a a1 s = a a2 s
  | Not b1 -> fun s -> not (b b1 s)
  | Greater (a1, a2) -> fun s -> a a1 s > a a2 s

let rec c : Comm.t -> State.t -> State.t = function
  | Skip -> fun s -> s
  | Assign (l1, a1) -> fun s (l : Loc.t) -> if l = l1 then a a1 s else s l
  | Seq (c1, c2) -> fun s -> c c2 (c c1 s)
  | If (b1, c1, c2) -> fun s -> if b b1 s then c c1 s else c c2 s
  | While (b1, c1) ->
      let rec w (s : State.t) = if b b1 s then w (c c1 s) else s in
      fun s -> w s
