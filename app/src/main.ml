
let delay = Core.Span.of_sec 1.0

(*
let schedule_jobs () =
  Periodic.(
    [ every (Core.Span.of_sec 0.1) (loop 1 (fun i -> print_endline (Printf.sprintf "A [%d] - %.0f" i (Unix.time ())); i + 1));
      every (Core.Span.of_sec 1.0) (loop 1 (fun i -> print_endline (Printf.sprintf "%d sec!" i); i + 1))
    ]
    |> schedule_jobs)
*)

let data i =
  (Printf.sprintf "A [%d] - %.0f" i (Unix.time ()))

let schedule_jobs () =
  let connection = Tcp_client.connect ~host:"127.0.0.1" ~port:12233 in
  Periodic.(
    every delay (loop (1, connection) (fun (i, connection) ->
                                           (i + 1, Tcp_client.send connection (data i))))
    |> schedule_job
  )

let () =
    Async.Std.Scheduler.go_main ~main:schedule_jobs () |> Core.Std.never_returns
